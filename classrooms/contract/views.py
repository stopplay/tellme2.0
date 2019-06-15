from django.shortcuts import render, redirect, reverse, get_object_or_404
from .serializers import *
from .models import *
from .forms import *
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, generics, status
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_text
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import AllowAny
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response
from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from django.views.decorators.csrf import csrf_exempt
import datetime
from block.utils import SymmetricEncryption, JsonApi, EncryptionApi
from block.models import *
from block.forms import *
from school_users.models import *
from django.http import HttpResponse, Http404, HttpResponseRedirect
from PyPDF2 import PdfFileMerger
from io import BytesIO
import urllib
from weasyprint import HTML
import tempfile
import os
from django.template.loader import render_to_string
import pdb
from classrooms import settings

# Create your views here.
class ContractsViewSet(viewsets.ModelViewSet):
    """docstring for ContinentsViewSet"""
    queryset = Contract.objects.all()
    serializer_class = ContractSerializer
    # filter_backends = (DjangoFilterBackend)
    # filterset_fields = ['__all__']

def printorder(request, order_id=None):
    try:
        message = render_to_string('contract/contracttorender.html', {
                'contract': contract,
            })
        html_string = '<!doctype html><html><head><meta charset="utf-8"><title>Contract:' + str(contract.contract_id) + '</title></head><body>' + message + '</body></html>'
        html = HTML(string=html_string)
        result = html.write_pdf()

        # Creating http response
        response = HttpResponse(content_type='application/pdf;')
        response['Content-Disposition'] = 'inline; filename=receipt.pdf'
        response['Content-Transfer-Encoding'] = 'binary'
        with tempfile.NamedTemporaryFile(delete=True) as output:
            output.write(result)
            output.flush()

            output_filepath = output.name
            output = open(output.name, 'rb')
            pdf_data = output.read()
            return HttpResponse(pdf_data, content_type='application/pdf')

    except Exception as e:
        print('error', e)
        return HttpResponse("Error Rendering PDF", status=400)

@login_required
def createacontract(request):
	if request.user.is_superuser:
		form = ContractModelForm(request.POST or None, request.FILES)
		students = Student.objects.all()
		if request.method == 'POST':
			if form.is_valid():
				selected_user = request.POST.get('selected_user', 0)
				student = Student.objects.get(student_id = selected_user)
				contract = form.save(commit=False)
				if student.first_parent and student.second_parent:
					contract.first_auth_signe = student.first_parent
					contract.second_auth_signe = student.second_parent
					attachments = []
					content = contract.pdf.read()
					attachment = (contract.pdf.name, content, 'application/pdf')
					attachments.append(attachment)
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.first_auth_signe,
					})
					to_email = contract.first_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.second_auth_signe,
					})
					to_email = contract.second_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.counter_signe,
					})
					to_email = contract.counter_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					contract.save()
					return redirect('/contracts/seemycontracts')
				return HttpResponse('This student dont have at least one of the parents associated to him.')
		return render(request, 'contract/createacontract.html', {'form':form, 'students':students})
	return HttpResponse('U cannot access this page cos u are not admin!')

@login_required
def seemycontracts(request):
    contracts = []
    is_parent = False
    is_supervisor = False
    if Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        contracts = Contract.objects.filter(counter_signe=Supervisor.objects.get(profile=request.user))
    elif Parent.objects.filter(profile=request.user).count()>=1:
        is_parent = True
        contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
        contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
    elif request.user.is_superuser:
        contracts = Contract.objects.all()
    return render(request, 'contract/seemycontracts.html', {'contracts':contracts, 'is_parent':is_parent, 'is_supervisor':is_supervisor})

#weverton
@login_required
def seecontractdetails(request, contract_id=None):
    contract = Contract.objects.get(contract_id=contract_id)
    return render(request,'contract/seecontractdetails.html',{'contract':contract})

