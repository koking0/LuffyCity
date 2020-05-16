from django.contrib.auth.models import AbstractUser
from django.db import models


__all__ = ["Account", "Student", "Teacher"]


class Account(AbstractUser):
	"""用户"""
	avatar = models.ImageField(upload_to='avatars/', default='avatars/default.png')
	telephone = models.CharField(max_length=11, null=True, blank=True, unique=True)
	balance = models.IntegerField(verbose_name="贝里余额", default=0)
	identity = models.IntegerField(verbose_name="身份", choices=[(0, "管理员"), (2, "导师"), (3, "学员")], default=3)

	def __str__(self):
		return self.username


class Student(models.Model):
	"""学生表"""
	student = models.OneToOneField(verbose_name="学生信息", to="Account", on_delete=models.PROTECT)
	QQ = models.CharField(verbose_name="学生QQ", max_length=32, null=True, blank=True)
	telephone = models.CharField(verbose_name="学生手机号", max_length=32, null=True, blank=True)
	teacher = models.ForeignKey(to='Teacher', related_name='studentTeacher', on_delete=models.PROTECT, null=True, blank=True)

	courses = models.ManyToManyField(to='Course.EmploymentCourse', related_name='userCourse')
	completeSection = models.ManyToManyField(to='Course.CourseSection')

	def __str__(self):
		return "%s" % self.student.username


class Teacher(models.Model):
	"""老师表"""
	teacher = models.OneToOneField(verbose_name="老师信息", to="Account", on_delete=models.PROTECT)
	telephone = models.CharField(verbose_name="老师手机号", max_length=32)
	remark = models.TextField(verbose_name="备注", null=True, blank=True)

	def __str__(self):
		return "%s" % self.teacher.username
