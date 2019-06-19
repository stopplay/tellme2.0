from django.db import models
from school_users.models import Student, Teacher, Head
from block.models import *

# Create your models here.
class School(models.Model):
	"""docstring for School"""
	school_id = models.AutoField(primary_key=True)
	school_name = models.TextField()
	enrollment_year = models.IntegerField()
	classes = models.ManyToManyField('Class')
	chains = models.ManyToManyField(Chain)
	head = models.ForeignKey(Head, on_delete=models.SET_NULL, null=True, blank=True)

class Class(models.Model):
	"""docstring for Class"""
	class_id = models.AutoField(primary_key=True)
	class_name = models.TextField()
	CLASS_UNIT_CHOICES = [('Morning','Morning'), ('Afternoon','Afternoon'), ('Evening','Evening')]
	class_unit = models.CharField(max_length = 500, choices = CLASS_UNIT_CHOICES, default = '1', blank = True, null = True)
	class_level = models.IntegerField()
	students = models.ManyToManyField(Student)
	teachers = models.ManyToManyField(Teacher)
	def __str__(self):
		return self.class_name

	def preliminary_students(self):
		"""Remember to do this as well later, confirm student"""
		pass