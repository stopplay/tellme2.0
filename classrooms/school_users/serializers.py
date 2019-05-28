from rest_framework import serializers
from .models import *

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'groups', 'is_superuser')

class HeadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Head
        fields = '__all__'

class TeacherSerializer(serializers.ModelSerializer):
    """docstring for TeacherSerializer"""
    class Meta:
        model = Teacher
        fields = '__all__'

class AdminSerializer(serializers.ModelSerializer):
    """docstring for AdminSerializer"""
    class Meta:
        model = Admin
        fields = '__all__'

class SupervisorSerializer(serializers.ModelSerializer):
    """docstring for SupervisorSerializer"""
    class Meta:
        model = Supervisor
        fields = '__all__'

class ParentSerializer(serializers.ModelSerializer):
    """docstring for ParentSerializer"""
    class Meta:
        model = Parent
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    """docstring for StudentSerializer"""
    father = ParentSerializer()
    mother = ParentSerializer()
    class Meta:
        model = Student
        fields = '__all__'