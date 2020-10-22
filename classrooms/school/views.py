import csv, io
from django.shortcuts import render, redirect, reverse, get_object_or_404
from .serializers import *
from .models import *
from block.forms import *
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, generics, status
from .forms import *
from django.http import HttpResponse, Http404, HttpResponseRedirect
from block.models import *
from contract.models import *
import pdb
from block.utils import SymmetricEncryption, JsonApi, EncryptionApi
import datetime
from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import AllowAny
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK,
	HTTP_403_FORBIDDEN
)
from rest_framework.response import Response
from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from django.views.decorators.csrf import csrf_exempt
from school_users.models import *
from school_users.forms import *
from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_text
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from school_users.tokens import account_activation_token
from school.utils import get_sku_by_slm_url
import requests
from django.core import serializers
from django.http import JsonResponse
from xml.etree import cElementTree as ET
from collections import defaultdict
from .services import *
from django.contrib.auth.models import User
from django.db import transaction
from classrooms.pagination import *
from classrooms.ordering import *
from django.db.models import Q

# Create your views here.
class SchoolsViewSet(viewsets.ModelViewSet):
    """docstring for SchoolsViewSet"""
    queryset = School.objects.all().order_by('school_id')
    serializer_class = SchoolSerializer
    filter_backends = (DjangoFilterBackend, MyCustomOrdering)
    filterset_fields = '__all__'
    pagination_class = GeneralPagination

class SchoolsViewSetMinimal(viewsets.ModelViewSet):
    """docstring for SchoolsViewSet"""
    queryset = School.objects.all().order_by('school_id')
    serializer_class = MinimalSchoolSerializer
    filter_backends = (DjangoFilterBackend, MyCustomOrdering)
    filterset_fields = '__all__'
    pagination_class = GeneralPagination

@login_required
def create_school(request):
	if request.user.is_superuser:
		try:
			form = SchoolModelForm(request.POST or None)
			if form.is_valid():
				wish = request.POST.get('wish' or None)
				school = form.save(commit=False)
				if wish == 'sim':
					school.is_maple_bear = True
				school.save()
				form = SchoolModelForm()
				school_to_add_head = School.objects.get(school_id=school.school_id)
				messages.success(request, '{} adicionada corretamente!'.format(school_to_add_head.school_name))
				if school_to_add_head.sponte_client_number and school_to_add_head.sponte_token:
					save_students_to_school(request, school_to_add_head.school_id)
					save_parents(request, school_to_add_head.school_id)
				return redirect('/users/create_head_to_school/{}'.format(school_to_add_head.school_id))
		except Exception:
			storage = messages.get_messages(request)
			for message in storage:
			    del message
			school_to_add_head.delete()
			messages.warning(request, 'O número ou token sponte está inválido')
			return redirect('/schools/add_school')
		return render(request, 'school/add_school.html', {'form':form})
	return redirect('/')

@login_required
def seeallschools(request):
	if request.user.is_superuser:
		schools = School.objects.all()
		return render(request, 'school/seeallschools.html', {'schools':schools})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
		return render(request, 'school/seeallschools.html', {'schools':schools, 'is_supervisor':is_supervisor})
	elif Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
		return render(request, 'school/seeallschools.html', {'schools':schools, 'is_supervisor':is_supervisor})
	return redirect('/contracts/all')

@login_required
def seeallschoolsbyquery(request):
	current_school = None
	selected_school = None
	all_contracts = Contract.objects.all()
	complete_contracts_in_period = 0
	contracts_in_period = 0
	contracts_to_pay = 0
	value_to_pay = 0
	contracts_paid = 0
	error = ''
	query = None
	if request.user.is_superuser:
		schools = School.objects.all().order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date
			}
			
			try:
				current_school = School.objects.get(school_id=selected_school)
				all_contracts =  all_contracts.filter(chain__in=current_school.chains.all())

				if initial_date:
					all_contracts = all_contracts.filter(date__date__gte=initial_date)
				
				if final_date:
					all_contracts = all_contracts.filter(date__date__lte=final_date)									

				contracts_in_period = all_contracts.count()
				complete_contracts_in_period = all_contracts.filter(all_signed=True).count()
				contracts_to_pay = all_contracts.filter(is_paid=False).count()
				value_to_pay = current_school.value_per_contract * contracts_to_pay
				contracts_paid = all_contracts.filter(is_paid=True).count()
			except:
				error = 'Escola não selecionada'
		return render(request, 'school/seeallschoolsbyquery.html', {'schools': schools, 'current_school': current_school, 'contracts_to_pay': contracts_to_pay, 'contracts_paid': contracts_paid, 'contracts_in_period': contracts_in_period, 'complete_contracts_in_period': complete_contracts_in_period, 'value_to_pay': value_to_pay,  'selected_school': selected_school, 'error': error, 'query': query})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id).order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date
			}
			try:
				current_school = School.objects.get(school_id=selected_school)
				all_contracts =  all_contracts.filter(chain__in=current_school.chains.all())

				if initial_date:
					all_contracts = all_contracts.filter(date__date__gte=initial_date)
				
				if final_date:
					all_contracts = all_contracts.filter(date__date__lte=final_date)									

				contracts_in_period = all_contracts.count()
				complete_contracts_in_period = all_contracts.filter(all_signed=True).count()
				contracts_to_pay = all_contracts.filter(is_paid=False).count()
				value_to_pay = current_school.value_per_contract * contracts_to_pay
				contracts_paid = all_contracts.filter(is_paid=True).count()
			except:
				error = 'Escola não selecionada'
		return render(request, 'school/seeallschoolsbyquery.html', {'schools': schools, 'current_school': current_school, 'contracts_to_pay': contracts_to_pay, 'contracts_paid': contracts_paid, 'contracts_in_period': contracts_in_period, 'complete_contracts_in_period': complete_contracts_in_period, 'value_to_pay': value_to_pay,  'selected_school': selected_school, 'error': error, 'query': query, 'is_supervisor':is_supervisor})
	elif Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user))).order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date
			}
			try:
				current_school = School.objects.get(school_id=selected_school)
				all_contracts =  all_contracts.filter(chain__in=current_school.chains.all())

				if initial_date:
					all_contracts = all_contracts.filter(date__date__gte=initial_date)
				
				if final_date:
					all_contracts = all_contracts.filter(date__date__lte=final_date)									

				contracts_in_period = all_contracts.count()
				complete_contracts_in_period = all_contracts.filter(all_signed=True).count()
				contracts_to_pay = all_contracts.filter(is_paid=False).count()
				value_to_pay = current_school.value_per_contract * contracts_to_pay
				contracts_paid = all_contracts.filter(is_paid=True).count()
			except:
				error = 'Escola não selecionada'
		return render(request, 'school/seeallschoolsbyquery.html', {'schools': schools, 'current_school': current_school, 'contracts_to_pay': contracts_to_pay, 'contracts_paid': contracts_paid, 'contracts_in_period': contracts_in_period, 'complete_contracts_in_period': complete_contracts_in_period, 'value_to_pay': value_to_pay,  'selected_school': selected_school, 'error': error, 'query': query, , 'is_supervisor':is_supervisor})
	return redirect('/contracts/all')

@login_required
def seeallclassesbyquery(request):
	current_school = None
	current_class = None
	selected_school = None
	selected_class = None
	query = None
	error = ''
	if request.user.is_superuser:
		schools = School.objects.all().order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			selected_class = request.POST.get('selected_class' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date,
				'selected_class': int(selected_class) if selected_class else 0
			}
			try:
				current_school = School.objects.get(school_id=selected_school)
				try:
					current_class = Class.objects.get(class_id=selected_class)
				except:
					current_class = None
			except:
				pass
		return render(request, 'school/seeallclassesbyquery.html', {'schools': schools, 'current_school': current_school, 'current_class': current_class, 'selected_school': selected_school, 'selected_class': selected_class, 'query': query, 'error': error})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id).order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			selected_class = request.POST.get('selected_class' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date,
				'selected_class': int(selected_class) if selected_class else 0
			}
			try:
				current_school = School.objects.get(school_id=selected_school)
				try:
					current_class = Class.objects.get(class_id=selected_class)
				except:
					current_class = None
			except:
				error = 'Escola não selecionada'
		return render(request, 'school/seeallclassesbyquery.html', {'schools': schools, 'current_school': current_school, 'current_class': current_class, 'selected_school': selected_school, 'selected_class': selected_class, 'query': query, 'error': error})
	elif Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user))).order_by('school_name')
		if request.method == 'POST':
			selected_school = request.POST.get('selected_school' or 0)
			selected_class = request.POST.get('selected_class' or 0)
			initial_date = request.POST.get('initial_date' or None)
			final_date = request.POST.get('final_date' or None)
			query = {
				'selected_school': int(selected_school) if selected_school else 0,
				'initial_date': initial_date,
				'final_date': final_date,
				'selected_class': int(selected_class) if selected_class else 0
			}
			try:
				current_school = School.objects.get(school_id=selected_school)
				try:
					current_class = Class.objects.get(class_id=selected_class)
				except:
					current_class = None
			except:
				pass
		return render(request, 'school/seeallclassesbyquery.html', {'schools': schools, 'current_school': current_school, 'current_class': current_class, 'selected_school': selected_school, 'selected_class': selected_class, 'query': query, 'error': error})
	return redirect('/contracts/all')

