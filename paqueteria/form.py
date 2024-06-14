from django import forms
from django.contrib.auth.forms import UserCreationForm
from paqueteria.models import *

class UsuarioModelForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ('direccion', 'ciudad', 'estado', 'telefono', 'nro_cliente')
        
class paquetesForm(forms.ModelForm):
  
    usuario = forms.ModelChoiceField(
        queryset=Usuario.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'usuario'})    
    )
    identificado = forms.ChoiceField(
    choices=[(1, 'Si'), (2, 'No')],
    initial='Si',
    widget=forms.Select(attrs={'class': 'form-control','id': 'identificado'}),required=False
      )
    
    numrastreo = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control','id':'numrastreo'}
        )
    )
    
    tienda_procedente = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control','id':'tienda_procedente'}
        )
    )
    fecha_compra = forms.DateField(
        widget=forms.TextInput(attrs={'class': 'form-control','id':'fecha_compra'}
        )
    )

    class Meta:
        model = Paquete
        fields=['numrastreo','fecha_compra','usuario','tienda_procedente','identificado']
     
    
