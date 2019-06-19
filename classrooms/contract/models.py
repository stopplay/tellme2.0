from django.db import models
from school_users.models import *

# Create your models here.
class Contract(models.Model):
	"""docstring for Contract"""
	# Data from Sponte #
	contract_id_sponte = models.IntegerField(null=True, blank=True)
	contract_free_class_id_sponte = models.IntegerField(null=True, blank=True)
	situation_id_sponte = models.IntegerField(null=True, blank=True)
	situation_sponte = models.TextField(null=True, blank=True)
	student_name_sponte = models.TextField(null=True, blank=True)
	student_id_sponte = models.IntegerField(null=True, blank=True)
	course_id_sponte = models.TextField(null=True, blank=True)
	class_id_sponte = models.IntegerField(null=True, blank=True)
	class_name_sponte = models.TextField(null=True, blank=True)
	course_name_sponte = models.TextField(null=True, blank=True)
	contract_type_id = models.IntegerField(null=True, blank=True)
	initial_date_sponte = models.TextField(null=True, blank=True)
	end_date_sponte = models.TextField(null=True, blank=True)
	date_of_registration_sponte = models.TextField(null=True, blank=True)
	type_of_registration_sponte = models.IntegerField(null=True, blank=True)
	contractor_sponte = models.TextField(null=True, blank=True)
	name_of_curricular_matrix_sponte = models.TextField(null=True, blank=True)
	financial_launched_sponte = models.TextField(null=True, blank=True)
	contract_number_sponte = models.TextField(null=True, blank=True)
	closing_date_sponte = models.TextField(null=True, blank=True)
	# end of Data from Sponte #
	# Basic data of the contract #
	contract_id = models.AutoField(primary_key=True)
	name = models.TextField(null=True, blank=True)
	date = models.DateField(null=True, blank=True)
	first_auth_signed = models.BooleanField(default=False)
	second_auth_signed = models.BooleanField(default=False)
	counter_signed = models.BooleanField(default=False)
	all_signed = models.BooleanField(default=False)
	pdf = models.FileField(null=True, blank=True)
	first_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='first_responsible', default=None)
	second_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='second_responsible', default=None)
	counter_signe = models.ForeignKey(Supervisor, on_delete=models.SET_NULL, null=True, blank=True, related_name='financial_responsible', default=None)
	first_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	second_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	counter_signed_timestamp = models.DateTimeField(null=True, blank=True)
	first_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	second_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	counter_auth_hash = models.CharField(max_length=255, null=True, blank=True)
	chain = models.ForeignKey('block.Chain', on_delete=models.SET_NULL, null=True, blank=True)
	# end of Basic data of the contract #
