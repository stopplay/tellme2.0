from django.contrib import admin
from .models import *

# Register your models here.
class ContractAdmin(admin.ModelAdmin):
	list_display = ['contract_id']

admin.site.register(Contract, ContractAdmin)