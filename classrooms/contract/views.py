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
from school_users.views import current_user, get_data
from django.contrib import messages
import pdb
from . import tasks
import datetime
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.views.static import serve
from django.core.exceptions import ObjectDoesNotExist
import shutil
from django.template.defaultfilters import filesizeformat

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
    filterset_fields = ['contract_id','name','contract_id_sponte','situation_id_sponte','situation_sponte','student_name_sponte','student_id_sponte','course_id_sponte','class_id_sponte','class_name_sponte','course_name_sponte','contract_type_id','initial_date_sponte','contract_free_class_id_sponte','end_date_sponte','date_of_registration_sponte','type_of_registration_sponte','contractor_sponte','name_of_curricular_matrix_sponte','financial_launched_sponte','contract_number_sponte','closing_date_sponte', 'first_auth_signe', 'first_auth_signed', 'second_auth_signe', 'second_auth_signed', 'counter_signe', 'counter_signed']

def extract_text_to_write_and_coords(contract=None, whosigned=None, school=None):

	if whosigned == 'first_auth':
		date = str(contract.first_auth_signed_timestamp.date().day)+'/'+str(contract.first_auth_signed_timestamp.date().month)+'/'+str(contract.first_auth_signed_timestamp.date().year)
		if contract.first_auth_signed_timestamp.time().hour<10:
			time = '0'+str(contract.first_auth_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.first_auth_signed_timestamp.time().hour)+':'
		if contract.first_auth_signed_timestamp.time().minute<10:
			time += '0'+str(contract.first_auth_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.first_auth_signed_timestamp.time().minute)+':'
		if contract.first_auth_signed_timestamp.time().second<10:
			time += '0'+str(contract.first_auth_signed_timestamp.time().second)
		else:
			time += str(contract.first_auth_signed_timestamp.time().second)
		if contract.first_witness_signe and contract.second_witness_signe:
			return { 'x' : 45, 'y' : 70, 'text' : "1. Responsável Financeiro: {} Hash: {}, em {} às {}".format(contract.first_auth_signe.name, contract.first_auth_hash, date, time) }
		return { 'x' : 45, 'y' : 30, 'text' : "1. Responsável Financeiro: {} Hash: {}, em {} às {}".format(contract.first_auth_signe.name, contract.first_auth_hash, date, time) }
	elif whosigned == 'second_auth':
		date = str(contract.second_auth_signed_timestamp.date().day)+'/'+str(contract.second_auth_signed_timestamp.date().month)+'/'+str(contract.second_auth_signed_timestamp.date().year)
		if contract.second_auth_signed_timestamp.time().hour<10:
			time = '0'+str(contract.second_auth_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.second_auth_signed_timestamp.time().hour)+':'
		if contract.second_auth_signed_timestamp.time().minute<10:
			time += '0'+str(contract.second_auth_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.second_auth_signed_timestamp.time().minute)+':'
		if contract.second_auth_signed_timestamp.time().second<10:
			time += '0'+str(contract.second_auth_signed_timestamp.time().second)
		else:
			time += str(contract.second_auth_signed_timestamp.time().second)
		if contract.first_witness_signe and contract.second_witness_signe:
			return { 'x' : 45, 'y' : 60, 'text' : "2. Responsável Didático: {} Hash: {}, em {} às {}".format(contract.second_auth_signe.name, contract.second_auth_hash, date, time) }
		return { 'x' : 45, 'y' : 20, 'text' : "2. Responsável Didático: {} Hash: {}, em {} às {}".format(contract.second_auth_signe.name, contract.second_auth_hash, date, time) }
	elif whosigned == 'student_auth':
		date = str(contract.student_auth_signed_timestamp.date().day)+'/'+str(contract.student_auth_signed_timestamp.date().month)+'/'+str(contract.student_auth_signed_timestamp.date().year)
		if contract.student_auth_signed_timestamp.time().hour<10:
			time = '0'+str(contract.student_auth_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.student_auth_signed_timestamp.time().hour)+':'
		if contract.student_auth_signed_timestamp.time().minute<10:
			time += '0'+str(contract.student_auth_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.student_auth_signed_timestamp.time().minute)+':'
		if contract.student_auth_signed_timestamp.time().second<10:
			time += '0'+str(contract.student_auth_signed_timestamp.time().second)
		else:
			time += str(contract.student_auth_signed_timestamp.time().second)
		if contract.first_witness_signe and contract.second_witness_signe:
			return { 'x' : 45, 'y' : 60, 'text' : "1. Responsável Financeiro: {} Hash: {}, em {} às {}".format(contract.student_auth_signe.name, contract.student_auth_hash, date, time) }
		return { 'x' : 45, 'y' : 20, 'text' : "1. Responsável Financeiro: {} Hash: {}, em {} às {}".format(contract.student_auth_signe.name, contract.student_auth_hash, date, time) }
	elif whosigned == 'first_witness':
		date = str(contract.first_witness_signed_timestamp.date().day)+'/'+str(contract.first_witness_signed_timestamp.date().month)+'/'+str(contract.first_witness_signed_timestamp.date().year)
		if contract.first_witness_signed_timestamp.time().hour<10:
			time = '0'+str(contract.first_witness_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.first_witness_signed_timestamp.time().hour)+':'
		if contract.first_witness_signed_timestamp.time().minute<10:
			time += '0'+str(contract.first_witness_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.first_witness_signed_timestamp.time().minute)+':'
		if contract.first_witness_signed_timestamp.time().second<10:
			time += '0'+str(contract.first_witness_signed_timestamp.time().second)
		else:
			time += str(contract.first_witness_signed_timestamp.time().second)
		if contract.first_auth_signe and contract.second_auth_signe:
			return { 'x' : 45, 'y' : 40, 'text' : "4. Primeira Testemunha: {} Hash: {}, em {} às {}".format(contract.first_witness_signe.name, contract.first_witness_hash, date, time) }
		return { 'x' : 45, 'y' : 40, 'text' : "3. Primeira Testemunha: {} Hash: {}, em {} às {}".format(contract.first_witness_signe.name, contract.first_witness_hash, date, time) }
	elif whosigned == 'first_witness_cpf':
		return { 'x' : 45, 'y' : 30, 'text' : "RG: {} CPF: {}".format(contract.first_witness_signe.rg, contract.first_witness_signe.cpf) }
	elif whosigned == 'second_witness':
		date = str(contract.second_witness_signed_timestamp.date().day)+'/'+str(contract.second_witness_signed_timestamp.date().month)+'/'+str(contract.second_witness_signed_timestamp.date().year)
		if contract.second_witness_signed_timestamp.time().hour<10:
			time = '0'+str(contract.second_witness_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.second_witness_signed_timestamp.time().hour)+':'
		if contract.second_witness_signed_timestamp.time().minute<10:
			time += '0'+str(contract.second_witness_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.second_witness_signed_timestamp.time().minute)+':'
		if contract.second_witness_signed_timestamp.time().second<10:
			time += '0'+str(contract.second_witness_signed_timestamp.time().second)
		else:
			time += str(contract.second_witness_signed_timestamp.time().second)
		if contract.first_auth_signe and contract.second_auth_signe:
			return { 'x' : 45, 'y' : 20, 'text' : "5. Segunda Testemunha: {} Hash: {}, em {} às {}".format(contract.second_witness_signe.name, contract.second_witness_hash, date, time) }
		return { 'x' : 45, 'y' : 20, 'text' : "4. Segunda Testemunha: {} Hash: {}, em {} às {}".format(contract.second_witness_signe.name, contract.second_witness_hash, date, time) }
	elif whosigned == 'second_witness_cpf':
		return { 'x' : 45, 'y' : 10, 'text' : "RG: {} CPF: {}".format(contract.second_witness_signe.rg, contract.second_witness_signe.cpf) }
	elif whosigned == 'director':
		date = str(contract.counter_signed_timestamp.date().day)+'/'+str(contract.counter_signed_timestamp.date().month)+'/'+str(contract.counter_signed_timestamp.date().year)
		if contract.counter_signed_timestamp.time().hour<10:
			time = '0'+str(contract.counter_signed_timestamp.time().hour)+':'
		else:
			time = str(contract.counter_signed_timestamp.time().hour)+':'
		if contract.counter_signed_timestamp.time().minute<10:
			time += '0'+str(contract.counter_signed_timestamp.time().minute)+':'
		else:
			time += str(contract.counter_signed_timestamp.time().minute)+':'
		if contract.counter_signed_timestamp.time().second<10:
			time += '0'+str(contract.counter_signed_timestamp.time().second)
		else:
			time += str(contract.counter_signed_timestamp.time().second)
		if contract.first_auth_signe and contract.second_auth_signe:
			if contract.first_witness_signe and contract.second_witness_signe:
				return { 'x' : 45, 'y' : 50, 'text' : "3. Representante {}: {} Hash: {}, em {} às {}".format(school.school_name, contract.counter_signe.name, contract.counter_auth_hash, date, time) }
			return { 'x' : 45, 'y' : 10, 'text' : "3. Representante {}: {} Hash: {}, em {} às {}".format(school.school_name, contract.counter_signe.name, contract.counter_auth_hash, date, time) }
		elif contract.student_auth_signe:
			if contract.first_witness_signe and contract.second_witness_signe:
				return { 'x' : 45, 'y' : 50, 'text' : "2. Representante {}: {} Hash: {}, em {} às {}".format(school.school_name, contract.counter_signe.name, contract.counter_auth_hash, date, time) }
			return { 'x' : 45, 'y' : 10, 'text' : "2. Representante {}: {} Hash: {}, em {} às {}".format(school.school_name, contract.counter_signe.name, contract.counter_auth_hash, date, time) }
	elif whosigned == 'all_signed':
		if contract.first_auth_signe and contract.second_auth_signe:
			if contract.first_witness_signe and contract.second_witness_signe:
				return { 'x' : 45, 'y' : 80, 'text' : "Assinado eletronicamente via blockchain por:" }
			return { 'x' : 45, 'y' : 40, 'text' : "Assinado Eletronicamente por:" }
		elif contract.student_auth_signe:
			if contract.first_witness_signe and contract.second_witness_signe:
				return { 'x' : 45, 'y' : 70, 'text' : "Assinado eletronicamente via blockchain por:" }
			return {'x' : 45, 'y' : 30, 'text' : "Assinado Eletronicamente por:" }
	return {'x' : 45, 'y' : 10, 'text' : "" }

