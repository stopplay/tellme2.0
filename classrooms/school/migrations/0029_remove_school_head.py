# Generated by Django 2.1.5 on 2019-09-13 14:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('school', '0028_school_head'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='school',
            name='head',
        ),
    ]
