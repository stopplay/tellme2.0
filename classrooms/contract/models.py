from django.db import models
from school_users.models import *

# Create your models here.
class Contract(models.Model):
	"""docstring for Contract"""
	# Data from Sponte #
	contract_id_sponte = models.IntegerField(null=True, blank=True)
	contract_free_class_id_sponte = models.IntegerField(null=True, blank=True, verbose_name = 'Id do Contrato de Aula Livre Sponte')
	situation_id_sponte = models.IntegerField(null=True, blank=True, verbose_name = 'Id da Situação Sponte')
	situation_sponte = models.TextField(null=True, blank=True, verbose_name = 'Situação Sponte')
	student_name_sponte = models.TextField(null=True, blank=True, verbose_name = 'Nome do Estudante Sponte')
	student_id_sponte = models.IntegerField(null=True, blank=True, verbose_name = 'Id do Estudante Sponte')
	course_id_sponte = models.TextField(null=True, blank=True, verbose_name = 'Id do Curso Sponte')
	class_id_sponte = models.IntegerField(null=True, blank=True, verbose_name = 'Id da Aula Sponte')
	class_name_sponte = models.TextField(null=True, blank=True, verbose_name = 'Nome da Aula Sponte')
	course_name_sponte = models.TextField(null=True, blank=True, verbose_name = 'Nome do Curso Sponte')
	contract_type_id = models.IntegerField(null=True, blank=True, verbose_name = 'Id do Tipo de Contrato Sponte')
	initial_date_sponte = models.TextField(null=True, blank=True, verbose_name = 'Data Inicial do Contrato Sponte')
	end_date_sponte = models.TextField(null=True, blank=True, verbose_name = 'Data Final do Contrato Sponte')
	date_of_registration_sponte = models.TextField(null=True, blank=True, verbose_name = 'Data de Registro Sponte')
	type_of_registration_sponte = models.IntegerField(null=True, blank=True, verbose_name = 'Tipo de Registro Sponte')
	contractor_sponte = models.TextField(null=True, blank=True, verbose_name = 'Contratante Sponte')
	name_of_curricular_matrix_sponte = models.TextField(null=True, blank=True, verbose_name = 'Nome da Matriz Curricular Sponte')
	financial_launched_sponte = models.TextField(null=True, blank=True, verbose_name = 'Financeiro Lançado Sponte')
	contract_number_sponte = models.TextField(null=True, blank=True, verbose_name = 'Número do Contrato Sponte')
	closing_date_sponte = models.TextField(null=True, blank=True, verbose_name = 'Data de Fechamento Sponte')
	# end of Data from Sponte #
	# Basic data of the contract #
	contract_id = models.AutoField(primary_key=True)
	name = models.TextField(null=True, blank=True, verbose_name = 'Nome do Contrato')
	date = models.DateField(null=True, blank=True, verbose_name = 'Data do Contrato')
	first_auth_signed = models.BooleanField(default=False)
	second_auth_signed = models.BooleanField(default=False)
	counter_signed = models.BooleanField(default=False)
	all_signed = models.BooleanField(default=False)
	pdf = models.FileField(null=True, blank=True, verbose_name = 'Contrato')
	terms_of_contract = models.FileField(null=True, blank=True, verbose_name = 'Termos Aditivos do Contrato')
	terms_of_contract_2 = models.FileField(null=True, blank=True, verbose_name = 'Termos Aditivos do Contrato')
	first_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='first_responsible', default=None)
	second_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='second_responsible', default=None)
	counter_signe = models.ForeignKey(Head, on_delete=models.SET_NULL, null=True, blank=True, related_name='financial_responsible', default=None)
	first_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	second_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	counter_signed_timestamp = models.DateTimeField(null=True, blank=True)
	first_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	second_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	counter_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	slm = models.TextField(null=True, blank=True)
	chain = models.ForeignKey('block.Chain', on_delete=models.SET_NULL, null=True, blank=True, verbose_name = 'Cadeia da Turma')
	email_sent = models.BooleanField(default=False)
	sent_date = models.DateTimeField(blank=True, null=True)
	student_name = models.TextField(null=True, blank=True)
	# end of Basic data of the contract #
