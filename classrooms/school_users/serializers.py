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
    profile = UserSerializer(required=False)
    def create(self, validated_data):
       
        parent_data = {}
        profile_data = {}

        if 'profile' in validated_data:
            profile_data = dict(validated_data['profile'])
            del validated_data['profile']
            parent_data = validated_data
            parent_data['profile'] = User.objects.create(**profile_data)
        else:
            parent_data = validated_data

        return Parent.objects.create(**parent_data)

    class Meta:
        model = Parent
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    """docstring for StudentSerializer"""
    profile = UserSerializer(required=False)
    first_parent = ParentSerializer(required=False)
    second_parent = ParentSerializer(required=False)
    
    def create(self, validated_data):
       
        student_data = {}
        profile_data = {}

        if 'profile' in validated_data:
            profile_data = dict(validated_data['profile'])
            del validated_data['profile']
            student_data = validated_data
            student_data['profile'] = User.objects.create(**profile_data)
        else:
            student_data = validated_data

        return Student.objects.create(**student_data)
        
    class Meta:
        model = Student
        fields = '__all__'

class WitnessSerializer(serializers.ModelSerializer):
    """docstring for WitnessSerializer"""
    profile = UserSerializer()
    class Meta:
        model = Witness
        fields = '__all__'