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
from PyPDF2 import PdfFileMerger, PdfFileWriter, PdfFileReader
import urllib
import io
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from reportlab.graphics import renderPDF
import tempfile
import os
from django.template.loader import render_to_string
from classrooms import settings
from svglib.svglib import svg2rlg
from django.contrib.staticfiles.templatetags.staticfiles import static
from django.contrib.staticfiles import finders
from school.models import *
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.sites.shortcuts import get_current_site
from . import services
from school_users.views import current_user
from django.contrib import messages

try:
    from StringIO import StringIO
except ImportError:
    from io import BytesIO as StringIO

# Create your views here.
class ContractsViewSet(viewsets.ModelViewSet):
    """docstring for ContinentsViewSet"""
    queryset = Contract.objects.all()
    serializer_class = ContractSerializer
    # filter_backends = (DjangoFilterBackend)
    filterset_fields = ['contract_id','name','contract_id_sponte','situation_id_sponte','situation_sponte','student_name_sponte','student_id_sponte','course_id_sponte','class_id_sponte','class_name_sponte','course_name_sponte','contract_type_id','initial_date_sponte','contract_free_class_id_sponte','end_date_sponte','date_of_registration_sponte','type_of_registration_sponte','contractor_sponte','name_of_curricular_matrix_sponte','financial_launched_sponte','contract_number_sponte','closing_date_sponte']

def write_pdf(request, contract=None, whosigned=None):
	packet = StringIO()
	# create a new PDF with Reportlab
	can = canvas.Canvas(packet, pagesize=letter)
	can.setFont("Times-Roman",8)
	result = finders.find('img/certificate.svg')
	current_site = get_current_site(request)
	drawing = svg2rlg('http://'+current_site.domain+static('img/certificate.svg'))
	drawing.width = drawing.minWidth() * 0.035
	drawing.height = drawing.height * 0.035 
	drawing.scale(0.035, 0.035)
	renderPDF.draw(drawing, can, 5, 10)
	if whosigned == 'first_auth':
		can.drawString(45, 30, "1. Responsável Financeiro: {} Hash: {}, em {} às {}".format(contract.first_auth_signe.name, contract.first_auth_hash, str(contract.first_auth_signed_timestamp.date().day)+'/'+str(contract.first_auth_signed_timestamp.date().month)+'/'+str(contract.first_auth_signed_timestamp.date().year), str(contract.first_auth_signed_timestamp.time().hour)+':'+str(contract.first_auth_signed_timestamp.time().minute)+':'+str(contract.first_auth_signed_timestamp.time().second)))
	elif whosigned == 'second_auth':
		can.drawString(45, 20, "2. Responsável Didático: {} Hash: {}, em {} às {}".format(contract.second_auth_signe.name, contract.second_auth_hash, str(contract.second_auth_signed_timestamp.date().day)+'/'+str(contract.second_auth_signed_timestamp.date().month)+'/'+str(contract.second_auth_signed_timestamp.date().year), str(contract.second_auth_signed_timestamp.time().hour)+':'+str(contract.second_auth_signed_timestamp.time().minute)+':'+str(contract.second_auth_signed_timestamp.time().second)))
	elif whosigned == 'director':
		can.drawString(45, 10, "3. Responsável Didático: {} Hash: {}, em {} às {}".format(contract.counter_signe.name, contract.counter_auth_hash, str(contract.counter_signed_timestamp.date().day)+'/'+str(contract.counter_signed_timestamp.date().month)+'/'+str(counter.second_auth_signed_timestamp.date().year), str(contract.counter_signed_timestamp.time().hour)+':'+str(contract.counter_signed_timestamp.time().minute)+':'+str(contract.counter_signed_timestamp.time().second)))
	elif whosigned == 'all_signed':
		can.drawString(45, 40, "Assinado Eletronicamente por:")
	can.showPage()
	can.save()
	#move to the beginning of the StringIO buffer
	packet.seek(0)
	new_pdf = PdfFileReader(packet)
	# read your existing PDF
	existing_pdf = PdfFileReader(open(settings.MEDIA_ROOT+'/'+contract.pdf.name, "rb"))
	output = PdfFileWriter()
	# add the "watermark" (which is the new pdf) on the existing page
	for i in range(0,existing_pdf.getNumPages()):
		page = existing_pdf.getPage(i)
		page.mergePage(new_pdf.getPage(0))
		output.addPage(page)
	# finally, write "output" to a real file
	outputStream = open(settings.MEDIA_ROOT+'/'+contract.pdf.name, "wb")
	output.write(outputStream)
	outputStream.close()

