from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils import timezone

from RBAC.models import RbacUserInfo


class User(AbstractUser):
	"""用户"""
	avatar = models.ImageField(upload_to='avatars/', default='avatars/default.png')
	telephone = models.CharField(max_length=11, null=True, blank=True, unique=True)

	def __str__(self):
		return self.username


class Course(models.Model):
	"""课程"""
	name = models.CharField(verbose_name="课程名称", max_length=32)
	sketch = models.TextField(verbose_name="课程简述")
	price = models.PositiveIntegerField(verbose_name="学费", help_text="游客学习收费，工作室成员学习免费")
	cover = models.ImageField(verbose_name="课程封面", upload_to='courseCover/', default='courseCover/default.png')
	grade = models.IntegerField(verbose_name="课程等级", choices=[(1, "M1"), (2, "M2"), (3, "M3"), (4, "M4"), (5, "M5")])
	category = models.IntegerField(verbose_name="课程分类", choices=[(1, "算法"), (2, "前端"), (3, "后端"), (4, "AI"), (5, "其它")])

	teacher = models.ForeignKey(verbose_name="开课老师", to="RBAC.RbacUserInfo", on_delete=models.PROTECT,
	                            related_name="teacher", help_text="开课老师限制为M4、M5等级成员")
	assistant = models.ManyToManyField(verbose_name="助教", to="RBAC.RbacUserInfo",
	                                   related_name="assistant", help_text="助教限定为M3等级成员")

	def __str__(self):
		return self.name


class Classes(models.Model):
	"""班级"""
	QQ = models.IntegerField(verbose_name="班级QQ群")
	startDate = models.DateField(verbose_name="开课日期")
	graduateDate = models.DateField(verbose_name="结业日期", null=True, blank=True)
	explain = models.TextField(verbose_name="说明", null=True, blank=True)

	course = models.ForeignKey(verbose_name="课程", to="Course", on_delete=models.PROTECT)
	classTeacher = models.ForeignKey(verbose_name="班主任", to="RBAC.RbacUserInfo", on_delete=models.PROTECT,
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
	teacher = models.ForeignKey(verbose_name="批改老师", to="RBAC.RbacUserInfo", on_delete=models.PROTECT, null=True, blank=True)

	chapters = models.CharField(verbose_name="模块章节", max_length=64)
	title = models.CharField(verbose_name="题目", max_length=32)
	file = models.FileField(verbose_name="作业内容", upload_to="media/task/")
	date = models.DateTimeField(verbose_name="提交时间", default=timezone.now)
	achievement = models.IntegerField(verbose_name="成绩", validators=[MaxValueValidator(100), MinValueValidator(1)], null=True, blank=True)
	comment = models.TextField(verbose_name="老师点评", null=True, blank=True)

	def __str__(self):
		return "%s-%s" % (self.student.username, self.title)


class Project(models.Model):
	"""项目"""
	MaxPrivateProjectCount = 5
	name = models.CharField(verbose_name="项目名称", max_length=32)
	price = models.IntegerField(verbose_name="项目报价")
	introduce = models.TextField(verbose_name="项目介绍")
	contactName = models.CharField(verbose_name="联系人姓名", max_length=32)
	contactInformation = models.CharField(verbose_name="联系人联系方式", max_length=64, help_text="QQ/WeChat/Phone")
	status = models.IntegerField(verbose_name="状态", choices=[(1, "无人敢接"), (2, "已被接取")], default=1)

	chargePerson = models.ForeignKey(verbose_name="项目负责人", to="RBAC.RbacUserInfo",
	                                 null=True, blank=True, on_delete=models.PROTECT)
	startDate = models.DateField(verbose_name="接取日期", null=True, blank=True)
	completeDate = models.DateField(verbose_name="完结日期", null=True, blank=True)

	def __str__(self):
		return self.name


class ProjectRecord(models.Model):
	"""项目跟进记录"""
	content = models.TextField(verbose_name="跟进内容")
	date = models.DateField(verbose_name="跟进日期", default=timezone.now)

	project = models.ForeignKey(verbose_name="跟进项目", to="Project", on_delete=models.PROTECT)
	superintendent = models.ForeignKey(verbose_name="跟进人", to="RBAC.RbacUserInfo", on_delete=models.PROTECT)

	def __str__(self):
		return "%s-%s" % (self.project.name, self.date)


class PaymentRecord(models.Model):
	"""账单记录"""
	user = models.OneToOneField(verbose_name="付款人", to="User", on_delete=models.PROTECT)
	type = models.IntegerField(verbose_name="账单类型", choices=[(1, "学费"), (2, "项目款"), (3, "其它")])
	price = models.IntegerField(verbose_name="金额")
	date = models.DateTimeField(verbose_name="账单日期", default=timezone.now)
	state = models.IntegerField(verbose_name="状态", choices=[(1, "审核中"), (2, "确认"), (3, "驳回")])
	confirmDate = models.DateTimeField(verbose_name="确认日期", null=True, blank=True)
	confirmUser = models.ForeignKey(verbose_name="审批人", to="RBAC.RbacUserInfo", null=True, blank=True,
	                                on_delete=models.PROTECT)
	remark = models.TextField(verbose_name="备注", null=True, blank=True)

	def __str__(self):
		return "%s-%s-%s" % (self.user.username, self.type, self.price)
