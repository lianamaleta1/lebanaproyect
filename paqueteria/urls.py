from django.urls import path, include
from paqueteria import views

urlpatterns = [
 path('listado/',views.registration,name='registration'),
]