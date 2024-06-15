from django.urls import path, include
from paqueteria import views

urlpatterns = [
 path('listadpquetes/',views.listadpquetes,name='listadpquetes'),
 path('addpquetes/',views.addpquetes,name='addpquetes'),
 path('listadproductos/', views.listadproductos, name='listadproductos'),
 path('addproductos/',views.addproductos,name='addproductos'),
]