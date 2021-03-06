# Generated by Django 3.0.3 on 2020-05-13 16:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Course', '0010_module_module'),
        ('Account', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='completeSection',
            field=models.ManyToManyField(to='Course.CourseSection'),
        ),
        migrations.AddField(
            model_name='account',
            name='courses',
            field=models.ManyToManyField(to='Course.EmploymentCourse'),
        ),
    ]
