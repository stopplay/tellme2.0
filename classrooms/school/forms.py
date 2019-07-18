from django.forms import ModelForm
from django import forms
from .models import *

class SchoolModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'app_name']
		widgets = {
			'school_name': forms.TextInput(attrs={'maxlength':255}),
			'enrollment_year': forms.NumberInput(),
			'sponte_client_number': forms.NumberInput(attrs={'required':False}),
			'sponte_token': forms.TextInput(attrs={'required':False}),
			'tell_me_school_id': forms.TextInput(attrs={'required':False}),
			'country': forms.TextInput(attrs={'required':False}),
			'state': forms.TextInput(attrs={'required':False}),
			'city': forms.TextInput(attrs={'required':False}),
			'app_name': forms.TextInput(attrs={'required':False}),
		}

class ClassModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Class
		fields = ['class_name', 'class_unit', 'enrollment_class_year', 'slm']
		widgets = {
			'class_name': forms.TextInput(attrs={'maxlength':255, 'required':True}),
			'class_unit': forms.Select(attrs={'required':True}),
			'enrollment_year': forms.NumberInput(attrs={'required':True}),
			'slm': forms.TextInput(attrs={'required':False}),
		}

class ClassAddTeachersModelForm(forms.ModelForm):
	"""docstring for ClassAddTeachersModelForm"""
	class Meta:
		model = Class
		fields = ['teachers']

class ClassAddStudentsModelForm(forms.ModelForm):
	"""docstring for ClassAddTeachersModelForm"""
	class Meta:
		model = Class
		fields = ['students']
		