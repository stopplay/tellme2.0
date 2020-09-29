import csv, io
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
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_text
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from .tokens import account_activation_token
import requests
import datetime
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.hashers import make_password
from django.contrib.auth.forms import SetPasswordForm
import psycopg2
from django.utils.safestring import mark_safe
import json
import operator
from functools import reduce
from django.db.models import Q
from django.contrib.auth.models import User
from django.shortcuts import render_to_response
from django.template import RequestContext


# Create your views here.
@login_required
def create_user(request):
    if request.user.is_superuser:
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        form3 = TeacherModelForm(request.POST or None)
        form4 = AdminModelForm(request.POST or None)
        form5 = SupervisorModelForm(request.POST or None)
        form6 = ParentIdTellMeModelForm(request.POST or None)
        form7 = StudentModelForm(request.POST or None)
        schools = School.objects.all()
        selected_user = request.POST.get('selected_user', 0)
        selected_school = request.POST.get('selected_school', 0)
        selected_class = request.POST.get('selected_class', 0)
        school_to_add = None
        class_to_add = None
        if School.objects.filter(school_id=selected_school).count()>=1:
            school_to_add = School.objects.get(school_id=selected_school)
        if Class.objects.filter(class_id=selected_class).count()>=1:
            class_to_add = Class.objects.get(class_id=selected_class)
        if request.method == 'POST':
            yesorno = request.POST.get('sim/não' or None)
            # archive_type = request.POST.get('archive_type' or None)
            csv_file = request.FILES.get('file' or None)
            if yesorno == 'sim':
                # if archive_type == 'url':
                #     url = request.POST.get('url')
                #     csv_file = r = requests.get(url)
                #     if not url.endswith('.csv'):
                #         messages.warning(request, 'O arquivo enviado não é CSV')
                #         return redirect('/users/create_user')
                #     data_set = csv_file.content.decode('UTF-8')
                # elif archive_type == 'file':
                #     csv_file = request.FILES.get('file' or None)
                #     if not csv_file.name.endswith('.csv'):
                #         messages.warning(request, 'O arquivo enviado não é CSV')
                #         return redirect('/users/create_user')
                #     data_set = csv_file.read().decode('UTF-8')
                if csv_file:
                    if not csv_file.name.endswith('.csv'):
                        messages.warning(request, 'O arquivo enviado não é CSV')
                        return redirect('/users/create_user')
                    data_set = csv_file.read().decode('latin1')
                    io_string = io.StringIO(data_set)
                    next(io_string)
                    if selected_user == '1':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Head.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Head.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '2':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Teacher.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Teacher.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '3':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Admin.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Admin.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '4':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Supervisor.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Supervisor.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '5':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                            pass
                    elif selected_user == '6':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        if school_to_add:
                                                school_to_add.students.add(_)
                                        if class_to_add:
                                            class_to_add.students.add(_)
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        if school_to_add:
                                                school_to_add.students.add(_)
                                        if class_to_add:
                                            class_to_add.students.add(_)

                    elif selected_user == '7':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            else:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            if school_to_add and _:
                                                school_to_add.students.add(_)
                                            if class_to_add and _:
                                                class_to_add.students.add(_)
                                        elif column[7]:
                                            if User.objects.filter(username=school_to_add.school_name+'-parent-'+column[0]).count()<1:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-parent-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
                                            else:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.get(username=school_to_add.school_name+'-parent-'+column[0]), tell_me_user_id=column[7])

                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            else:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            if school_to_add and _:
                                                school_to_add.students.add(_)
                                            if class_to_add and _:
                                                class_to_add.students.add(_)
                                        elif column[7]:
                                            if User.objects.filter(username=school_to_add.school_name+'-parent-'+column[0]).count()<1:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-parent-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
                                            else:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.get(username=school_to_add.school_name+'-parent-'+column[0]), tell_me_user_id=column[7])
                    messages.success(request, 'Usuários criados com sucesso!')
                    return redirect('/users/create_user')
                else:
                    messages.error(request, 'Nenhum arquivo enviado!')
                    return redirect('/users/create_user')
            else:
                if form.is_valid():
                    if selected_user == '7':
                        messages.error(request, 'Você não pode adicionar pais e estudantes ao mesmo tempo desta forma, por favor selecione o formato adicionar por CSV!')
                        return redirect('/users/create_user')
                    else:
                        if selected_user == '6':
                            if not school_to_add or not class_to_add:
                                messages.error(request, 'Escola e turma são requeridos para criação de alunos')
                                return redirect('/users/create_user')
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
                        if selected_user == '1':
                            if form2.is_valid():
                                user_creation = form2.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                if school_to_add:
                                    head_to_add = Head.objects.get(profile=user_profile)
                                    school_to_add.heads.add(head_to_add)
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'diretor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '2':
                            if form3.is_valid():
                                user_creation = form3.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'professor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '3':
                            if form4.is_valid():
                                user_creation = form4.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'administrador',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '4':
                            if form5.is_valid():
                                user_creation = form5.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'supervisor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '5':
                            if form6.is_valid():
                                user_creation = form6.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.maple_bear_email = user_profile.email
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                        elif selected_user == '6':
                            if form7.is_valid():
                                user_creation = form7.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.maple_bear_email = user_profile.email
                                if user_creation.financial_responsible_id_sponte:
                                    if Parent.objects.filter(tell_me_user_id=user_creation.financial_responsible_id_sponte).count()>=1:
                                        user_creation.first_parent = Parent.objects.filter(tell_me_user_id=user_creation.financial_responsible_id_sponte).last()
                                if user_creation.didatic_responsible_id_sponte:
                                    if Parent.objects.filter(tell_me_user_id=user_creation.didatic_responsible_id_sponte).count()>=1:
                                        user_creation.second_parent = Parent.objects.filter(tell_me_user_id=user_creation.didatic_responsible_id_sponte).last()
                                user_creation.save()
                                student_to_add = Student.objects.get(profile=user_profile)
                                diff = datetime.date.today() - user_creation.birthday
                                age = diff.days//365
                                if age >= 18 and not student_to_add.first_parent and not student_to_add.second_parent:
                                    return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student_to_add.student_id, school_to_add.school_id, class_to_add.class_id))
                                school_to_add.students.add(student_to_add)
                                class_to_add.students.add(student_to_add)
                                messages.success(request, 'Usuário criado com sucesso!')
                                if student_to_add.first_parent and student_to_add.second_parent:
                                    pass
                                elif student_to_add.first_parent:
                                    messages.success(request, 'Você selecionou apenas o Responsável Financeiro!')
                                    messages.success(request, 'Por favor selecione o Responsável Pedagógico na aba de usuários!')
                                elif student_to_add.second_parent:
                                    messages.success(request, 'Você selecionou apenas o Responsável Pedagógico!')
                                    messages.success(request, 'Por favor selecione o Responsável Financeiro na aba de usuários!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'aluno',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                                if not student_to_add.first_parent and not student_to_add.second_parent:
                                    return redirect('/users/add_first_parent/{}'.format(student_to_add.student_id))
                    return redirect('/users/create_user')
        return render(request, 'school_users/createuser.html', {'user_form':form,'head_form':form2,'teacher_form':form3,'admin_form':form4,'supervisor_form':form5,'parent_form':form6,'student_form':form7, 'schools':schools})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        schools = None
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
        if Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
        is_supervisor = True
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        form3 = TeacherModelForm(request.POST or None)
        form4 = AdminModelForm(request.POST or None)
        form5 = SupervisorModelForm(request.POST or None)
        form6 = ParentIdTellMeModelForm(request.POST or None)
        form7 = StudentModelForm(request.POST or None)
        selected_user = request.POST.get('selected_user', 0)
        selected_school = request.POST.get('selected_school', 0)
        selected_class = request.POST.get('selected_class', 0)
        school_to_add = None
        if School.objects.filter(school_id=selected_school).count()>=1:
            school_to_add = School.objects.get(school_id=selected_school)
        if Class.objects.filter(class_id=selected_class).count()>=1:
            class_to_add = Class.objects.get(class_id=selected_class)
        csv_file = request.FILES.get('file' or None)
        if request.method == 'POST':

            yesorno = request.POST.get('sim/não' or None)
            # archive_type = request.POST.get('archive_type' or None)
            if yesorno == 'sim':
                # if archive_type == 'url':
                #     url = request.POST.get('url')
                #     csv_file = r = requests.get(url)
                #     if not url.endswith('.csv'):
                #         messages.warning(request, 'O arquivo enviado não é CSV')
                #         return redirect('/users/create_user')
                #     data_set = csv_file.content.decode('UTF-8')
                # elif archive_type == 'file':
                #     csv_file = request.FILES.get('file' or None)
                #     if not csv_file.name.endswith('.csv'):
                #         messages.warning(request, 'O arquivo enviado não é CSV')
                #         return redirect('/users/create_user')
                #     data_set = csv_file.read().decode('UTF-8')
                if csv_file:
                    if not csv_file.name.endswith('.csv'):
                        messages.warning(request, 'O arquivo enviado não é CSV')
                        return redirect('/users/create_user')
                    data_set = csv_file.read().decode('latin1')
                    io_string = io.StringIO(data_set)
                    next(io_string)
                    if selected_user == '1':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Head.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Head.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '2':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Teacher.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        school_to_add.teachers.add(_)
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Teacher.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        school_to_add.teachers.add(_)
                            pass
                    elif selected_user == '3':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Admin.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Admin.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '4':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Supervisor.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Supervisor.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '5':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                    elif selected_user == '6':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        if school_to_add:
                                                school_to_add.students.add(_)
                                        if class_to_add:
                                            class_to_add.students.add(_)
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        if school_to_add:
                                                school_to_add.students.add(_)
                                        if class_to_add:
                                            class_to_add.students.add(_)
                    elif selected_user == '7':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            else:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            if school_to_add and _:
                                                school_to_add.students.add(_)
                                            if class_to_add and _:
                                                class_to_add.students.add(_)
                                        elif column[7]:
                                            if User.objects.filter(username=school_to_add.school_name+'-parent-'+column[0]).count()<1:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-parent-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
                                            else:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.get(username=school_to_add.school_name+'-parent-'+column[0]), tell_me_user_id=column[7])

                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            else:
                                                _ = None
                                                if User.objects.filter(username=school_to_add.school_name+'-student-'+column[0]).count()<1:
                                                    _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-student-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                                else:
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                                    _.first_parent=Parent.objects.get(tell_me_user_id=column[8])
                                                    _.second_parent=Parent.objects.get(tell_me_user_id=column[9])
                                                    _.save()
                                                    _ = Student.objects.get(profile = User.objects.get(username=school_to_add.school_name+'-student-'+column[0]))
                                            if school_to_add and _:
                                                school_to_add.students.add(_)
                                            if class_to_add and _:
                                                class_to_add.students.add(_)
                                        elif column[7]:
                                            if User.objects.filter(username=school_to_add.school_name+'-parent-'+column[0]).count()<1:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=school_to_add.school_name+'-parent-'+column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
                                            else:
                                                _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.get(username=school_to_add.school_name+'-parent-'+column[0]), tell_me_user_id=column[7])
                    messages.success(request, 'Usuários criados com sucesso!')
                    return redirect('/users/create_user')
                else:
                    messages.error(request, 'Nenhum arquivo enviado!')
                    return redirect('/users/create_user')
            elif yesorno == 'não':
                if form.is_valid():
                    if selected_user == '7':
                        messages.error(request, 'Você não pode adicionar pais e estudantes ao mesmo tempo desta forma, por favor selecione o formato adicionar por CSV!')
                        return redirect('/users/create_user')
                    else:
                        if selected_user == '6':
                            if not school_to_add or not class_to_add:
                                messages.error(request, 'Escola e turma são requeridos para criação de alunos')
                                return redirect('/users/create_user')
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
                        if selected_user == '1':
                            if form2.is_valid():
                                user_creation = form2.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'diretor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                if school_to_add:
                                    head_to_add = Head.objects.get(profile=user_profile)
                                    school_to_add.heads.add(head_to_add)
                                email.send()
                        elif selected_user == '2':
                            if form3.is_valid():
                                user_creation = form3.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                teacher_to_add = Teacher.objects.get(profile=user_profile)
                                school_to_add.teachers.add(teacher_to_add)
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'professor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '3':
                            if form4.is_valid():
                                user_creation = form4.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'administrador',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '4':
                            if form5.is_valid():
                                user_creation = form5.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'supervisor',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                        elif selected_user == '5':
                            if form6.is_valid():
                                user_creation = form6.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.maple_bear_email = user_profile.email
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
                        elif selected_user == '6':
                            if form7.is_valid():
                                user_creation = form7.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.maple_bear_email = user_profile.email
                                if user_creation.financial_responsible_id_sponte:
                                    if Parent.objects.filter(tell_me_user_id=user_creation.financial_responsible_id_sponte).count()>=1:
                                        user_creation.first_parent = Parent.objects.filter(tell_me_user_id=user_creation.financial_responsible_id_sponte).last()
                                if user_creation.didatic_responsible_id_sponte:
                                    if Parent.objects.filter(tell_me_user_id=user_creation.didatic_responsible_id_sponte).count()>=1:
                                        user_creation.second_parent = Parent.objects.filter(tell_me_user_id=user_creation.didatic_responsible_id_sponte).last()
                                user_creation.save()
                                student_to_add = Student.objects.get(profile=user_profile)
                                diff = datetime.date.today() - user_creation.birthday
                                age = diff.days//365
                                if age >= 18 and not student_to_add.first_parent and not student_to_add.second_parent:
                                    return redirect('/users/do_u_need_parents/{}/{}/{}'.format(student_to_add.student_id, school_to_add.school_id, class_to_add.class_id))
                                school_to_add.students.add(student_to_add)
                                class_to_add.students.add(student_to_add)
                                messages.success(request, 'Usuário criado com sucesso!')
                                if student_to_add.first_parent and student_to_add.second_parent:
                                    pass
                                elif student_to_add.first_parent:
                                    messages.success(request, 'Você selecionou apenas o Responsável Financeiro!')
                                    messages.success(request, 'Por favor selecione o Responsável Pedagógico na aba de usuários!')
                                elif student_to_add.second_parent:
                                    messages.success(request, 'Você selecionou apenas o Responsável Pedagógico!')
                                    messages.success(request, 'Por favor selecione o Responsável Financeiro na aba de usuários!')
                                current_site = get_current_site(request)
                                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                                message = render_to_string('school_users/user_login.html', {
                                    'user': user_creation,
                                    'domain': current_site.domain,
                                    'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                                    'token':account_activation_token.make_token(user),
                                    'type_of_user':'aluno',
                                })
                                to_email = form.cleaned_data.get('email')
                                email = EmailMessage(
                                            mail_subject, message, to=[to_email]
                                )
                                email.send()
                                if not student_to_add.first_parent and not student_to_add.second_parent:
                                    return redirect('/users/add_first_parent/{}'.format(student_to_add.student_id))
                    return redirect('/users/create_user')
        return render(request, 'school_users/createuser.html', {'user_form':form,'head_form':form2,'teacher_form':form3,'admin_form':form4,'supervisor_form':form5,'parent_form':form6,'student_form':form7,'is_supervisor':is_supervisor, 'schools':schools})
    return redirect('/')

