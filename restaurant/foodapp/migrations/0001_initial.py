# Generated by Django 5.1 on 2024-12-03 15:58

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FoodPrice',
            fields=[
                ('name', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=150)),
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('price', models.IntegerField(default=0)),
            ],
        ),
    ]
