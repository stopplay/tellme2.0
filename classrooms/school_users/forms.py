from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from .models import *
from django.contrib.auth.forms import UserCreationForm
import datetime

class UserModelForm(UserCreationForm, forms.ModelForm):
	"""docstring for UserModelForm"""
	email = forms.EmailField(required=True)
	class Meta:
		model = User
		fields = ('first_name', 'last_name', 'email', 'password1', 'password2')
		def save(self, commit=True):
			user = super(UserModelForm, self).save(commit=False)
			user.username = self.cleaned_data['username'].lower()
			user.first_name = self.cleaned_data['first_name']
			user.last_name = self.cleaned_data['last_name']
			user.email = self.cleaned_data['email'].lower()

			if commit:
				user.save()

			return user

class HeadModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Head
		fields = []

class TeacherModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Teacher
		fields = []

class AdminModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Admin
		fields = []

class SupervisorModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Supervisor
		fields = []

class ParentModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Parent
		fields = ['maple_bear_username', 'maple_bear_password', 'maple_bear_email']
		widgets = {
			'maple_bear_username': forms.TextInput(attrs={'class':'labelandform', 'required':True, 'maxlength':255}),
			'maple_bear_password': forms.TextInput(attrs={'type':'password','class':'labelandform', 'required':True, 'maxlength':255}),
			'maple_bear_email': forms.TextInput(attrs={'class':'labelandform', 'required':True, 'maxlength':255}),
		}

class StudentModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Student
		fields = ['birthday']
		widgets = {
			'birthday': forms.DateInput(attrs={'type':'date', 'class':'labelandform', 'required':True, 'style':"width:100%", 'max':datetime.date.today()-datetime.timedelta(days=1)}),
		}

class SetParentsModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Student
		fields = ['first_parent','second_parent']
		widgets = {
			'first_parent': forms.Select(attrs={'class':'custom-select'}),
			'second_parent': forms.Select(attrs={'class':'custom-select'}),
		}