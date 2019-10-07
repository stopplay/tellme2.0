from rest_framework import serializers
from .models import *
from school_users.serializers import *
from block.serializers import *

class ClassSerializer(serializers.ModelSerializer):
    students = StudentSerializer(read_only=True, many=True)
    teachers = TeacherSerializer(read_only=True, many=True)
    class Meta:
        model = Class
        fields = '__all__'

class SchoolSerializer(serializers.ModelSerializer):
	"""docstring for SchoolSerializer"""
	classes = ClassSerializer(read_only=True, many=True)
	chains = ChainSerializer(read_only=True, many=True)
	heads = HeadSerializer(read_only=True, many=True)
	adminorsupervisor = SupervisorSerializer()
	students = StudentSerializer(read_only=True, many=True)
	teachers = TeacherSerializer(read_only=True, many=True)
	first_witness = WitnessSerializer()
	second_witness = WitnessSerializer()
	class Meta:
		model = School
		fields = '__all__'

class MinimalSchoolSerializer(serializers.ModelSerializer):
	"""docstring for SchoolSerializer"""
	chains = ChainSerializer(read_only=True, many=True)
	class Meta:
		model = School
		fields = ['school_id', 'school_name', 'classes', 'chains', 'heads', 'adminorsupervisor', 'sponte_client_number', 'sponte_token', 'tell_me_school_id', 'country', 'state', 'city', 'quantity_of_directors', 'students', 'teachers', 'parents', 'first_witness', 'second_witness', 'app_name', 'is_maple_bear', 'quantity_of_contracts_signed', 'quantity_of_contracts_total', 'quantity_of_contracts_not_signed']