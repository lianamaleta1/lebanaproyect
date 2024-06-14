from django.contrib.auth.forms import UserCreationForm
from paqueteria.models import *

class UsuarioModelForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ('direccion', 'ciudad', 'estado', 'telefono', 'nro_cliente')
    
