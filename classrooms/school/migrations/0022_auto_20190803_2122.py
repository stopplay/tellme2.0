# Generated by Django 2.1.11 on 2019-08-03 21:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('school', '0021_auto_20190802_1853'),
    ]

    operations = [
        migrations.AlterField(
            model_name='class',
            name='sku',
            field=models.TextField(blank=True, null=True, verbose_name='SKU do Material'),
        ),
    ]
