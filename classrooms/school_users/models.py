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
	name = models.CharField(max_length = 750, null=True, blank=True)
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
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	authorised = models.BooleanField(default=False)
	relationship = models.TextField(null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Student(models.Model):
	"""docstring for Student"""
	student_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750, null=True, blank=True)
	profile = models.OneToOneField(User, on_delete = models.SET_NULL, null=True, blank=True)
	first_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='first_parent')
	second_parent = models.ForeignKey('Parent', on_delete = models.SET_NULL, null=True, blank=True, related_name='second_parent')

	def __str__(self):
		return '{}'.format(self.name)