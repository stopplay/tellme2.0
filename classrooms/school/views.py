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
    HTTP_200_OK
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

# Create your views here.
class SchoolsViewSet(viewsets.ModelViewSet):
    """docstring for SchoolsViewSet"""
    queryset = School.objects.all()
    serializer_class = SchoolSerializer
    # filter_backends = (DjangoFilterBackend)
    filterset_fields = '__all__'

@login_required
def create_school(request):
	if request.user.is_superuser:
		form = SchoolModelForm(request.POST or None)
		if form.is_valid():
			school = form.save(commit=False)
			school.save()
			form = SchoolModelForm()
			school_to_add_head = School.objects.get(school_id=school.school_id)
			messages.success(request, '{} adicionada corretamente!'.format(school_to_add_head.school_name))
			return redirect('/users/create_head_to_school/{}'.format(school_to_add_head.school_id))
		return render(request, 'school/add_school.html', {'form':form})
	return redirect('/')

@login_required
def seeallschools(request):
	if request.user.is_superuser:
		schools = School.objects.all()
		return render(request, 'school/seeallschools.html', {'schools':schools})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(head=Head.objects.get(profile=request.user))
		return render(request, 'school/seeallschools.html', {'schools':schools, 'is_supervisor':is_supervisor})
	elif Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
		return render(request, 'school/seeallschools.html', {'schools':schools, 'is_supervisor':is_supervisor})
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

@login_required
def update_school(request, school_id=None):
	if request.user.is_superuser:
		instance = School.objects.get(school_id=school_id)
		form = SchoolModelForm(request.POST or None, instance=instance)
		if form.is_valid():
			school = form.save(commit=False)
			for classe in school.classes.all():
				chain = Chain.objects.get(id=classe.class_id)
				chain.name = "{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name)
				chain.save(update_fields=['name'])
			school.save(update_fields=['school_name', 'head', 'sponte_client_number', 'country', 'state', 'city','app_name'])
			messages.success(request, 'A escola foi atualizada com sucesso!')
			return redirect('/')
		return render(request, 'school/update_school.html', {'form':form})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		instance = School.objects.get(school_id=school_id)
		form = SchoolModelForm(request.POST or None, instance=instance)
		if form.is_valid():
			school = form.save(commit=False)
			for classe in school.classes.all():
				chain = Chain.objects.get(id=classe.class_id)
				chain.name = "{0}-{1}-{2}-{3}".format(school.school_name, classe.enrollment_class_year, classe.class_unit, classe.class_name)
				chain.save(update_fields=['name'])
			school.save(update_fields=['school_name', 'head', 'sponte_client_number', 'country', 'state', 'city','app_name'])
			messages.success(request, 'A escola foi atualizada com sucesso!')
			return redirect('/')
		return render(request, 'school/update_school.html', {'form':form, 'is_supervisor':is_supervisor})

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
				student.first_parent.profile.delete()
				student.second_parent.profile.delete()
				student.profile.delete()
				student.first_parent.delete()
				student.second_parent.delete()
				student.delete()
		if school_to_delete.head:
			if School.objects.filter(head=school_to_delete.head).count()<2:
				school_to_delete.head.profile.delete()
				school_to_delete.head.delete()
		if school_to_delete.adminorsupervisor:
			if School.objects.filter(adminorsupervisor=school_to_delete.adminorsupervisor).count()<2:
				school_to_delete.adminorsupervisor.profile.delete()
				school_to_delete.adminorsupervisor.delete()
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
		if form.is_valid():
			classroom = form.save(commit=False)
			newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
			school_to_add_class.chains.add(newchain)
			
			classroom.sku = get_sku_by_slm_url(classroom.slm)
			classroom.save()
			
			newclassroom = Class.objects.get(class_id=classroom.class_id)
			school_to_add_class.classes.add(newclassroom)
			messages.success(request, 'Classe adicionada com sucesso!')
			return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_class.html', {'form':form})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		school_to_add_class = School.objects.get(school_id=school_id)
		form = ClassModelForm(request.POST or None)
		if form.is_valid():
			classroom = form.save(commit=False)
			newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name))
			school_to_add_class.chains.add(newchain)

			classroom.sku = get_sku_by_slm_url(classroom.slm)
			classroom.save()

			newclassroom = Class.objects.get(class_id=classroom.class_id)
			school_to_add_class.classes.add(newclassroom)
			messages.success(request, 'Classe adicionada com sucesso!')
			return redirect('/schools/{}/add_class/{}/add_student'.format(school_id, newclassroom.class_id))
		return render(request, 'school/add_class.html', {'form':form, 'is_supervisor':is_supervisor})


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
		chain_to_be_updated = Chain.objects.get(id=class_id)
		form = ClassModelForm(request.POST or None, instance=class_to_update)
		if form.is_valid():
			classroom = form.save(commit=False)
			chain_to_be_updated.name = "{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name)
			chain_to_be_updated.save(update_fields=['name'])

			classroom.sku = get_sku_by_slm_url(classroom.slm)
			classroom.save(update_fields=['class_name', 'class_unit', 'enrollment_class_year','slm', 'sku'])

			messages.success(request, 'Classe e blockchain referente à classe atualizadas com sucesso!')
			return redirect('/')
		return render(request, 'school/update_class.html', {'form':form})
	elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		class_to_update = Class.objects.get(class_id=class_id)
		school_to_update_class = School.objects.get(classes__class_id__exact=class_to_update.class_id)
		chain_to_be_updated = Chain.objects.get(id=class_id)
		form = ClassModelForm(request.POST or None, instance=class_to_update)
		if form.is_valid():
			classroom = form.save(commit=False)
			chain_to_be_updated.name = "{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, classroom.enrollment_class_year, classroom.class_unit, classroom.class_name)
			chain_to_be_updated.save(update_fields=['name'])

			classroom.sku = get_sku_by_slm_url(classroom.slm)
			classroom.save(update_fields=['class_name', 'class_unit', 'enrollment_class_year','slm', 'sku'])
			
			messages.success(request, 'Classe e blockchain referente à classe atualizadas com sucesso!')
			return redirect('/')
		return render(request, 'school/update_class.html', {'form':form, 'is_supervisor':is_supervisor})

