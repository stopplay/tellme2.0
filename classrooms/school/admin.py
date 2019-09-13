from django.contrib import admin
from .models import *

# Register your models here.
class SchoolAdmin(admin.ModelAdmin):
	list_display = ['school_id','school_name', 'get_classes', 'get_chains', 'sponte_client_number', 'country', 'state', 'city']

	def get_chains(self, obj):
		return "\n".join([chain.name for chain in obj.chains.all()])

	def get_classes(self, obj):
		return "\n".join([classe.class_name for classe in obj.classes.all()])

admin.site.register(School, SchoolAdmin)