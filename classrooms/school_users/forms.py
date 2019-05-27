from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from .models import *
from django.contrib.auth.forms import UserCreationForm

class UserModelForm(UserCreationForm, forms.ModelForm):
	"""docstring for UserModelForm"""
	email = forms.EmailField(required=True)
	class Meta:
		model = User
		fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2')
		def save(self, commit=True):
			user = super(UserModelForm, self).save(commit=False)
			user.first_name = self.cleaned_data['first_name']
			user.last_name = self.cleaned_data['last_name']
			user.email = self.cleaned_data['email']

			if commit:
				user.save()

			return user

class HeadModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Head
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class TeacherModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Teacher
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class AdminModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Admin
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class SupervisorModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Supervisor
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class ParentModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Parent
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class StudentModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Student
		fields = ['name']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255}),
		}

class SetParentsModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Student
		fields = ['father','mother']
		# widgets = {
		# 	'name': forms.TextInput(attrs={'maxlength':255}),
		# }