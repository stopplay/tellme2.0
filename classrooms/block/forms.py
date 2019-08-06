from django.forms import ModelForm
from django import forms
from .models import *

class BlockModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Block
		fields = ['data', 'chain', 'contract']
		widgets = {
			'data' : forms.TextInput(attrs={'class' : 'form-control'}),
			'data' : forms.Textarea(attrs={'style':'resize:none;'})
			# 'school_name': forms.TextInput(attrs={'maxlength':255}),
			# 'enrollment_year': forms.NumberInput(),
		}

class BlockModelFormByContract(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Block
		fields = []