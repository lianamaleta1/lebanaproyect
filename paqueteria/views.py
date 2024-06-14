from django.shortcuts import render,redirect
from paqueteria.form import UsuarioModelForm,paquetesForm

# Create your views here.
def registration(request):
    
    if request.method=='POST':
        form= UsuarioModelForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(listadpquetes)
        else:
             form= UsuarioModelForm()
    
    else:           
        form= UsuarioModelForm()
    
    return render(request,'registration/login.html',{'form': form})

def autenticar(request):
    
    return render(request,'registration/autenticar.html')

def listadpquetes(request):
    paquetes=paquetes.objects.all()
    return render(request,'paquetes/listad.html',{'paquetes': paquetes})

def addpquetes(request):
    
    if request.method=='POST':
        form= paquetesForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(listadpquetes)
        else:
             form= paquetesForm()
    
    else:           
        form= paquetesForm()
    
    return render(request,'paquetes/add.html',{'form': form})