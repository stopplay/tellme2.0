# Generated by Django 2.1.5 on 2019-07-07 16:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contract', '0014_auto_20190707_1342'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contract',
            name='pdf',
            field=models.FileField(blank=True, null=True, upload_to='', verbose_name='Contrato'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='terms_of_contract',
            field=models.FileField(blank=True, null=True, upload_to='', verbose_name='Termos do Contrato'),
        ),
    ]