@login_required
def createacontract(request):
	if request.user.is_superuser:
		form = ContractModelFormWithoutSponte(request.POST or None, request.FILES)
		students = Student.objects.all().order_by('name')
		if request.method == 'POST':
			if form.is_valid():
				selected_user = request.POST.get('selected_user', 0)
				student = Student.objects.get(student_id = selected_user)
				contract = form.save(commit=False)
				school = School.objects.get(chains__name__exact=contract.chain.name)
				if student.first_parent and student.second_parent:
					contract.counter_signe = school.head
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
					messages.success(request, 'Contrato criado com sucesso!')
					return redirect('/contracts/seeallcontracts')
				messages.warning(request, 'O estudante não tem pelo menos um dos pais associados a ele!')
		return render(request, 'contract/createacontract.html', {'form':form, 'students':students})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		form = ContractModelFormWithoutSponte(request.POST or None, request.FILES)
		chains = []
		students_ids = []
		for school in School.objects.filter(head=Head.objects.get(profile=request.user)):
			for student in school.students.all():
				students_ids += [(student.student_id)]
			for chain in Chain.objects.filter(school=school):
				chains += [(chain.id)]
		form.fields["chain"].queryset = Chain.objects.filter(id__in=chains)
		students = Student.objects.filter(student_id__in=students_ids)
		if request.method == 'POST':
			if form.is_valid():
				selected_user = request.POST.get('selected_user', 0)
				student = Student.objects.get(student_id = selected_user)
				contract = form.save(commit=False)
				school = School.objects.get(chains__name__exact=contract.chain.name)
				if student.first_parent and student.second_parent:
					contract.counter_signe = school.head
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
					messages.success(request, 'Contrato criado com sucesso!')
					return redirect('/contracts/seeallcontracts')
				messages.warning(request, 'O estudante não tem pelo menos um dos pais associados a ele!')
		return render(request, 'contract/createacontract.html', {'form':form, 'students':students, 'is_supervisor':is_supervisor})
	return HttpResponse('U cannot access this page cos u are not admin!')

@login_required
def updatecontract(request, contract_id=None):
	if request.user.is_superuser:
		instance = Contract.objects.get(contract_id=contract_id)
		if instance.chain:
			school = School.objects.get(chains__id__exact=instance.chain.id)
			if not (school.sponte_client_number==None and school.sponte_token==None):
				form = ContractModelFormWithSponte(request.POST or None, request.FILES, instance=instance)
			else:
				form = ContractModelFormWithoutSponte(request.POST or None, request.FILES, instance=instance)
		else:
			form = ContractModelFormWithoutSponte(request.POST or None, request.FILES, instance=instance)
		students = Student.objects.all().order_by('name')
		if request.method=='POST':
			if form.is_valid():
				selected_user = request.POST.get('selected_user', 0)
				student = Student.objects.get(student_id = selected_user)
				contract = form.save(commit=False)
				school = School.objects.get(chains__name__exact=contract.chain.name)
				if student.first_parent and student.second_parent:
					contract.counter_signe = school.head
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
					contract.first_auth_signed = False
					contract.second_auth_signed = False
					contract.counter_signed = False
					contract.all_signed = False
					contract.save(update_fields=['name', 'date', 'pdf', 'terms_of_contract', 'first_auth_signe', 'first_auth_signed', 'second_auth_signe', 'second_auth_signed', 'counter_signe', 'counter_signed', 'all_signed', 'chain'])
					messages.success(request, 'Contrato atualizado com sucesso!')
					return redirect('/contracts/seeallcontracts')
				messages.warning(request, 'O estudante não tem pelo menos um dos pais associados a ele!')
		return render(request, 'contract/updatecontract.html', {'form':form, 'students':students})
	return HttpResponse('U cannot access this page cos u are not admin!')

