from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'groups', 'is_superuser', 'password')

class HeadSerializer(serializers.ModelSerializer):
    profile = UserSerializer()
    class Meta:
        model = Head
        fields = '__all__'

class TeacherSerializer(serializers.ModelSerializer):
    """docstring for TeacherSerializer"""
    profile = UserSerializer()
    class Meta:
        model = Teacher
        fields = '__all__'

class AdminSerializer(serializers.ModelSerializer):
    """docstring for AdminSerializer"""
    profile = UserSerializer()
    class Meta:
        model = Admin
        fields = '__all__'

class SupervisorSerializer(serializers.ModelSerializer):
    """docstring for SupervisorSerializer"""
    profile = UserSerializer()
    class Meta:
        model = Supervisor
        fields = '__all__'

class ParentSerializer(serializers.ModelSerializer):
    """docstring for ParentSerializer"""
    profile = UserSerializer()
    class Meta:
        model = Parent
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    """docstring for StudentSerializer"""
    profile = UserSerializer(read_only=True)
    father = serializers.StringRelatedField()
    mother = serializers.StringRelatedField()
    class Meta:
        model = Student
        fields = '__all__'
        read_only = True