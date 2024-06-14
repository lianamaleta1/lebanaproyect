from django.shortcuts import render
from paqueteria.form import UsuarioModelForm

# Create your views here.
def registration(request):
    
    if request.method=='POST':
        form= UsuarioModelForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(HOLA)
        else:
            
    
    else:           
        form= UsuarioModelForm()
    
    return render(request,'registration/login.html',{'form': form})

def autenticar(request):
    
    return render(request,'registration/autenticar.html')