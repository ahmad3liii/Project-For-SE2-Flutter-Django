from django.urls import path 
from . import views
# جولي احمد جحجاح

urlpatterns=[
    path("restaurantapp/",views.index,name="index"),
    path("allprices/",views.all_food_prices,name="allprices")
]