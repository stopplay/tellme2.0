# Generated by Django 2.1.5 on 2019-07-08 11:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school', '0012_auto_20190707_1430'),
    ]

    operations = [
        migrations.AlterField(
            model_name='school',
            name='tell_me_school_id',
            field=models.TextField(blank=True, null=True, verbose_name='TellMe ID'),
        ),
    ]
