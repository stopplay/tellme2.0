from rest_framework import serializers
from .models import *
from school_users.serializers import *
from block.serializers import *

class ContractSerializer(serializers.ModelSerializer):
    first_auth_signe = ParentSerializer(required=False)
    second_auth_signe = ParentSerializer(required=False)
    third_auth_signe = ParentSerializer(required=False)
    student_auth_signe = StudentSerializer(required=False)
    first_witness_signe = WitnessSerializer(required=False)
    second_witness_signe = WitnessSerializer(required=False)
    counter_signe = HeadSerializer(required=False)
    chain = ChainSerializer()
    class Meta:
        model = Contract
        fields = '__all__'

class ContractSerializerMinimal(serializers.ModelSerializer):
    class Meta:
        model = Contract
        fields = '__all__'