def generate_password(request):
    password = make_password('wordpass234')
    return render(request, 'school_users/password.html', {'password':password})

@login_required
def do_u_need_parents(request, student_id=None, school_id=None, class_id=None):
    student = Student.objects.get(student_id=student_id)
    school_to_add = School.objects.get(school_id=school_id)
    class_to_add = Class.objects.get(class_id=class_id)
    if request.user.is_superuser:
        if request.method == 'POST':
            yesorno = request.POST.get('sim/não')
            if yesorno == 'não':
                student.needs_parent = False
            student.save(update_fields=['needs_parent'])
            student_to_add = Student.objects.get(student_id=student_id)
            if school_to_add and class_to_add:
                school_to_add.students.add(student_to_add)
                class_to_add.students.add(student_to_add)
            messages.success(request, 'Usuário criado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': student,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(student.profile.pk)).decode(),
                'token':account_activation_token.make_token(student.profile),
                'type_of_user':'aluno',
            })
            to_email = student.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            if yesorno == 'não':
                messages.success(request, 'Você criou este estudante e o colocou como próprio responsável financeiro')
                return redirect('/users/create_user')
            return redirect('/users/add_first_parent/{}'.format(student_to_add.student_id))
        return render(request, 'school_users/do_u_need_parents.html', {'user':student})
    elif Head.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        if request.method == 'POST':
            yesorno = request.POST.get('sim/não')
            if yesorno == 'não':
                student.needs_parent = False
            student.save(update_fields=['needs_parent'])
            student_to_add = Student.objects.get(student_id=student_id)
            if school_to_add and class_to_add:
                school_to_add.students.add(student_to_add)
                class_to_add.students.add(student_to_add)
            messages.success(request, 'Usuário criado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': student,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(student.profile.pk)).decode(),
                'token':account_activation_token.make_token(student.profile),
                'type_of_user':'aluno',
            })
            to_email = student.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            if yesorno == 'não':
                messages.success(request, 'Você criou este estudante e o colocou como próprio responsável financeiro')
                return redirect('/users/create_user')
            return redirect('/users/add_first_parent/{}'.format(student_to_add.student_id))
        return render(request, 'school_users/do_u_need_parents.html', {'user':student, 'is_supervisor':is_supervisor})

