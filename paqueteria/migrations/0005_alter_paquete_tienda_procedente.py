# Generated by Django 4.2.13 on 2024-06-14 22:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('paqueteria', '0004_alter_usuario_telefono'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paquete',
            name='tienda_procedente',
            field=models.CharField(blank=True, max_length=2000, null=True),
        ),
    ]
