from django.db import models


# Create your models here.
class ShoppingCar(models.Model):
	account = models.OneToOneField(to='Account.Account', on_delete=models.CASCADE)
	course = models.ManyToManyField(to='Course.PracticalCourse')

	def __str__(self):
		return self.account.username + self.course.title
