# Generated by Django 2.1.5 on 2019-08-01 12:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school_users', '0013_auto_20190731_1602'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='needs_parent',
            field=models.BooleanField(default=True),
        ),
    ]
