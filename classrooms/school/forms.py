from django.forms import ModelForm
from django import forms
from .models import *
import datetime

class SchoolModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'app_name']
		widgets = {
			'school_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'enrollment_year': forms.NumberInput(),
			'sponte_client_number': forms.NumberInput(attrs={'class':'form-control', 'required':False ,'min':0}),
			'sponte_token': forms.TextInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'tell_me_school_id': forms.TextInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'country': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'state': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'city': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'app_name': forms.TextInput(attrs={'class':'form-control', 'required':False}),
		}

class ClassModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Class
		fields = ['class_name', 'class_unit', 'enrollment_class_year', 'slm', 'sku']
		widgets = {
			'class_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'class_unit': forms.Select(attrs={'class':'form-control', 'required':True}),
			'enrollment_class_year': forms.NumberInput(attrs={'required':True, 'min':datetime.date.today().year}),
			'slm': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':False}),
			'sku': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':False}),
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
		