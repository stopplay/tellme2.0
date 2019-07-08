# Generated by Django 2.1.5 on 2019-07-07 16:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('contract', '0013_auto_20190705_1630'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contract',
            name='chain',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='block.Chain', verbose_name='Cadeia da Classe'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='class_id_sponte',
            field=models.IntegerField(blank=True, null=True, verbose_name='Id da Aula Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='class_name_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Nome da Aula Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='closing_date_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Data de Fechamento Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='contract_free_class_id_sponte',
            field=models.IntegerField(blank=True, null=True, verbose_name='Id do Contrato de Aula Livre Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='contract_number_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Número do Contrato Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='contract_type_id',
            field=models.IntegerField(blank=True, null=True, verbose_name='Tipo de Contrato Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='contractor_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Contratante Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='course_id_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Id do Curso Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='course_name_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Nome do Curso Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='date',
            field=models.DateField(blank=True, null=True, verbose_name='Data do Contrato'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='date_of_registration_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Data de Registro Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='end_date_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Data Final do Contrato Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='financial_launched_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Financeiro Lançado Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='initial_date_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Data Inicial do Contrato Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='name',
            field=models.TextField(blank=True, null=True, verbose_name='Nome do Contrato'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='name_of_curricular_matrix_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Nome da Matriz Curricular Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='situation_id_sponte',
            field=models.IntegerField(blank=True, null=True, verbose_name='Id da Situação Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='situation_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Situação Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='student_id_sponte',
            field=models.IntegerField(blank=True, null=True, verbose_name='Id do Estudante Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='student_name_sponte',
            field=models.TextField(blank=True, null=True, verbose_name='Nome do Estudante Sponte'),
        ),
        migrations.AlterField(
            model_name='contract',
            name='type_of_registration_sponte',
            field=models.IntegerField(blank=True, null=True, verbose_name='Tipo de Registro Sponte'),
        ),
    ]