@csrf_exempt
@api_view(['GET'])
def seemycontracts_rest(request):
	contracts = []
	is_parent = False
	is_supervisor = False
	if Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		contracts = Contract.objects.filter(counter_signe=Supervisor.objects.get(profile=request.user))
	elif Parent.objects.filter(profile=request.user).count()>=1:
		is_parent = True
		contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
	elif request.user.is_superuser:
		contracts = Contract.objects.all()
	contracts_rest = ContractSerializer(contracts, many=True)
	return Response({'contracts':contracts_rest.data, 'is_parent':is_parent, 'is_supervisor':is_supervisor})

def set_signed(request, contract_id = None):
	contract = Contract.objects.get(contract_id=contract_id)
	form = BlockModelFormByContract(request.POST or None)
	if request.method == 'POST':
		if form.is_valid():
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'Basic hash for the chain'
				block.time_stamp=datetime.datetime.now(tz=pytz.utc)
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=datetime.datetime.now(tz=pytz.utc)
				block.previous_hash=block.chain.last_block.hash
				block.nonce=SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				if block.is_valid_block(block.chain.last_block):
					print(block.is_valid_block(block.chain.last_block))
					block.save()
			if Supervisor.objects.filter(profile=request.user).count()>=1:
				attachments = []
				supervisor = Supervisor.objects.get(profile=request.user)
				try:
					message = render_to_string('contract/contracttorender.html', {
			                'block': block,
			                'user': supervisor,
			            })
					html_string = '<!doctype html><html><head><meta charset="utf-8"><title>Contract:' + str(contract.contract_id) + '</title></head><body>' + message + '</body></html>'
					html = HTML(string=html_string)
					result = html.write_pdf()
					merger = PdfFileMerger()


					# Creating http response
					response = HttpResponse(content_type='application/pdf;')
					response['Content-Disposition'] = 'inline; filename=receipt.pdf'
					response['Content-Transfer-Encoding'] = 'binary'
					with tempfile.NamedTemporaryFile(delete=True) as output:
						output.write(result)
						output.flush()
						merger.append(settings.MEDIA_ROOT+'/'+contract.pdf.name)
						merger.append(os.path.realpath(output.name))
						merger.write(settings.MEDIA_ROOT+'/'+contract.pdf.name)
						merger.close()
				except Exception as e:
					print('error', e)
					return HttpResponse("Error Rendering PDF", status=400)
				contract.counter_signed = True
				contract.counter_signed_timestamp = datetime.datetime.now()
				contract.save(update_fields=['counter_signed', 'counter_signed_timestamp'])
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'Contract has been signed'
				message = render_to_string('contract/contractsigned.html', {
					'user': supervisor,
					'timestamp': contract.counter_signed_timestamp,
					'block': block,
				})
				to_email = supervisor.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
			elif Parent.objects.filter(profile=request.user).count()>=1:
				attachments = []
				parent = Parent.objects.get(profile=request.user)
				if contract.first_auth_signe == parent:
					try:
						message = render_to_string('contract/contracttorender.html', {
				                'block': block,
				                'user': parent,
				            })
						html_string = '<!doctype html><html><head><meta charset="utf-8"><title>Contract:' + str(contract.contract_id) + '</title></head><body>' + message + '</body></html>'
						html = HTML(string=html_string)
						result = html.write_pdf()
						merger = PdfFileMerger()


						# Creating http response
						response = HttpResponse(content_type='application/pdf;')
						response['Content-Disposition'] = 'inline; filename=receipt.pdf'
						response['Content-Transfer-Encoding'] = 'binary'
						with tempfile.NamedTemporaryFile(delete=True) as output:
							output.write(result)
							output.flush()
							merger.append(settings.MEDIA_ROOT+'/'+contract.pdf.name)
							merger.append(os.path.realpath(output.name))
							merger.write(settings.MEDIA_ROOT+'/'+contract.pdf.name)
							merger.close()
					except Exception as e:
						print('error', e)
						return HttpResponse("Error Rendering PDF", status=400)
					contract.first_auth_signed = True
					contract.first_auth_signed_timestamp = datetime.datetime.now()
					contract.save(update_fields=['first_auth_signed', 'first_auth_signed_timestamp'])
					content = contract.pdf.read()
					attachment = (contract.pdf.name, content, 'application/pdf')
					attachments.append(attachment)
					mail_subject = 'Contract has been signed'
					message = render_to_string('contract/contractsigned.html', {
						'user': parent,
						'timestamp': contract.first_auth_signed_timestamp,
						'block': block,
					})
					to_email = parent.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
				if contract.second_auth_signe == parent:
					try:
						message = render_to_string('contract/contracttorender.html', {
				                'block': block,
				                'user': parent,
				            })
						html_string = '<!doctype html><html><head><meta charset="utf-8"><title>Contract:' + str(contract.contract_id) + '</title></head><body>' + message + '</body></html>'
						html = HTML(string=html_string)
						result = html.write_pdf()
						merger = PdfFileMerger()


						# Creating http response
						response = HttpResponse(content_type='application/pdf;')
						response['Content-Disposition'] = 'inline; filename=receipt.pdf'
						response['Content-Transfer-Encoding'] = 'binary'
						with tempfile.NamedTemporaryFile(delete=True) as output:
							output.write(result)
							output.flush()
							merger.append(settings.MEDIA_ROOT+'/'+contract.pdf.name)
							merger.append(os.path.realpath(output.name))
							merger.write(settings.MEDIA_ROOT+'/'+contract.pdf.name)
							merger.close()
					except Exception as e:
						print('error', e)
						return HttpResponse("Error Rendering PDF", status=400)
					contract.second_auth_signed = True
					contract.second_auth_signed_timestamp = datetime.datetime.now()
					contract.save(update_fields=['second_auth_signed', 'second_auth_signed_timestamp'])
					content = contract.pdf.read()
					attachment = (contract.pdf.name, content, 'application/pdf')
					attachments.append(attachment)
					mail_subject = 'Contract has been signed'
					message = render_to_string('contract/contractsigned.html', {
						'user': parent,
						'timestamp': contract.second_auth_signed_timestamp,
						'block': block,
					})
					to_email = parent.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
			contract = Contract.objects.get(contract_id=contract_id)
			if contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed:
				contract.all_signed = True
				contract.save(update_fields=['all_signed'])
			return redirect('/contracts/seemycontracts')
	return render(request, 'contract/createblockcontract.html', {'form':form})

