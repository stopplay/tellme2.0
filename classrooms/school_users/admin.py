from django.contrib import admin
from .models import *

# Register your models here.
class UserAdmin(admin.ModelAdmin):
	list_display = ['id', 'username']

admin.site.register(User, UserAdmin)

class HeadAdmin(admin.ModelAdmin):
	list_display = ['head_id','name', 'profile']

admin.site.register(Head, HeadAdmin)

class TeacherAdmin(admin.ModelAdmin):
	list_display = ['teacher_id','name', 'profile']

admin.site.register(Teacher, TeacherAdmin)

class AdminAdmin(admin.ModelAdmin):
	list_display = ['admin_id','name', 'profile']

admin.site.register(Admin, AdminAdmin)

class SupervisorAdmin(admin.ModelAdmin):
	list_display = ['supervisor_id','name', 'profile']

admin.site.register(Supervisor, SupervisorAdmin)

class ParentAdmin(admin.ModelAdmin):
	list_display = ['parent_id','name', 'profile']

admin.site.register(Parent, ParentAdmin)

class StudentAdmin(admin.ModelAdmin):
	list_display = ['student_id','name', 'profile']

admin.site.register(Student, StudentAdmin)

class WitnessAdmin(admin.ModelAdmin):
	list_display = ['witness_id','name', 'profile']

admin.site.register(Witness, WitnessAdmin)