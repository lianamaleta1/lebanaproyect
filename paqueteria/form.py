from django import forms
from django.contrib.auth.forms import UserCreationForm
from paqueteria.models import *

class UsuarioModelForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ('direccion', 'ciudad', 'estado', 'telefono', 'nro_cliente')
        
class paquetesForm(forms.ModelForm):

    identificado = forms.ModelChoiceField(
        widget=forms.RadioSelect(attrs={'class': 'radio-label'},required=False )
    )
    class Meta:
        model = Paquete
        fields=['numrastreo','fecha_compra','usuario','tienda_procedente','identificado']
     
    
