from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Head(models.Model):
	"""dosctring for Head"""
	head_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Teacher(models.Model):
	"""docstring for Teacher"""
	teacher_id = models.AutoField(primary_key = True)
	employee_id_sponte = models.IntegerField(null=True, blank=True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	cpf_sponte = models.TextField(null=True, blank=True)
	rg_sponte = models.TextField(null=True, blank=True)
	bithday_sponte = models.TextField(null=True, blank=True)
	cep_sponte = models.TextField(null=True, blank=True)
	address_sponte = models.TextField(null=True, blank=True)
	address_number_sponte = models.TextField(null=True, blank=True)
	note_sponte = models.TextField(null=True, blank=True)
	telephone_sponte = models.TextField(null=True, blank=True)
	cell_phone_sponte = models.TextField(null=True, blank=True)
	registration_number_spontet = models.TextField(null=True, blank=True)
	gender_sponte = models.TextField(null=True, blank=True)
	city_sponte = models.TextField(null=True, blank=True)
	hometown_sponte = models.TextField(null=True, blank=True)
	neighborhood_sponte = models.TextField(null=True, blank=True)
	job_role_sponte = models.TextField(null=True, blank=True)
	situation_sponte = models.TextField(null=True, blank=True)
	admission_date_sponte = models.TextField(null=True, blank=True)
	resignation_date_sponte = models.TextField(null=True, blank=True)
	work_register_booklet = models.TextField(null=True, blank=True)
	pis_sponte = models.TextField(null=True, blank=True)
	maritial_status_sponte = models.TextField(null=True, blank=True)
	add_on_address_sponte = models.TextField(null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Admin(models.Model):
	"""docstring for Admin"""
	admin_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Supervisor(models.Model):
	"""docstring for Supervisor"""
	supervisor_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Parent(models.Model):
	"""docstring for Parent"""
	parent_id = models.AutoField(primary_key = True)
	responsible_id_sponte = models.IntegerField(null=True, blank=True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	cpf_or_cnpj_sponte = models.TextField(null=True, blank=True)
	rg_sponte = models.TextField(null=True, blank=True)
	bithday_sponte = models.TextField(null=True, blank=True)
	cep_sponte = models.TextField(null=True, blank=True)
	address_sponte = models.TextField(null=True, blank=True)
	address_number_sponte = models.TextField(null=True, blank=True)
	note_sponte = models.TextField(null=True, blank=True)
	telephone_sponte = models.TextField(null=True, blank=True)
	cell_phone_sponte = models.TextField(null=True, blank=True)
	gender_sponte = models.TextField(null=True, blank=True)
	city_sponte = models.TextField(null=True, blank=True)
	neighborhood_sponte = models.TextField(null=True, blank=True)
	kind_of_person = models.TextField(null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	authorised = models.BooleanField(default=False)
	relationship = models.TextField(null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Student(models.Model):
	"""docstring for Student"""
	student_id = models.AutoField(primary_key = True)
	student_id_sponte = models.IntegerField(null=True, blank=True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	cpf_sponte = models.TextField(null=True, blank=True)
	rg_sponte = models.TextField(null=True, blank=True)
	midia_sponte = models.TextField(null=True, blank=True)
	bithday_sponte = models.TextField(null=True, blank=True)
	cep_sponte = models.TextField(null=True, blank=True)
	address_sponte = models.TextField(null=True, blank=True)
	address_number_sponte = models.TextField(null=True, blank=True)
	register_date_sponte = models.TextField(null=True, blank=True)
	RA_sponte = models.TextField(null=True, blank=True)
	note_sponte = models.TextField(null=True, blank=True)
	telephone_sponte = models.TextField(null=True, blank=True)
	cell_phone_sponte = models.TextField(null=True, blank=True)
	current_class_id = models.TextField(null=True, blank=True)
	financial_responsible_id_sponte = models.IntegerField(null=True, blank=True)
	didatic_responsible_id_sponte = models.IntegerField(null=True, blank=True)
	registration_number_sponte = models.TextField(null=True, blank=True)
	gender_sponte = models.TextField(null=True, blank=True)
	situation_sponte = models.TextField(null=True, blank=True)
	city_sponte = models.TextField(null=True, blank=True)
	neighborhood_sponte = models.TextField(null=True, blank=True)
	hometown_sponte = models.TextField(null=True, blank=True)
	overdue_sponte = models.TextField(null=True, blank=True)
	origin_sponte = models.TextField(null=True, blank=True)
	original_name_sponte = models.TextField(null=True, blank=True)
	course_of_interest_sponte = models.TextField(null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	first_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='first_parent')
	second_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='second_parent')

	def __str__(self):
		return '{}'.format(self.name)