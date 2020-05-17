from django.db import models
from django.utils import timezone
from django.core.validators import MinValueValidator, MaxValueValidator

__all__ = ["Question", "Task"]


class Question(models.Model):
	"""提问表"""
	student = models.ForeignKey(to='Account.Student', on_delete=models.CASCADE, unique=False)
	teacher = models.ForeignKey(to='Account.Teacher', on_delete=models.CASCADE, unique=False)
	title = models.CharField(verbose_name='提问标题', max_length=255)
	content = models.TextField(verbose_name='提问内容')
	solve = models.TextField(verbose_name='解决内容', null=True, blank=True)
	environment = models.CharField(verbose_name='环境', max_length=255)
	situation = models.IntegerField(verbose_name="情况", choices=[(0, "一般"), (1, "紧急"), (2, "十万火急")], default=1)
	state = models.IntegerField(verbose_name="进度", choices=[(0, "未处理"), (1, "已回复")], default=0)

	def __str__(self):
		return self.student.student.username + self.teacher.teacher.username + self.title


class Task(models.Model):
	"""作业表"""
	student = models.ForeignKey(verbose_name="学生", to="Account.Account", on_delete=models.PROTECT)
	teacher = models.ForeignKey(verbose_name="导师", to="Account.Teacher", on_delete=models.PROTECT)
	chapter = models.ForeignKey(verbose_name="章节", to='Course.CourseChapter', on_delete=models.PROTECT)

	file = models.FileField(verbose_name="作业内容", upload_to="media/task/")
	date = models.DateTimeField(verbose_name="提交时间", default=timezone.now)
	achievement = models.IntegerField(verbose_name="成绩", validators=[MaxValueValidator(100), MinValueValidator(1)],
	                                  null=True, blank=True)
	comment = models.TextField(verbose_name="老师点评", null=True, blank=True)
	state = models.IntegerField(verbose_name="进度", choices=[(0, "未批改"), (1, "已批改")], default=0)

	def __str__(self):
		return "%s-%s" % (self.student.username, self.chapter.homeworkTitle)
