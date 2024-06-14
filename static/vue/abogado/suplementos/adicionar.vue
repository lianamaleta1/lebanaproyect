<template>
  <div>

  <div class="row">
      <div class="col-12" style="margin-top: 10px">
          <h4>Solicitudes de Pago / Suplementos</h4>
      </div>
  </div>

  <div class="row">          
          <div class="col-sm-6" style="margin-left: 25%">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true"><i class="fa fa-plus"></i> Adicionar Contrato</a>
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
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method="POST" v-on:submit.prevent="crear">
                  <div class="row">
                    <div class="col-sm-12">
                      <!-- checkbox -->
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Proveedor:</label>
                      <div class="col-sm-9">
                        <select id="tcp" v-model="contrato.tcp" name="tcp" required="" class="bs-select form-control">
                              <option v-for="opt in listado_tcp" v-bind:value="opt.id">
                             {{opt.nombre }}
                             </option>
                       </select>

                        <span v-for="error in errors.tcp" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Descripción:</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" name="nombre" v-model="contrato.descripcion" placeholder="Descripción"></input>
                        <span v-for="error in errors.descripcion" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Fecha de Vencimiento:</label>
                      <div class="col-sm-8">
                        <input type="date" class="form-control" name="fecha_vencimiento" v-model="contrato.fecha_vencimiento" placeholder="Fecha Vencimiento"></input>
                        <span v-for="error in errors.fecha_vencimiento" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-md-12" style="margin-bottom: 10px;text-align: center;">
                <div class="fileinput fileinput-new" data-provides="fileinput">
                 <div class="fileinput-new thumbnail">
                 </div>
                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                </div>
                <div>
                    <span class="btn btn-default btn-file">
                        <span class="fileinput-new">
                              Seleccionar Contrato
                        </span>
                    <span class="fileinput-exists">
                              Cambiar
                    </span>
                    <input type="file" required="" accept=".pdf" @change="onFileSelected">
                    </span>
                    <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">
                        Eliminar
                    </a>
                </div>
               </div>
               <span v-for="error in errors.modelo" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
               </div>
               </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Estado:</label>
                      <div class="col-sm-9">
                      <select id="estado" v-model="contrato.estado" name="estado" required="" class="bs-select form-control">
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
    contrato:{
      division_territorial:'',
      descripcion:'',
      tcp:'',
      fecha_vencimiento:'',
      modelo:'',
      estado:'' 
    },
    listado_tcp:[],
    errors:[],
  }   
  },
  methods: {

    listado:function(){
    window.location='#/contrato_listado';
    },
    crear:function(){
     var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/adicionar_contrato/';

      const fd =new FormData();      
      fd.append('division_territorial',this.contrato.division_territorial);
      fd.append('descripcion',this.contrato.descripcion);
      fd.append('tcp',this.contrato.tcp);
      fd.append('fecha_vencimiento',this.contrato.fecha_vencimiento);
      fd.append('modelo',this.contrato.modelo,this.contrato.modelo.name);
      fd.append('estado',this.contrato.estado);
      axios.post(url,fd).then(response =>{         
         
        this.errors=[];       
        toastr.success('Operación exitosa.');
        this.limpiar();
        
    }).catch(error => { 

        this.errors=error.response.data.error;
        toastr.error('Existen errores.');
    });    
       
    },

    onFileSelected:function(event){
     this.contrato.modelo=event.target.files[0];
      
    },
    get_lista_tcp:function(dtar){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/cargar_tcps_dtar/'+dtar+'/';
      axios.get(url).then(response => {
      this.listado_tcp=response.data;
      }).catch(error => {});
    },
    limpiar:function(){
    	this.contrato.descripcion='';      
      this.contrato.fecha_vencimiento='';
      this.contrato.modelo.name='';
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
    
    
    vm.contrato.division_territorial=response.data.trabajador_dt;
    vm.get_lista_tcp(vm.contrato.division_territorial);

    
    }).catch(error => {
        toastr.error('Existen errores.');
    });

      
    
      $('.bs-select').select2();
      $('#estado').change(function (){
          vm.contrato.estado =$("#estado option:selected").val();          
      });
      $('#tcp').change(function (){
          vm.contrato.tcp =$("#tcp option:selected").val();          
      });
 
    
  }
}
</script>
<style>
.text-sm .select2-container--default .select2-selection--single, select.form-control-sm ~ .select2-container--default .select2-selection--single {
    height: 32px !important;
}
</style>