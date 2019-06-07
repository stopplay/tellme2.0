# Generated by Django 2.1.7 on 2019-06-07 11:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('contract', '0006_auto_20190606_1803'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contract',
            name='counter_signe',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='financial_responsible', to='school_users.Supervisor'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='first_auth_signe',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='first_responsible', to='school_users.Parent'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='second_auth_signe',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='second_responsible', to='school_users.Parent'),
        ),
    ]