def get_pdf_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.pdf.name

def get_pdf_signed_output_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.pdf.name+'signed'

def get_terms_of_contract_1_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.terms_of_contract.name

def get_terms_of_contract_1_signed_output_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.terms_of_contract.name+'signed'

def get_terms_of_contract_2_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.terms_of_contract_2.name

def get_terms_of_contract_2_signed_output_filepath(contract=None):
	return settings.MEDIA_ROOT+'/'+contract.terms_of_contract_2.name+'signed'

def write_pdf(request, contract=None, whosigned=None, school=None):
	
	packet = StringIO()
	# create a new PDF with Reportlab
	can = canvas.Canvas(packet, pagesize=letter)
	can.setFont("Times-Roman", 8)
	current_site = get_current_site(request)
	
	drawing = svg2rlg('http://'+current_site.domain+static('img/certificate.svg'))	
	drawing.width = drawing.minWidth() * 0.035
	drawing.height = drawing.height * 0.035 
	drawing.scale(0.035, 0.04)

	renderPDF.draw(drawing, can, 5, 10)	
	text_and_coords = extract_text_to_write_and_coords(contract, whosigned, school)
	can.drawString(text_and_coords['x'], text_and_coords['y'], text_and_coords['text'])
	if whosigned == 'first_witness':
		text_and_coords = extract_text_to_write_and_coords(contract, 'first_witness_cpf', school)
		can.drawString(text_and_coords['x'], text_and_coords['y'], text_and_coords['text'])
	if whosigned == 'second_witness':
		text_and_coords = extract_text_to_write_and_coords(contract, 'second_witness_cpf', school)
		can.drawString(text_and_coords['x'], text_and_coords['y'], text_and_coords['text'])
	can.showPage()
	can.save()

	#move to the beginning of the StringIO buffer
	packet.seek(0)
	new_pdf = PdfFileReader(packet)
	# read your existing PDF
	existing_pdf = PdfFileReader(open(get_pdf_filepath(contract), "rb"))
	output = PdfFileWriter()
	output.removeImages(False)
	
	# add the "watermark" (which is the new pdf) on the existing page
	for i in range(0, existing_pdf.getNumPages()):
		page = existing_pdf.getPage(i)
		page.mergePage(new_pdf.getPage(0))
		output.addPage(page)

	# finally, write "output" to a real file
	outputStream = open(get_pdf_signed_output_filepath(contract), "wb")
	output.write(outputStream)
	outputStream.close()

	shutil.copyfile(get_pdf_signed_output_filepath(contract), get_pdf_filepath(contract))

	if contract.terms_of_contract:
		existing_pdf = PdfFileReader(open(get_terms_of_contract_1_filepath(contract), "rb"))
		output = PdfFileWriter()
		output.removeImages(False)
		
		# add the "watermark" (which is the new pdf) on the existing page
		for i in range(0, existing_pdf.getNumPages()):
			page = existing_pdf.getPage(i)
			page.mergePage(new_pdf.getPage(0))
			output.addPage(page)

		# finally, write "output" to a real file
		outputStream = open(get_terms_of_contract_1_signed_output_filepath(contract), "wb")
		output.write(outputStream)
		outputStream.close()

		shutil.copyfile(get_terms_of_contract_1_signed_output_filepath(contract), get_terms_of_contract_1_filepath(contract))

	if contract.terms_of_contract_2:
		existing_pdf = PdfFileReader(open(get_terms_of_contract_2_filepath(contract), "rb"))
		output = PdfFileWriter()
		output.removeImages(False)
		
		# add the "watermark" (which is the new pdf) on the existing page
		for i in range(0, existing_pdf.getNumPages()):
			page = existing_pdf.getPage(i)
			page.mergePage(new_pdf.getPage(0))
			output.addPage(page)

		# finally, write "output" to a real file
		outputStream = open(get_terms_of_contract_2_signed_output_filepath(contract), "wb")
		output.write(outputStream)
		outputStream.close()

		shutil.copyfile(get_terms_of_contract_2_signed_output_filepath(contract), get_terms_of_contract_2_filepath(contract))


