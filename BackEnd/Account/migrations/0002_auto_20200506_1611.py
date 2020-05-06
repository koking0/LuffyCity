# Generated by Django 3.0.3 on 2020-05-06 08:11

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Course', '0001_initial'),
        ('Account', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='teacher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='Course.Teacher', verbose_name='批改老师'),
        ),
        migrations.AddField(
            model_name='student',
            name='classList',
            field=models.ManyToManyField(blank=True, to='Account.Classes', verbose_name='已报班级'),
        ),
        migrations.AddField(
            model_name='student',
            name='student',
            field=models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL, verbose_name='学生信息'),
        ),
        migrations.AddField(
            model_name='classes',
            name='classTeacher',
            field=models.ForeignKey(help_text='班主任为成员管理部成员，负责督促老师课程制作进度和学生学习进度', on_delete=django.db.models.deletion.PROTECT, to='Course.Teacher', verbose_name='班主任'),
        ),
        migrations.AddField(
            model_name='classes',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='Course.Course', verbose_name='课程'),
        ),
    ]
