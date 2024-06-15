# Generated by Django 4.2.13 on 2024-06-15 01:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('paqueteria', '0005_alter_paquete_tienda_procedente'),
    ]

    operations = [
        migrations.AddField(
            model_name='paquete',
            name='almacen',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='paqueteria.almacen'),
        ),
        migrations.AddField(
            model_name='paquete',
            name='clasificacion',
            field=models.CharField(blank=True, max_length=2000, null=True),
        ),
    ]