@login_required
def seeschooldetails(request, school_id = None):
	if request.user.is_superuser:
		school = School.objects.get(school_id=school_id)
		return render(request, 'school/seeschooldetails.html', {'school':school})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school = School.objects.get(school_id=school_id)
		return render(request, 'school/seeschooldetails.html', {'school':school, 'is_supervisor':is_supervisor})

#weverton
@login_required
def seeclassbyid(request, class_id=None):
    if request.user.is_superuser:
        classe = Class.objects.get(class_id=class_id)
        school = School.objects.get(classes__class_id__exact=classe.class_id)
        return render(request,'school/seeclassbyid.html',{'classe':classe, 'school':school})
    elif Head.objects.filter(profile=request.user).count()>=1:
    	is_supervisor = True
    	classe = Class.objects.get(class_id=class_id)
    	school = School.objects.get(classes__class_id__exact=classe.class_id)
    	return render(request,'school/seeclassbyid.html',{'classe':classe,'school':school, 'is_supervisor':is_supervisor})
    return redirect('/')

#weverton
@login_required
def seechainbyid(request, chain_id=None):
    if request.user.is_superuser:
        chain = Chain.objects.get(id=chain_id)
        return render(request,'school/seechainbyname.html',{'chain':chain})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
    	is_supervisor = True
    	chain = Chain.objects.get(id=chain_id)
    	return render(request,'school/seechainbyname.html',{'chain':chain, 'is_supervisor':is_supervisor})
    return redirect('/')
    
@csrf_exempt
@api_view(['GET'])
def seeallschools_rest(request):
	if request.user.is_superuser:
		schools = School.objects.all()
		schools_rest = SchoolSerializer(schools, many=True)
		return Response({'schools':schools_rest.data})
	return redirect('/')

def etree_to_dict(t):
    d = {t.tag: {} if t.attrib else None}
    children = list(t)
    if children:
        dd = defaultdict(list)
        for dc in map(etree_to_dict, children):
            for k, v in dc.iteritems():
                dd[k].append(v)
        d = {t.tag: {k:v[0] if len(v) == 1 else v for k, v in dd.iteritems()}}
    if t.attrib:
        d[t.tag].update(('@' + k, v) for k, v in t.attrib.iteritems())
    if t.text:
        text = t.text.strip()
        if children or t.attrib:
            if text:
              d[t.tag]['#text'] = text
        else:
            d[t.tag] = text
    return d

def create_student_with_extracted_data(aluno, school_name):
	student_id_sponte = None
	name = None
	cpf_sponte = None
	rg_sponte = None
	midia_sponte = None
	bithday_sponte = None
	cep_sponte = None
	address_sponte = None
	address_number_sponte = None
	register_date_sponte = None
	RA_sponte = None
	note_sponte = None
	telephone_sponte = None
	cell_phone_sponte = None
	current_class_id = None
	financial_responsible_id_sponte = None
	didatic_responsible_id_sponte = None
	registration_number_sponte = None
	gender_sponte = None
	situation_sponte = None
	city_sponte = None
	neighborhood_sponte = None
	email = None
	username = None
	password = None
	hometown_sponte = None
	overdue_sponte = None
	origin_sponte = None
	original_name_sponte = None
	course_of_interest_sponte = None
	for mindata in aluno:
		if mindata.tag == '{http://api.sponteeducacional.net.br/}AlunoID':
			student_id_sponte =  mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Nome':
			name = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CPF':
			cpf_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}RG':
			rg_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Midia':
			midia_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}DataNascimento':
			bithday_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CEP':
			cep_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Endereco':
			address_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}NumeroEndereco':
			address_number_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Email':
			email = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}DataCadastro':
			register_date_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}RA':
			RA_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}LoginPortal':
			username = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}SenhaPortal':
			password = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Observacao':
			note_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Telefone':
			telephone_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Celular':
			cell_phone_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}TurmaAtual':
			current_class_id = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}ResponsavelFinanceiroID':
			financial_responsible_id_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}ResponsavelDidaticoID':
			didatic_responsible_id_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}NumeroMatricula':
			registration_number_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Sexo':
			gender_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Situacao':
			situation_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Cidade':
			city_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Bairro':
			neighborhood_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CidadeNatal':
			hometown_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Inadimplente':
			overdue_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Origem':
			origin_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}NomeOrigem':
			original_name_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CursoInteresse':
			course_of_interest_sponte = mindata.text
	if username:
		if User.objects.filter(username=username).count()>=1:
			if Student.objects.filter(student_id_sponte=student_id_sponte, name=name, cpf_sponte=cpf_sponte, midia_sponte=midia_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, register_date_sponte=register_date_sponte, RA_sponte=RA_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, current_class_id=current_class_id, financial_responsible_id_sponte=financial_responsible_id_sponte, didatic_responsible_id_sponte=didatic_responsible_id_sponte, registration_number_sponte=registration_number_sponte, gender_sponte=gender_sponte, situation_sponte=situation_sponte, city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, hometown_sponte=hometown_sponte, overdue_sponte=overdue_sponte, origin_sponte=origin_sponte, original_name_sponte=original_name_sponte, course_of_interest_sponte=course_of_interest_sponte, profile=User.objects.get(username=username)).count()>=1:
				return Student.objects.get(student_id_sponte=student_id_sponte, name=name, cpf_sponte=cpf_sponte, midia_sponte=midia_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, register_date_sponte=register_date_sponte, RA_sponte=RA_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, current_class_id=current_class_id, financial_responsible_id_sponte=financial_responsible_id_sponte, didatic_responsible_id_sponte=didatic_responsible_id_sponte, registration_number_sponte=registration_number_sponte, gender_sponte=gender_sponte, situation_sponte=situation_sponte, city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, hometown_sponte=hometown_sponte, overdue_sponte=overdue_sponte, origin_sponte=origin_sponte, original_name_sponte=original_name_sponte, course_of_interest_sponte=course_of_interest_sponte, profile=User.objects.get(username=username))
			elif Student.objects.filter(student_id_sponte=student_id_sponte, name=name, profile=User.objects.get(username=username)).count()>=1:
				student = Student.objects.get(student_id_sponte=student_id_sponte, name=name, profile=User.objects.get(username=username))
				student.financial_responsible_id_sponte=financial_responsible_id_sponte
				student.didatic_responsible_id_sponte=didatic_responsible_id_sponte
				student.save()
				return Student.objects.get(student_id_sponte=student_id_sponte, name=name, profile=User.objects.get(username=username))
		username = school_name + '-student-' + username
		if User.objects.filter(username=username).count()<1:
			return Student.objects.create(student_id_sponte=student_id_sponte, name=name, cpf_sponte=cpf_sponte, midia_sponte=midia_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, register_date_sponte=register_date_sponte, RA_sponte=RA_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, current_class_id=current_class_id, financial_responsible_id_sponte=financial_responsible_id_sponte, didatic_responsible_id_sponte=didatic_responsible_id_sponte, registration_number_sponte=registration_number_sponte, gender_sponte=gender_sponte, situation_sponte=situation_sponte, city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, hometown_sponte=hometown_sponte, overdue_sponte=overdue_sponte, origin_sponte=origin_sponte, original_name_sponte=original_name_sponte, course_of_interest_sponte=course_of_interest_sponte, profile=User.objects.create_user(username=username, first_name=name.split(' ')[0], last_name=name.split(' ')[-1], password=password, email=email))
		else:
			if Student.objects.filter(profile=User.objects.get(username=username)).count()>=1:
				student = Student.objects.get(profile=User.objects.get(username=username))
				student.financial_responsible_id_sponte=financial_responsible_id_sponte
				student.didatic_responsible_id_sponte=didatic_responsible_id_sponte
				student.save()
				return Student.objects.get(profile=User.objects.get(username=username))
	return None

def get_school_students(sponte_client_number, token, school_name):
	e = get_alunos(sponte_client_number, token, "SituacaoAlunoID=-1")
	students = []
	for aluno in e:
		student = create_student_with_extracted_data(aluno, school_name)
		if not student == None and student not in students:
			students += [(student)]
	return students

