from rest_framework import serializers
from .models import *
from school_users.serializers import *
from block.serializers import *

class ContractSerializer(serializers.ModelSerializer):
    first_auth_signe = ParentSerializer(required=False)
    second_auth_signe = ParentSerializer(required=False)
    first_witness_signe = WitnessSerializer(required=False)
    second_witness_signe = WitnessSerializer(required=False)
    counter_signe = SupervisorSerializer(required=False)
    chain = ChainSerializer()
    class Meta:
        model = Contract
        exclude = ['third_auth_signe']