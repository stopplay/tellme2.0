# Generated by Django 2.1.5 on 2019-07-07 17:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school', '0010_auto_20190707_1139'),
    ]

    operations = [
        migrations.AlterField(
            model_name='school',
            name='tell_me_school_id',
            field=models.TextField(blank=True, null=True, verbose_name='ID da Escola Tell'),
        ),
    ]