def remove_non_active_students(request, school_id=None, students=None):
	school = School.objects.get(school_id=school_id)
	for student in school.students.all():
		if students:
			if not student.situation_sponte == 'Ativo' or student not in students:
				school.students.remove(student)
		else:
			if not student.situation_sponte == 'Ativo':
				school.students.remove(student)
	return JsonResponse({'success' : 'OK'}, status=HTTP_200_OK)

def save_students_to_school(request, school_id=None):
	is_superuser = request.user.is_superuser;
	head_or_supervisor = Head.objects.filter(profile=request.user).count() >= 1 or Supervisor.objects.filter(profile=request.user).count() >= 1
	school = School.objects.get(school_id=school_id)
	students = get_school_students(school.sponte_client_number, school.sponte_token, school.school_name)
	remove_non_active_students(request, school_id, students)
	if is_superuser or head_or_supervisor:
		for student in students:
			if student not in school.students.all():
				school.students.add(student)
		school.save()
		return True
	return False

def create_parent_with_extracted_data(parent, school_name):
	responsible_id_sponte = None
	name = None
	cpf_or_cnpj_sponte = None
	rg_sponte = None
	bithday_sponte = None
	cep_sponte = None
	address_sponte = None
	address_number_sponte = None
	note_sponte = None
	telephone_sponte = None
	cell_phone_sponte = None
	gender_sponte = None
	city_sponte = None
	neighborhood_sponte = None
	kind_of_person = None
	email = None
	username = None
	password = None
	hometown_sponte = None
	overdue_sponte = None
	origin_sponte = None
	original_name_sponte = None
	course_of_interest_sponte = None
	for mindata in parent:
		if mindata.tag == '{http://api.sponteeducacional.net.br/}ResponsavelID':
			responsible_id_sponte =  mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Nome':
			name = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CPFCNPJ':
			cpf_or_cnpj_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}RG':
			rg_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}DataNascimento':
			bithday_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}CEP':
			cep_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Endereco':
			address_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}NumeroEndereco':
			address_number_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Email':
			email = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}LoginPortal':
			username = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}SenhaPortal':
			password = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Observacao':
			note_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Telefone':
			telephone_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Celular':
			cell_phone_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Sexo':
			gender_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Situacao':
			situation_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Cidade':
			city_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}Bairro':
			neighborhood_sponte = mindata.text
		if mindata.tag == '{http://api.sponteeducacional.net.br/}TipoPessoa':
			kind_of_person = mindata.text
	if username:
		if User.objects.filter(username=username).count()>=1:
			if Parent.objects.filter(responsible_id_sponte=responsible_id_sponte, name=name, cpf_or_cnpj_sponte=cpf_or_cnpj_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, gender_sponte=gender_sponte,  city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, kind_of_person=kind_of_person, profile=User.objects.get(username=username)).count()>=1:
				return Parent.objects.get(responsible_id_sponte=responsible_id_sponte, name=name, cpf_or_cnpj_sponte=cpf_or_cnpj_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, gender_sponte=gender_sponte,  city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, kind_of_person=kind_of_person, profile=User.objects.get(username=username))
			elif Parent.objects.filter(responsible_id_sponte=responsible_id_sponte, name=name, profile=User.objects.get(username=username)).count()>=1:
				return Parent.objects.get(responsible_id_sponte=responsible_id_sponte, name=name, profile=User.objects.get(username=username))
		username = school_name + '-parent-' + username
		if User.objects.filter(username=username).count()<1:
			return Parent.objects.create(responsible_id_sponte=responsible_id_sponte, name=name, cpf_or_cnpj_sponte=cpf_or_cnpj_sponte, bithday_sponte=bithday_sponte, cep_sponte=cep_sponte, address_sponte=address_sponte, address_number_sponte=address_number_sponte, note_sponte=note_sponte, telephone_sponte=telephone_sponte, cell_phone_sponte=cell_phone_sponte, gender_sponte=gender_sponte,  city_sponte=city_sponte, neighborhood_sponte=neighborhood_sponte, kind_of_person=kind_of_person, profile=User.objects.create_user(username=username, first_name=name.split(' ')[0], last_name=name.split(' ')[-1], password=password, email=email))
		else:
			if Parent.objects.filter(profile=User.objects.get(username=username)).count()>=1:
				return Parent.objects.get(profile=User.objects.get(username=username))
	return None

def get_school_parents(sponte_client_number, token, school_name):
	parents = []
	e = get_parents(sponte_client_number, token, "nome=a")
	for parent in e:
		newparent = create_parent_with_extracted_data(parent, school_name)
		if not newparent == None and newparent not in parents:
			parents += [(newparent)]
	e = get_parents(sponte_client_number, token, "nome=e")
	for parent in e:
		newparent = create_parent_with_extracted_data(parent, school_name)
		if not newparent == None and newparent not in parents:
			parents += [(newparent)]
	e = get_parents(sponte_client_number, token, "nome=i")
	for parent in e:
		newparent = create_parent_with_extracted_data(parent, school_name)
		if not newparent == None and newparent not in parents:
			parents += [(newparent)]
	e = get_parents(sponte_client_number, token, "nome=o")
	for parent in e:
		newparent = create_parent_with_extracted_data(parent, school_name)
		if not newparent == None and newparent not in parents:
			parents += [(newparent)]
	e = get_parents(sponte_client_number, token, "nome=u")
	for parent in e:
		newparent = create_parent_with_extracted_data(parent, school_name)
		if not newparent == None and newparent not in parents:
			parents += [(newparent)]
	return parents

def save_parents(request, school_id=None):
	is_superuser = request.user.is_superuser;
	head_or_supervisor = Head.objects.filter(profile=request.user).count() >= 1 or Supervisor.objects.filter(profile=request.user).count() >= 1
	school = School.objects.get(school_id=school_id)
	parents = get_school_parents(school.sponte_client_number, school.sponte_token, school.school_name)
	parents_ids = []
	for parent in parents:
		if parent.parent_id not in parents_ids:
			parents_ids += [(parent.parent_id)]
	if is_superuser or head_or_supervisor:
		for student in school.students.all():
			if Parent.objects.filter(responsible_id_sponte=student.financial_responsible_id_sponte).count()>=1:
				for parent in Parent.objects.filter(responsible_id_sponte=student.financial_responsible_id_sponte):
					if parent.parent_id in parents_ids:
						student.first_parent = parent
			if Parent.objects.filter(responsible_id_sponte=student.didatic_responsible_id_sponte).count()>=1:
				for parent in Parent.objects.filter(responsible_id_sponte=student.didatic_responsible_id_sponte):
					if parent.parent_id in parents_ids:
						student.second_parent = parent
			student.save(update_fields=['first_parent', 'second_parent'])
		return True
	return False


@login_required
def pull_students(request, school_id=None):

	could_save = False
	school = School.objects.get(school_id=school_id)
	if school.sponte_client_number and school.sponte_token:
		could_save = save_students_to_school(request, school_id)
		could_save = save_parents(request, school_id) and could_save

	if could_save:		
		return JsonResponse({'success' : 'OK'}, status=HTTP_200_OK)
	else:
		return JsonResponse({'error' : 'Não autorizado'}, status=HTTP_403_FORBIDDEN)


@login_required
def update_school(request, school_id=None):
	if request.user.is_superuser:
		instance = School.objects.get(school_id=school_id)
		form = SchoolModelFormWithSupervisorAndDirector(request.POST or None, instance=instance)
		if form.is_valid():
			school = form.save(commit=False)
			for classe in school.classes.all():
				chain = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name))
				chain.name = "{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name)
				chain.save(update_fields=['name'])		
			form.save_m2m()
			school.save(update_fields=['school_name', 'sponte_client_number', 'sponte_token', 'country', 'state', 'city','app_name', 'adminorsupervisor', 'adminorsupervisor_2', 'tell_me_school_id', 'value_per_contract'])
			messages.success(request, 'A escola foi atualizada com sucesso!')
			return redirect('/')
		return render(request, 'school/update_school.html', {'form':form, 'school_id': school_id})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		instance = School.objects.get(school_id=school_id)
		form = SchoolModelFormWithSupervisor(request.POST or None, instance=instance)
		if form.is_valid():
			school = form.save(commit=False)
			for classe in school.classes.all():
				chain = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name))
				chain.name = "{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name)
				chain.save(update_fields=['name'])
			form.save_m2m()
			school.save(update_fields=['school_name', 'sponte_client_number', 'sponte_token', 'country', 'state', 'city','app_name', 'adminorsupervisor', 'adminorsupervisor_2', 'tell_me_school_id'])
			messages.success(request, 'A escola foi atualizada com sucesso!')
			return redirect('/')
		return render(request, 'school/update_school.html', {'form':form, 'is_supervisor':is_supervisor, 'school_id': school_id})

