from django.db import models

__all__ = ['Category', 'FreeCourse', 'PracticalCourse', 'Teacher', 'CourseDetail', 'GoLearn', 'CourseChapter',
           'CourseSection', 'EmploymentCourse', 'Module']


# Create your models here.
class Category(models.Model):
    """课程分类表"""
    title = models.CharField(max_length=32, verbose_name="课程的分类")
    categoryType = models.SmallIntegerField(choices=((0, "免费课"), (1, "实战课")))

    def __str__(self):
        return self.title + str(self.categoryType)


class BaseCourse(models.Model):
    # 列表+详情页面数据
    title = models.CharField(max_length=128, verbose_name="课程的名称")
    courseImage = models.ImageField(upload_to="course/%Y-%m", verbose_name='课程的图片')
    studyNumber = models.IntegerField(verbose_name="学习人数")
    hours = models.IntegerField(verbose_name="时长")
    # 列表页面数据
    slogan = models.CharField(verbose_name="课程概述", max_length=1024)
    level = models.SmallIntegerField(choices=((0, '初级'), (1, '中级'), (2, '高级')), default=1)
    # 其它数据
    category = models.ForeignKey(to="Category", verbose_name="课程的分类", on_delete=models.PROTECT)
    courseType = models.SmallIntegerField(choices=((0, "免费课"), (1, "实战课"), (2, "轻课"), (3, "就业班")))
    courseDetail = models.OneToOneField(to="CourseDetail", on_delete=models.CASCADE)
    chapter = models.ManyToManyField(to="CourseChapter")

    def __str__(self):
        return self.title

    class Meta:
        abstract = True


class FreeCourse(BaseCourse):
    pass


class PracticalCourse(BaseCourse):
    price = models.IntegerField(verbose_name="价格", default=99)


class EmploymentCourse(models.Model):
    title = models.CharField(max_length=128, verbose_name="课程的名称")
    courseImage = models.ImageField(upload_to="course/%Y-%m", verbose_name='课程的图片')
    studyNumber = models.IntegerField(verbose_name="学习人数")
    hours = models.IntegerField(verbose_name="时长")
    slogan = models.CharField(verbose_name="课程概述", max_length=1024)
    courseType = models.SmallIntegerField(choices=((0, "免费课"), (1, "实战课"), (2, "轻课"), (3, "就业班")))
    courseDetail = models.OneToOneField(to="CourseDetail", on_delete=models.CASCADE)
    price = models.IntegerField(verbose_name="价格", default=99)
    salary = models.CharField(max_length=128, verbose_name="就业薪资")
    employmentRate = models.FloatField(verbose_name="就业率")

    def __str__(self):
        return self.title


class Module(models.Model):
    course = models.ForeignKey(to='EmploymentCourse', on_delete=models.CASCADE)
    module = models.SmallIntegerField(verbose_name="第几模块")
    title = models.CharField(verbose_name="模块", max_length=256)
    chapter = models.ManyToManyField(to="CourseChapter")

    def __str__(self):
        return self.title


class Teacher(models.Model):
    name = models.CharField(max_length=32, verbose_name="讲师名字")
    brief = models.TextField(max_length=1024, verbose_name="讲师介绍")
    avatar = models.ImageField(upload_to='avatars/', default='avatars/default.png')

    def __str__(self):
        return self.name


class CourseDetail(models.Model):
    teachers = models.ManyToManyField("Teacher", verbose_name="课程讲师")
    brief = models.TextField(verbose_name="课程简介")
    number = models.IntegerField(verbose_name="课程小节", default=0)
    qqGroup = models.CharField(max_length=11, null=True, blank=True)

    def __str__(self):
        return self.brief


class GoLearn(models.Model):
    title = models.CharField(verbose_name="将会学到的内容", max_length=256)
    courseDetail = models.ForeignKey(to="CourseDetail", on_delete=models.PROTECT)

    def __str__(self):
        return self.title


class CourseChapter(models.Model):
    """课程章节表"""
    chapter = models.SmallIntegerField(verbose_name="第几章")
    title = models.CharField(max_length=32, verbose_name="课程章节名称")
    homeworkTitle = models.CharField(verbose_name="作业题目", max_length=32, null=True, blank=True)
    homeworkContent = models.TextField(verbose_name="作业内容", null=True, blank=True)
    homeworkPrice = models.IntegerField(verbose_name="奖学金", null=True, blank=True)

    def __str__(self):
        return self.title


class CourseSection(models.Model):
    """课时表"""
    chapter = models.ForeignKey(to="CourseChapter", on_delete=models.CASCADE)
    name = models.CharField(max_length=32, verbose_name="课时名称")
    freeTrail = models.BooleanField(default=False, help_text="是否可试看")
    sectionType = models.SmallIntegerField(default=2, choices=((0, '文档'), (1, '练习'), (2, '视频')))

    def __str__(self):
        return self.name
