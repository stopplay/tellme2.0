# Generated by Django 2.1.5 on 2019-07-03 23:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school', '0003_auto_20190703_1712'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='school',
            name='enrollment_year',
        ),
        migrations.AddField(
            model_name='class',
            name='class_year',
            field=models.IntegerField(default=2019),
        ),
    ]