@login_required
def create_head_to_school(request, school_id=None):
    if request.user.is_superuser:
        school_to_add_head = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = HeadModelForm(request.POST or None)
        head_users = Head.objects.all()
        selected_user = request.POST.get('selected_user', 0)
        if request.method == 'POST':
            if selected_user == '0' or selected_user == 0:
                if form.is_valid() and form2.is_valid():
                    user = form.save(commit=False)
                    user.username=user.first_name.lower()+user.last_name.lower()
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
                    current_site = get_current_site(request)
                    mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                    message = render_to_string('school_users/user_login.html', {
                        'user': user_creation,
                        'domain': current_site.domain,
                        'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                        'token':account_activation_token.make_token(user),
                        'type_of_user':'diretor',
                    })
                    to_email = form.cleaned_data.get('email')
                    email = EmailMessage(
                        mail_subject, message, to=[to_email]
                    )
                    email.send()
                    head_to_add = get_object_or_404(Head, profile=user_profile)
                    school_to_add_head.heads.add(head_to_add)
                    messages.success(request, '{} adicionado com sucesso à escola {}'.format(head_to_add.name, school_to_add_head.school_name))
                    if school_to_add_head.heads.all().count() < school_to_add_head.quantity_of_directors:
                        return redirect('/users/create_head_to_school/{}'.format(school_to_add_head.school_id))
                    return redirect('/users/create_supervisor_to_school/{}'.format(school_id))
            else:
                head = Head.objects.get(head_id=selected_user)
                school_to_add_head.heads.add(head)
                messages.success(request, '{} adicionado com sucesso à escola {}'.format(head.name, school_to_add_head.school_name))
                if school_to_add_head.heads.all().count() < school_to_add_head.quantity_of_directors:
                    return redirect('/users/create_head_to_school/{}'.format(school_to_add_head.school_id))
                return redirect('/users/create_supervisor_to_school/{}'.format(school_id))
        return render(request, 'school_users/create_head_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_head, 'head_users':head_users})

def classes_choices_ajax(request):
    school_id = request.GET.get('id')
    if School.objects.filter(school_id=school_id).count()>=1:
        school = School.objects.get(school_id=school_id)
        context = {'classes':school.classes.all().order_by('class_name')}
    else:
        context = {}
    return render(request, 'school_users/classes_choices.html', context)

def students_choices_ajax(request):
    class_id = request.GET.get('id')
    if Class.objects.filter(class_id=class_id).count()>=1:
        classe = Class.objects.get(class_id=class_id)
        context = {'students':classe.students.all().order_by('name')}
    else:
        context = {}
    return render(request, 'school_users/students_choices.html', context)

def reset_password(request, token=None, uidb64=None):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        if request.method == 'POST':
            password = request.POST.get('password')
            password2 = request.POST.get('password2')
            if password == password2:
                user.set_password(password)
                user.save()
            return redirect('/')
        return render(request, 'school_users/reset_password.html')
    return HttpResponse('O token não é válido para este usuário')

@login_required
def create_supervisor_to_school(request, school_id=None):
    if request.user.is_superuser:
        school_to_add_supervisor = School.objects.get(school_id=school_id)
        form = UserModelForm(request.POST or None)
        form2 = SupervisorModelForm(request.POST or None)
        supervisor_users = Supervisor.objects.all()
        selected_user = request.POST.get('selected_user' or 0)
        aplicável = request.POST.get('aplicável' or False)
        if request.method == 'POST':
            if aplicável == 'true':
                if selected_user == '0' or selected_user == 0:
                    if form.is_valid() and form2.is_valid():
                        user = form.save(commit=False)
                        user.username=user.first_name.lower()+user.last_name.lower()
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
                        current_site = get_current_site(request)
                        mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                        message = render_to_string('school_users/user_login.html', {
                            'user': user_creation,
                            'domain': current_site.domain,
                            'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                            'token':account_activation_token.make_token(user),
                            'type_of_user':'supervisor',
                        })
                        to_email = form.cleaned_data.get('email')
                        email = EmailMessage(
                            mail_subject, message, to=[to_email]
                        )
                        email.send()
                        supervisor_to_add = get_object_or_404(Supervisor, profile=user_profile)
                        school_to_add_supervisor.adminorsupervisor = supervisor_to_add
                        school_to_add_supervisor.save(update_fields=['adminorsupervisor'])
                        messages.success(request, 'Admin/Supervisor adicionado com sucesso à escola {}'.format(school_to_add_supervisor.school_name))
                        return redirect('/schools/{}/add_first_witness'.format(school_id))
                else:
                    supervisor = Supervisor.objects.get(supervisor_id=selected_user)
                    school_to_add_supervisor.adminorsupervisor = supervisor
                    school_to_add_supervisor.save(update_fields=['adminorsupervisor'])
                    messages.success(request, 'Admin/Supervisor adicionado com sucesso à escola {}'.format(school_to_add_supervisor.school_name))
                    return redirect('/schools/{}/add_first_witness'.format(school_id))
            elif aplicável == 'false':
                messages.warning(request, 'Você escolheu supervisor não aplicável para a escola {}'.format(school_to_add_supervisor.school_name))
                return redirect('/schools/{}/add_first_witness'.format(school_id))
        return render(request, 'school_users/create_supervisor_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_supervisor, 'supervisor_users':supervisor_users})


@login_required
def add_student(request):
    if request.user.is_superuser:
        form = UserModelForm(request.POST or None)
        form2 = StudentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            student = Student.objects.get(profile=user_profile)
            messages.success(request, 'Estudante criado com sucesso!')
            return redirect('/users/add_first_parent/{}'.format(student_id))
        return render(request, 'school_users/add_student.html', {'form':form, 'form2':form2})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        form = UserModelForm(request.POST or None)
        form2 = StudentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            student = Student.objects.get(profile=user_profile)
            messages.success(request, 'Estudante criado com sucesso!')
            return redirect('/users/add_first_parent/{}'.format(student_id))
        return render(request, 'school_users/add_student.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

@login_required
def add_first_parent(request, student_id=None):
    if request.user.is_superuser:
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            student.first_parent = parent
            student.save(update_fields=['first_parent'])
            messages.success(request, 'Responsável financeiro adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': student,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/add_second_parent/{}'.format(student_id))
        return render(request, 'school_users/add_first_parent.html', {'form':form, 'form2':form2, 'student':student})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            student.first_parent = parent
            student.save(update_fields=['first_parent'])
            messages.success(request, 'Responsável financeiro adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': user_creation,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/add_second_parent/{}'.format(student_id))
        return render(request, 'school_users/add_first_parent.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor, 'student':student})

@login_required
def add_second_parent(request, student_id=None):
    if request.user.is_superuser:
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            student.second_parent = parent
            student.save(update_fields=['second_parent'])
            messages.success(request, 'Responsável pedagógico adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': user_creation,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/create_user/')
        return render(request, 'school_users/add_second_parent.html', {'form':form, 'form2':form2, 'student':student})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username=user.first_name.lower()+user.last_name.lower()
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
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            student.second_parent = parent
            student.save(update_fields=['second_parent'])
            messages.success(request, 'Responsável pedagógico adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': user_creation,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/create_user'.format(student_id))
        return render(request, 'school_users/add_second_parent.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor, 'student':student})

@login_required
def add_parent(request, student_id=None, type_of_user= None):
    if request.user.is_superuser:
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
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
            user_creation.maple_bear_email = user_profile.email
            user_creation.save()
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            if type_of_user == 'first_parent':
                student.first_parent = parent
            if type_of_user == 'second_parent':
                student.second_parent = parent
            if type_of_user == 'third_parent':
                student.third_parent = parent
            student.save(update_fields=['first_parent','second_parent', 'third_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': user_creation,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/set_parents/{}'.format(student_id))
        return render(request, 'school_users/add_parent.html', {'form':form, 'form2':form2})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentIdTellMeModelForm(request.POST or None)
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
            user_creation.maple_bear_email = user_profile.email
            user_creation.save()
            current_site = get_current_site(request)
            parent = Parent.objects.get(profile=user_profile)
            if type_of_user == 'first_parent':
                student.first_parent = parent
            if type_of_user == 'second_parent':
                student.second_parent = parent
            if type_of_user == 'third_parent':
                student.third_parent = parent
            student.save(update_fields=['first_parent','second_parent', 'third_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
            current_site = get_current_site(request)
            mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
            message = render_to_string('school_users/user_login.html', {
                'user': user_creation,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token':account_activation_token.make_token(user),
                'type_of_user':'responsável',
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/users/set_parents/{}'.format(student_id))
        return render(request, 'school_users/add_parent.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

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
        head_users = []
        teacher_users = []
        student_users = []
        admin_users = []
        parent_users = []
        supervisor_users = []
        school = None
        schools = []
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
        elif Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
        is_supervisor = True
        for school in schools:
            for head in school.heads.all():
                if head not in head_users:
                    head_users += [(head)]
            if school.adminorsupervisor not in supervisor_users:
                supervisor_users += [(school.adminorsupervisor)]
            teacher_users += school.teachers.all()
            student_users += school.students.all()
            for student in school.students.all():
                if student.first_parent:
                    if student.first_parent not in parent_users:
                        parent_users += [(student.first_parent)]
                if student.second_parent:
                    if student.second_parent not in parent_users:
                        parent_users += [(student.second_parent)]
        return render(request, 'school_users/seeallusers.html', {'head_users':head_users,'teacher_users':teacher_users,'admin_users':admin_users,'supervisor_users':supervisor_users,'parent_users':parent_users,'student_users':student_users, 'is_supervisor':is_supervisor})
    return redirect('/')

@login_required
def seeusersbyquery_administration(request):
    head = request.user.head if hasattr(request.user, 'head') else None
    supervisor = request.user.supervisor if hasattr(request.user, 'supervisor') else None
    is_supervisor = False
    schools = []  
    
    if request.user.is_superuser:
        schools = School.objects.all().order_by('school_name')
    elif head or supervisor:
        is_supervisor = True
        if head:
            schools = School.objects.filter(heads__head_id__exact=head.head_id).order_by('school_name')
        elif supervisor:
            schools = School.objects.filter(Q(adminorsupervisor=supervisor)|Q(adminorsupervisor_2=supervisor)).order_by('school_name')

    
    if request.method == 'POST':
        fetched = False
        type_of_user = request.POST.get('type_of_user', None)
        selected_school = request.POST.get('selected_school', 0)
        name = request.POST.get('name' or None)
        school_users = []

        try:
            school = schools.get(school_id=selected_school)
        except School.DoesNotExist:
            school = None

        if type_of_user:

            TYPE = {
                'director': Head,
                'supervisor': Supervisor,
                'witness': Witness,
                'parent': Parent,
                'student': Student
            }
            
            if type_of_user != 'parent':
                if type_of_user == 'witness':
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(Q(first_witness_school__in=schools) | Q(second_witness_school__in=schools))

                    if school:
                        school_users = school_users.filter(Q(first_witness_school=school) | Q(second_witness_school=school))
                        fetched = True
                        
                    if name:
                        if fetched:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        else:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                            fetched = True

                    if not fetched:
                        if request.user.is_superuser:
                            school_users = TYPE[type_of_user].objects.all()
                        else:
                            school_users = TYPE[type_of_user].objects.filter(Q(first_witness_school__in=school) | Q(second_witness_school__in=school))
                elif type_of_user == 'supervisor':
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(Q(school_in=school) | Q(adminorsupervisor_2__in=school))

                    if school:
                        school_users = school_users.filter(Q(school=school) | Q(adminorsupervisor_2=school))
                        fetched = True
                        
                    if name:
                        if fetched:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        else:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                            fetched = True

                    if not fetched:
                        if request.user.is_superuser:
                            school_users = TYPE[type_of_user].objects.all()
                        else:
                            school_users = TYPE[type_of_user].objects.filter(Q(school__in=school) | Q(adminorsupervisor_2__in=school))
                else:
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(school__in=schools)

                    if school:
                        school_users = school_users.filter(school=school)
                        fetched = True
                        
                    if name:
                        if fetched:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        else:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                            fetched = True

                    if not fetched:
                        if request.user.is_superuser:
                            school_users = TYPE[type_of_user].objects.all()
                        else:
                            school_users = TYPE[type_of_user].objects.filter(school__in=schools)

            else:
                if request.user.is_superuser:
                    school_users = TYPE[type_of_user].objects.all()
                else:
                    school_users = TYPE[type_of_user].objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))

                if school:
                    school_users = school_users.filter(Q(first_parent__school=school) | Q(second_parent__school=school) | Q(third_parent__school=school))
                    fetched = True
                    
                if name:
                    if fetched:
                        school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                    else:
                        school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        fetched = True

                if not fetched:
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))
            
        
        return render(request, 'school_users/seeusersbyquery_administration.html', {'type_of_user':type_of_user, 'school_users':school_users, 'schools':schools, 'is_supervisor': is_supervisor})

            
    return render(request, 'school_users/seeusersbyquery_administration.html', {'schools':schools, 'is_supervisor': is_supervisor})

@login_required
def seeusersbyquery_signes(request):
    head = request.user.head if hasattr(request.user, 'head') else None
    supervisor = request.user.supervisor if hasattr(request.user, 'supervisor') else None
    is_supervisor = False
    schools = []  
    
    if request.user.is_superuser:
        schools = School.objects.all().order_by('school_name')
    elif head or supervisor:
        is_supervisor = True
        if head:
            schools = School.objects.filter(heads__head_id__exact=head.head_id).order_by('school_name')
        elif supervisor:
            schools = School.objects.filter(Q(adminorsupervisor=supervisor)|Q(adminorsupervisor_2=supervisor)).order_by('school_name')

    
    if request.method == 'POST':
        fetched = False
        type_of_user = request.POST.get('type_of_user', None)
        selected_school = request.POST.get('selected_school', 0)
        name = request.POST.get('name' or None)
        school_users = []

        try:
            school = schools.get(school_id=selected_school)
        except School.DoesNotExist:
            school = None

        if type_of_user:

            TYPE = {
                'director': Head,
                'supervisor': Supervisor,
                'witness': Witness,
                'parent': Parent,
                'student': Student
            }
            
            if type_of_user != 'parent':
                if type_of_user == 'witness':
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(Q(first_witness_school=school) | Q(second_witness_school=school))

                    if school:
                        school_users = school_users.filter(Q(first_witness_school=school) | Q(second_witness_school=school))
                        fetched = True
                        
                    if name:
                        if fetched:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        else:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                            fetched = True

                    if not fetched:
                        if request.user.is_superuser:
                            school_users = TYPE[type_of_user].objects.all()
                        else:
                            school_users = TYPE[type_of_user].objects.filter(Q(first_witness_school=school) | Q(second_witness_school=school))
                else:
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(school__in=schools)

                    if school:
                        school_users = school_users.filter(school=school)
                        fetched = True
                        
                    if name:
                        if fetched:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        else:
                            school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                            fetched = True

                    if not fetched:
                        if request.user.is_superuser:
                            school_users = TYPE[type_of_user].objects.all()
                        else:
                            school_users = TYPE[type_of_user].objects.filter(school__in=schools)

            else:
                if request.user.is_superuser:
                    school_users = TYPE[type_of_user].objects.all()
                else:
                    school_users = TYPE[type_of_user].objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))

                if school:
                    school_users = school_users.filter(Q(first_parent__school=school) | Q(second_parent__school=school) | Q(third_parent__school=school))
                    fetched = True
                    
                if name:
                    if fetched:
                        school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                    else:
                        school_users = school_users.filter(reduce(operator.and_, (Q(name__icontains=x) for x in name.split(" "))))
                        fetched = True

                if not fetched:
                    if request.user.is_superuser:
                        school_users = TYPE[type_of_user].objects.all()
                    else:
                        school_users = TYPE[type_of_user].objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))
            
        
        return render(request, 'school_users/seeusersbyquery_signes.html', {'type_of_user':type_of_user, 'school_users':school_users, 'schools':schools, 'is_supervisor': is_supervisor})

            
    return render(request, 'school_users/seeusersbyquery_signes.html', {'schools':schools, 'is_supervisor': is_supervisor})

def seeallusers_by_school(request, school_id=None):
    if request.user.is_superuser:
        head_users = []
        teacher_users = []
        student_users = []
        admin_users = []
        parent_users = []
        supervisor_users = []
        school = None
        if school_id:
            school = School.objects.get(school_id=school_id)
        if school:
            if school.heads.all().count()>=1:
                for head in school.heads.all():
                    if head not in head_users:
                        head_users += [(head)]
            if school.adminorsupervisor:
                supervisor_users += [(school.adminorsupervisor)]
            teacher_users = school.teachers.all()
            student_users = school.students.all()
            for student in school.students.all():
                if student.first_parent:
                    if student.first_parent not in parent_users:
                        parent_users += [(student.first_parent)]
                if student.second_parent:
                    if student.second_parent not in parent_users:
                        parent_users += [(student.second_parent)]
        else:
            head_users = Head.objects.all()
            teacher_users = Teacher.objects.all()
            admin_users = Admin.objects.all()
            supervisor_users = Supervisor.objects.all()
            parent_users = Parent.objects.all()
            student_users = Student.objects.all()
        return render(request, 'school_users/seeallusers.html', {'head_users':head_users,'teacher_users':teacher_users,'admin_users':admin_users,'supervisor_users':supervisor_users,'parent_users':parent_users,'student_users':student_users})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        head_users = []
        teacher_users = []
        student_users = []
        admin_users = []
        parent_users = []
        supervisor_users = []
        school = None
        if school_id:
            school = School.objects.get(school_id=school_id)
        if school:
            if school.heads.all().count()>=1:
                for head in school.heads.all():
                    if head not in head_users:
                        head_users += [(head)]
            if school.adminorsupervisor:
                supervisor_users += [(school.adminorsupervisor)]
            teacher_users = school.teachers.all()
            student_users = school.students.all()
            for student in school.students.all():
                if student.first_parent:
                    if student.first_parent not in parent_users:
                        parent_users += [(student.first_parent)]
                if student.second_parent:
                    if student.second_parent not in parent_users:
                        parent_users += [(student.second_parent)]
        else:
            schools = []
            if Head.objects.filter(profile=request.user).count()>=1:
                schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
            elif Supervisor.objects.filter(profile=request.user).count()>=1:
                schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
            for school in schools:
                if school.heads.all().count()>=1:
                    for head in school.heads.all():
                        if head not in head_users:
                            head_users += [(head)]
                if school.adminorsupervisor not in supervisor_users:
                    supervisor_users += [(school.adminorsupervisor)]
                teacher_users += school.teachers.all()
                student_users += school.students.all()
                for student in school.students.all():
                    if student.first_parent:
                        if student.first_parent not in parent_users:
                            parent_users += [(student.first_parent)]
                    if student.second_parent:
                        if student.second_parent not in parent_users:
                            parent_users += [(student.second_parent)]
        is_supervisor = True
        return render(request, 'school_users/seeallusers.html', {'head_users':head_users,'teacher_users':teacher_users,'admin_users':admin_users,'supervisor_users':supervisor_users,'parent_users':parent_users,'student_users':student_users, 'is_supervisor':is_supervisor})
    return redirect('/')

@login_required
def delete_user(request, user_id=None, type_of_user=None):
    if request.user.is_superuser:
        if(type_of_user=='head'):
            user_to_delete = get_object_or_404(Head, head_id=user_id)
        if(type_of_user=='teacher'):
            user_to_delete = get_object_or_404(Teacher, teacher_id=user_id)
        if(type_of_user=='admin'):
            user_to_delete = get_object_or_404(Admin, admin_id=user_id)
        if(type_of_user=='supervisor'):
            user_to_delete = get_object_or_404(Supervisor, supervisor_id=user_id)
        if(type_of_user=='witness'):
            user_to_delete = get_object_or_404(Witness, witness_id=user_id)
        if(type_of_user=='parent'):
            user_to_delete = get_object_or_404(Parent, parent_id=user_id)
        if(type_of_user=='student'):
            user_to_delete = get_object_or_404(Student, student_id=user_id)
            if user_to_delete.first_parent and user_to_delete.second_parent:
                if not user_to_delete.first_parent == user_to_delete.second_parent:
                    if Student.objects.filter(Q(first_parent=user_to_delete.first_parent)|Q(first_parent=user_to_delete.second_parent)|Q(second_parent=user_to_delete.first_parent)|Q(second_parent=user_to_delete.second_parent)).count()<=1:
                        if user_to_delete.first_parent.profile:
                            user_to_delete.first_parent.profile.delete()
                        user_to_delete.first_parent.delete()
                        if user_to_delete.second_parent.profile:
                            user_to_delete.second_parent.profile.delete()
                        user_to_delete.second_parent.delete()
                else:
                    if Student.objects.filter(Q(first_parent=user_to_delete.first_parent)|Q(second_parent=user_to_delete.first_parent)).count()<=1:
                        if user_to_delete.first_parent.profile:
                            user_to_delete.first_parent.profile.delete()
                        user_to_delete.first_parent.delete()
        if user_to_delete.profile:
            user_to_delete.profile.delete()
        user_to_delete.delete()
        messages.success(request, 'Esse usuário foi deletado com sucesso')
        return redirect(request.META.get('HTTP_REFERER'))
    messages.error(request, 'Você não é administrador portanto não pode deletar usuários')
    return redirect(request.META.get('HTTP_REFERER'))

@login_required
def reset_password_send_email(request, user_id=None, type_of_user=None):
    if request.user.is_superuser or Head.objects.filter(profile=request.user).count()>=1:
        if(type_of_user=='head'):
            user_to_reset_password = get_object_or_404(Head, head_id=user_id)
        if(type_of_user=='teacher'):
            user_to_reset_password = get_object_or_404(Teacher, teacher_id=user_id)
        if(type_of_user=='admin'):
            user_to_reset_password = get_object_or_404(Admin, admin_id=user_id)
        if(type_of_user=='supervisor'):
            user_to_reset_password = get_object_or_404(Supervisor, supervisor_id=user_id)
        if(type_of_user=='witness'):
            user_to_reset_password = get_object_or_404(Witness, witness_id=user_id)            
        if(type_of_user=='parent'):
            user_to_reset_password = get_object_or_404(Parent, parent_id=user_id)
        if(type_of_user=='student'):
            user_to_reset_password = get_object_or_404(Student, student_id=user_id)
        current_site = get_current_site(request)
        mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
        message = render_to_string('school_users/user_login.html', {
            'user': user_to_reset_password,
            'domain': current_site.domain,
            'uid':urlsafe_base64_encode(force_bytes(user_to_reset_password.profile.pk)).decode(),
            'token':account_activation_token.make_token(user_to_reset_password.profile),
        })
        to_email = user_to_reset_password.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        email.send()
        messages.success(request, 'O usuário {} recebeu no email cadastrado um email para resetar a senha'.format(user_to_reset_password.name))
        return redirect(request.META.get('HTTP_REFERER'))

@login_required
def set_parents(request, student_id=None):
    if request.user.is_superuser:
    	instance = get_object_or_404(Student, student_id=student_id)
    	form = SetParentsModelForm(request.POST or None, instance=instance)
    	if form.is_valid():
            new_student = form.save(commit=False)
            new_student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsáveis Selecionados com Sucesso')
            return redirect('/users/all_signes/')
    	return render(request, 'school_users/set_parents.html', {'form':form, 'student_id':student_id})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        instance = get_object_or_404(Student, student_id=student_id)
        form = SetParentsModelForm(request.POST or None, instance=instance)
        parents_ids = []
        schools = None
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(heads__head_id__exact=Head.objects.get(profile=request.user).head_id)
        if Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(Q(adminorsupervisor=Supervisor.objects.get(profile=request.user))|Q(adminorsupervisor_2=Supervisor.objects.get(profile=request.user)))
        form.fields["first_parent"].queryset = Parent.objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))
        form.fields["second_parent"].queryset = Parent.objects.filter(Q(first_parent__school__in=schools) | Q(second_parent__school__in=schools) | Q(third_parent__school__in=schools))
        if form.is_valid():
            new_student = form.save(commit=False)
            new_student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsáveis Selecionados com Sucesso')
            return redirect('/users/all_signes/')
        return render(request, 'school_users/set_parents.html', {'form':form, 'student_id':student_id, 'is_supervisor':is_supervisor})


@csrf_exempt
def do_login(request):
    if request.method == 'POST':
        username = request.POST['username'].lower()
        user = authenticate(username=username, password=request.POST['password'])
        if user is not None:
            login(request, user)
            nextpage = request.GET.get('next','/')
            return redirect(nextpage)
        else:
            user = authenticate(username=request.POST['username'], password=request.POST['password'])
            if user is not None:
                login(request, user)
                nextpage = request.GET.get('next','/')
                return redirect(nextpage)
            else:
                messages.error(request, 'Usuário não existente')
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

@csrf_exempt
@api_view(['GET','POST'])
def get_data(request, mydataserialized, message, type_of_message):
    return Response({'message':message, 'type_of_message':type_of_message,'data_serialised':mydataserialized.data})

def login_from_other_system(request, username=None):
    if request.method == 'POST':
        username = username.lower()
        user = authenticate(username=username, password=request.POST['password'])
        if user is not None:
            login(request, user)
            nextpage = request.GET.get('next','/')
            return redirect(nextpage)
    return render(request, 'school_users/login_from_other_system.html')

@login_required
def profile(request):
    if Parent.objects.filter(profile=request.user).count()>=1:
        parent = Parent.objects.get(profile=request.user)
        sons = []
        form = ParentModelForm(request.POST or None, instance=parent)
        for student in Student.objects.filter(first_parent=parent):
            if student not in sons:
                sons += [(student)]
        for student in Student.objects.filter(second_parent=parent):
            if student not in sons:
                sons += [(student)]
        if request.method == 'POST':
            if form.is_valid():
                newparent = form.save(commit=False)
                newparent.save(update_fields=['maple_bear_username', 'maple_bear_password', 'maple_bear_email'])
                messages.success(request, 'Perfil alterado com sucesso')
                return redirect('/users/profile')
        return render(request, 'school_users/profile.html', {'form':form, 'parent':parent, 'sons':sons, 'is_client':True})
    elif Student.objects.filter(profile=request.user).count()>=1:
        parent = Student.objects.get(profile=request.user)
        sons = []
        form = ProfileForStudentModelForm(request.POST or None, instance=parent)
        if request.method == 'POST':
            if form.is_valid():
                newparent = form.save(commit=False)
                newparent.save(update_fields=['maple_bear_username', 'maple_bear_password', 'maple_bear_email'])
                messages.success(request, 'Perfil alterado com sucesso')
                return redirect('/users/profile')
        return render(request, 'school_users/profile.html', {'form':form, 'parent':parent, 'sons':sons, 'is_client':True})
    messages.error(request, 'Você não é responsável ou estudante responsável dentro do sistema.')
    return redirect('/')

@login_required
def seesonsofparent(request, parent_id=None):
    if request.user.is_superuser:
        parent = Parent.objects.get(parent_id=parent_id)
        sons = []
        for student in Student.objects.filter(first_parent=parent):
            if student not in sons:
                sons += [(student)]
        for student in Student.objects.filter(second_parent=parent):
            if student not in sons:
                sons += [(student)]
        return render(request, 'school_users/sonsofparent.html', {'parent':parent, 'sons':sons})
    if Head.objects.filter(profile=request.user).count()>=1:
        parent = Parent.objects.get(parent_id=parent_id)
        sons = []
        for student in Student.objects.filter(first_parent=parent):
            if student not in sons:
                sons += [(student)]
        for student in Student.objects.filter(second_parent=parent):
            if student not in sons:
                sons += [(student)]
        return render(request, 'school_users/sonsofparent.html', {'parent':parent, 'sons':sons, 'is_supervisor':True})

@csrf_exempt
def update_profile(request):
    user = User.objects.get(id=current_user(request).data.get("id"))
    received_json_data=json.loads(request.body)
    if Parent.objects.filter(profile=user).count()>=1:
        parent = Parent.objects.get(profile=user)
        maple_bear_email = received_json_data.get("maple_bear_email")
        parent.maple_bear_email = maple_bear_email
        parent.save(update_fields='maple_bear_email')
        parent_rest = ParentSerializer(parent)
        return get_data(request, parent_rest, 'O email do maple bear do usuário foi alterado com sucesso!', 'success')
    if Student.objects.filter(profile=user).count()>=1:
        student = Student.objects.get(profile=user)
        maple_bear_email = received_json_data.get("maple_bear_email")
        student.maple_bear_email = maple_bear_email
        student.save(update_fields='maple_bear_email')
        student_rest = StudentSerializer(student)
        return get_data(request, student_rest, 'O email do maple bear do usuário foi alterado com sucesso!', 'success')
    user_rest = UserSerializer(user)
    return get_data(request, user_rest, 'O usuário não é responsável no sistema!', 'warning')

def change_email(request, user_id):
    user = User.objects.get(id=user_id)
    form = EmailModelForm(request.POST or None, instance=user)
    if request.method == 'POST':
        if form.is_valid():
            user = form.save(commit=False)
            user.save(update_fields=['email'])
            messages.success(request, 'Email Atualizado com sucesso')
            return redirect(request.META.get('HTTP_REFERER'))
    return render(request, 'school_users/change_email.html', {'form':form})

def room(request, room_name):
    return render(request, 'school_users/room.html', {
        'room_name_json': mark_safe(json.dumps(room_name))
    })

def handler404(request, *args, **argv):
    response = render_to_response('school_users/errorpage.html')
    response.status_code = 404
    return response


def handler500(request, *args, **argv):
    response = render_to_response('school_users/errorpage.html')
    response.status_code = 500
    return response

def forgot_password(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        selected_user = request.POST.get('selected_user')
        TYPE = {
                'director': Head,
                'supervisor': Supervisor,
                'witness': Witness,
                'parent': Parent,
                'student': Student
            }
        try:
            users_to_reset_password = TYPE[selected_user].objects.filter(profile__email=email)
            for user_to_reset_password in users_to_reset_password:
                current_site = get_current_site(request)
                mail_subject = 'Login de acesso ao módulo de Contratos - Tellme School.'
                message = render_to_string('school_users/user_login.html', {
                    'user': user_to_reset_password,
                    'domain': current_site.domain,
                    'uid':urlsafe_base64_encode(force_bytes(user_to_reset_password.profile.pk)).decode(),
                    'token':account_activation_token.make_token(user_to_reset_password.profile),
                })
                to_email = user_to_reset_password.profile.email
                email = EmailMessage(
                    mail_subject, message, to=[to_email]
                )
                email.send()
                messages.success(request, 'O usuário {} recebeu no email cadastrado um email para resetar a senha'.format(user_to_reset_password.name))
        except Exception as e:
            messages.error(request, str(e))
        return redirect(request.META.get('HTTP_REFERER'))
    return render(request, 'school_users/forgot_password.html')