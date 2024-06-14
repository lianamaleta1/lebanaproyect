<template>
  <div>

  <div class="row">
      <div class="col-12" style="margin-top: 10px">
          <h4>Solicitudes de Pago / Proveedores</h4>
      </div>
  </div>

  <div class="row">
          <div class="col-sm-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true"><i class="fa fa-info"></i> Adicionar Proveedor</a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content" id="custom-tabs-four-tabContent">
                  <div class="tab-pane fade show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
            <!-- /.card -->
            <!-- general form elements disabled -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Formulario de Registro </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method="POST" v-on:submit.prevent="crear">
                  <div class="row">
                    <div class="col-sm-12">
                      <!-- checkbox -->
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nombre:</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" name="nombre" v-model="tcp.nombre" placeholder="Nombre"></input>
                        <span v-for="error in errors.nombre" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Información:</label>
                      <div class="col-sm-8">
                        <textarea type="text" class="form-control" name="info" v-model="tcp.info" placeholder="Información de contacto"></textarea>
                        <span v-for="error in errors.info" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Importe máximo:</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" name="importe_maximo" v-model="tcp.importe_maximo" placeholder="Importe máximo"></input>
                        <span v-for="error in errors.importe_maximo" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Estado:</label>
                      <div class="col-sm-9">
                      <select id="estado" v-model="tcp.estado" name="estado" required="" class="bs-select form-control">
                              <option value="activo">Activo</option>
                              <option value="inactivo">Inactivo</option>
                       </select>
                        <span v-for="error in errors.estado" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
              <button type="button" class="btn btn-default" v-on:click.prevent="listado()"><i class="fa fa-list"></i> Listado</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Adicionar</button>
            </div>
        </form>
  </div>
</template>
<script>
module.exports = {

  data(){
   return{
    tcp:{
      division_territorial:'',
      nombre:'',
      info:'',
      importe_maximo:'',
      estado:'' 
    },
    errors:[],
  }   
  },
  methods: {

    listado:function(){
    window.location='#/proveedor_listado';
    },

    crear:function(){
     var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/adicionar_tcp/';
     axios.post(url,this.tcp).then(response =>{         
         
        this.errors=[];       
        toastr.success('Operación exitosa.');
        this.limpiar();
        
    }).catch(error => { 

        this.errors=error.response.data.error;
        toastr.error('Existen errores.');
    });    
       
    },
    limpiar:function(){
    	this.tcp.nombre='';
    	this.tcp.info='';
    	this.tcp.importe_maximo='';
    }
  },
  mounted(){
    toastr.options = {
                 closeButton: true,
                 debug: false,
                 positionClass: 'toast-top-center',
                 onclick: null
    };
    vm=this;
   
    var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/usuario/';
        axios.get(url).then(response => {
    
    
    vm.tcp.division_territorial=response.data.trabajador_dt;

    
    }).catch(error => {
        toastr.error('Existen errores.');
    });

      
    
      $('.bs-select').select2();
      $('#estado').change(function (){
          vm.tcp.estado =$("#estado option:selected").val();          
      });
 
    
  }
}
</script>
<style>
.text-sm .select2-container--default .select2-selection--single, select.form-control-sm ~ .select2-container--default .select2-selection--single {
    height: 32px !important;
}
</style>