@login_required
def createacontract(request):
    request.POST.get('selected_user' or None)
    tomorrow = datetime.date.today()+datetime.timedelta(days=1)
    tomorrow = tomorrow.strftime('%Y-%m-%d')
    if request.user.is_superuser:
        form = ContractModelFormWithoutSponte(request.POST or None, request.FILES)
        students = Student.objects.all().order_by('name')
        chains = []
        selected_user = request.session['selected_user']
        if Student.objects.filter(student_id = selected_user).count()>=1:
            student = Student.objects.get(student_id = selected_user)
        else:
            messages.warning(request, 'Por favor selecione um estudante')
            return redirect('/contracts/select_student_to_contract')
        for school in School.objects.all():
            for classe in school.classes.all():
                if student in classe.students.all():
                    chains += [(classe.class_id)]
        form.fields["chain"].queryset = Chain.objects.filter(id__in=chains)
        if request.method == 'POST':
            if form.is_valid():
                wish = request.POST.get('wish' or None)
                wish_today = request.POST.get('wish_today' or None)
                selected_user = request.POST.get('selected_user' or None)
                head = None
                if Head.objects.filter(head_id = selected_user).count()>=1:
                    head = Head.objects.get(head_id = selected_user)
                else:
                    messages.warning(request, 'Você não selecionou nenhum diretor')
                    return redirect('/contracts/createacontract')
                contract = form.save(commit=False)
                if contract.pdf.size > 2097152:
                    messages.error(request, 'Por favor mantenha o tamanho do arquivo de contrato enviado abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.pdf.size)))
                    return redirect('/contracts/createacontract')
                if contract.terms_of_contract:
                    if contract.terms_of_contract.size > 2097152:
                        messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (1) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract.size)))
                        return redirect('/contracts/createacontract')
                    if not contract.terms_of_contract.name.endswith('.pdf'):
                        messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (1) no tipo correto que é PDF')
                        return redirect('/contracts/createacontract')
                if contract.terms_of_contract_2:
                    if contract.terms_of_contract_2.size > 2097152:
                        messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (2) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract_2.size)))
                        return redirect('/contracts/createacontract')
                    if not contract.terms_of_contract_2.name.endswith('.pdf'):
                        messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (2) no tipo correto que é PDF')
                        return redirect('/contracts/createacontract')
                if not contract.pdf.name.endswith('.pdf'):
                    messages.error(request, 'Por favor insira o arquivo de contrato no tipo correto que é PDF')
                    return redirect('/contracts/createacontract')
                school = School.objects.get(chains__id__exact=contract.chain.id)
                classe = Class.objects.get(class_id=contract.chain.id)
                contract.slm = classe.slm
                contract.name = student.name+' - '+contract.chain.name
                contract.counter_signe = head
                if school.first_witness and school.second_witness:
                    contract.first_witness_signe = school.first_witness
                    contract.second_witness_signe = school.second_witness
                if student.needs_parent:
                    if student.first_parent and student.second_parent:
                        contract.first_auth_signe = student.first_parent
                        contract.second_auth_signe = student.second_parent
                        if student.third_parent:
                            contract.third_auth_signe = student.third_parent
                        contract.student_name = student.name
                        if wish == 'sim':
                            if wish_today == 'sim':
                                contract.save()
                                tasks.schedule_email(contract, 'normal', 'admin')
                            elif wish_today == 'não':
                                date = request.POST.get('date' or None)
                                time = request.POST.get('time' or None)
                                if date and time:
                                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                    contract.save()
                                    contract_rest = ContractSerializer(contract)
                                    tasks.schedule_email.apply_async((contract_rest.data, 'json', 'admin'), eta=contract.sent_date)
                                else:
                                    messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                    return redirect('/contracts/createacontract')
                        else:
                            if wish_today == 'sim':
                                contract.save()
                                tasks.schedule_email_without_attachment(contract,'normal', 'admin')
                            elif wish_today == 'não':
                                date = request.POST.get('date' or None)
                                time = request.POST.get('time' or None)
                                if date and time:
                                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                    contract.save()
                                    contract_rest = ContractSerializer(contract)
                                    tasks.schedule_email.apply_async((contract_rest.data, 'json', 'admin'), eta=contract.sent_date)
                                else:
                                    messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                    return redirect('/contracts/createacontract')
                        messages.success(request, 'Contrato criado com sucesso!')
                        return redirect('/contracts/all/'.format(contract.contract_id))
                else:
                    contract.student_auth_signe = student
                    contract.student_name = student.name
                    if wish == 'sim':
                        if wish_today == 'sim':
                            tasks.schedule_email(contract, 'normal', 'admin')
                        elif wish_today == 'não':
                            date = request.POST.get('date' or None)
                            time = request.POST.get('time' or None)
                            if date and time:
                                contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                contract.save()
                                contract_rest = ContractSerializer(contract)
                                tasks.schedule_email.apply_async((contract_rest.data, 'json', 'admin'), eta=contract.sent_date)
                            else:
                                messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                return redirect('/contracts/createacontract')
                    else:
                        if wish_today == 'sim':
                            contract.save()
                            tasks.schedule_email_without_attachment(contract,'normal', 'admin')
                        elif wish_today == 'não':
                            date = request.POST.get('date' or None)
                            time = request.POST.get('time' or None)
                            if date and time:
                                contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                contract.save()
                                contract_rest = ContractSerializer(contract)
                                tasks.schedule_email.apply_async((contract_rest.data, 'json', 'admin'), eta=contract.sent_date)
                            else:
                                messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                return redirect('/contracts/createacontract')
                    messages.success(request, 'Contrato criado com sucesso!')
                    return redirect('/contracts/all/'.format(contract.contract_id))
        return render(request, 'contract/createacontract.html', {'form':form, 'student':student, 'tomorrow':tomorrow})
    elif Head.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        form = ContractModelFormWithoutSponte(request.POST or None, request.FILES)
        chains = []
        students_ids = []
        selected_user = request.session['selected_user']
        if Student.objects.filter(student_id = selected_user).count()>=1:
            student = Student.objects.get(student_id = selected_user)
        else:
            messages.warning(request, 'Por favor selecione um estudante')
            return redirect('/contracts/select_student_to_contract')
        for school in School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id):
            for classe in school.classes.all():
                if student in classe.students.all():
                    chains += [(classe.class_id)]
        form.fields["chain"].queryset = Chain.objects.filter(id__in=chains)
        if request.method == 'POST':
            if form.is_valid():
                wish = request.POST.get('wish' or None)
                wish_today = request.POST.get('wish_today' or None)
                selected_user = request.POST.get('selected_user' or None)
                head = None
                if Head.objects.filter(head_id = selected_user).count()>=1:
                    head = Head.objects.get(head_id = selected_user)
                else:
                    messages.warning(request, 'Você não selecionou nenhum diretor')
                    return redirect('/contracts/createacontract')
                contract = form.save(commit=False)
                if contract.pdf.size > 2097152:
                    messages.error(request, 'Por favor mantenha o tamanho do arquivo de contrato enviado abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.pdf.size)))
                    return redirect('/contracts/createacontract')
                if contract.terms_of_contract:
                    if contract.terms_of_contract.size > 2097152:
                        messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (1) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract.size)))
                        return redirect('/contracts/createacontract')
                    if not contract.terms_of_contract.name.endswith('.pdf'):
                        messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (1) no tipo correto que é PDF')
                        return redirect('/contracts/createacontract')
                if contract.terms_of_contract_2:
                    if contract.terms_of_contract_2.size > 2097152:
                        messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (2) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract_2.size)))
                        return redirect('/contracts/createacontract')
                    if not contract.terms_of_contract_2.name.endswith('.pdf'):
                        messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (2) no tipo correto que é PDF')
                        return redirect('/contracts/createacontract')
                if not contract.pdf.name.endswith('.pdf'):
                    messages.error(request, 'Por favor insira o arquivo de contrato no tipo correto que é PDF')
                    return redirect('/contracts/createacontract')
                school = School.objects.get(chains__id__exact=contract.chain.id)
                classe = Class.objects.get(class_id=contract.chain.id)
                contract.slm = classe.slm
                contract.name = student.name+' - '+contract.chain.name
                contract.counter_signe = head
                if school.first_witness and school.second_witness:
                    contract.first_witness_signe = school.first_witness
                    contract.second_witness_signe = school.second_witness
                if student.needs_parent:
                    if student.first_parent and student.second_parent:
                        contract.first_auth_signe = student.first_parent
                        contract.second_auth_signe = student.second_parent
                        if student.third_parent:
                            contract.third_auth_signe = student.third_parent
                        contract.student_name = student.name
                        if wish == 'sim':
                            if wish_today == 'sim':
                                contract.save()
                                tasks.schedule_email(contract, 'normal', 'director')
                            elif wish_today == 'não':
                                date = request.POST.get('date' or None)
                                time = request.POST.get('time' or None)
                                if date and time:
                                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                    contract.save()
                                    contract_rest = ContractSerializer(contract)
                                    tasks.schedule_email.apply_async((contract_rest.data, 'json', 'director'), eta=contract.sent_date)
                                else:
                                    messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                    return redirect('/contracts/createacontract')
                        else:
                            if wish_today == 'sim':
                                contract.save()
                                tasks.schedule_email_without_attachment(contract,'normal', 'director')
                            elif wish_today == 'não':
                                date = request.POST.get('date' or None)
                                time = request.POST.get('time' or None)
                                if date and time:
                                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                    contract.save()
                                    contract_rest = ContractSerializer(contract)
                                    tasks.schedule_email.apply_async((contract_rest.data, 'json', 'director'), eta=contract.sent_date)
                                else:
                                    messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                    return redirect('/contracts/createacontract')
                        messages.success(request, 'Contrato criado com sucesso!')
                        return redirect('/contracts/all/'.format(contract.contract_id))
                else:
                    contract.student_auth_signe = student
                    contract.student_name = student.name
                    if wish == 'sim':
                        if wish_today == 'sim':
                            contract.save()
                            tasks.schedule_email(contract, 'normal', 'director')
                        elif wish_today == 'não':
                            date = request.POST.get('date' or None)
                            time = request.POST.get('time' or None)
                            if date and time:
                                contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                contract.save()
                                contract_rest = ContractSerializer(contract)
                                tasks.schedule_email.apply_async((contract_rest.data, 'json', 'director'), eta=contract.sent_date)
                            else:
                                messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                return redirect('/contracts/createacontract')
                    else:
                        if wish_today == 'sim':
                            contract.save()
                            tasks.schedule_email_without_attachment(contract,'normal', 'director')
                        elif wish_today == 'não':
                            date = request.POST.get('date' or None)
                            time = request.POST.get('time' or None)
                            if date and time:
                                contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                                contract.save()
                                contract_rest = ContractSerializer(contract)
                                tasks.schedule_email.apply_async((contract_rest.data, 'json', 'director'), eta=contract.sent_date)
                            else:
                                messages.error(request, 'Você não informou a data em que o contrato será enviado!')
                                return redirect('/contracts/createacontract')
                    messages.success(request, 'Contrato criado com sucesso!')
                    return redirect('/contracts/all/'.format(contract.contract_id))
        return render(request, 'contract/createacontract.html', {'form':form, 'is_supervisor':is_supervisor, 'student':student, 'tomorrow':tomorrow})
    return redirect('/')

