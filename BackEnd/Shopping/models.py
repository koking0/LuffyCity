from django.db import models


# Create your models here.
class ShoppingCar(models.Model):
	account = models.OneToOneField(to='Account', on_delete=models.CASCADE)
	course = models.ManyToManyField(to='PracticalCourse')
