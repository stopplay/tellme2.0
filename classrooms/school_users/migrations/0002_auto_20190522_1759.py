# Generated by Django 2.1.7 on 2019-05-22 20:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school_users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='parent',
            name='authorised',
            field=models.BooleanField(default=False),
        ),
    ]
