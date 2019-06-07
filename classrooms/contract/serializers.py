from rest_framework import serializers
from .models import *
from school_users.serializers import *

class ContractSerializer(serializers.ModelSerializer):
    first_auth_signe = ParentSerializer(required=False)
    second_auth_signe = ParentSerializer(required=False)
    counter_signe = SupervisorSerializer(required=False)
    class Meta:
        model = Contract
        fields = '__all__'