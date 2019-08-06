from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Admin(models.Model):
	"""dosctring for Manager"""
	admin_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750)
	profile = models.ForeignKey(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)

class Authorised_Signe(models.Model):
	"""docstring for Authorised_Signe"""
	authorised_signed_id = models.AutoField(primary_key = True)
	name = models.CharField(max_length = 750)
	profile = models.ForeignKey(User, on_delete = models.SET_NULL, null=True, blank=True)

	def __str__(self):
		return '{}'.format(self.name)