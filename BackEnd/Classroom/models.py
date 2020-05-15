from django.db import models


class Question(models.Model):
	"""提问表"""
	student = models.ForeignKey(to='Account.Student', on_delete=models.CASCADE, unique=False)
	teacher = models.ForeignKey(to='Account.Teacher', on_delete=models.CASCADE, unique=False)
	title = models.CharField(verbose_name='提问标题', max_length=255)
	content = models.TextField(verbose_name='提问内容')
	environment = models.CharField(verbose_name='环境', max_length=255)
	situation = models.IntegerField(verbose_name="情况", choices=[(0, "一般"), (1, "紧急"), (2, "十万火急")], default=1)
	state = models.IntegerField(verbose_name="进度", choices=[(0, "未处理"), (1, "已回复")], default=1)

	def __str__(self):
		return self.student.student.username + self.teacher.teacher.username + self.title