@login_required
def updatecontract(request, contract_id=None):
	if request.user.is_superuser:
		instance = Contract.objects.get(contract_id=contract_id)
		form = ContractModelForm(request.POST or None, request.FILES, instance=instance)
		students = Student.objects.all()
		if request.method=='POST':
			if form.is_valid():
				selected_user = request.POST.get('selected_user', 0)
				student = Student.objects.get(student_id = selected_user)
				contract = form.save(commit=False)
				if student.first_parent and student.second_parent:
					contract.first_auth_signe = student.first_parent
					contract.second_auth_signe = student.second_parent
					attachments = []
					content = contract.pdf.read()
					attachment = (contract.pdf.name, content, 'application/pdf')
					attachments.append(attachment)
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.first_auth_signe,
					})
					to_email = contract.first_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.second_auth_signe,
					})
					to_email = contract.second_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contract to be signed'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.counter_signe,
					})
					to_email = contract.counter_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					contract.counter_signed = False
					contract.first_auth_signed = False
					contract.second_auth_signed = False
					contract.save(update_fields=['name', 'date', 'pdf', 'first_auth_signe', 'first_auth_signed', 'second_auth_signe', 'second_auth_signed', 'counter_signe', 'counter_signed'])
					return redirect('/contracts/seemycontracts')
				return HttpResponse('This student dont have at least one of the parents associated to him.')
		return render(request, 'contract/updatecontract.html', {'form':form, 'students':students})
	return HttpResponse('U cannot access this page cos u are not admin!')

def delete_contract(request, contract_id = None):
	contract_to_delete = Contract.objects.get(contract_id=contract_id)
	contract_to_delete.delete()
	return redirect('/contracts/seemycontracts')
