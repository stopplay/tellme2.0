from django.shortcuts import render, redirect, reverse
from .serializers import *
from .models import *
from block.forms import *
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, generics, status
from .forms import *
from django.http import HttpResponse, Http404, HttpResponseRedirect
from block.models import *
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

# Create your views here.
class SchoolsViewSet(viewsets.ModelViewSet):
    """docstring for SchoolsViewSet"""
    queryset = School.objects.all()
    serializer_class = SchoolSerializer
    # filter_backends = (DjangoFilterBackend)
    filterset_fields = '__all__'

def create_school(request):
	form = SchoolModelForm(request.POST or None)
	if form.is_valid():
		school = form.save(commit=False)
		school.save()
		form = SchoolModelForm()
		return render(request, 'school/add_school.html', {'form':form})
	return render(request, 'school/add_school.html', {'form':form})

@login_required
def seeallschools(request):
	if request.user.is_superuser:
		schools = School.objects.all()
		return render(request, 'school/seeallschools.html', {'schools':schools})
	return HttpResponse('U cannot access this page cos u are not admin!')

#weverton
@login_required
def seeclassbyid(request, class_id=None):
    if request.user.is_superuser:
        classe = Class.objects.get(class_id=class_id)
        return render(request,'school/seeclassbyid.html',{'classe':classe})
    return HttpResponse('U cannot access this page cos u are not admin!')

#weverton
@login_required
def seechainbyname(request, chain_name=None):
    if request.user.is_superuser:
        chain = Chain.objects.get(name=chain_name)
        return render(request,'school/seechainbyname.html',{'chain':chain})
    return HttpResponse('U cannot access this page cos u are not admin!')
    
@csrf_exempt
@api_view(['GET'])
def seeallschools_rest(request):
	if request.user.is_superuser:
		schools = School.objects.all()
		schools_rest = SchoolSerializer(schools, many=True)
		return Response({'schools':schools_rest.data})
	return HttpResponse('U cannot access this page cos u are not admin!')

def update_school(request, school_id=None):
	instance = School.objects.get(school_id=school_id)
	form = SchoolModelForm(request.POST or None, instance=instance)
	if form.is_valid():
		school = form.save(commit=False)
		school.save(update_fields=['school_name', 'enrollment_year'])
		return redirect('/schools/seeallschools')
	return render(request, 'school/update_school.html', {'form':form})

@csrf_exempt
@api_view(['POST'])
def update_school_rest(request, school_id=None):
	pdb.set_trace()
	instance = School.objects.get(school_id=school_id)
	instance.school_name = request.POST.get('school_name')
	instance.enrollment_year = request.POST.get('enrollment_year')
	instance.save(update_fields=['school_name', 'enrollment_year'])
	schools_rest = SchoolSerializer(instance)
	return Response({'schools':schools_rest.data})

def delete_school(request, school_id=None):
	school_to_delete = School.objects.get(school_id=school_id)
	school_to_delete.delete()
	return HttpResponse('This school has been deleted correctly')

@csrf_exempt
@api_view(['GET'])
def delete_school_rest(request, school_id=None):
	school_to_delete = School.objects.get(school_id=school_id)
	school_to_delete.delete()
	return HttpResponse('This school has been deleted correctly')

def add_class(request, school_id=None):
	school_to_add_class = School.objects.get(school_id=school_id)
	form = ClassModelForm(request.POST or None)
	if form.is_valid():
		classroom = form.save(commit=False)
		newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, school_to_add_class.enrollment_year, classroom.class_unit, classroom.class_name))
		school_to_add_class.chains.add(newchain)
		classroom.save()
		newclassroom = Class.objects.get(class_id=classroom.class_id)
		school_to_add_class.classes.add(newclassroom)
		return redirect('/schools/seeallschools')
	return render(request, 'school/add_class.html', {'form':form})

@csrf_exempt
@api_view(['POST'])
def add_class_rest(request, school_id=None):
	school_to_add_class = School.objects.get(school_id=school_id)
	classroom = Class.objects.create(class_name=request.POST.get('class_name'), class_level=request.POST.get('class_level'), class_unit=request.POST.get('class_unit'))
	newchain = Chain.objects.create(name="{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, school_to_add_class.enrollment_year, classroom.class_unit, classroom.class_name))
	school_to_add_class.chains.add(newchain)
	newclassroom = Class.objects.get(class_id=classroom.class_id)
	school_to_add_class.classes.add(newclassroom)
	school_rest = SchoolSerializer(school_to_add_class)
	return Response({'school_with_new_class':school_rest.data})

def update_class(request, class_id=None):
	class_to_update = Class.objects.get(class_id=class_id)
	school_to_update_class = School.objects.get(classes__class_id__exact=class_to_update.class_id)
	name_of_chain = "{0}-{1}-{2}-{3}".format(school_to_update_class.school_name, school_to_update_class.enrollment_year, class_to_update.class_unit, class_to_update.class_name)
	chain_to_be_updated = Chain.objects.get(name=name_of_chain)
	form = ClassModelForm(request.POST or None, instance=class_to_update)
	if form.is_valid():
		classroom = form.save(commit=False)
		chain_to_be_updated.name = "{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, school_to_add_class.enrollment_year, classroom.class_unit, classroom.class_name)
		chain_to_be_updated.save(update_fields=['name'])
		classroom.save(update_fields=['class_name','class_level'])
		return redirect('/schools/seeallschools')
	return render(request, 'school/update_class.html', {'form':form})

def delete_class(request, class_id=None):
	class_to_delete = Class.objects.get(class_id=class_id)
	school_to_delete_class = School.objects.get(classes__class_id__exact=class_to_delete.class_id)
	name_of_chain = "{0}-{1}-{2}-{3}".format(school_to_add_class.school_name, school_to_add_class.enrollment_year, classroom.class_unit, classroom.class_name)
	if (Chain.objects.filter(name=name_of_chain).count()>=1):
		Chain.objects.get(name=name_of_chain).delete()
	class_to_delete.delete()
	return redirect('/schools/seeallschools')

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
		return redirect('/schools/seeallschools')
	return render(request, 'school/create_block.html', {'form':form})

def verifyvalidchain(request, class_id=None):
	class_to_verify_chain = Class.objects.get(class_id=class_id)
	school_to_verify_chain = School.objects.get(classes__class_id__exact=class_to_verify_chain.class_id)
	name_of_chain = "{0}-{1}-{2}".format(school_to_verify_chain.school_name, class_to_verify_chain.class_name, school_to_verify_chain.enrollment_year)
	chain_to_be_verified = Chain.objects.get(name=name_of_chain)
	verify = chain_to_be_verified.is_valid_chain()
	if verify:
		return HttpResponse('The chain for this class is valid!')
	return HttpResponse('The chain for this class is not valid!')

def add_head_to_school(request, school_id=None):
	pass

@login_required
def add_teacher_to_class(request, class_id=None):
	if request.user.is_superuser:
		class_to_add_teacher = Class.objects.get(class_id=class_id)
		form = ClassAddTeachersModelForm(request.POST or None, instance=class_to_add_teacher)
		if form.is_valid():
			newclass = form.save(commit=False)
			newclass.save()
			form.save_m2m()
			return redirect('/schools/seeallschools')
		return render(request, 'school/add_teacher_to_class.html', {'form':form})
	return HttpResponse('U cannot access this page cos u are not admin!')
