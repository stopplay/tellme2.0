from django.forms import ModelForm
from django import forms
from .models import *

class ContractModelFormWithSponte(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Contract
		fields = ['chain', 'date', 'end', 'expiration', 'pdf', 'terms_of_contract', 'terms_of_contract_2', 'contract_free_class_id_sponte', 'situation_id_sponte', 'situation_sponte', 'student_name_sponte', 'student_id_sponte', 'course_id_sponte', 'class_id_sponte', 'class_name_sponte', 'course_name_sponte', 'contract_type_id', 'initial_date_sponte', 'end_date_sponte', 'date_of_registration_sponte', 'type_of_registration_sponte', 'contractor_sponte', 'name_of_curricular_matrix_sponte', 'financial_launched_sponte', 'contract_number_sponte', 'closing_date_sponte']
		widgets = {
			'date': forms.DateInput(attrs={'type':'date', 'class':'labelandform', 'required':True, 'style':"width:120%"}),
			'end': forms.DateInput(attrs={'type':'date', 'class':'labelandform', 'required':True, 'style':"width:120%"}),
			'expiration': forms.DateInput(attrs={'type':'date', 'class':'labelandform', 'required':True, 'style':"width:120%"}),
			'chain': forms.Select(attrs={'class':'chosen-select', 'required':True}),
			'pdf': forms.FileInput(attrs={'required':True}),
			'terms_of_contract': forms.FileInput(attrs={'required':False}),
			'terms_of_contract_2': forms.FileInput(attrs={'required':False}),
			'contract_free_class_id_sponte': forms.NumberInput(attrs={'required':True}),
			'situation_id_sponte': forms.NumberInput(attrs={'required':True}),
			'situation_sponte': forms.TextInput(attrs={'required':True}),
			'student_name_sponte': forms.TextInput(attrs={'required':True}),
			'student_id_sponte': forms.NumberInput(attrs={'required':True}),
			'course_name_sponte': forms.TextInput(attrs={'required':True}),
			'course_id_sponte': forms.NumberInput(attrs={'required':True}),
			'class_name_sponte': forms.TextInput(attrs={'required':True}),
			'class_id_sponte': forms.NumberInput(attrs={'required':True}),
			'contract_type_id': forms.NumberInput(attrs={'required':True}),
			'initial_date_sponte': forms.TextInput(attrs={'required':True}),
			'end_date_sponte': forms.TextInput(attrs={'required':True}),
			'date_of_registration_sponte': forms.TextInput(attrs={'required':True}),
			'type_of_registration_sponte': forms.TextInput(attrs={'required':True}),
			'contractor_sponte': forms.TextInput(attrs={'required':True}),
			'name_of_curricular_matrix_sponte': forms.TextInput(attrs={'required':True}),
			'financial_launched_sponte': forms.TextInput(attrs={'required':True}),
			'contract_number_sponte': forms.TextInput(attrs={'required':True}),
			'closing_date_sponte': forms.TextInput(attrs={'required':True}),
		}

class ContractModelFormWithoutSponte(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Contract
		fields = ['chain', 'date', 'end', 'expiration', 'pdf', 'terms_of_contract', 'terms_of_contract_2']
		widgets = {
			'date': forms.DateInput(attrs={'type':'date', 'class':'form-control', 'required':True, 'style' : "width: 100%" }),
			'end': forms.DateInput(attrs={'type':'date', 'class':'form-control', 'required':True, 'style':"width:100%"}),
			'expiration': forms.DateInput(attrs={'type':'date', 'class':'form-control', 'required':True, 'style':"width:100%"}),
			'chain': forms.Select(attrs={'class':'form-control', 'style' : "width: 100%", 'required':True}),
			'pdf': forms.FileInput(attrs={'required':True, 'style' : "width: 100%", 'class':'form-control'}),
			'terms_of_contract': forms.FileInput(attrs={'required':False, 'style' : "width: 100%", 'class':'form-control'}),
			'terms_of_contract_2': forms.FileInput(attrs={'required':False, 'style' : "width: 100%", 'class':'form-control'}),
		}