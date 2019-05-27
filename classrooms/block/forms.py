from django.forms import ModelForm
from django import forms
from .models import *

class BlockModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Block
		fields = ['data', 'chain', 'contract']
		widgets = {
			# 'school_name': forms.TextInput(attrs={'maxlength':255}),
			# 'enrollment_year': forms.NumberInput(),
		}