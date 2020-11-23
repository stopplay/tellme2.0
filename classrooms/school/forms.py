from django.forms import ModelForm
from django import forms
from .models import *
import datetime
from django.utils import timezone

today = lambda: timezone.now().date()
class SchoolModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'app_name', 'quantity_of_directors']
		widgets = {
			'school_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'enrollment_year': forms.NumberInput(),
			'sponte_client_number': forms.NumberInput(attrs={'class':'form-control', 'required':False ,'min':0}),
			'sponte_token': forms.TextInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'tell_me_school_id': forms.NumberInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'country': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'state': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'city': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'app_name': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'quantity_of_directors': forms.NumberInput(attrs={'class':'form-control', 'required':True ,'min':1}),
		}

class SchoolModelFormWithSupervisor(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'app_name', 'adminorsupervisor', 'adminorsupervisor_2']
		widgets = {
			'school_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'enrollment_year': forms.NumberInput(),
			'sponte_client_number': forms.NumberInput(attrs={'class':'form-control', 'required':False ,'min':0}),
			'sponte_token': forms.TextInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'tell_me_school_id': forms.NumberInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'country': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'state': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'city': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'app_name': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'adminorsupervisor': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
			'adminorsupervisor_2': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
		}

class SchoolModelFormWithSupervisorAndDirector(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'app_name', 'adminorsupervisor', 'adminorsupervisor_2', 'first_witness', 'second_witness', 'heads', 'students', 'value_per_contract']
		widgets = {
			'school_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'enrollment_year': forms.NumberInput(),
			'sponte_client_number': forms.NumberInput(attrs={'class':'form-control', 'required':False ,'min':0}),
			'sponte_token': forms.TextInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'tell_me_school_id': forms.NumberInput(attrs={'class':'form-control', 'required':False, 'min':0}),
			'country': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'state': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'city': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'app_name': forms.TextInput(attrs={'class':'form-control', 'required':False}),
			'adminorsupervisor': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
			'adminorsupervisor_2': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
			'first_witness': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
			'second_witness': forms.Select(attrs={'class':'form-control chosen-select', 'required':False}),
			'heads': forms.SelectMultiple(attrs={'class':'form-control chosen-select', 'required':False}),
			'students': forms.SelectMultiple(attrs={'class':'form-control chosen-select', 'required':False}),
			'value_per_contract': forms.NumberInput(attrs={'class':'form-control', 'required':False, 'min':0}),
		}

class SetWitnessModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = School
		fields = ['first_witness','second_witness']
		widgets = {
			'first_witness': forms.Select(attrs={'class':'form-control chosen-select'}),
			'second_witness': forms.Select(attrs={'class':'form-control chosen-select'}),
		}

class ClassModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Class
		fields = ['class_name', 'class_unit', 'enrollment_class_year', 'slm', 'sku', 'students']
		widgets = {
			'class_name': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':True}),
			'class_unit': forms.Select(attrs={'class':'form-control', 'required':True}),
			'enrollment_class_year': forms.NumberInput(attrs={'required':True, 'min':today().year, 'default': today().year}),
			'slm': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':False}),
			'sku': forms.TextInput(attrs={'class':'form-control', 'maxlength':255, 'required':False}),
			'students': forms.SelectMultiple(attrs={'class':'form-control chosen-select'}),
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
		