@csrf_exempt
@api_view(['POST'])
def update_school_rest(request, school_id=None):
	instance = School.objects.get(school_id=school_id)
	instance.school_name = request.POST.get('school_name')
	instance.enrollment_year = request.POST.get('enrollment_year')
	instance.save(update_fields=['school_name', 'enrollment_year'])
	schools_rest = SchoolSerializer(instance)
	return Response({'schools':schools_rest.data})

@login_required
def delete_school(request, school_id=None):
	if request.user.is_superuser:
		school_to_delete = School.objects.get(school_id=school_id)
		for chain in school_to_delete.chains.all():
			Contract.objects.filter(chain=chain).delete()
			chain.delete()
		for classe in school_to_delete.classes.all():
			classe.delete()
		for student in school_to_delete.students.all():
			if School.objects.filter(students__student_id__exact=student.student_id).count()<2:
				try:
					if student.first_parent and student.second_parent:
						if not student.first_parent == student.second_parent:
							if student.first_parent:
								if student.first_parent.profile:
									student.first_parent.profile.delete()
								student.first_parent.delete()
							if student.second_parent:
								if student.second_parent.profile:
									student.second_parent.profile.delete()
								student.second_parent.delete()
						else:
							if student.first_parent:
								if student.first_parent.profile:
									student.first_parent.profile.delete()
								student.first_parent.delete()
					else:
						if student.first_parent:
							if student.first_parent.profile:
								student.first_parent.profile.delete()
							student.first_parent.delete()
						if student.second_parent:
							if student.second_parent.profile:
								student.second_parent.profile.delete()
							student.second_parent.delete()
				except Exception as e:
					print (str(e))
					pass
				if student.profile:
					student.profile.delete()
				student.delete()
		for head in school_to_delete.heads.all():
			if School.objects.filter(heads__head_id__exact=head.head_id).count()<2:
				if head.profile:
					head.profile.delete()
				head.delete()
		if school_to_delete.adminorsupervisor:
			if School.objects.filter(Q(adminorsupervisor=school_to_delete.adminorsupervisor)|Q(adminorsupervisor_2=school_to_delete.adminorsupervisor)).count()<2:
				if school_to_delete.adminorsupervisor.profile:
					school_to_delete.adminorsupervisor.profile.delete()
				school_to_delete.adminorsupervisor.delete()
		if school_to_delete.adminorsupervisor_2:
			if School.objects.filter(Q(adminorsupervisor=school_to_delete.adminorsupervisor_2)|Q(adminorsupervisor_2=school_to_delete.adminorsupervisor_2)).count()<2:
				if school_to_delete.adminorsupervisor_2.profile:
					school_to_delete.adminorsupervisor_2.profile.delete()
				school_to_delete.adminorsupervisor_2.delete()
		if school_to_delete.first_witness:
			if School.objects.filter(first_witness=school_to_delete.first_witness).count()<2:
				if school_to_delete.first_witness.profile:
					school_to_delete.first_witness.profile.delete()
				school_to_delete.first_witness.delete()
		if school_to_delete.second_witness:
			if School.objects.filter(first_witness=school_to_delete.second_witness).count()<2:
				if school_to_delete.second_witness.profile:
					school_to_delete.second_witness.profile.delete()
				school_to_delete.second_witness.delete()
		school_to_delete.delete()
		messages.success(request, 'Escola excluída com sucessso!')
		return redirect('/')

@csrf_exempt
@api_view(['GET'])
def delete_school_rest(request, school_id=None):
	school_to_delete = School.objects.get(school_id=school_id)
	school_to_delete.delete()
	return HttpResponse('This school has been deleted correctly')

@login_required
def add_class(request, school_id=None):
	if request.user.is_superuser:
		school_to_add_class = School.objects.get(school_id=school_id)
		form = ClassModelForm(request.POST or None)
		form.fields['students'].queryset = school_to_add_class.students.all()
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não' or None)
			if form.is_valid():
				classroom = form.save(commit=False)
				newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
				school_to_add_class.chains.add(newchain)
				if classroom.slm:
					sku = get_sku_by_slm_url(classroom.slm)
					if sku: classroom.sku = sku
					print('slm', classroom.slm)
					print('sku', classroom.sku)
				classroom.save()
				form.save_m2m()
				
				newclassroom = Class.objects.get(class_id=classroom.class_id)
				newchain.classe = newclassroom
				newchain.save()
				school_to_add_class.classes.add(newclassroom)
				messages.success(request, 'Classe adicionada com sucesso!')
				if yesorno == 'sim':
					return redirect('/schools/{}/add_another_class'.format(school_id))
				return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_class.html', {'form':form})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school_to_add_class = School.objects.get(school_id=school_id)
		form = ClassModelForm(request.POST or None)
		form.fields['students'].queryset = school_to_add_class.students.all()
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não' or None)
			if form.is_valid():
				classroom = form.save(commit=False)
				newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
				school_to_add_class.chains.add(newchain)
				if classroom.slm:
					sku = get_sku_by_slm_url(classroom.slm)
					if sku: classroom.sku = sku
					print('slm', classroom.slm)
					print('sku', classroom.sku)
				classroom.save()
				form.save_m2m()
				
				newclassroom = Class.objects.get(class_id=classroom.class_id)
				newchain.classe = newclassroom
				newchain.save()
				school_to_add_class.classes.add(newclassroom)
				messages.success(request, 'Classe adicionada com sucesso!')
				if yesorno == 'sim':
					return redirect('/schools/{}/add_another_class'.format(school_id))
				return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_class.html', {'form':form, 'is_supervisor':is_supervisor})

@login_required
def add_another_class(request, school_id=None):
	if request.user.is_superuser:
		school_to_add_class = School.objects.get(school_id=school_id)
		form = ClassModelForm(request.POST or None)
		form.fields['students'].queryset = school_to_add_class.students.all()
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não' or None)
			if form.is_valid():
				classroom = form.save(commit=False)
				newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
				school_to_add_class.chains.add(newchain)
				if classroom.slm:
					sku = get_sku_by_slm_url(classroom.slm)
					if sku: classroom.sku = sku
					print('slm', classroom.slm)
					print('sku', classroom.sku)
				classroom.save()
				form.save_m2m()
				
				newclassroom = Class.objects.get(class_id=classroom.class_id)
				school_to_add_class.classes.add(newclassroom)
				messages.success(request, 'Classe adicionada com sucesso!')
				if yesorno == 'sim':
					return redirect('/schools/{}/add_another_class'.format(school_id))
				return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_another_class.html', {'form':form, 'school':school_to_add_class})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school_to_add_class = School.objects.get(school_id=school_id)
		form = ClassModelForm(request.POST or None)
		form.fields['students'].queryset = school_to_add_class.students.all()
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não' or None)
			if form.is_valid():
				classroom = form.save(commit=False)
				newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
				school_to_add_class.chains.add(newchain)
				if classroom.slm:
					sku = get_sku_by_slm_url(classroom.slm)
					if sku: classroom.sku = sku
					print('slm', classroom.slm)
					print('sku', classroom.sku)
				classroom.save()
				form.save_m2m()
				
				newclassroom = Class.objects.get(class_id=classroom.class_id)
				school_to_add_class.classes.add(newclassroom)
				messages.success(request, 'Classe adicionada com sucesso!')
				if yesorno == 'sim':
					return redirect('/schools/{}/add_another_class'.format(school_id))
				return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_another_class.html', {'form':form, 'is_supervisor':is_supervisor, 'school':school_to_add_class})

@csrf_exempt
@api_view(['POST'])
def add_class_rest(request, school_id=None):
	school_to_add_class = School.objects.get(school_id=school_id)
	classroom = Class.objects.create(class_name=request.POST.get('class_name'), class_level=request.POST.get('class_level'), class_unit=request.POST.get('class_unit'))
	newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
	school_to_add_class.chains.add(newchain)
	newclassroom = Class.objects.get(class_id=classroom.class_id)
	school_to_add_class.classes.add(newclassroom)
	school_rest = SchoolSerializer(school_to_add_class)
	return Response({'school_with_new_class':school_rest.data})