@login_required
def updatecontract(request, contract_id=None):
	if request.user.is_superuser:
		selected_user = request.session['selected_user']
		if Student.objects.filter(student_id = selected_user).count()>=1:
			student = Student.objects.get(student_id = selected_user)
		else:
			messages.warning(request, 'Por favor selecione um estudante')
			return redirect('/contracts/select_student_to_contract_update/{}'.format(contract_id))
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
				contract = form.save(commit=False)
				if contract.pdf.size > 2097152:
					messages.error(request, 'Por favor mantenha o tamanho do arquivo de contrato enviado abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.pdf.size)))
					return redirect('/contracts/createacontract')
				if contract.terms_of_contract:
					if contract.terms_of_contract.size > 2097152:
						messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (1) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract.size)))
						return redirect('/contracts/createacontract')
					if not contract.terms_of_contract.name.endswith('.pdf'):
						messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (1) no tipo correto que é PDF')
						return redirect('/contracts/createacontract')
				if contract.terms_of_contract_2:
					if contract.terms_of_contract_2.size > 2097152:
						messages.error(request, 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (2) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract_2.size)))
						return redirect('/contracts/createacontract')
					if not contract.terms_of_contract_2.name.endswith('.pdf'):
						messages.error(request, 'Por favor insira o arquivo de termos aditivos de contrato (2) no tipo correto que é PDF')
				if not contract.pdf.name.endswith('.pdf'):
					messages.error(request, 'Por favor insira o arquivo de contrato no tipo correto que é PDF')
				school = School.objects.get(chains__name__exact=contract.chain.name)
				if student.first_parent and student.second_parent:
					contract.counter_signe = school.head
					contract.first_auth_signe = student.first_parent
					contract.second_auth_signe = student.second_parent
					attachments = []
					content = contract.pdf.read()
					attachment = (contract.pdf.name, content, 'application/pdf')
					attachments.append(attachment)
					mail_subject = 'Contrato a ser assinado'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.first_auth_signe,
					})
					to_email = contract.first_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contrato a ser assinado'
					message = render_to_string('contract/sendcontract.html', {
						'user': contract.second_auth_signe,
					})
					to_email = contract.second_auth_signe.profile.email
					email = EmailMessage(
						mail_subject, message, to=[to_email], attachments=attachments
					)
					email.send()
					mail_subject = 'Contrato a ser assinado'
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
					return redirect('/contracts/all')
				messages.warning(request, 'O estudante não tem pelo menos um dos pais associados a ele!')
		return render(request, 'contract/updatecontract.html', {'form':form, 'students':students})
	return redirect('/')

