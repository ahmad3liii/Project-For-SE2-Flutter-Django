from django.db import models
# جولي احمد جحجاح
# Create your models here.
class FoodPrice(models.Model):
    name= models.CharField(max_length=100)
    description=models.CharField(max_length=150)
    id=models.IntegerField(primary_key=True)
    price=models.IntegerField(default=0)
# حمزة علي
    def __str__(self):
        return self.name