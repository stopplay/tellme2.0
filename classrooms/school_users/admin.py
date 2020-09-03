from django.contrib import admin
from .models import *

# Register your models here.
class HeadAdmin(admin.ModelAdmin):
	list_display = ['head_id','name', 'profile']

admin.site.register(Head, HeadAdmin)

class TeacherAdmin(admin.ModelAdmin):
	list_display = ['teacher_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Teacher, TeacherAdmin)

class AdminAdmin(admin.ModelAdmin):
	list_display = ['admin_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Admin, AdminAdmin)

class SupervisorAdmin(admin.ModelAdmin):
	list_display = ['supervisor_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Supervisor, SupervisorAdmin)

class ParentAdmin(admin.ModelAdmin):
	list_display = ['parent_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Parent, ParentAdmin)

class StudentAdmin(admin.ModelAdmin):
	list_display = ['student_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Student, StudentAdmin)

class WitnessAdmin(admin.ModelAdmin):
	list_display = ['witness_id','name', 'profile']
	search_fields = ('name',)

admin.site.register(Witness, WitnessAdmin)