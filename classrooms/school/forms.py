from django.forms import ModelForm
from django import forms
from .models import *

class SchoolModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = School
		fields = ['school_name', 'enrollment_year']
		widgets = {
			'school_name': forms.TextInput(attrs={'maxlength':255}),
			'enrollment_year': forms.NumberInput(),
		}

class ClassModelForm(forms.ModelForm):
	"""docstring for UserModelForm"""
	class Meta:
		model = Class
		fields = ['class_name', 'class_level', 'class_unit']
		widgets = {
			'class_name': forms.TextInput(attrs={'maxlength':255}),
			'class_level': forms.NumberInput(),
		}