@login_required
def select_director_to_contract(request, contract_id=None):
	contract = Contract.objects.get(contract_id=contract_id)
	school = School.objects.get(chains__id__exact=contract.chain.id)
	directors = school.heads.all()
	if request.user.is_superuser:
		if request.method == 'POST':
			selected_user = request.POST.get('selected_user' or None)
			if Head.objects.filter(head_id=selected_user).count()>=1:
				head_to_contract = Head.objects.get(head_id=selected_user)
			else:
				messages.warning(request, 'Por favor selecione um diretor para este contrato')
				return redirect('/contracts/select_director_to_contract/{}'.format(contract.contract_id))
			contract.counter_signe = head_to_contract
			mail_subject = 'Contrato a ser assinado'
			message = render_to_string('contract/sendcontract.html', {
				'user':contract.counter_signe,
				'contract': contract,
				'school': school
			})
			to_email = contract.counter_signe.profile.email
			email = EmailMessage(
				mail_subject, message, to=[to_email]
			)
			email.send()
			messages.success(request, 'Diretor selecionado com sucesso!')
			contract.save(update_fields=['counter_signe'])
			return redirect('/contracts/all')
		return render(request, 'contract/select_director_to_contract.html', {'directors':directors})
	elif Head.objects.filter(profile=request.user).count()>=1:
		if request.method == 'POST':
			selected_user = request.POST.get('selected_user' or None)
			if Head.objects.filter(head_id=selected_user).count()>=1:
				head_to_contract = Head.objects.get(head_id=selected_user)
			else:
				messages.warning(request, 'Por favor selecione um diretor para este contrato')
				return redirect('/contracts/select_director_to_contract/{}'.format(contract.contract_id))
			contract.counter_signe = head_to_contract
			contract.save(update_fields=['counter_signe'])
			messages.success(request, 'Diretor selecionado com sucesso!')
			return redirect('/contracts/all')
		return render(request, 'contract/select_director_to_contract.html', {'directors':directors})

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
		mail_subject = 'Contrato a ser assinado'
		message = render_to_string('contract/sendcontract.html', {
			'user': contract.first_auth_signe,
		})
		to_email = contract.first_auth_signe.profile.email
		email = EmailMessage(
			mail_subject, message, to=[to_email], attachments=attachments
		)
		email.send()
		mail_subject = 'Contrato a ser assinado'
		message = render_to_string('contract/sendcontract.html', {
			'user': contract.second_auth_signe,
		})
		to_email = contract.second_auth_signe.profile.email
		email = EmailMessage(
			mail_subject, message, to=[to_email], attachments=attachments
		)
		email.send()
		mail_subject = 'Contrato a ser assinado'
		message = render_to_string('contract/sendcontract.html', {
			'user': contract.counter_signe,
		})
		to_email = contract.counter_signe.profile.email
		email = EmailMessage(
			mail_subject, message, to=[to_email], attachments=attachments
		)
		email.send()
		contract_rest = ContractSerializer(contract)
		return Response({'contracts':contract_rest.data,})

@login_required
def mark_slm_purchased(request, contract_id):
    contract = Contract.objects.get(contract_id=contract_id)
    if contract:
        contract.purchased_slm = True
        contract.save()
    messages.success(request, 'O material foi marcado como comprado.')
    return redirect('/contracts/all')

