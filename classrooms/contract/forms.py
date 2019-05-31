from django.forms import ModelForm
from django import forms
from .models import *

class ContractModelForm(forms.ModelForm):
	"""docstring for ManagerModelForm"""
	class Meta:
		model = Contract
		fields = ['name', 'date', 'pdf', 'first_auth_signe', 'second_auth_signe', 'counter_signe']
		widgets = {
			'name': forms.TextInput(attrs={'maxlength':255, 'class':'labelandform'}),
			'date': forms.DateInput(attrs={'type':'date', 'class':'labelandform'})
		}
