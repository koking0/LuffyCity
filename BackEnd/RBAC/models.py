from django.db import models
from django.utils import timezone


class Menu(models.Model):
	"""菜单"""
	name = models.CharField(verbose_name="菜单名称", max_length=32)
	icon = models.CharField(verbose_name="菜单图标", max_length=32)

	def __str__(self):
		return self.name


class Permission(models.Model):
	"""权限"""
	title = models.CharField(verbose_name="权限名称", max_length=32)
	url = models.CharField(verbose_name="权限URL正则表达式", max_length=256)
	name = models.CharField(verbose_name="权限URL别名", max_length=32, unique=True)
	icon = models.CharField(verbose_name="权限图标", max_length=32, null=True, blank=True)

	menu = models.ForeignKey(verbose_name="所属菜单", to="Menu", null=True, blank=True, on_delete=models.PROTECT,
	                         help_text="如果为 null 表示该权限不是菜单，否则为二级菜单")
	parentPermission = models.ForeignKey(verbose_name="父权限", to="Permission", null=True, blank=True,
	                                     on_delete=models.PROTECT, help_text="非菜单权限需要一个二级菜单的父权限做默认展开和选中")

	def __str__(self):
		return self.title


class Role(models.Model):
	"""角色"""
	name = models.CharField(verbose_name="角色名称", max_length=32)
	duty = models.CharField(verbose_name="职责", max_length=256)

	permissions = models.ManyToManyField(verbose_name="角色所拥有权限", to='Permission', blank=True)

	def __str__(self):
		return self.name


class Team(models.Model):
	"""分组信息"""
	name = models.CharField(verbose_name="Team名称", max_length=32, unique=True)
	introduce = models.TextField(verbose_name="Team介绍")
	# 一个组内可以拥有多名角色，但一个角色只能属于一个组
	hasRoles = models.ForeignKey(verbose_name="组内拥有的角色", to="Role", null=True, blank=True, on_delete=models.PROTECT)

	def __str__(self):
		return self.name


class Department(models.Model):
	"""部门信息"""
	name = models.CharField(verbose_name="部门名称", max_length=32, unique=True)
	duty = models.TextField(verbose_name="部门职责")
	# 一个部门可以拥有多名角色，但一个角色只能属于一个部门
	hasRoles = models.ForeignKey(verbose_name="组内拥有的角色", to="Role", null=True, blank=True, on_delete=models.PROTECT)

	def __str__(self):
		return self.name


class Attendance(models.Model):
	"""出勤记录"""
	subject = models.CharField(verbose_name="主题", max_length=32)
	person = models.ForeignKey(verbose_name="成员", to="RBAC.RbacUserInfo", related_name="person",
	                           on_delete=models.PROTECT)
	record = models.CharField("记录", choices=[("check", "全勤"), ("vacate", "请假"), ("late", "迟到"), ("lack", "缺勤")],
	                          max_length=64)
	score = models.IntegerField(verbose_name="处理分值")
	referee = models.ForeignKey(verbose_name="执行人", to="RBAC.RbacUserInfo", related_name="referee",
	                            on_delete=models.PROTECT)
	date = models.DateTimeField(verbose_name="执行日期", default=timezone.now)
	remark = models.TextField(verbose_name="备注", null=True, blank=True)

	def __str__(self):
		return "%s-%s" % (self.subject, self.person.username)


class ScoreRecord(models.Model):
	"""积分记录"""
	score = models.IntegerField(verbose_name="处理分值")
	reason = models.TextField(verbose_name="理由")
	person = models.ForeignKey(verbose_name="成员", related_name="scorePerson", to="RBAC.RbacUserInfo",
	                           on_delete=models.PROTECT)
	referee = models.ForeignKey(verbose_name="执行人", related_name="scoreReferee", to="RBAC.RbacUserInfo",
	                            on_delete=models.PROTECT)

	def __str__(self):
		return "%s-(%s)" % (self.person.username, self.score)


class RbacUserInfo(models.Model):
	"""成员信息"""
	username = models.CharField(verbose_name="用户名", max_length=150, unique=True)
	password = models.CharField(verbose_name="密码", max_length=150)
	first_name = models.CharField(verbose_name="名", max_length=30, blank=True)
	last_name = models.CharField(verbose_name="姓", max_length=150, blank=True)
	email = models.EmailField(verbose_name="邮箱", blank=True)
	score = models.IntegerField(verbose_name="积分", default=10)
	grade = models.IntegerField(verbose_name="等级", choices=[(1, "M1"), (2, "M2"), (3, "M3"), (4, "M4"), (5, "M5")],
	                            default=1)
	gender = models.IntegerField(verbose_name='性别', choices=[(1, '男'), (2, '女')], default=1)
	avatar = models.ImageField(verbose_name="头像", upload_to='avatars/', default='avatars/default.png')
	telephone = models.CharField(verbose_name='手机号', max_length=11, null=True, unique=True)
	dateJoined = models.DateTimeField(verbose_name="加入日期", default=timezone.now)

	roles = models.ManyToManyField(verbose_name='职位', to="Role", blank=True)
	team = models.ForeignKey(verbose_name="组", to="Team", null=True, blank=True, on_delete=models.PROTECT)
	department = models.ForeignKey(verbose_name='部门', to="Department", null=True, blank=True, on_delete=models.PROTECT)

	def __str__(self):
		return self.username