@login_required
def set_contract_paid(request, contract_id):
	contract = Contract.objects.get(contract_id=contract_id)

	# first_auth_signe
	# second_auth_signe
	# student_auth_signe

	if contract:
		contract.is_paid = True
		contract.save(update_fields=['is_paid'])
		messages.success(request, 'O contrato foi setado como pago')

	return redirect('/contracts/all')
	
@login_required
def seemycontracts(request):
	contracts = []
	is_client = False
	is_supervisor = False
	schools = []
	if Parent.objects.filter(profile=request.user).count()>=1:
		is_client = True
		contracts += Contract.objects.filter(first_auth_signe=Parent.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_auth_signe=Parent.objects.get(profile=request.user))
		for contract in contracts:
			if School.objects.filter(chains__id__exact=contract.chain.id).count()>=1:
				if School.objects.get(chains__id__exact=contract.chain.id) not in schools:
					schools+=[(School.objects.get(chains__id__exact=contract.chain.id).school_id)]
		schools = School.objects.filter(school_id__in=schools)
	elif Witness.objects.filter(profile=request.user).count()>=1:
		contracts += Contract.objects.filter(first_witness_signe=Witness.objects.get(profile=request.user))
		contracts += Contract.objects.filter(second_witness_signe=Witness.objects.get(profile=request.user))
		for contract in contracts:
			if School.objects.filter(chains__id__exact=contract.chain.id).count()>=1:
				if School.objects.get(chains__id__exact=contract.chain.id) not in schools:
					schools+=[(School.objects.get(chains__id__exact=contract.chain.id).school_id)]
		schools = School.objects.filter(school_id__in=schools)
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		contracts = Contract.objects.filter(counter_signe=Head.objects.get(profile=request.user))
		for contract in contracts:
			if School.objects.filter(chains__id__exact=contract.chain.id).count()>=1:
				if School.objects.get(chains__id__exact=contract.chain.id) not in schools:
					schools+=[(School.objects.get(chains__id__exact=contract.chain.id).school_id)]
		schools = School.objects.filter(school_id__in=schools)
	elif Student.objects.filter(profile=request.user).count()>=1:
		if not Student.objects.get(profile=request.user).needs_parent:
			is_client = True
			contracts = Contract.objects.filter(student_auth_signe=Student.objects.get(profile=request.user))
			for contract in contracts:
				if School.objects.filter(chains__id__exact=contract.chain.id).count()>=1:
					if School.objects.get(chains__id__exact=contract.chain.id) not in schools:
						schools+=[(School.objects.get(chains__id__exact=contract.chain.id).school_id)]
			schools = School.objects.filter(school_id__in=schools)
		else:
			return HttpResponse('Você não foi adicionado como responsável financeiro portanto não pode ver contratos')
	elif request.user.is_superuser:
		contracts = Contract.objects.all()
		schools = School.objects.all()
	if request.method=='POST':
		select_all = request.POST.get('variable' or None)
		if select_all:
			for contract in contracts:
				if not (contract.counter_signed):
					set_signed(request, contract.contract_id)
		else:
			checked_contract_ids_on_form = request.POST.getlist('checks')
			print('checked_contract_ids_on_form', checked_contract_ids_on_form)
			for contract_id in checked_contract_ids_on_form:
				set_signed(request, contract_id)
	return render(request, 'contract/seemycontracts.html', {'contracts':contracts, 'is_client':is_client, 'is_supervisor':is_supervisor, 'schools':schools})

@login_required
def select_student_to_contract(request):
	if request.user.is_superuser:
		students = Student.objects.all()
		if request.method == 'POST':
			selected_user = request.POST.get('selected_user' or None)
			request.session['selected_user'] = selected_user
			student = Student.objects.get(student_id=selected_user)
			if student.needs_parent:
				if not student.first_parent or not student.second_parent:
					messages.warning(request, 'O estudante não tem pelo menos um dos responsáveis necessários associados a ele!')
					return redirect('/contracts/select_student_to_contract')
			return redirect('/contracts/createacontract')
		return render(request, 'contract/select_student_to_contract.html', {'students':students})
	elif Head.objects.filter(profile=request.user).count()>=1:
		students_ids = []
		for school in School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id):
			for student in school.students.all():
				students_ids += [(student.student_id)]
		students = Student.objects.filter(student_id__in=students_ids)
		if request.method == 'POST':
			selected_user = request.POST.get('selected_user' or None)
			request.session['selected_user'] = selected_user
			student = Student.objects.get(student_id=selected_user)
			if student.needs_parent:
				if not student.first_parent and student.second_parent:
					messages.warning(request, 'O estudante não tem pelo menos um dos responsáveis necessários associados a ele!')
					return redirect('/contracts/select_student_to_contract')
			return redirect('/contracts/createacontract')
		return render(request, 'contract/select_student_to_contract.html', {'students':students, 'is_supervisor':True})

@login_required
def select_student_to_contract_update(request, contract_id=None):
	if request.user.is_superuser:
		students = Student.objects.all()
		if request.method == 'POST':
			selected_user = request.POST.get('selected_user' or None)
			request.session['selected_user'] = selected_user
			return redirect('/contracts/updatecontract/{}'.format(contract_id))
		return render(request, 'contract/select_student_to_contract.html', {'students':students})

#weverton
@login_required
def seecontractdetails(request, contract_id=None):
	classe = None
	school = None
	is_supervisor = False
	if Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
	contract = Contract.objects.get(contract_id=contract_id)
	if contract.chain:
		classe = Class.objects.get(class_id=contract.chain.id)
		school = School.objects.get(classes__class_id__exact=classe.class_id)
	return render(request,'contract/seecontractdetails.html',{'contract':contract, 'is_supervisor':is_supervisor, 'class':classe, 'school':school})

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

