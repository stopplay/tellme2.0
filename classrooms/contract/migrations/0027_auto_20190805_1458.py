# Generated by Django 2.1.5 on 2019-08-05 14:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('school_users', '0017_student_third_parent'),
        ('contract', '0026_auto_20190804_1658'),
    ]

    operations = [
        migrations.AddField(
            model_name='contract',
            name='student_auth_hash',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='contract',
            name='student_auth_signe',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='student_responsible', to='school_users.Student'),
        ),
        migrations.AddField(
            model_name='contract',
            name='student_auth_signed',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='contract',
            name='student_auth_signed_timestamp',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
