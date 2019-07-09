from django.forms import ModelForm
from django import forms
from .models import *

class ContractModelFormWithSponte(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Contract
		fields = ['name', 'date', 'pdf', 'terms_of_contract', 'chain', 'slm', 'contract_free_class_id_sponte', 'situation_id_sponte', 'situation_sponte', 'student_name_sponte', 'student_id_sponte', 'course_id_sponte', 'class_id_sponte', 'class_name_sponte', 'course_name_sponte', 'contract_type_id', 'initial_date_sponte', 'end_date_sponte', 'date_of_registration_sponte', 'type_of_registration_sponte', 'contractor_sponte', 'name_of_curricular_matrix_sponte', 'financial_launched_sponte', 'contract_number_sponte', 'closing_date_sponte']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255, 'class':'labelandform'}),
			'date': forms.DateInput(attrs={'type':'date', 'class':'labelandform'}),
			'chain': forms.Select(attrs={'class':'chosen-select'}),
			'terms_of_contract': forms.FileInput(attrs={'required':False}),
			'slm': forms.TextInput(attrs={'required':False}),
		}

class ContractModelFormWithoutSponte(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Contract
		fields = ['name', 'date', 'pdf', 'terms_of_contract', 'chain', 'slm']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255, 'class':'labelandform'}),
			'date': forms.DateInput(attrs={'type':'date', 'class':'labelandform'}),
			'chain': forms.Select(attrs={'class':'chosen-select'}),
			'terms_of_contract': forms.FileInput(attrs={'required':False}),
			'slm': forms.TextInput(attrs={'required':False}),
		}