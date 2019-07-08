from django.shortcuts import render, redirect, reverse, get_object_or_404
from .serializers import *
from .models import *
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, generics, status
from .forms import *
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
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
import pdb
from school.models import *
from django.contrib import messages

# Create your views here.
@login_required
def create_user(request):
    if request.user.is_superuser:
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        form3 = TeacherModelForm(request.POST or None)
        form4 = AdminModelForm(request.POST or None)
        form5 = SupervisorModelForm(request.POST or None)
        form6 = ParentModelForm(request.POST or None)
        form7 = StudentModelForm(request.POST or None)
        selected_user = request.POST.get('selected_user', 0)
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            if selected_user == '1':
                if form2.is_valid():
                    user_creation = form2.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '2':
                if form3.is_valid():
                    user_creation = form3.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '3':
                if form4.is_valid():
                    user_creation = form4.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '4':
                if form5.is_valid():
                    user_creation = form5.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '5':
                if form6.is_valid():
                    user_creation = form6.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '6':
                if form7.is_valid():
                    user_creation = form7.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            return redirect('/users/create_user')
        return render(request, 'school_users/createuser.html', {'form':form,'form2':form2,'form3':form3,'form4':form4,'form5':form5,'form6':form6,'form7':form7})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        schools = None
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(head=Head.objects.get(profile=request.user))
        if Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(head=Supervisor.objects.get(profile=request.user))
        is_supervisor = True
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        form3 = TeacherModelForm(request.POST or None)
        form4 = AdminModelForm(request.POST or None)
        form5 = SupervisorModelForm(request.POST or None)
        form6 = ParentModelForm(request.POST or None)
        form7 = StudentModelForm(request.POST or None)
        selected_user = request.POST.get('selected_user', 0)
        selected_school = request.POST.get('selected_school', 0)
        school_to_add = None
        if School.objects.filter(school_id=selected_school).count()>=1:
            school_to_add = School.objects.get(school_id=selected_school)
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            if selected_user == '1':
                if form2.is_valid():
                    user_creation = form2.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '2':
                if form3.is_valid():
                    user_creation = form3.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '3':
                if form4.is_valid():
                    user_creation = form4.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    new_teacher = Teacher.objects.get(profile=user_profile)
                    if school_to_add:
                        school_to_add.teachers.add(new_teacher)
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '4':
                if form5.is_valid():
                    user_creation = form5.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '5':
                if form6.is_valid():
                    user_creation = form6.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    messages.success(request, 'Usuário Criado com sucesso')
            elif selected_user == '6':
                if form7.is_valid():
                    user_creation = form7.save(commit=False)
                    user_creation.profile = user_profile
                    user_creation.name = user_profile.first_name+' '+user_profile.last_name
                    user_creation.save()
                    new_student = Student.objects.get(profile=user_profile)
                    if school_to_add:
                        school_to_add.students.add(new_student)
                    messages.success(request, 'Usuário Criado com sucesso')
            return redirect('/users/create_user')
        return render(request, 'school_users/createuser.html', {'form':form,'form2':form2,'form3':form3,'form4':form4,'form5':form5,'form6':form6,'form7':form7,'is_supervisor':is_supervisor, 'schools':schools})
    return HttpResponse('U cannot access this page cos u are not admin!')

