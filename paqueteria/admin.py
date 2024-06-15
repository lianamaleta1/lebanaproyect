from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Paquete)
admin.site.register(Usuario)
admin.site.register(categoriAlmacen)
admin.site.register(Almacen)
admin.site.register(Productos)
admin.site.register(categoriaProducto)


