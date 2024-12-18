from django.shortcuts import render
from django.http import HttpResponse
from .models import FoodPrice
from rest_framework.decorators import api_view
from .serializers import FoodSerializer
from rest_framework.response import Response
# اسراء غسان حاجي سليمان
# Create your views here.
def index (request):
    food_prices=FoodPrice.objects.all()
    return render(request,"food/index.html",{"list_food_prices":food_prices})
@api_view(['GET'])
def all_food_prices(request):
    food_prices=FoodPrice.objects.all()
    serializer=FoodSerializer(food_prices,many=True)
    return Response(serializer.data)