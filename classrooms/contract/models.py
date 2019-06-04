from django.db import models
from school_users.models import *

# Create your models here.
class Contract(models.Model):
	"""docstring for Contract"""
	contract_id = models.AutoField(primary_key=True)
	name = models.TextField()
	date = models.DateField()
	first_auth_signed = models.BooleanField(default=False)
	second_auth_signed = models.BooleanField(default=False)
	counter_signed = models.BooleanField(default=False)
	all_signed = models.BooleanField(default=False)
	pdf = models.FileField()
	first_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='first_responsible')
	second_auth_signe = models.ForeignKey(Parent, on_delete=models.SET_NULL, null=True, blank=True, related_name='second_responsible')
	counter_signe = models.ForeignKey(Supervisor, on_delete=models.SET_NULL, null=True, blank=True, related_name='financial_responsible')
	first_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	second_auth_signed_timestamp = models.DateTimeField(null=True, blank=True)
	counter_signed_timestamp = models.DateTimeField(null=True, blank=True)