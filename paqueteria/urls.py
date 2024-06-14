from django.urls import path, include
from paqueteria import views

urlpatterns = [
 path('registration/',views.registration,name='registration'),
 path('autenticar/',views.autenticar,name='autenticar'),
 path('listadpquetes/',views.listadpquetes,name='listadpquetes'),
 path('addpquetes/',views.addpquetes,name='addpquetes')
]