from django.contrib.auth.models import AbstractUser
from django.db import models


__all__ = ["Account", "Classes", "Student", "Teacher"]


class Account(AbstractUser):
	"""用户"""
	avatar = models.ImageField(upload_to='avatars/', default='avatars/default.png')
	telephone = models.CharField(max_length=11, null=True, blank=True, unique=True)
	balance = models.IntegerField(verbose_name="贝里余额", default=0)
	identity = models.IntegerField(verbose_name="身份", choices=[(0, "管理员"), (2, "导师"), (3, "学员")], default=3)

	def __str__(self):
		return self.username


class Classes(models.Model):
	"""班级"""
	QQ = models.IntegerField(verbose_name="班级QQ群")
	startDate = models.DateField(verbose_name="开课日期")
	graduateDate = models.DateField(verbose_name="结业日期", null=True, blank=True)
	explain = models.TextField(verbose_name="说明", null=True, blank=True)

	course = models.ForeignKey(verbose_name="课程", to="Course.PracticalCourse", on_delete=models.PROTECT)
	classTeacher = models.ForeignKey(verbose_name="班主任", to="Course.Teacher", on_delete=models.PROTECT,
	                                 help_text="班主任为成员管理部成员，负责督促老师课程制作进度和学生学习进度")

	def __str__(self):
		return "%s-%s" % (self.course.title, self.QQ)


class Student(models.Model):
	"""学生表"""
	student = models.OneToOneField(verbose_name="学生信息", to="Account", on_delete=models.PROTECT)
	QQ = models.CharField(verbose_name="学生QQ", max_length=32)
	telephone = models.CharField(verbose_name="学生手机号", max_length=32)
	classList = models.ManyToManyField(verbose_name="已报班级", to="Classes", blank=True)
	teacher = models.ForeignKey(to='Teacher', related_name='studentTeacher', on_delete=models.PROTECT)
	state = models.IntegerField(verbose_name="学生状态", choices=[(1, "审核"), (2, "在读"), (3, "毕业")], default=1)
	remark = models.TextField(verbose_name="备注", null=True, blank=True)

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
