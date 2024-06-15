from django.shortcuts import render,redirect
from paqueteria.form import UsuarioModelForm,paquetesForm,productosForm
from paqueteria.models import *
from django.core.mail import send_mail
from django.conf import settings



def listadpquetes(request):
    paquetes=Paquete.objects.all()
    return render(request,'paquetes/listad.html',{'paquetes': paquetes})

def addpquetes(request):
    
    if request.method=='POST':
        form= paquetesForm(request.POST)
        if form.is_valid():
            usuario=form.cleaned_data['usuario']
            if usuario is not None:
               usuario1=User.objects.get(first_name=usuario)
               email=usuario1.email
            paueteGuardado=form.save()
            #idpaquete=paueteGuardado.pk
            
            send_mail('Paqueteria Lebanapost', 'Hemos recibido su compra online' , settings.EMAIL_HOST_USER,[email], fail_silently=True)        
            return redirect(listadpquetes)
    else:           
        form= paquetesForm()
    
    return render(request,'paquetes/add.html',{'form': form})

def Clasifipque(request,id):
    compra=Paquete.objects.get(pk=id)
    if compra is not None:   
        catAlma=categoriAlmacen.objects.filter(nombre="Compras Recibidas / Sin clasificar")
        if catAlma is not None:
            gfg=catAlma.id
            alm=Almacen.objects.get(categoria_almaceb=gfg)
            compra.almacen=alm
            compra.save()
        
    else:
     compra.clasificacion="Compra de usuario no identificada"
     compra.save()
    return render(request,'paquetes/listad.html')

def listadproductos(request):
    productos=Productos.objects.all()
    return render(request,'productos/listad.html',{'productos': productos})


def addproductos(request):
    
    if request.method=='POST':
        form= productosForm(request.POST)
        if form.is_valid():

            form.save()   
            return redirect(listadpquetes)
    else:           
        form= productosForm()
    
    return render(request,'productos/add.html',{'form': form})