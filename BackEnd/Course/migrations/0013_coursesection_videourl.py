# Generated by Django 3.0.3 on 2020-05-16 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Course', '0012_coursechapter_homeworkprice'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursesection',
            name='videoUrl',
            field=models.URLField(default='//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1'),
        ),
    ]
