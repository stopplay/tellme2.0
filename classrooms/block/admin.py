from django.contrib import admin
from .models import *

# Register your models here.
class ChainAdmin(admin.ModelAdmin):
	list_display = ['name']

admin.site.register(Chain, ChainAdmin)

class BlockAdmin(admin.ModelAdmin):
	list_display = ['hash']

admin.site.register(Block, BlockAdmin)