@login_required
def update_class(request, class_id=None):
	if request.user.is_superuser:
		class_to_update = Class.objects.get(class_id=class_id)
		school_to_update_class = School.objects.get(classes__class_id__exact=class_to_update.class_id)
		chain_to_be_updated = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, class_to_update.enrollment_class_year, class_to_update.class_unit, class_to_update.class_name))
		form = ClassModelForm(request.POST or None, instance=class_to_update)
		form.fields['students'].queryset = school_to_update_class.students.all()
		if form.is_valid():
			classroom = form.save(commit=False)
			chain_to_be_updated.name = "{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name)
			chain_to_be_updated.save(update_fields=['name'])
			if classroom.slm:
				sku = get_sku_by_slm_url(classroom.slm)
				if sku: classroom.sku = sku
				print('slm', classroom.slm)
				print('sku', classroom.sku)
			form.save_m2m()
			classroom.save(update_fields=['class_name', 'class_unit', 'enrollment_class_year','slm', 'sku'])

			messages.success(request, 'Classe e blockchain referente à classe atualizadas com sucesso!')
			return redirect('/')
		return render(request, 'school/update_class.html', {'form':form})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		class_to_update = Class.objects.get(class_id=class_id)
		school_to_update_class = School.objects.get(classes__class_id__exact=class_to_update.class_id)
		chain_to_be_updated = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, class_to_update.enrollment_class_year, class_to_update.class_unit, class_to_update.class_name))
		form = ClassModelForm(request.POST or None, instance=class_to_update)
		form.fields['students'].queryset = school_to_update_class.students.all()
		if form.is_valid():
			classroom = form.save(commit=False)
			chain_to_be_updated.name = "{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name)
			chain_to_be_updated.save(update_fields=['name'])
			if classroom.slm:
				sku = get_sku_by_slm_url(classroom.slm)
				if sku: classroom.sku = sku
				print('slm', classroom.slm)
				print('sku', classroom.sku)
			form.save_m2m()				
			classroom.save(update_fields=['class_name', 'class_unit', 'enrollment_class_year','slm', 'sku'])
			
			messages.success(request, 'Classe e blockchain referente à classe atualizadas com sucesso!')
			return redirect('/')
		return render(request, 'school/update_class.html', {'form':form, 'is_supervisor':is_supervisor})

@login_required
def delete_class(request, class_id=None):
	if request.user.is_superuser or Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		class_to_delete = Class.objects.get(class_id=class_id)
		school = School.objects.get(classes__class_id__exact=class_id)
		chain_to_delete = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school.school_name, class_to_delete.enrollment_class_year, class_to_delete.class_unit, class_to_delete.class_name))
		chain_to_delete.delete()
		class_to_delete.delete()
		messages.success(request, 'Esta classe foi deletada corretamente e o blockchain referente a ela também!')
		return redirect('/')


def create_block(request):
	form = BlockModelForm(request.POST or None)
	if form.is_valid():
		block = form.save(commit=False)
		if block.chain.__len__()<1:
			block.index = 0
			block.previous_hash = 'Basic hash for test'
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
		return redirect('/')
	return render(request, 'school/create_block.html', {'form':form})

def verifyvalidchain(request, class_id=None):
	try:
		class_to_verify_chain = Class.objects.get(class_id=class_id)
		school_to_verify_chain = School.objects.get(classes__class_id__exact=class_to_verify_chain.class_id)
		name_of_chain = "{0}-{1}-{2}-{3}".format(school_to_verify_chain.school_name, class_to_verify_chain.enrollment_class_year, class_to_verify_chain.class_unit, class_to_verify_chain.class_name)
		chain_to_be_verified = Chain.objects.get(name=name_of_chain)
		verify = chain_to_be_verified.is_valid_chain()
		if verify or chain_to_be_verified.block_set.count()==0:
			messages.success(request, 'O chain para esta turma é válido!')
			return redirect('/')
		messages.error(request, 'O chain para esta turma não é válido')
	except:
		messages.error(request, 'Turma ou Escola não encontrados')
	return redirect('/')

def add_head_to_school(request, school_id=None):
	pass

@login_required
def add_teachers_to_school(request, school_id=None):
	if request.user.is_superuser:
		school = School.objects.get(school_id=school_id)
		teacher_users = Teacher.objects.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			school.teachers.clear()
			if select_all:
				school.teachers.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					teacher = Teacher.objects.get(teacher_id=var)
					school.teachers.add(teacher)
			messages.success(request, 'Professores alterados na escola com sucesso')
			return redirect('/')
		return render(request, 'school/add_teachers_to_school.html', {'teacher_users':teacher_users, 'school':school})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school = School.objects.get(school_id=school_id)
		teacher_users = Teacher.objects.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			school.teachers.clear()
			if select_all:
				school.teachers.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					teacher = Teacher.objects.get(teacher_id=var)
					school.teachers.add(teacher)
			messages.success(request, 'Professores alterados na escola com sucesso')
			return redirect('/')
		return render(request, 'school/add_teachers_to_school.html', {'is_supervisor':is_supervisor, 'student_users':student_users, 'school':school})

@login_required
def add_teachers_to_class(request, class_id=None):
	if request.user.is_superuser:
		class_to_add_teacher = Class.objects.get(class_id=class_id)
		school = School.objects.get(classes__class_id__exact=class_to_add_teacher.class_id)
		teacher_users = school.teachers.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			class_to_add_teacher.teachers.clear()
			if select_all:
				school.teachers.add(*teacher_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					teacher = Teacher.objects.get(teacher_id=var)
					class_to_add_teacher.teachers.add(teacher)
			messages.success(request, 'Professores alterados na classe com sucesso!')
			return redirect('/')
		return render(request, 'school/add_teacher_to_class.html', {'teacher_users':teacher_users, 'class':class_to_add_teacher})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		class_to_add_teacher = Class.objects.get(class_id=class_id)
		school = School.objects.get(classes__class_id__exact=class_to_add_teacher.class_id)
		teacher_users = school.teachers.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			class_to_add_teacher.teachers.clear()
			if select_all:
				class_to_add_teacher.teachers.add(*teacher_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					teacher = Teacher.objects.get(teacher_id=var)
					class_to_add_teacher.teachers.add(teacher)
			messages.success(request, 'Professores alterados na classe com sucesso!')
			return redirect('/')
		return render(request, 'school/add_teacher_to_class.html', {'is_supervisor':is_supervisor, 'teacher_users':teacher_users, 'class':class_to_add_teacher})

@login_required
def select_head_to_school(request, school_id=None):
	if request.user.is_superuser:
		school_to_select_head = School.objects.get(school_id=school_id)
		form = SchoolAddHeadModelForm(request.POST or None, instance=school_to_select_head)

@login_required
def add_students_to_school(request, school_id=None):
	if request.user.is_superuser:
		school = School.objects.get(school_id=school_id)
		student_ids = []
		for head in school.heads.all():
			if School.objects.filter(heads__head_id__exact=head.head_id).count()>1:
				for school in School.objects.filter(heads__head_id__exact=head.head_id):
					for student in school.students.all():
						if student.student_id not in student_ids:
							student_ids+=[(student.student_id)]
		student_users = Student.objects.filter(student_id__in=student_ids)
		if student_users.count()<1:
			student_users = Student.objects.all()
		if not student_users:
			student_users = Student.objects.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			school.students.clear()
			if select_all == 'true':
				school.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					school.students.add(student)
			messages.success(request, 'Estudantes alterados na escola com sucesso!')
			return redirect('/')
		return render(request, 'school/add_students_to_school.html', {'student_users':student_users, 'school':school})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school = School.objects.get(school_id=school_id)
		student_ids = []
		if School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id).count()>1:
			for school in School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id):
				for student in school.students.all():
					if student.student_id not in student_ids:
						student_ids+=[(student.student_id)]
		student_users = Student.objects.filter(student_id__in=student_ids)
		school = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			school.students.clear()
			if select_all == 'true':
				school.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					school.students.add(student)
			messages.success(request, 'Estudantes alterados na escola com sucesso!')
			return redirect('/')
		return render(request, 'school/add_students_to_school.html', {'is_supervisor':is_supervisor, 'student_users':student_users, 'school':school})

def add_students_to_class(request, class_id=None):
	if request.user.is_superuser:
		class_to_add_student = Class.objects.get(class_id=class_id)
		school = School.objects.get(classes__class_id__exact=class_to_add_student.class_id)
		student_users = school.students.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			class_to_add_student.students.clear()
			if select_all == 'true':
				class_to_add_student.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					class_to_add_student.students.add(student)
			messages.success(request, 'Estudantes alterados na classe com sucesso')
			return redirect('/')
		return render(request, 'school/add_students_to_class.html', {'student_users':student_users, 'class':class_to_add_student})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		class_to_add_student = Class.objects.get(class_id=class_id)
		school = School.objects.get(classes__class_id__exact=class_to_add_student.class_id)
		student_users = school.students.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			class_to_add_student.students.clear()
			if select_all == 'true':
				class_to_add_student.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					class_to_add_student.students.add(student)
			messages.success(request, 'Estudantes alterados na classe com sucesso')
			return redirect('/')
		return render(request, 'school/add_students_to_class.html', {'is_supervisor':is_supervisor, 'student_users':student_users, 'class':class_to_add_student})

