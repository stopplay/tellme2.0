# Generated by Django 2.1.5 on 2019-07-31 15:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school_users', '0011_auto_20190718_1431'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='bithday',
            field=models.DateField(blank=True, null=True, verbose_name='Data de Nascimento'),
        ),
    ]
