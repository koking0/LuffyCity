# Generated by Django 3.0.3 on 2020-05-14 15:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Account', '0006_auto_20200514_2307'),
        ('Classroom', '0004_auto_20200514_2316'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Account.Student'),
        ),
        migrations.AlterField(
            model_name='question',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Account.Teacher'),
        ),
    ]