@login_required
def create_head_to_school(request, school_id=None):
    if request.user.is_superuser:
        school_to_add_head = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.save()
            head_to_add = get_object_or_404(Head, profile=user_profile)
            school_to_add_head.head = head_to_add
            school_to_add_head.save(update_fields=['head'])
            messages.success(request, 'Diretor adicionado com sucesso à escola {}'.format(school_to_add_head.school_name))
            return redirect('/users/create_supervisor_to_school/{}'.format(school_id))
        return render(request, 'school_users/create_head_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_head})

@login_required
def create_supervisor_to_school(request, school_id=None):
    if request.user.is_superuser:
        school_to_add_head = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = SupervisorModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.save()
            supervisor_to_add = get_object_or_404(Supervisor, profile=user_profile)
            school_to_add_head.adminorsupervisor = supervisor_to_add
            school_to_add_head.save(update_fields=['adminorsupervisor'])
            messages.success(request, 'Admin/Supervisor adicionado com sucesso à escola {}'.format(school_to_add_head.school_name))
            return redirect('/schools/seeallschools/'.format(school_id))
        return render(request, 'school_users/create_supervisor_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_head})

@login_required
def seeallusers(request):
    if request.user.is_superuser:
        head_users = Head.objects.all()
        teacher_users = Teacher.objects.all()
        admin_users = Admin.objects.all()
        supervisor_users = Supervisor.objects.all()
        parent_users = Parent.objects.all()
        student_users = Student.objects.all()
        return render(request, 'school_users/seeallusers.html', {'head_users':head_users,'teacher_users':teacher_users,'admin_users':admin_users,'supervisor_users':supervisor_users,'parent_users':parent_users,'student_users':student_users})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        schools = []
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(head=Head.objects.get(profile=request.user))
        elif Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
        is_supervisor = True
        head_users = []
        teacher_users = []
        student_users = []
        admin_users = []
        parent_users = []
        supervisor_users = []
        for school in schools:
            head_users += [(school.head)]
            supervisor_users += [(school.adminorsupervisor)]
            teacher_users += school.teachers.all()
            student_users += school.students.all()
            for student in school.students.all():
                if student.first_parent:
                    parent_users += [(student.first_parent)]
                if student.second_parent:
                    parent_users += [(student.second_parent)]
        return render(request, 'school_users/seeallusers.html', {'head_users':head_users,'teacher_users':teacher_users,'admin_users':admin_users,'supervisor_users':supervisor_users,'parent_users':parent_users,'student_users':student_users, 'is_supervisor':is_supervisor})
    return HttpResponse('U cannot access this page cos u are not admin!')

def delete_user(request, user_id=None, type_of_user=None):
	if(type_of_user=='head'):
		user_to_delete = get_object_or_404(Head, head_id=user_id)
	if(type_of_user=='teacher'):
		user_to_delete = get_object_or_404(Teacher, teacher_id=user_id)
	if(type_of_user=='admin'):
		user_to_delete = get_object_or_404(Admin, admin_id=user_id)
	if(type_of_user=='supervisor'):
		user_to_delete = get_object_or_404(Supervisor, supervisor_id=user_id)
	if(type_of_user=='parent'):
		user_to_delete = get_object_or_404(Parent, parent_id=user_id)
	if(type_of_user=='student'):
		user_to_delete = get_object_or_404(Student, student_id=user_id)
	user_to_delete.profile.delete()
	user_to_delete.delete()
	return HttpResponse('This user has been deleted correctly')

@login_required
def set_parents(request, student_id):
    if request.user.is_superuser:
    	instance = get_object_or_404(Student, student_id=student_id)
    	form = SetParentsModelForm(request.POST or None, instance=instance)
    	if form.is_valid():
    		new_student = form.save(commit=False)
    		new_student.save(update_fields=['first_parent','second_parent'])
    		return redirect('/users/seeallusers')
    	return render(request, 'school_users/set_parents.html', {'form':form})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        schools = []
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(head=Head.objects.get(profile=request.user))
        elif Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
        is_supervisor = True
        parents_ids = []
        for school in schools:
            for student in school.students.all():
                parents_ids += [(student.first_parent.parent_id)]
                parents_ids += [(student.second_parent.parent_id)]
        form.fields["first_parent"].queryset = Parent.objects.filter(parent_id__in=parents_ids)
        form.fields["first_parent"].queryset = Parent.objects.filter(parent_id__in=parents_ids)
        return render(request, 'school_users/set_parents.html', {'form':form, 'is_supervisor':is_supervisor})



def do_login(request):
    if request.method == 'POST':
        user = authenticate(username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            login(request, user)
            nextpage = request.GET.get('next','/contracts/seeallcontracts')
            return redirect(nextpage)
    return render(request, 'school_users/login.html')

def my_jwt_response_handler(token, user=None, request=None):
    return {
        'token': token,
        'user': UserSerializer(user, context={'request': request}).data
    }

@api_view(['GET','POST'])
def current_user(request):
    """
    Determine the current user by their token, and return their data
    """

    serializer = UserSerializer(request.user)
    return Response(serializer.data)

@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def do_login_rest(request):
    username = request.data.get("username")
    password = request.data.get("password")
    if username is None or password is None:
        return Response({'error': 'Please provide both username and password'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'},
                        status=HTTP_404_NOT_FOUND)
    login(request,user)
    token, _ = Token.objects.get_or_create(user=user)
    return Response({'token': token.key},
                    status=HTTP_200_OK)

@csrf_exempt
@api_view(['GET'])
def seeallusers_rest(request):
	if request.user.is_superuser:
		head_common_users = Head.objects.all()
		head_users = HeadSerializer(head_common_users, many=True)
		teacher_common_users = Teacher.objects.all()
		teacher_users = HeadSerializer(teacher_common_users, many=True)
		admin_common_users = Admin.objects.all()
		admin_users = HeadSerializer(admin_common_users, many=True)
		supervisor_common_users = Supervisor.objects.all()
		supervisor_users = HeadSerializer(supervisor_common_users, many=True)
		parent_common_users = Parent.objects.all()
		parent_users = HeadSerializer(parent_common_users, many=True)
		student_common_users = Student.objects.all()
		student_users = HeadSerializer(student_common_users, many=True)
		context = {'head_users':head_users.data,
				   'teacher_users':teacher_users.data,
				   'admin_users':admin_users.data,
				   'supervisor_users':supervisor_users.data,
				   'parent_users':parent_users.data,
				   'student_users':student_users.data}
		return Response(context)

def do_logout(request):
    logout(request)
    return redirect('/users/login')