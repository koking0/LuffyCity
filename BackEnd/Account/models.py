from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils import timezone


class Account(AbstractUser):
	"""用户"""
	avatar = models.ImageField(upload_to='avatars/', default='avatars/default.png')
	telephone = models.CharField(max_length=11, null=True, blank=True, unique=True)
	balance = models.IntegerField(verbose_name="贝里余额", default=0)

	def __str__(self):
		return self.username

	class Meta:
		verbose_name = "用户表"


class Classes(models.Model):
	"""班级"""
	QQ = models.IntegerField(verbose_name="班级QQ群")
	startDate = models.DateField(verbose_name="开课日期")
	graduateDate = models.DateField(verbose_name="结业日期", null=True, blank=True)
	explain = models.TextField(verbose_name="说明", null=True, blank=True)

	course = models.ForeignKey(verbose_name="课程", to="Course", on_delete=models.PROTECT)
	classTeacher = models.ForeignKey(verbose_name="班主任", to="Course.Teacher", on_delete=models.PROTECT,
	                                 help_text="班主任为成员管理部成员，负责督促老师课程制作进度和学生学习进度")

	def __str__(self):
		return "%s-%s" % (self.course.name, self.QQ)


class Student(models.Model):
	"""学生表"""
	student = models.OneToOneField(verbose_name="学生信息", to="User", on_delete=models.PROTECT)
	QQ = models.CharField(verbose_name="学生QQ", max_length=32)
	telephone = models.CharField(verbose_name="学生手机号", max_length=32)
	classList = models.ManyToManyField(verbose_name="已报班级", to="Classes", blank=True)
	state = models.IntegerField(verbose_name="学生状态", choices=[(1, "审核"), (2, "在读"), (3, "毕业")], default=1)
	remark = models.TextField(verbose_name="备注", null=True, blank=True)

	def __str__(self):
		return "%s" % self.student.username


class Task(models.Model):
	"""作业表"""
	student = models.ForeignKey(verbose_name="学生", to="User", on_delete=models.PROTECT)
	teacher = models.ForeignKey(verbose_name="批改老师", to="Course.Teacher", on_delete=models.PROTECT, null=True,
	                            blank=True)

	chapters = models.CharField(verbose_name="模块章节", max_length=64)
	title = models.CharField(verbose_name="题目", max_length=32)
	file = models.FileField(verbose_name="作业内容", upload_to="media/task/")
	date = models.DateTimeField(verbose_name="提交时间", default=timezone.now)
	achievement = models.IntegerField(verbose_name="成绩", validators=[MaxValueValidator(100), MinValueValidator(1)],
	                                  null=True, blank=True)
	comment = models.TextField(verbose_name="老师点评", null=True, blank=True)

	def __str__(self):
		return "%s-%s" % (self.student.username, self.title)
