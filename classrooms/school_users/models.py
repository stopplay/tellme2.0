from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Head(models.Model):
	"""dosctring for Head"""
	head_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	tell_me_user_id = models.IntegerField(null=True, blank=True)

	@property
	def origin(self):
		return 'Adicionado Manualmente'

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
	tell_me_user_id = models.IntegerField(null=True, blank=True)

	@property
	def origin(self):
		return 'Adicionado Manualmente'

	def __str__(self):
		return '{}'.format(self.name)

class Admin(models.Model):
	"""docstring for Admin"""
	admin_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	tell_me_user_id = models.IntegerField(null=True, blank=True)

	@property
	def origin(self):
		return 'Adicionado Manualmente'

	def __str__(self):
		return '{}'.format(self.name)

class Supervisor(models.Model):
	"""docstring for Supervisor"""
	supervisor_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	tell_me_user_id = models.IntegerField(null=True, blank=True)
	
	@property
	def origin(self):
		return 'Adicionado Manualmente'

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
	tell_me_user_id = models.IntegerField(null=True, blank=True, verbose_name= 'ID assinante Tellme')
	maple_bear_user_id = models.TextField(null=True, blank=True)
	maple_bear_username = models.TextField(null=True, blank=True, verbose_name='Nome de Usuário Maple Bear')
	maple_bear_password = models.TextField(null=True, blank=True, verbose_name='Senha Maple Bear')
	maple_bear_email = models.TextField(null=True, blank=True, verbose_name='Email Maple Bear')

	@property
	def origin(self):
		if self.responsible_id_sponte:
			return 'Importado do Sponte'
		return 'Adicionado Manualmente'
	

	@property
	def school_name(self):
		if self.first_parent.all().first() is not None:
			return self.first_parent.all().first().school_name
		elif self.second_parent.all().first() is not None:
			return self.second_parent.all().first().school_name
		elif self.third_parent.all().first() is not None:
			return self.third_parent.all().first().school_name
		return self.profile.username.split('-')[0]

	def __str__(self):
		if self.profile:
			return '{}-{}'.format(self.profile.username.split('-')[0],self.name)
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
	operation_return_message_sponte = models.TextField(null=True, blank=True)
	responsibles_sponte = models.TextField(null=True, blank=True)
	address_sponte = models.TextField(null=True, blank=True)
	address_number_sponte = models.TextField(null=True, blank=True)
	register_date_sponte = models.TextField(null=True, blank=True)
	RA_sponte = models.TextField(null=True, blank=True)
	note_sponte = models.TextField(null=True, blank=True)
	telephone_sponte = models.TextField(null=True, blank=True)
	cell_phone_sponte = models.TextField(null=True, blank=True)
	current_class_id = models.TextField(null=True, blank=True)
	financial_responsible_id_sponte = models.IntegerField(null=True, blank=True, verbose_name='ID parent 1 Tellme')
	didatic_responsible_id_sponte = models.IntegerField(null=True, blank=True, verbose_name='ID parent 2 Tellme')
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
	first_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='first_parent', verbose_name='Responsável Financeiro')
	second_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='second_parent', verbose_name='Responsável Pedagógico')
	third_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='third_parent', verbose_name='Segundo Responsável Pedagógico (Opcional)')
	tell_me_user_id = models.IntegerField(null=True, blank=True, verbose_name= 'ID aluno Tellme')
	birthday = models.DateField(null=True, blank=True, verbose_name = 'Data de Nascimento')
	needs_parent = models.BooleanField(default=True)
	maple_bear_user_id = models.TextField(null=True, blank=True)
	maple_bear_username = models.TextField(null=True, blank=True, verbose_name='Nome de Usuário Maple Bear')
	maple_bear_password = models.TextField(null=True, blank=True, verbose_name='Senha Maple Bear')
	maple_bear_email = models.TextField(null=True, blank=True, verbose_name='Email Maple Bear')

	@property
	def origin(self):
		if self.student_id_sponte:
			return 'Importado do Sponte'
		return 'Adicionado Manualmente'

	@property
	def school_name(self):
		if self.school_set.all().first() is not None:
			return self.school_set.all().first().school_name
		return self.profile.username.split('-')[0]
	

	def __str__(self):
		if self.profile:
			return '{}-{}'.format(self.profile.username.split('-')[0],self.name)
		return self.name

class Witness(models.Model):
	"""docstring for Witness"""
	witness_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	rg = models.TextField(null=True, blank=True)
	cpf = models.TextField(null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	tell_me_user_id = models.IntegerField(null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)