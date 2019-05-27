from rest_framework import serializers
from .models import *

class ContractSerializer(serializers.ModelSerializer):
    first_auth_signe = serializers.StringRelatedField()
    second_auth_signe = serializers.StringRelatedField()
    counter_signe = serializers.StringRelatedField()
    class Meta:
        model = Contract
        fields = '__all__'