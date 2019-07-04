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
	head = HeadSerializer()
	adminorsupervisor = SupervisorSerializer()
	class Meta:
		model = School
		fields = '__all__'