@login_required
def set_signed(request, contract_id = None):
	contract = Contract.objects.get(contract_id=contract_id)
	if Head.objects.filter(profile=request.user).count()>=1:
		if contract.counter_signed:
			messages.warning(request, 'O diretor já assinou este contrato!')
			return redirect('/contracts/all')
	if Parent.objects.filter(profile=request.user).count()>=1:
		parent = Parent.objects.get(profile=request.user)
		if contract.first_auth_signe == parent:
			if contract.first_auth_signed:
				messages.warning(request, 'O responsável financeiro já assinou este contrato!')
				return redirect('/contracts/all')
		if contract.second_auth_signe == parent:
			if contract.second_auth_signed:
				messages.warning(request, 'O responsável pedagógico já assinou este contrato!')
				return redirect('/contracts/all')
	if Student.objects.filter(profile=request.user).count()>=1:
		if contract.student_auth_signed:
			messages.warning(request, 'O responsável estudante já assinou este contrato!')
			return redirect('/contracts/all')
	if Witness.objects.filter(profile=request.user).count()>=1:
		witness = Witness.objects.get(profile=request.user)
		if contract.first_witness_signe == witness:
			if contract.first_witness_signed:
				messages.warning(request, 'A primeira testemunha já assinou este contrato!')
				return redirect('/contracts/all')
		if contract.second_witness_signe == witness:
			if contract.second_witness_signed:
				messages.warning(request, 'A segunda testemunha já assinou este contrato!')
				return redirect('/contracts/all')
	if Head.objects.filter(profile=request.user).count()>=1 or Parent.objects.filter(profile=request.user).count()>=1 or Student.objects.filter(profile=request.user).count()>=1 or Witness.objects.filter(profile=request.user).count()>=1:
		if Head.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'NULO'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
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
			contract.counter_signed_timestamp = block.time_stamp
			contract.counter_auth_hash = block.hash
			school = School.objects.get(chains__id__exact=contract.chain.id)
			contract.save(update_fields=['counter_signed', 'counter_signed_timestamp', 'counter_auth_hash'])
			write_pdf(request, contract, 'director', school)
			content = contract.pdf.read()
			attachment = (contract.pdf.name, content, 'application/pdf')
			attachments.append(attachment)
			mail_subject = 'O contrato foi assinado'
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
				block.previous_hash = 'NULO'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
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
				contract.first_auth_signed_timestamp = block.time_stamp
				contract.first_auth_hash = block.hash
				school = School.objects.get(chains__id__exact=contract.chain.id)
				contract.save(update_fields=['first_auth_signed', 'first_auth_signed_timestamp', 'first_auth_hash'])
				write_pdf(request, contract, 'first_auth', None)
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'O contrato foi assinado'
				message = render_to_string('contract/contractsigned.html', {
					'user': parent,
					'timestamp': contract.first_auth_signed_timestamp,
					'block': block,
					'school': school,
				})
				to_email = parent.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
			if contract.second_auth_signe == parent:
				contract.second_auth_signed = True
				contract.second_auth_signed_timestamp = block.time_stamp
				contract.second_auth_hash = block.hash
				school = School.objects.get(chains__id__exact=contract.chain.id)
				contract.save(update_fields=['second_auth_signed', 'second_auth_signed_timestamp', 'second_auth_hash'])
				write_pdf(request, contract, 'second_auth', None)
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'O contrato foi assinado'
				message = render_to_string('contract/contractsigned.html', {
					'user': parent,
					'timestamp': contract.second_auth_signed_timestamp,
					'block': block,
					'school': school,
				})
				to_email = parent.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
		elif Witness.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'NULO'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
				block.previous_hash=block.chain.last_block.hash
				block.nonce=SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				if block.is_valid_block(block.chain.last_block):
					print(block.is_valid_block(block.chain.last_block))
					block.save()
			attachments = []
			witness = Witness.objects.get(profile=request.user)
			if contract.first_witness_signe == witness:
				contract.first_witness_signed = True
				contract.first_witness_signed_timestamp = block.time_stamp
				contract.first_witness_hash = block.hash
				school = School.objects.get(chains__id__exact=contract.chain.id)
				contract.save(update_fields=['first_witness_signed', 'first_witness_signed_timestamp', 'first_witness_hash'])
				write_pdf(request, contract, 'first_witness', None)
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'O contrato foi assinado'
				message = render_to_string('contract/contractsigned.html', {
					'user': witness,
					'timestamp': contract.first_auth_signed_timestamp,
					'block': block,
					'school': school,
				})
				to_email = witness.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
			if contract.second_witness_signe == witness:
				contract.second_witness_signed = True
				contract.second_witness_signed_timestamp = block.time_stamp
				contract.second_witness_hash = block.hash
				school = School.objects.get(chains__id__exact=contract.chain.id)
				contract.save(update_fields=['second_witness_signed', 'second_witness_signed_timestamp', 'second_witness_hash'])
				write_pdf(request, contract, 'second_witness', None)
				content = contract.pdf.read()
				attachment = (contract.pdf.name, content, 'application/pdf')
				attachments.append(attachment)
				mail_subject = 'O contrato foi assinado'
				message = render_to_string('contract/contractsigned.html', {
					'user': witness,
					'timestamp': contract.second_auth_signed_timestamp,
					'block': block,
					'school': school,
				})
				to_email = witness.profile.email
				email = EmailMessage(
					mail_subject, message, to=[to_email], attachments=attachments
				)
				email.send()
				messages.success(request, 'Assinado com sucesso!')
		elif Student.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'NULO'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
				block.previous_hash=block.chain.last_block.hash
				block.nonce=SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				if block.is_valid_block(block.chain.last_block):
					print(block.is_valid_block(block.chain.last_block))
					block.save()
			attachments = []
			student = Student.objects.get(profile=request.user)
			contract.student_auth_signed = True
			contract.student_auth_signed_timestamp = block.time_stamp
			contract.student_auth_hash = block.hash
			contract.save(update_fields=['student_auth_signed', 'student_auth_signed_timestamp', 'student_auth_hash'])
			write_pdf(request, contract, 'student_auth')
			content = contract.pdf.read()
			attachment = (contract.pdf.name, content, 'application/pdf')
			attachments.append(attachment)
			mail_subject = 'O contrato foi assinado'
			message = render_to_string('contract/contractsigned.html', {
				'user': student,
				'timestamp': contract.student_auth_signed_timestamp,
				'block': block,
				'school': School.objects.get(chains__name__exact=block.chain.name),
			})
			to_email = student.profile.email
			email = EmailMessage(
				mail_subject, message, to=[to_email], attachments=attachments
			)
			email.send()
			messages.success(request, 'Assinado com sucesso!')
		contract = Contract.objects.get(contract_id=contract_id)
		if contract.first_witness_signe and contract.first_witness_signe:
			if contract.first_witness_signed and contract.second_witness_signed:
				contract.all_witness_signed = True
				messages.success(request, 'Todos as testemunhas assinaram')
				contract.save(update_fields=['all_witness_signed'])
			contract = Contract.objects.get(contract_id=contract_id)
			if (contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed and contract.all_witness_signed) or (contract.student_auth_signed and contract.counter_signed and contract.all_witness_signed):
				contract.all_signed = True
				write_pdf(request, contract, 'all_signed')
				messages.success(request, 'Todos os responsáveis desse contrato assinaram!')
				contract.save(update_fields=['all_signed'])
				return redirect('/contracts/all')
		else:
			if (contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed) or (contract.student_auth_signed and contract.counter_signed):
				contract.all_signed = True
				write_pdf(request, contract, 'all_signed')
				messages.success(request, 'Todos os responsáveis desse contrato assinaram!')
				contract.save(update_fields=['all_signed'])
				return redirect('/contracts/all')

	else:
		messages.warning(request, 'Você não é diretor nem pai do estudante deste contrato!')
	return redirect('/contracts/all')


