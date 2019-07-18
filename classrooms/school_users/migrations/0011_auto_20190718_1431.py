# Generated by Django 2.1.5 on 2019-07-18 14:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('school_users', '0010_auto_20190709_1734'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='second_parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='second_parent', to='school_users.Parent', verbose_name='Responsável Pedagógico'),
        ),
    ]