@csrf_exempt
def createacontract_rest(request):
	is_superuser = current_user(request).data.get("is_superuser")
	if is_superuser:
		received_json_data=json.loads(request.body)
		contract_id_sponte = received_json_data.get("contract_id_sponte")
		contract_free_class_id_sponte = received_json_data.get("contract_free_class_id_sponte")
		situation_id_sponte = received_json_data.get("situation_id_sponte")
		situation_sponte = received_json_data.get("situation_sponte")
		student_name_sponte = received_json_data.get("student_name_sponte")
		student_id_sponte = received_json_data.get("student_id_sponte")
		course_id_sponte = received_json_data.get("course_id_sponte")
		class_id_sponte = received_json_data.get("class_id_sponte")
		class_name_sponte = received_json_data.get("class_name_sponte")
		course_name_sponte = received_json_data.get("course_name_sponte")
		contract_type_id = received_json_data.get("contract_type_id")
		initial_date_sponte = received_json_data.get("initial_date_sponte")
		end_date_sponte = received_json_data.get("end_date_sponte")
		date_of_registration_sponte = received_json_data.get("date_of_registration_sponte")
		type_of_registration_sponte = received_json_data.get("type_of_registration_sponte")
		contractor_sponte = received_json_data.get("contractor_sponte")
		name_of_curricular_matrix_sponte = received_json_data.get("name_of_curricular_matrix_sponte")
		financial_launched_sponte = received_json_data.get("financial_launched_sponte")
		contract_number_sponte = received_json_data.get("contract_number_sponte")
		closing_date_sponte = received_json_data.get("closing_date_sponte")
		name = received_json_data.get("name")
		date = received_json_data.get("date")
		pdf = received_json_data.get("pdf")
		terms_of_contract = received_json_data.get("terms_of_contract")
		student_id = received_json_data.get("student_id")
		counter_signe = received_json_data.get("counter_signe")
		chain = received_json_data.get("chain")
		student = Student.objects.get(student_id=student_id)
		newcontract = Contract.objects.create(contract_id_sponte = contract_id_sponte, contract_free_class_id_sponte=contract_free_class_id_sponte, situation_id_sponte=situation_id_sponte, situation_sponte=situation_sponte, student_name_sponte=student_name_sponte, student_id_sponte=student_id_sponte, course_id_sponte=course_id_sponte, class_id_sponte=class_id_sponte, course_name_sponte=course_name_sponte, contract_type_id=contract_type_id, initial_date_sponte=initial_date_sponte, end_date_sponte=end_date_sponte, date_of_registration_sponte=date_of_registration_sponte, type_of_registration_sponte=type_of_registration_sponte, contractor_sponte=contractor_sponte, name_of_curricular_matrix_sponte=name_of_curricular_matrix_sponte, financial_launched_sponte=financial_launched_sponte, contract_number_sponte=contract_number_sponte, closing_date_sponte=closing_date_sponte, name=name, date=date, pdf=pdf, terms_of_contract=terms_of_contract, first_auth_signe=student.first_parent, second_auth_signe=student.second_parent, counter_signe=counter_signe, chain=chain)
		contract = Contract.objects.get(contract_id_sponte = contract_id_sponte, contract_free_class_id_sponte=contract_free_class_id_sponte, situation_id_sponte=situation_id_sponte, situation_sponte=situation_sponte, student_name_sponte=student_name_sponte, student_id_sponte=student_id_sponte, course_id_sponte=course_id_sponte, class_id_sponte=class_id_sponte, course_name_sponte=course_name_sponte, contract_type_id=contract_type_id, initial_date_sponte=initial_date_sponte, end_date_sponte=end_date_sponte, date_of_registration_sponte=date_of_registration_sponte, type_of_registration_sponte=type_of_registration_sponte, contractor_sponte=contractor_sponte, name_of_curricular_matrix_sponte=name_of_curricular_matrix_sponte, financial_launched_sponte=financial_launched_sponte, contract_number_sponte=contract_number_sponte, closing_date_sponte=closing_date_sponte, name=name, date=date, pdf=pdf, terms_of_contract=terms_of_contract, first_auth_signe=student.first_parent, second_auth_signe=student.second_parent, counter_signe=counter_signe, chain=chain)
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
		contract_rest = ContractSerializer(contract)
		return Response({'contracts':contracts_rest.data,})

@login_required
def seemycontracts(request):
	contracts = []
	is_parent = False
	is_supervisor = False
	if Parent.objects.filter(profile=request.user).count()>=1:
		is_parent = True
		contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		contracts = Contract.objects.filter(counter_signe=Head.objects.get(profile=request.user))
	elif request.user.is_superuser:
		contracts = Contract.objects.all()
	if request.method=='POST':
		some_var = request.POST.getlist('checks')
		for var in some_var:
			set_signed(request, var)
	return render(request, 'contract/seemycontracts.html', {'contracts':contracts, 'is_parent':is_parent, 'is_supervisor':is_supervisor})

