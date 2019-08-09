# Generated by Django 2.1.5 on 2019-08-09 16:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contract', '0029_auto_20190808_1809'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contract',
            name='pdf',
            field=models.FileField(blank=True, null=True, upload_to='', verbose_name='Contrato (PDF apenas e tamanho máximo de 2MB)'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='terms_of_contract',
            field=models.FileField(blank=True, null=True, upload_to='', verbose_name='Termos Aditivos do Contrato (1) (PDF apenas e tamanho máximo de 2MB)'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='terms_of_contract_2',
            field=models.FileField(blank=True, null=True, upload_to='', verbose_name='Termos Aditivos do Contrato (2) (PDF apenas e tamanho máximo de 2MB)'),
        ),
    ]