@login_required
def delete_class(request, class_id=None):
	if request.user.is_superuser or Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
		class_to_delete = Class.objects.get(class_id=class_id)
		chain_to_delete = Chain.objects.get(id=class_id)
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
	class_to_verify_chain = Class.objects.get(class_id=class_id)
	school_to_verify_chain = School.objects.get(classes__class_id__exact=class_to_verify_chain.class_id)
	name_of_chain = "{0}-{1}-{2}-{3}".format(school_to_verify_chain.school_name, class_to_verify_chain.enrollment_class_year, class_to_verify_chain.class_unit, class_to_verify_chain.class_name)
	chain_to_be_verified = Chain.objects.get(id=class_id)
	verify = chain_to_be_verified.is_valid_chain()
	if verify or chain_to_be_verified.block_set.count()==0:
		messages.success(request, 'O chain para esta turma é válido!')
		return redirect('/')
	messages.error(request, 'O chain para esta turma não é válido')
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
		student_users = school.students.all()
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
						while User.objects.filter(username=user.username).count()>=1:
							user.username = user.first_name.lower()+user.last_name.lower()
							user.username = user.username + str(i)
							i+=1
						user.save()
						user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
						user_creation = form2.save(commit=False)
						user_creation.profile = user_profile
						user_creation.name = user_profile.first_name+' '+user_profile.last_name
						user_creation.save()
						student = Student.objects.get(student_id=user_creation.student_id)
						diff = datetime.date.today() - user_creation.birthday
						age = diff.days//365
						if age >= 18:
							return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student_to_add.student_id, school_to_add_student.school_id, class_to_add_student.class_id))
						school_to_add_student.students.add(student)
						class_to_add_student.students.add(student)
						messages.success(request, 'Estudante criado com sucesso!')
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
						while User.objects.filter(username=user.username).count()>=1:
							user.username = user.first_name.lower()+user.last_name.lower()
							user.username = user.username + str(i)
							i+=1
						user.save()
						user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
						user_creation = form2.save(commit=False)
						user_creation.profile = user_profile
						user_creation.name = user_profile.first_name+' '+user_profile.last_name
						user_creation.save()
						student = Student.objects.get(student_id=user_creation.student_id)
						diff = datetime.date.today() - user_creation.birthday
						age = diff.days//365
						if age >= 18:
							return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student_to_add.student_id, school_to_add_student.school_id, class_to_add_student.class_id))
						school_to_add_student.students.add(student)
						class_to_add_student.students.add(student)
						messages.success(request, 'Estudante criado com sucesso!')
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
		return render(request, 'school_users/add_student.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

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
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.first_parent = parent
				student_to_add_parent.save(update_fields=['first_parent'])
				messages.success(request, 'Responsável financeiro criado com sucesso!')
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
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.first_parent = parent
				student_to_add_parent.save(update_fields=['first_parent'])
				messages.success(request, 'Responsável financeiro criado com sucesso!')
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
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.second_parent = parent
				student_to_add_parent.save(update_fields=['second_parent'])
				messages.success(request, 'Responsável pedagógico criado com sucesso!')
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
				while User.objects.filter(username=user.username).count()>=1:
					user.username = user.first_name.lower()+user.last_name.lower()
					user.username = user.username + str(i)
					i+=1
				user.save()
				user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
				user_creation = form2.save(commit=False)
				user_creation.profile = user_profile
				user_creation.name = user_profile.first_name+' '+user_profile.last_name
				user_creation.save()
				parent = Parent.objects.get(parent_id=user_creation.parent_id)
				student_to_add_parent.second_parent = parent
				student_to_add_parent.save(update_fields=['second_parent'])
				messages.success(request, 'Responsável pedagógico criado com sucesso!')
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
				return redirect('/')
		return render(request, 'school_users/add_second_parent.html', {'form':form, 'form2':form2, 'student':student_to_add_parent, 'is_supervisor':is_supervisor})

@login_required
def add_students_to_class_and_school(request, school_id=None, class_id=None):
	if request.user.is_superuser:
		school = School.objects.get(school_id=school_id)
		classe = Class.objects.get(class_id=class_id)
		student_users = Student.objects.all()
		if request.method == 'POST':
			select_all = request.POST.get('variable')
			school.students.clear()
			if select_all == 'true':
				school.students.add(*student_users)
				classe.students.add(*student_users)
			else:
				some_var = request.POST.getlist('checks')
				for var in some_var:
					student = Student.objects.get(student_id=var)
					school.students.add(student)
					classe.students.add(student)
			messages.success(request, 'Estudantes alterados na escola com sucesso!')
			return redirect('/')
		return render(request, 'school/add_students_to_school.html', {'student_users':student_users, 'school':school, 'class':classe})
	elif Head.objects.filter(profile=request.user).count()>=1:
		is_supervisor = True
		student_users = []
		schools = School.objects.filter(head=Head.objects.get(profile=request.user))
		for school in schools:
			for student in school.students.all():
				if student not in student_users:
					student_users += [(student)]
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