#weverton
@login_required
def seecontractdetails(request, contract_id=None):
	is_supervisor = False
	if Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
	contract = Contract.objects.get(contract_id=contract_id)
	student = Student.objects.get(first_parent = contract.first_auth_signe, second_parent = contract.second_auth_signe)
	return render(request,'contract/seecontractdetails.html',{'contract':contract, 'is_supervisor':is_supervisor, 'student':student})

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
	if Head.objects.filter(profile=request.user).count()>=1:
		if contract.counter_signed:
			messages.warning(request, 'O diretor já assinou este contrato!')
			return redirect('/contracts/seeallcontracts')
	if Parent.objects.filter(profile=request.user).count()>=1:
		parent = Parent.objects.get(profile=request.user)
		if contract.first_auth_signe == parent:
			if contract.first_auth_signed:
				messages.warning(request, 'O primeiro responsável já assinou este contrato!')
				return redirect('/contracts/seeallcontracts')
		if contract.second_auth_signe == parent:
			if contract.second_auth_signed:
				messages.warning(request, 'O segundo responsável já assinou este contrato!')
				return redirect('/contracts/seeallcontracts')
	if Head.objects.filter(profile=request.user).count()>=1 or Parent.objects.filter(profile=request.user).count()>=1:
		if Head.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
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
			attachments = []
			head = Head.objects.get(profile=request.user)
			contract.counter_signed = True
			contract.counter_signed_timestamp = datetime.datetime.now()
			contract.counter_hash = block.hash
			contract.save(update_fields=['counter_signed', 'counter_signed_timestamp', 'counter_hash'])
			write_pdf(request, contract, 'director')
			content = contract.pdf.read()
			attachment = (contract.pdf.name, content, 'application/pdf')
			attachments.append(attachment)
			mail_subject = 'Contract has been signed'
			message = render_to_string('contract/contractsigned.html', {
				'user': head,
				'timestamp': contract.counter_signed_timestamp,
				'block': block,
				'school': School.objects.get(chains__name__exact=block.chain.name),
			})
			to_email = head.profile.email
			email = EmailMessage(
				mail_subject, message, to=[to_email], attachments=attachments
			)
			email.send()
			messages.success(request, 'Assinado com sucesso!')
		elif Parent.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
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
			attachments = []
			parent = Parent.objects.get(profile=request.user)
			if contract.first_auth_signe == parent:
				contract.first_auth_signed = True
				contract.first_auth_signed_timestamp = datetime.datetime.now()
				contract.first_auth_hash = block.hash
				contract.save(update_fields=['first_auth_signed', 'first_auth_signed_timestamp', 'first_auth_hash'])
				write_pdf(request, contract, 'first_auth')
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'Contract has been signed'
				message = render_to_string('contract/contractsigned.html', {
					'user': parent,
					'timestamp': contract.first_auth_signed_timestamp,
					'block': block,
					'school': School.objects.get(chains__name__exact=block.chain.name),
				})
				to_email = parent.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
			if contract.second_auth_signe == parent:
				contract.second_auth_signed = True
				contract.second_auth_signed_timestamp = datetime.datetime.now()
				contract.second_auth_hash = block.hash
				contract.save(update_fields=['second_auth_signed', 'second_auth_signed_timestamp', 'second_auth_hash'])
				write_pdf(request, contract, 'second_auth')
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'Contract has been signed'
				message = render_to_string('contract/contractsigned.html', {
					'user': parent,
					'timestamp': contract.second_auth_signed_timestamp,
					'block': block,
					'school': School.objects.get(chains__name__exact=block.chain.name),
				})
				to_email = parent.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
			contract = Contract.objects.get(contract_id=contract_id)
			if contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed:
				contract.all_signed = True
				write_pdf(request, contract, 'all_signed')
				messages.success(request, 'Todos os responsáveis desse contrato assinaram!')
				contract.save(update_fields=['all_signed'])
			return redirect('/contracts/seeallcontracts')
	else:
		messages.warning(request, 'Você não é diretor nem pai do estudante deste contrato!')
	return redirect('/contracts/seeallcontracts')

def delete_contract(request, contract_id = None):
	contract_to_delete = Contract.objects.get(contract_id=contract_id)
	contract_to_delete.delete()
	return redirect('/contracts/seemycontracts')

def seefinancialdetails(request, contract_id = None):
	contract = Contract.objects.get(contract_id=contract_id)
	if (contract.all_signed):
		sParametrosBusca = 'ResponsavelID='+str(Parent.objects.get(profile = request.user).responsible_id_sponte)+';'
		if contract.contract_id_sponte:
			sParametrosBusca += 'ContratoID='+str(contract.contract_id_sponte)+';'
		if contract.contract_free_class_id_sponte:
			sParametrosBusca += 'ContratoAulaLivreID='+str(contract.contract_free_class_id_sponte)+';'
		financials = services.get_financeiro('39324', 'JRpWbRP80CbK', sParametrosBusca)
		return render(request, 'contract/seefinancialdetails.html', {'financials':financials})
	else:
		return HttpResponse('Não é possível ver agora! Quando o contrato for assinado por todos você poderá ver os detalhes financeiros!')