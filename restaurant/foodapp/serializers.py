from .models import FoodPrice
from rest_framework import serializers
# حمزة علي
class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model=FoodPrice
        fields='__all__'