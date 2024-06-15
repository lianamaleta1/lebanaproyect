from django.db import models
from django.contrib.auth.models import User




class Usuario (models.Model): 
    usuario= models.ForeignKey(User, on_delete=models.RESTRICT, null=True, blank=True)
    username=models.CharField( max_length=100,null=True,blank=True)
    first_name=models.CharField( max_length=100,null=True,blank=True)
    last_name=models.CharField( max_length=100,null=True,blank=True)
    direccion=models.CharField( max_length=100,null=True,blank=True)
    ciudad=models.CharField( max_length=100,null=True,blank=True)
    estado=models.CharField( max_length=100,null=True,blank=True)
    telefono=models.CharField(max_length=100, null=True,blank=True)
    nro_cliente=models.CharField( max_length=100,null=True,blank=True)
    #password=models.CharField( max_length=100,null=True,blank=True)
    
    def __str__(self):
        return self.username
    
    class Meta:
        verbose_name= 'usuario'
        verbose_name_plural = 'usuarios'
        db_table = 'usuario'

class categoriAlmacen (models.Model):
    id = models.AutoField(
        primary_key=True, 
        editable = False, 
        verbose_name = 'id',
    )
    nombre = models.CharField( max_length=100,default="")
 
    def __str__(self):
        return f"{self.nombre}"
    class Meta:
        verbose_name= 'categoriAlmacen'
        db_table = 'categoriAlmacen'
              
class Almacen (models.Model):
    
    nombre = models.CharField( max_length=100,default="")
    categoria_almaceb = models.ForeignKey(categoriAlmacen, on_delete=models.RESTRICT, null=False, blank=False)

   
    def __unicode__(self):
        return self.nombre
    
    def __str__(self):
        return f"{self.nombre}"
    class Meta:
        verbose_name= 'Almacen'
        verbose_name_plural = 'Almacenes'
        db_table = 'almacen'
        
        
#Modelo q representa la COMPRA
class Paquete (models.Model):
    id = models.AutoField(
        primary_key=True, 
        editable = False, 
        verbose_name = 'id',
        )
    validez=[(1,'Si'),(2,'No')]
    numrastreo = models.CharField( max_length=100,default="")#seria como el tracking
    fecha_compra = models.DateField( max_length=2000, blank= True,null=True)
    usuario= models.ForeignKey(Usuario, on_delete=models.RESTRICT, null=True, blank=True)
    identificado=models.IntegerField(default='2',choices=validez)
    tienda_procedente =models.CharField( max_length=2000, blank= True,null=True)
    clasificacion =models.CharField( max_length=2000, blank= True,null=True)
    almacen =models.ForeignKey(Almacen, on_delete=models.RESTRICT, null=True, blank=True)

    
    def __str__(self):
        return f"{self.numrastreo}"
    
    class Meta:
        verbose_name= 'paquete'
        verbose_name_plural = 'Paquetes'
        db_table = 'paquete'


  
class categoriaProducto (models.Model):
    
    nombre = models.CharField( max_length=100,default="")
 
    def __str__(self):
        return f"{self.nombre}"
    class Meta:
        verbose_name= 'categoriaProducto'
        db_table = 'categoriaProducto'
              
class Productos (models.Model):
    
    nombre = models.CharField( max_length=100,default="")
    paquete= models.ForeignKey(Paquete, on_delete=models.RESTRICT, null=False, blank=False)
    categprod= models.ForeignKey(categoriaProducto, on_delete=models.RESTRICT, null=False, blank=False)
    
    def __str__(self):
        return f"{self.nombre}"
    
    class Meta:
        verbose_name= 'productos'
        verbose_name_plural = 'productos'
        db_table = 'productos'   
         

