from __future__ import absolute_import
from django.contrib.auth.models import User
from rest_framework import serializers
from celery import shared_task
from classrooms.celery import app
from django.core.mail import EmailMessage
from .models import *
import json
from school_users.models import *
from school.utils import get_sku_by_slm_url
from contract.utils import MagentoSoap, generate_slm_link
from django.db.models import Q
from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
import pdb
from django.core.files.base import ContentFile, File
from django.utils import timezone

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

def remove_non_active_students(school_id=None, students=None):
	school = School.objects.get(school_id=school_id)
	for student in school.students.all():
		if students:
			if not student.situation_sponte == 'Ativo' or student not in students:
				school.students.remove(student)
		else:
			if not student.situation_sponte == 'Ativo':
				school.students.remove(student)
	return JsonResponse({'success' : 'OK'}, status=HTTP_200_OK)

def save_students_to_school(school_id=None):
	school = School.objects.get(school_id=school_id)
	students = get_school_students(school.sponte_client_number, school.sponte_token, school.school_name)
	remove_non_active_students(school_id, students)
	for student in students:
		if student not in school.students.all():
			school.students.add(student)
	school.save()
	return True

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

def save_parents(school_id=None):
	school = School.objects.get(school_id=school_id)
	parents = get_school_parents(school.sponte_client_number, school.sponte_token, school.school_name)
	parents_ids = []
	for parent in parents:
		if parent.parent_id not in parents_ids:
			parents_ids += [(parent.parent_id)]
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

def pull_students(school_id=None):
	could_save = False
	school = School.objects.get(school_id=school_id)
	if school.sponte_client_number and school.sponte_token:
		could_save = save_students_to_school(school_id)
		could_save = save_parents(school_id) and could_save

	if could_save:		
		return JsonResponse({'success' : 'OK'}, status=HTTP_200_OK)
	else:
		return JsonResponse({'error' : 'Não autorizado'}, status=HTTP_403_FORBIDDEN)

@app.task
def import_all_sponte_users():
    schools = School.objects.exclude(sponte_client_number=None, sponte_token=None)
    for school in schools:
        result = pull_students(school.school_id)
    return True