@login_required
def add_student_to_class_and_school(request, school_id=None, class_id=None):
	if request.user.is_superuser:
		school_to_add_student = School.objects.get(school_id=school_id)
		class_to_add_student = Class.objects.get(class_id=class_id)
		form = UserModelForm(request.POST or None)
		form2 = StudentModelForm(request.POST or None)
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não')
			importornoimport = request.POST.get('import/noimport')
			if yesorno == 'não':
				if importornoimport == 'não':
					if form.is_valid():
						user = form.save(commit=False)
						user.username = user.first_name.lower()+user.last_name.lower()
						i=0
						user.username = user.username.replace(" ", "")
						while User.objects.filter(username=user.username).count()>=1:
							user.username = user.first_name.lower()+user.last_name.lower()
							user.username = user.username + str(i)
							user.username = user.username.replace(" ", "")
							i+=1
						user.save()
						user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
						user_creation = form2.save(commit=False)
						user_creation.profile = user_profile
						user_creation.name = user_profile.first_name+' '+user_profile.last_name
						user_creation.maple_bear_email = user_profile.email
						user_creation.save()
						student = Student.objects.get(student_id=user_creation.student_id)
						diff = datetime.date.today() - user_creation.birthday
						age = diff.days//365
						if age >= 18:
							return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student.student_id, school_to_add_student.school_id, class_to_add_student.class_id))
						school_to_add_student.students.add(student)
						class_to_add_student.students.add(student)
						messages.success(request, 'Estudante criado com sucesso!')
						return redirect('/schools/{}/add_class/{}/add_student/{}/add_first_parent_to_student'.format(school_id, class_id, student.student_id))
				elif importornoimport == 'sim':
					csv_file = request.FILES.get('file' or None)
					if csv_file:
						if not csv_file.name.endswith('.csv'):
							messages.warning(request, 'O arquivo enviado não é CSV')
							return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, class_id))
						data_set = csv_file.read().decode('UTF-8')
						io_string = io.StringIO(data_set)
						next(io_string)
						if ',' in data_set:
							for column in csv.reader(io_string, delimiter=',', quotechar='|'):
								if column[0]:
									if column[4]==column[5]:
										if column[6]:
											if column[11]:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
											school_to_add_student.students.add(_)
											class_to_add_student.students.add(_)
										elif column[7]:
											_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
						elif ';' in data_set:
							for column in csv.reader(io_string, delimiter=';', quotechar='|'):
								if column[0]:
									if column[4]==column[5]:
										if column[6]:
											if column[11]:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
											school_to_add_student.students.add(_)
											class_to_add_student.students.add(_)
										elif column[7]:
											_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
						messages.success(request, 'Usuários adicionados com sucesso')
						return redirect('/')
					else:
						messages.error(request, 'Nenhum arquivo enviado')
						return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, class_id))
			elif yesorno == 'sim':
				return redirect('/schools/{}/add_class/{}/add_multiple_students'.format(school_id, class_id))
		return render(request, 'school_users/add_student.html', {'form':form, 'form2':form2})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school_to_add_student = School.objects.get(school_id=school_id)
		class_to_add_student = Class.objects.get(class_id=class_id)
		form = UserModelForm(request.POST or None)
		form2 = StudentModelForm(request.POST or None)
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não')
			importornoimport = request.POST.get('import/noimport')
			if yesorno == 'não':
				if importornoimport == 'não':
					if form.is_valid():
						user = form.save(commit=False)
						user.username = user.first_name.lower()+user.last_name.lower()
						i=0
						user.username = user.username.replace(" ", "")
						while User.objects.filter(username=user.username).count()>=1:
							user.username = user.first_name.lower()+user.last_name.lower()
							user.username = user.username + str(i)
							user.username = user.username.replace(" ", "")
							i+=1
						user.save()
						user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
						user_creation = form2.save(commit=False)
						user_creation.profile = user_profile
						user_creation.name = user_profile.first_name+' '+user_profile.last_name
						user_creation.maple_bear_email = user_profile.email
						user_creation.save()
						student = Student.objects.get(student_id=user_creation.student_id)
						diff = datetime.date.today() - user_creation.birthday
						age = diff.days//365
						if age >= 18:
							return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student.student_id, school_to_add_student.school_id, class_to_add_student.class_id))
						school_to_add_student.students.add(student)
						class_to_add_student.students.add(student)
						messages.success(request, 'Estudante criado com sucesso!')
						return redirect('/schools/{}/add_class/{}/add_student/{}/add_first_parent_to_student'.format(school_id, class_id, student.student_id))
				elif importornoimport == 'sim':
					csv_file = request.FILES.get('file' or None)
					if csv_file:
						if not csv_file.name.endswith('.csv'):
							messages.warning(request, 'O arquivo enviado não é CSV')
							return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, class_id))
						data_set = csv_file.read().decode('UTF-8')
						io_string = io.StringIO(data_set)
						next(io_string)
						if ',' in data_set:
							for column in csv.reader(io_string, delimiter=',', quotechar='|'):
								if column[0]:
									if column[4]==column[5]:
										if column[6]:
											if column[11]:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
											school_to_add_student.students.add(_)
											class_to_add_student.students.add(_)
										elif column[7]:
											_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
						elif ';' in data_set:
							for column in csv.reader(io_string, delimiter=';', quotechar='|'):
								if column[0]:
									if column[4]==column[5]:
										if column[6]:
											if column[11]:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												if column[8] and column[9]:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
												else:
													_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
											school_to_add_student.students.add(_)
											class_to_add_student.students.add(_)
										elif column[7]:
											_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
						messages.success(request, 'Usuários adicionados com sucesso')
						return redirect('/')
					else:
						messages.error(request, 'Nenhum arquivo enviado')
						return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, class_id))
			elif yesorno == 'sim':
				return redirect('/schools/{}/add_another_class/select_class_to_add_students'.format(school_id))
		return render(request, 'school_users/add_student.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

@login_required
def add_students_for_multiple_classes(request, school_id=None):
	if request.user.is_superuser:
		school_to_add_student = School.objects.get(school_id=school_id)
		form = UserModelForm(request.POST or None)
		form2 = StudentModelForm(request.POST or None)
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não')
			if yesorno == 'não':
				csv_file = request.FILES.get('file' or None)
				if csv_file:
					if not csv_file.name.endswith('.csv'):
						messages.warning(request, 'O arquivo enviado não é CSV')
						return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id, class_id))
					data_set = csv_file.read().decode('UTF-8')
					io_string = io.StringIO(data_set)
					next(io_string)
					if ',' in data_set:
						for column in csv.reader(io_string, delimiter=',', quotechar='|'):
							if column[0]:
								if column[4]==column[5]:
									if column[6]:
										if column[11]:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
										else:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
										school_to_add_student.students.add(_)
										if column[10]:
											class_to_add_student = Class.objects.get(class_id = column[10])
											class_to_add_student.students.add(_)
									elif column[7]:
										_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
					elif ';' in data_set:
						for column in csv.reader(io_string, delimiter=';', quotechar='|'):
							if column[0]:
								if column[4]==column[5]:
									if column[6]:
										if column[11]:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
										else:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
										school_to_add_student.students.add(_)
										if column[10]:
											class_to_add_student = Class.objects.get(class_id = column[10])
											class_to_add_student.students.add(_)
									elif column[7]:
										_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
					messages.success(request, 'Usuários adicionados com sucesso')
					return redirect('/')
				else:
					messages.error(request, 'Nenhum arquivo enviado')
					return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id, class_id))
			elif yesorno == 'sim':
				return redirect('/schools/{}/add_another_class/select_class_to_add_students'.format(school_id))
		return render(request, 'school_users/add_students_for_multiple_classes.html', {'school':school_to_add_student})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school_to_add_student = School.objects.get(school_id=school_id)
		form = UserModelForm(request.POST or None)
		form2 = StudentModelForm(request.POST or None)
		if request.method == 'POST':
			yesorno = request.POST.get('sim/não')
			if yesorno == 'não':
				csv_file = request.FILES.get('file' or None)
				if csv_file:
					if not csv_file.name.endswith('.csv'):
						messages.warning(request, 'O arquivo enviado não é CSV')
						return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id))
					data_set = csv_file.read().decode('UTF-8')
					io_string = io.StringIO(data_set)
					next(io_string)
					if ',' in data_set:
						for column in csv.reader(io_string, delimiter=',', quotechar='|'):
							if column[0]:
								if column[4]==column[5]:
									if column[6]:
										if column[11]:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
										else:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
										if column[10]:
											class_to_add_student = Class.objects.get(class_id = column[10])
											class_to_add_student.students.add(_)
									elif column[7]:
										_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
					elif ';' in data_set:
						for column in csv.reader(io_string, delimiter=';', quotechar='|'):
							if column[0]:
								if column[4]==column[5]:
									if column[6]:
										if column[11]:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6], date_of_birth=column[11])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6], date_of_birth=column[11])
										else:
											if column[8] and column[9]:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
											else:
												_, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
										school_to_add_student.students.add(_)
										if column[10]:
											class_to_add_student = Class.objects.get(class_id = column[10])
											class_to_add_student.students.add(_)
									elif column[7]:
										_, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
					messages.success(request, 'Usuários adicionados com sucesso')
					return redirect('/')
				else:
					messages.error(request, 'Nenhum arquivo enviado')
					return redirect('/schools/{}/add_another_class/add_students_for_multiple_classes'.format(school_id, class_id))
			elif yesorno == 'sim':
				return redirect('/schools/{}/add_another_class/select_class_to_add_students'.format(school_id))
		return render(request, 'school_users/add_students_for_multiple_classes.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

@login_required
def select_class_to_add_students(request, school_id=None):
	if request.user.is_superuser:
		school_to_add_student = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			selected_class = request.POST.get('selected_class' or None)
			classe = Class.objects.get(class_id=selected_class)
			return redirect('/schools/{}/add_another_class/{}/add_multiple_students'.format(school_id, classe.class_id))
		return render(request, 'school/select_class_to_add_students.html', {'school':school_to_add_student})
	elif Head.objects.filter(profile=request.user).count()>=1:
		school_to_add_student = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			selected_class = request.POST.get('selected_class' or None)
			classe = Class.objects.get(class_id=selected_class)
			return redirect('/schools/{}/add_another_class/{}/add_multiple_students'.format(school_id, classe.class_id))
		return render(request, 'school/select_class_to_add_students.html', {'school':school_to_add_student, 'is_supervisor':True})

@login_required
def add_multple_students_for_class_and_school(request, school_id= None, class_id=None):
	if request.user.is_superuser:
		first_school = School.objects.get(school_id=school_id)
		classe = Class.objects.get(class_id=class_id)
		student_ids = []
		for head in first_school.heads.all():
			if School.objects.filter(heads__head_id__exact=head.head_id).count()>1:
				for school in School.objects.filter(heads__head_id__exact=head.head_id):
					for student in school.students.all():
						if student.student_id not in student_ids:
							student_ids+=[(student.student_id)]
		student_users = Student.objects.filter(student_id__in=student_ids)
		if student_users.count()<1:
			student_users = Student.objects.all()
		first_school = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			yesorno = request.POST.get('sim/não' or None)
			first_school.students.clear()
			classe.students.clear()
			if select_all == 'true':
				first_school.students.add(*student_users)
				classe.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					first_school.students.add(student)
					classe.students.add(student)
			messages.success(request, 'Estudantes adicionados com sucesso!')
			if yesorno == 'sim':
				return redirect('/schools/{}/add_another_class/select_class_to_add_students'.format(school_id))
			return redirect('/')
		return render(request, 'school/add_students_to_class_for_multiple_classes.html', {'student_users':student_users, 'school':first_school, 'class':classe})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		first_school = School.objects.get(school_id=school_id)
		classe = Class.objects.get(class_id=class_id)
		student_users = []
		schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
		first_school = School.objects.get(school_id=school_id)
		for school in schools:
			for student in school.students.all():
				if student not in student_users:
					student_users += [(student)]
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			yesorno = request.POST.get('sim/não' or None)
			first_school.students.clear()
			classe.students.clear()
			if select_all == 'true':
				first_school.students.add(*student_users)
				classe.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					first_school.students.add(student)
					classe.students.add(student)
			messages.success(request, 'Estudantes adicionados com sucesso!')
			if yesorno == 'sim':
				return redirect('/schools/{}/add_another_class/select_class_to_add_students'.format(school_id))
			return redirect('/')
		return render(request, 'school/add_students_to_class_for_multiple_classes.html', {'is_supervisor':is_supervisor, 'student_users':student_users, 'school':first_school})

@login_required
def add_first_parent_to_student(request, school_id=None, class_id=None, student_id=None):
	if request.user.is_superuser:
		student_to_add_parent = Student.objects.get(student_id=student_id)
		form = UserModelForm(request.POST or None)
		form2 = ParentModelForm(request.POST or None)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.maple_bear_email = user_profile.email
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.first_parent = parent
				student_to_add_parent.save(update_fields=['first_parent'])
				messages.success(request, 'Responsável financeiro criado com sucesso!')
				return redirect('/schools/{}/add_class/{}/add_student/{}/add_second_parent_to_student'.format(school_id, class_id, student_to_add_parent.student_id))
		return render(request, 'school_users/add_first_parent.html', {'form':form, 'form2':form2, 'student':student_to_add_parent})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		student_to_add_parent = Student.objects.get(student_id=student_id)
		form = UserModelForm(request.POST or None)
		form2 = ParentModelForm(request.POST or None)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.maple_bear_email = user_profile.email
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.first_parent = parent
				student_to_add_parent.save(update_fields=['first_parent'])
				messages.success(request, 'Responsável financeiro criado com sucesso!')
				return redirect('/schools/{}/add_class/{}/add_student/{}/add_second_parent_to_student'.format(school_id, class_id, student_to_add_parent.student_id))
		return render(request, 'school_users/add_first_parent.html', {'form':form, 'form2':form2, 'student':student_to_add_parent, 'is_supervisor':is_supervisor})

@login_required
def add_second_parent_to_student(request, school_id=None, class_id=None, student_id=None):
	if request.user.is_superuser:
		student_to_add_parent = Student.objects.get(student_id=student_id)
		form = UserModelForm(request.POST or None)
		form2 = ParentModelForm(request.POST or None)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.maple_bear_email = user_profile.email
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.second_parent = parent
				student_to_add_parent.save(update_fields=['second_parent'])
				messages.success(request, 'Responsável pedagógico criado com sucesso!')
				return redirect('/')
		return render(request, 'school_users/add_second_parent.html', {'form':form, 'form2':form2, 'student':student_to_add_parent})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		student_to_add_parent = Student.objects.get(student_id=student_id)
		form = UserModelForm(request.POST or None)
		form2 = ParentModelForm(request.POST or None)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.maple_bear_email = user_profile.email
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.second_parent = parent
				student_to_add_parent.save(update_fields=['second_parent'])
				messages.success(request, 'Responsável pedagógico criado com sucesso!')
				return redirect('/')
		return render(request, 'school_users/add_second_parent.html', {'form':form, 'form2':form2, 'student':student_to_add_parent, 'is_supervisor':is_supervisor})

@login_required
def add_students_to_class_and_school(request, school_id=None, class_id=None):
	if request.user.is_superuser:
		first_school = School.objects.get(school_id=school_id)
		classe = Class.objects.get(class_id=class_id)
		student_ids = []
		for head in first_school.heads.all():
			if School.objects.filter(heads__head_id__exact=head.head_id).count()>1:
				for school in School.objects.filter(heads__head_id__exact=head.head_id):
					for student in school.students.all():
						if student.student_id not in student_ids:
							student_ids+=[(student.student_id)]
		student_users = Student.objects.filter(student_id__in=student_ids)
		if student_users.count()<1:
			student_users = Student.objects.all()
		first_school = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			first_school.students.clear()
			classe.students.clear()
			select_all = request.POST.get('variable')
			if select_all == 'true':
				first_school.students.add(*student_users)
				classe.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					first_school.students.add(student)
					classe.students.add(student)
			messages.success(request, 'Estudantes adicionados com sucesso!')
			return redirect('/')
		return render(request, 'school/add_students_to_school.html', {'student_users':student_users, 'school':first_school, 'class':classe})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		first_school = School.objects.get(school_id=school_id)
		classe = Class.objects.get(class_id=class_id)
		student_users = []
		schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
		first_school = School.objects.get(school_id=school_id)
		for school in schools:
			for student in school.students.all():
				if student not in student_users:
					student_users += [(student)]
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			first_school.students.clear()
			classe.students.clear()
			if select_all == 'true':
				first_school.students.add(*student_users)
				classe.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					first_school.students.add(student)
					classe.students.add(student)
			messages.success(request, 'Estudantes adicionados com sucesso!')
			return redirect('/')
		return render(request, 'school/add_students_to_school.html', {'is_supervisor':is_supervisor, 'student_users':student_users, 'school':first_school})

def add_first_witness(request, school_id=None):
	if request.user.is_superuser:
		form = UserModelForm(request.POST or None)
		form2 = WitnessModelForm(request.POST or None)
		school_to_add_witness = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				witness = Witness.objects.get(witness_id=user_creation.witness_id)
				school_to_add_witness.first_witness = witness
				school_to_add_witness.save(update_fields=['first_witness'])
				messages.success(request, 'Primeira testemunha adicionada com sucesso')
				current_site = get_current_site(request)
				mail_subject = 'Login para acesso ao app escolar.'
				message = render_to_string('school_users/user_login.html', {
					'user': user_creation,
					'domain': current_site.domain,
					'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
					'token':account_activation_token.make_token(user),
					'type_of_user':'testemunha',
		           })
				to_email = form.cleaned_data.get('email')
				email = EmailMessage(
	            	mail_subject, message, to=[to_email]
	            )
				email.send()
				return redirect('/schools/{}/add_second_witness'.format(school_id))
		return render(request, 'school_users/add_first_witness.html', {'form':form, 'form2':form2,'school':school_to_add_witness})

def add_second_witness(request, school_id=None):
	if request.user.is_superuser:
		form = UserModelForm(request.POST or None)
		form2 = WitnessModelForm(request.POST or None)
		school_to_add_witness = School.objects.get(school_id=school_id)
		if request.method == 'POST':
			if form.is_valid():
				user = form.save(commit=False)
				user.username = user.first_name.lower()+user.last_name.lower()
				i=0
				user.username = user.username.replace(" ", "")
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					user.username = user.username.replace(" ", "")
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				witness = Witness.objects.get(witness_id=user_creation.witness_id)
				school_to_add_witness.second_witness = witness
				school_to_add_witness.save(update_fields=['second_witness'])
				messages.success(request, 'Segunda testemunha adicionada com sucesso')
				current_site = get_current_site(request)
				mail_subject = 'Login para acesso ao app escolar.'
				message = render_to_string('school_users/user_login.html', {
					'user': user_creation,
					'domain': current_site.domain,
					'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
					'token':account_activation_token.make_token(user),
					'type_of_user':'testemunha',
		           })
				to_email = form.cleaned_data.get('email')
				email = EmailMessage(
	            	mail_subject, message, to=[to_email]
	            )
				email.send()
				return redirect('/schools/{}/add_class'.format(school_id))
		return render(request, 'school_users/add_second_witness.html', {'form':form, 'form2':form2,'school':school_to_add_witness})

@login_required
def set_witnesses(request, school_id=None):
    if request.user.is_superuser:
    	instance = get_object_or_404(School, school_id=school_id)
    	form = SetWitnessModelForm(request.POST or None, instance=instance)
    	if form.is_valid():
            new_school = form.save(commit=False)
            new_school.save(update_fields=['first_witness','second_witness'])
            messages.success(request, 'Testemunhas Selecionadas com Sucesso')
            return redirect('/')
    	return render(request, 'school/set_witnesses.html', {'form':form, 'school_id':school_id})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        instance = get_object_or_404(School, school_id=school_id)
        form = SetWitnessModelForm(request.POST or None, instance=instance)
        witnesses_ids = []
        schools = None
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
        if Supervisor.objects.filter(profile=request.user).count()>=1:
        	schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
        for school in schools:
        	if school.first_witness:
        		witnesses_ids += [(school.first_witness.witness_id)]
        	if school.second_witness:
        		witnesses_ids += [(school.second_witness.witness_id)]
        form.fields["first_witness"].queryset = Witness.objects.filter(witness_id__in=witnesses_ids)
        form.fields["second_witness"].queryset = Witness.objects.filter(witness_id__in=witnesses_ids)
        if form.is_valid():
            new_school = form.save(commit=False)
            new_school.save(update_fields=['first_witness','second_witness'])
            messages.success(request, 'Testemunhas Selecionadas com Sucesso')
            return redirect('/')
        return render(request, 'school/set_witnesses.html', {'form':form, 'school_id':school_id, 'is_supervisor':is_supervisor})

@login_required
def add_witness(request, school_id=None, type_of_user= None):
    if request.user.is_superuser:
        school = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = WitnessModelForm(request.POST or None)
        if request.method == 'POST':
	        if form.is_valid() and form2.is_valid():
	            user = form.save(commit=False)
	            user.username = user.first_name.lower()+user.last_name.lower()
	            i = 0
	            user.username = user.username.replace(" ", "")
	            while User.objects.filter(username=user.username).count()>=1:
	                user.username = user.first_name.lower()+user.last_name.lower()
	                user.username = user.username + str(i)
	                user.username = user.username.replace(" ", "")
	                i+=1
	            user.save()
	            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
	            user_creation = form2.save(commit=False)
	            user_creation.profile = user_profile
	            user_creation.name = user_profile.first_name+' '+user_profile.last_name
	            user_creation.save()
	            current_site = get_current_site(request)
	            mail_subject = 'Login para acesso ao app escolar.'
	            message = render_to_string('school_users/user_login.html', {
	                'user': user_creation,
	                'domain': current_site.domain,
	                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
	                'token':account_activation_token.make_token(user),
	            })
	            to_email = form.cleaned_data.get('email')
	            email = EmailMessage(
	                mail_subject, message, to=[to_email]
	            )
	            email.send()
	            if type_of_user == 'first_witness':
	                school.first_witness = Witness.objects.get(profile=user_profile)
	            elif type_of_user == 'second_witness':
	                school.second_witness = Witness.objects.get(profile=user_profile)
	            school.save(update_fields=['first_witness','second_witness'])
	            messages.success(request, 'Testemunha adicionada com sucesso!')
	            return redirect('/schools/{}/set_witnesses'.format(school_id))
        return render(request, 'school/add_witness.html', {'form':form, 'form2':form2})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        school = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = WitnessModelForm(request.POST or None)
        if request.method == 'POST':
	        if form.is_valid() and form2.is_valid():
	            user = form.save(commit=False)
	            user.username = user.first_name.lower()+user.last_name.lower()
	            i = 0
	            user.username = user.username.replace(" ", "")
	            while User.objects.filter(username=user.username).count()>=1:
	                user.username = user.first_name.lower()+user.last_name.lower()
	                user.username = user.username + str(i)
	                user.username = user.username.replace(" ", "")
	                i+=1
	            user.save()
	            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
	            user_creation = form2.save(commit=False)
	            user_creation.profile = user_profile
	            user_creation.name = user_profile.first_name+' '+user_profile.last_name
	            user_creation.save()
	            current_site = get_current_site(request)
	            mail_subject = 'Login para acesso ao app escolar.'
	            message = render_to_string('school_users/user_login.html', {
	                'user': user_creation,
	                'domain': current_site.domain,
	                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
	                'token':account_activation_token.make_token(user),
	            })
	            to_email = form.cleaned_data.get('email')
	            email = EmailMessage(
	                mail_subject, message, to=[to_email]
	            )
	            email.send()
	            if type_of_user == 'first_witness':
	                school.first_witness = Witness.objects.get(profile=user_profile)
	            elif type_of_user == 'second_witness':
	                school.second_witness = Witness.objects.get(profile=user_profile)
	            school.save(update_fields=['first_witness','second_witness'])
	            messages.success(request, 'Testemunha adicionada com sucesso!')
	            return redirect('/schools/{}/set_witnesses'.format(school_id))
        return render(request, 'school/add_witness.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

def import_xml(request):
	xml_content = ''
	try:
		url_string = request.GET.get('url', '')
		print('url_string', url_string)
		xml_content = requests.get(url_string)
		print('xml_content', xml_content)
		return HttpResponse(xml_content, content_type='application/xml')
	except:
		return HttpResponse(xml_content, content_type='application/xml')

def import_sponte(request):
	xml_content = ''
	try:
		base_url = 'http://api.sponteeducacional.net.br/WSAPIEdu.asmx/'
		path = request.GET.get('path', '')
		and_query = '&'
		params = []

		print(request.GET)

		for query_key, query_value in request.GET.items():
			if query_key != 'path':
				params += [ query_key + '=' + query_value ]

		sponte_url = base_url + path + '?' + and_query.join(params)
		print('sponte_url', sponte_url)
		xml_response = requests.get(sponte_url)
		xml_content = xml_response.text
		response = HttpResponse(xml_content, content_type='text/xml')
		print('response', response)
		return response
	except:
		return HttpResponse(xml_content, content_type='text/xml')

def set_all_classes_chain():
	for classe in Class.objects.exclude(school=None):
		school = School.objects.get(classes__class_id__exact=classe.class_id)
		try:
			chain = Chain.objects.get(name="{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name))
			chain.classe = classe
			chain.save(update_fields=['classe'])
		except Exception as e:
			print (classe.class_name)
			print (str(e))
			print ('Cadeia não encontrada')
	return True