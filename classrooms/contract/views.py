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

# Create your views here.
class ContractsViewSet(viewsets.ModelViewSet):
    """docstring for ContinentsViewSet"""
    queryset = Contract.objects.all()
    serializer_class = ContractSerializer
    # filter_backends = (DjangoFilterBackend)
    # filterset_fields = ['__all__']

def createacontract(request):
	form = ContractModelForm(request.POST or None, request.FILES)
	if form.is_valid():
		contract = form.save(commit=False)
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
	return render(request, 'contract/createacontract.html', {'form':form})

@login_required
def seemycontracts(request):
	contracts = []
	if Supervisor.objects.filter(profile=request.user).count()>=1:
		contracts = Contract.objects.filter(counter_signe=Supervisor.objects.get(profile=request.user))
	elif Parent.objects.filter(profile=request.user).count()>=1:
		contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
	elif request.user.is_superuser:
		contracts = Contract.objects.all()
	return render(request, 'contract/seemycontracts.html', {'contracts':contracts})

@csrf_exempt
@api_view(['GET'])
def seemycontracts_rest(request):
	contracts = []
	if Supervisor.objects.filter(profile=request.user).count()>=1:
		contracts = Contract.objects.filter(counter_signe=Supervisor.objects.get(profile=request.user))
	elif Parent.objects.filter(profile=request.user).count()>=1:
		contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
	elif request.user.is_superuser:
		contracts = Contract.objects.all()
	contracts_rest = ContractSerializer(contracts, many=True)
	return Response({'contracts':contracts_rest.data})
	
def set_signed(request, contract_id = None):
	contract = Contract.objects.get(contract_id=contract_id)
	if Supervisor.objects.filter(profile=request.user).count()>=1:
		supervisor = Supervisor.objects.get(profile=request.user)
		contract.counter_signed = True
		contract.counter_signed_timestamp = datetime.datetime.now()
		contract.save(update_fields=['counter_signed', 'counter_signed_timestamp'])
	elif Parent.objects.filter(profile=request.user).count()>=1:
		parent = Parent.objects.get(profile=request.user)
		if contract.first_auth_signe == parent:
			contract.first_auth_signed = True
			contract.first_auth_signed_timestamp = datetime.datetime.now()
			contract.save(update_fields=['first_auth_signed', 'first_auth_signed_timestamp'])
		if contract.second_auth_signe == parent:
			contract.second_auth_signed = True
			contract.second_auth_signed_timestamp = datetime.datetime.now()
			contract.save(update_fields=['second_auth_signed', 'second_auth_signed_timestamp'])
	contract = Contract.objects.get(contract_id=contract_id)
	if contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed:
		contract.all_signed = True
		contract.save(update_fields=['all_signed'])
	return redirect('/contracts/seemycontracts')

def updatecontract(request, contract_id=None):
	instance = Contract.objects.get(contract_id=contract_id)
	form = ContractModelForm(request.POST or None, request.FILES, instance=instance)
	if request.method=='POST':
		if form.is_valid():
			contract = form.save(commit=False)
			attachments = []
			if (contract.pdf):
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
	return render(request, 'contract/updatecontract.html', {'form':form})

def delete_contract(request, contract_id = None):
	contract_to_delete = Contract.objects.get(contract_id=contract_id)
	contract_to_delete.delete()
	return redirect('/contracts/seemycontracts')