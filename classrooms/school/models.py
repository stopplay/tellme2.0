from django.db import models
from school_users.models import Student, Teacher, Head, Supervisor, Parent
from block.models import *

# Create your models here.
class School(models.Model):
	"""docstring for School"""
	school_id = models.AutoField(primary_key=True)
	school_name = models.TextField(verbose_name = 'Nome da escola')
	classes = models.ManyToManyField('Class')
	chains = models.ManyToManyField(Chain)
	head = models.ForeignKey(Head, on_delete=models.SET_NULL,verbose_name = 'Diretor', null=True, blank=True)
	adminorsupervisor = models.ForeignKey(Supervisor, on_delete=models.SET_NULL, verbose_name = 'Admin/Supervisor', null=True, blank=True)
	sponte_client_number = models.IntegerField(null=True, blank=True, verbose_name = 'SPONTE ID')
	sponte_token = models.TextField(null=True, blank=True, verbose_name = 'SPONTE Token')
	tell_me_school_id = models.TextField(null=True, blank=True, verbose_name = 'TellMe ID')
	country = models.TextField(null=True, blank=True, verbose_name = 'País')
	state = models.TextField(null=True, blank=True, verbose_name = 'Estado')
	city = models.TextField(null=True, blank=True, verbose_name = 'Cidade')
	students = models.ManyToManyField(Student)
	teachers = models.ManyToManyField(Teacher)
	parents = models.ManyToManyField(Parent)
	app_name = models.TextField(null=True, blank=True, verbose_name = 'Nome do App')

class Class(models.Model):
	"""docstring for Class"""
	class_id = models.AutoField(primary_key=True)
	class_name = models.TextField(verbose_name = 'Nome da classe')
	CLASS_UNIT_CHOICES = [('Manhã','Manhã'), ('Tarde','Tarde'), ('Noite','Noite')]
	class_unit = models.CharField(max_length = 500, choices = CLASS_UNIT_CHOICES, default = '1', blank = True, null = True, verbose_name = 'Horário')
	class_level = models.IntegerField(verbose_name = 'Nível da classe')
	enrollment_class_year = models.IntegerField(default=2019, verbose_name= 'Ano da classe')
	students = models.ManyToManyField(Student)
	teachers = models.ManyToManyField(Teacher)
	def __str__(self):
		return self.class_name

	def preliminary_students(self):
		"""Remember to do this as well later, confirm student"""
		pass