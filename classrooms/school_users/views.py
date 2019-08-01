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
                    data_set = csv_file.read().decode('UTF-8')
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
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])

                    elif selected_user == '7':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                            else:
                                                _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
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
                                        elif column[7]:
                                             _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
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
                        user = form.save(commit=False)
                        user.username = user.first_name.lower()+user.last_name.lower()
                        i=0
                        while User.objects.filter(username=user.username).count()>=1:
                            user.username = user.first_name.lower()+user.last_name.lower()
                            user.username = user.username + str(i)
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
                        elif selected_user == '2':
                            if form3.is_valid():
                                user_creation = form3.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '3':
                            if form4.is_valid():
                                user_creation = form4.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '4':
                            if form5.is_valid():
                                user_creation = form5.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '5':
                            if form6.is_valid():
                                user_creation = form6.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '6':
                            if form7.is_valid():
                                user_creation = form7.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                # diff = datetime.date.today() - user_creation.birthday
                                # age = diff.days//365
                                # if age >= 18:
                                #     do_u_need_parents(request, user_creation)
                                user_creation.save()
                                messages.success(request, 'Usuário criado com sucesso!')
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
                    data_set = csv_file.read().decode('UTF-8')
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
                                        school_to_add.students.add(_)
                                        class_to_add.students.add(_)
                        elif ';' in data_set:
                            for column in csv.reader(io_string, delimiter=';', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[7] and column[8]:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[7]), second_parent=Parent.objects.get(tell_me_user_id=column[8]), tell_me_user_id=column[6])
                                        else:
                                            _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                        school_to_add.students.add(_)
                                        class_to_add.students.add(_)
                    elif selected_user == '7':
                        if ',' in data_set:
                            for column in csv.reader(io_string, delimiter=',', quotechar='|'):
                                if column[0]:
                                    if column[4]==column[5]:
                                        if column[6]:
                                            if column[8] and column[9]:
                                                _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), first_parent=Parent.objects.get(tell_me_user_id=column[8]), second_parent=Parent.objects.get(tell_me_user_id=column[9]), tell_me_user_id=column[6])
                                            else:
                                                _, created = Student.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[6])
                                            school_to_add.students.add(_)
                                            class_to_add.students.add(_)
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
                                            school_to_add.students.add(_)
                                            class_to_add.students.add(_)
                                        elif column[7]:
                                             _, created = Parent.objects.update_or_create(name = column[1]+' '+column[2], profile = User.objects.create_user(username=column[0], first_name=column[1], last_name=column[2], email=column[3], password=column[4]), tell_me_user_id=column[7])
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
                        user = form.save(commit=False)
                        user.username = user.first_name.lower()+user.last_name.lower()
                        user.password = make_password('wordpass234')
                        i=0
                        while User.objects.filter(username=user.username).count()>=1:
                            user.username = user.first_name.lower()+user.last_name.lower()
                            user.username = user.username + str(i)
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
                        elif selected_user == '3':
                            if form4.is_valid():
                                user_creation = form4.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '4':
                            if form5.is_valid():
                                user_creation = form5.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '5':
                            if form6.is_valid():
                                user_creation = form6.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                messages.success(request, 'Usuário Criado com sucesso!')
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
                        elif selected_user == '6':
                            if form7.is_valid():
                                user_creation = form7.save(commit=False)
                                user_creation.profile = user_profile
                                user_creation.name = user_profile.first_name+' '+user_profile.last_name
                                user_creation.save()
                                student_to_add = Student.objects.get(profile=user_profile)
                                school_to_add.students.add(student_to_add)
                                class_to_add.students.add(student_to_add)
                                messages.success(request, 'Usuário criado com sucesso!')
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
                    return redirect('/users/create_user')
        return render(request, 'school_users/createuser.html', {'form':form,'form2':form2,'form3':form3,'form4':form4,'form5':form5,'form6':form6,'form7':form7,'is_supervisor':is_supervisor, 'schools':schools})
    return HttpResponse('U cannot access this page cos u are not admin!')

def generate_password(request):
    password = make_password('wordpass234')
    return render(request, 'school_users/password.html', {'password':password})