@csrf_exempt
def set_signed_rest(request, contract_id = None):
	user = User.objects.get(id=current_user(request).data.get("id"))
	contract = Contract.objects.get(contract_id=contract_id)
	if Head.objects.filter(profile=user).count()>=1:
		if contract.counter_signed:
			contract_rest = ContractSerializer(contract)
			return get_data(request, contract_rest, 'O diretor já assinou este contrato!', 'warning')
	if Parent.objects.filter(profile=user).count()>=1:
		parent = Parent.objects.get(profile=request.user)
		if contract.first_auth_signe == parent:
			if contract.first_auth_signed:
				contract_rest = ContractSerializer(contract)
				return get_data(request, contract_rest,'O primeiro responsável já assinou este contrato!', 'warning')
		if contract.second_auth_signe == parent:
			if contract.second_auth_signed:
				contract_rest = ContractSerializer(contract)
				return get_data(request, contract_rest, 'O segundo responsável já assinou este contrato!', 'warning')
	if Head.objects.filter(profile=user).count()>=1 or Parent.objects.filter(profile=request.user).count()>=1:
		if Head.objects.filter(profile=request.user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'Basic hash for the chain'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
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
			contract.save(update_fields=['counter_signed', 'counter_signed_timestamp', 'counter_auth_hash'])
			write_pdf(request, contract, 'director')
			content = contract.pdf.read()
			attachment = (contract.pdf.name, content, 'application/pdf')
			attachments.append(attachment)
			mail_subject = 'O contrato foi assinado'
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
		elif Parent.objects.filter(profile=user).count()>=1:
			form = BlockModelFormByContract()
			block = form.save(commit=False)
			block.data = contract.name
			block.contract = contract
			block.chain = contract.chain
			if block.chain.__len__()<1:
				block.index = 0
				block.previous_hash = 'Basic hash for the chain'
				block.time_stamp=timezone.now()
				block.nonce = SymmetricEncryption.generate_salt(26)
				while not block.valid_hash():
					block.nonce = SymmetricEncryption.generate_salt(26)
				block.hash = block.__hash__()
				block.save()
			else:
				block.index=block.chain.last_block.index + 1
				block.time_stamp=timezone.now()
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
				mail_subject = 'O contrato foi assinado'
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
				mail_subject = 'O contrato foi assinado'
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
			contract_rest = ContractSerializer(contract)
			return get_data(request, contract_rest, 'Assinado com sucesso! Todos os responsáveis desse contrato assinaram!' , 'success')
	else:
		messages.warning(request, 'Você não é diretor nem pai do estudante deste contrato!')
		contract_rest = ContractSerializer(contract)
		return get_data(request, contract_rest, 'Você não é diretor nem pai do estudante deste contrato!' , 'warning')
	contract_rest = ContractSerializer(contract)
	return get_data(request, contract_rest, 'Assinado com sucesso!' , 'success')

def delete_contract(request, contract_id = None):
	contract_to_delete = Contract.objects.get(contract_id=contract_id)
	contract_to_delete.delete()
	messages.success(request, 'Contrato {} foi deletado com sucesso!'.format(contract_id))
	return redirect('/contracts/all')

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

@login_required
def protected_serve(request, path, contract_id=None, document_root=None):
	try:
		if Parent.objects.filter(profile=request.user).count()>=1:
			obj = Contract.objects.get(contract_id=contract_id)
			if Parent.objects.get(profile=request.user) == obj.first_auth_signe or Parent.objects.get(profile=request.user) == obj.second_auth_signe:
				obj_pdf_url = obj.pdf.url
				correct_pdf_url = obj_pdf_url.replace("/media/", "")
			else:
				return HttpResponse('Você não tem permissão para acessar esse arquivo')
		elif Head.objects.filter(profile=request.user).count()>=1:
			obj = Contract.objects.get(contract_id=contract_id)
			if Head.objects.get(profile=request.user) == obj.counter_signe:
				obj_pdf_url = obj.pdf.url
				correct_pdf_url = obj_pdf_url.replace("/media/", "")
			else:
				return HttpResponse('Você não tem permissão para acessar esse arquivo')
		elif Student.objects.filter(profile=request.user).count()>=1:
			obj = Contract.objects.get(contract_id=contract_id)
			if Student.objects.get(profile=request.user) == obj.student_auth_signe:
				obj_pdf_url = obj.pdf.url
				correct_pdf_url = obj_pdf_url.replace("/media/", "")
			else:
				return HttpResponse('Você não tem permissão para acessar esse arquivo')
		elif Witness.objects.filter(profile=request.user).count()>=1:
			obj = Contract.objects.get(contract_id=contract_id)
			if Witness.objects.get(profile=request.user) == obj.first_witness_signe or Witness.objects.get(profile=request.user) == obj.second_witness_signe:
				obj_pdf_url = obj.pdf.url
				correct_pdf_url = obj_pdf_url.replace("/media/", "")
			else:
				return HttpResponse('Você não tem permissão para acessar esse arquivo')
		elif request.user.is_superuser:
			obj = Contract.objects.get(contract_id=contract_id)
			obj_pdf_url = obj.pdf.url
			correct_pdf_url = obj_pdf_url.replace("/media/", "")
		if correct_pdf_url == path:
			return serve(request, path, document_root)
	except ObjectDoesNotExist:
		return HttpResponse('Você não tem permissão para acessar esse arquivo')

def directors_choices_ajax(request):
    chain_id = request.GET.get('id')
    school = School.objects.get(chains__id__exact=chain_id)
    context = {'directors':school.heads.all()}
    return render(request, 'contract/directors_choices.html', context)