def do_u_need_parents(request, user_creation=None, school_to_add=None, class_to_add=None):

    pass

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
                    head_to_add = get_object_or_404(Head, profile=user_profile)
                    school_to_add_head.head = head_to_add
                    school_to_add_head.save(update_fields=['head'])
                    messages.success(request, '{} adicionado com sucesso à escola {}'.format(head_to_add.name, school_to_add_head.school_name))
                    return redirect('/users/create_supervisor_to_school/{}'.format(school_id))
            else:
                head = Head.objects.get(head_id=selected_user)
                school_to_add_head.head = head
                school_to_add_head.save(update_fields=['head'])
                messages.success(request, '{} adicionado com sucesso à escola {}'.format(head.name, school_to_add_head.school_name))
                return redirect('/users/create_supervisor_to_school/{}'.format(school_id))
        return render(request, 'school_users/create_head_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_head, 'head_users':head_users})

def classes_choices_ajax(request):
    school_id = request.GET.get('id')
    school = School.objects.get(school_id=school_id)
    context = {'classes':school.classes.all()}
    return render(request, 'school_users/classes_choices.html', context)

def restPassword():
    pass

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
                        supervisor_to_add = get_object_or_404(Supervisor, profile=user_profile)
                        school_to_add_supervisor.adminorsupervisor = supervisor_to_add
                        school_to_add_supervisor.save(update_fields=['adminorsupervisor'])
                        messages.success(request, 'Admin/Supervisor adicionado com sucesso à escola {}'.format(school_to_add_supervisor.school_name))
                        return redirect('/'.format(school_id))
                else:
                    supervisor = Supervisor.objects.get(supervisor_id=selected_user)
                    school_to_add_supervisor.adminorsupervisor = supervisor
                    school_to_add_supervisor.save(update_fields=['adminorsupervisor'])
                    messages.success(request, 'Admin/Supervisor adicionado com sucesso à escola {}'.format(school_to_add_supervisor.school_name))
                    return redirect('/'.format(school_id))
            elif aplicável == 'false':
                messages.warning(request, 'Você escolheu supervisor não aplicável para a escola {}'.format(school_to_add_supervisor.school_name))
                return redirect('/'.format(school_id))
        return render(request, 'school_users/create_supervisor_to_school.html', {'form':form, 'form2':form2, 'school':school_to_add_supervisor, 'supervisor_users':supervisor_users})


@login_required
def add_student(request):
    if request.user.is_superuser:
        form = UserModelForm(request.POST or None)
        form2 = StudentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.name = user_profile.first_name+' '+user_profile.last_name
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
            user.save()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.name = user_profile.first_name+' '+user_profile.last_name
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
        form2 = ParentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.save()
            user.username = user.first_name.lower()+user.last_name.lower()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.name = user_profile.first_name+' '+user_profile.last_name
            user_creation.save()
            parent = Parent.objects.get(profile=user_profile)
            student.first_parent = parent
            student.save(update_fields=['first_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
            return redirect('/users/add_second_parent/{}'.format(student_id))
        return render(request, 'school_users/add_parent.html', {'form':form, 'form2':form2})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.save()
            user.username = user.first_name.lower()+user.last_name.lower()
            user_profile = get_object_or_404(User, username=user.username,first_name=user.first_name,last_name=user.last_name,email=user.email,password=user.password)
            user_creation = form2.save(commit=False)
            user_creation.profile = user_profile
            user_creation.name = user_profile.first_name+' '+user_profile.last_name
            user_creation.save()
            parent = Parent.objects.get(profile=user_profile)
            student.first_parent = parent
            student.save(update_fields=['first_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
            return redirect('/users/add_second_parent/{}'.format(student_id))
        return render(request, 'school_users/add_parent.html', {'form':form, 'form2':form2, 'is_supervisor':is_supervisor})

@login_required
def add_parent(request, student_id=None, type_of_user= None):
    if request.user.is_superuser:
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username = user.first_name.lower()+user.last_name.lower()
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
            parent = Parent.objects.get(profile=user_profile)
            if type_of_user == 'first_parent':
                student.first_parent = parent
            if type_of_user == 'second_parent':
                student.second_parent = parent
            student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
            return redirect('/users/set_parents/{}'.format(student_id))
        return render(request, 'school_users/add_parent.html', {'form':form, 'form2':form2})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        student = Student.objects.get(student_id=student_id)
        form = UserModelForm(request.POST or None)
        form2 = ParentModelForm(request.POST or None)
        if form.is_valid() and form2.is_valid():
            user = form.save(commit=False)
            user.username = user.first_name.lower()+user.last_name.lower()
            i = 1
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
            parent = Parent.objects.get(profile=user_profile)
            if type_of_user == 'first_parent':
                student.first_parent = parent
            if type_of_user == 'second_parent':
                student.second_parent = parent
            student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsável adicionado com sucesso!')
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
            schools = School.objects.filter(head=Head.objects.get(profile=request.user))
        elif Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
        is_supervisor = True
        for school in schools:
            if school.head not in head_users:
                head_users += [(school.head)]
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
    return HttpResponse('U cannot access this page cos u are not admin!')

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
            if school.head:
                head_users += [(school.head)]
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
            if school.head:
                head_users += [(school.head)]
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
                schools = School.objects.filter(head=Head.objects.get(profile=request.user))
            elif Supervisor.objects.filter(profile=request.user).count()>=1:
                schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
            for school in schools:
                if school.head not in head_users:
                    head_users += [(school.head)]
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
    return HttpResponse('U cannot access this page cos u are not admin!')
    pass

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
        if(type_of_user=='parent'):
            user_to_delete = get_object_or_404(Parent, parent_id=user_id)
        if(type_of_user=='student'):
            user_to_delete = get_object_or_404(Student, student_id=user_id)
            if user_to_delete.first_parent:
                user_to_delete.first_parent.profile.delete()
                user_to_delete.first_parent.delete()
            if user_to_delete.second_parent:
                user_to_delete.second_parent.profile.delete()
                user_to_delete.second_parent.delete()
        user_to_delete.profile.delete()
        user_to_delete.delete()
        messages.success(request, 'Esse usuário foi deletado com sucesso')
        return redirect('/users/all')
    messages.error(request, 'Você não é administrador portanto não pode deletar usuários')
    return redired('/users/all')

@login_required
def set_parents(request, student_id=None):
    if request.user.is_superuser:
    	instance = get_object_or_404(Student, student_id=student_id)
    	form = SetParentsModelForm(request.POST or None, instance=instance)
    	if form.is_valid():
            new_student = form.save(commit=False)
            new_student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsáveis Selecionados com Sucesso')
            return redirect('/users/all')
    	return render(request, 'school_users/set_parents.html', {'form':form, 'student_id':student_id})
    elif Head.objects.filter(profile=request.user).count()>=1 or Supervisor.objects.filter(profile=request.user).count()>=1:
        is_supervisor = True
        instance = get_object_or_404(Student, student_id=student_id)
        form = SetParentsModelForm(request.POST or None, instance=instance)
        parents_ids = []
        schools = None
        if Head.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(head=Head.objects.get(profile=request.user))
        if Supervisor.objects.filter(profile=request.user).count()>=1:
            schools = School.objects.filter(adminorsupervisor=Supervisor.objects.get(profile=request.user))
        for school in schools:
            for student in school.students.all():
                if student.first_parent:
                    parents_ids += [(student.first_parent.parent_id)]
                if student.second_parent:
                    parents_ids += [(student.second_parent.parent_id)]
        form.fields["first_parent"].queryset = Parent.objects.filter(parent_id__in=parents_ids)
        form.fields["second_parent"].queryset = Parent.objects.filter(parent_id__in=parents_ids)
        if form.is_valid():
            new_student = form.save(commit=False)
            new_student.save(update_fields=['first_parent','second_parent'])
            messages.success(request, 'Responsáveis Selecionados com Sucesso')
            return redirect('/users/all')
        return render(request, 'school_users/set_parents.html', {'form':form, 'student_id':student_id, 'is_supervisor':is_supervisor})



def do_login(request):
    if request.method == 'POST':
        username = request.POST['username'].lower()
        user = authenticate(username=username, password=request.POST['password'])
        if user is not None:
            login(request, user)
            nextpage = request.GET.get('next','/')
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