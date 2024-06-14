<template>
  <div>

  <div class="row">
      <div class="col-12" style="margin-top: 10px">
          <h4>Editar Solicitud de Pago</h4>
      </div>
  </div>

<div class="row">          
          <div class="col-12 col-sm-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true"><i class="fa fa-edit"></i> Editar Solicitud {{solicitud.referencia}} creada {{solicitud.creada}}</a>
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
                <form method="POST" v-on:submit.prevent="editar_solicitud">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- checkbox -->
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Páguese a:</label>
                      <div class="col-sm-8">
                        <select id="tcp" v-model="solicitud.tcp" name="tcp" required="" class="bs-select form-control">
                              <!--<option v-for="opt in listado_tcp" v-bind:value="opt.id">{{opt.nombre }}</option>-->
                       </select>

                        <span v-for="error in errors.tcp" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      <div class="progress-group col-md-10" style="margin-top: 5px">
                       Pagado: <span class="badge badge-secondary" style="font-size: small;"> <b id="pagado"></b></span><!--  de <span class="badge badge-info" style="font-size: small;"><b id="maximo"></b></span>--> / Solicitudes: <span class="badge badge-primary" style="font-size: small;"> <b>{{cantidad_solicitudes}}</b></span> / Facturas: <span class="badge badge-primary" style="font-size: small;"><b>{{cantidad_facturas}}</b></span>
                    </div>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Titular:</label>
                      <div class="col-sm-8">
                        <select id="titular" v-model="solicitud.titular" name="titular" required="" class="bs-select form-control">
                          <option v-for="opt in listado_titulares_tcp" v-bind:value="opt.id">{{opt.nombre}}</option>
                       </select>
                        <span v-for="error in errors.titular" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Contrato:</label>
                      <div class="col-sm-8">
                        <select id="contrato" v-model="solicitud.contrato" name="contrato" required="" class="bs-select form-control">
                         <option v-for="opt in listado_contratos" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                        <span v-for="error in errors.contrato" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Suplemento:</label>
                      <div class="col-sm-8">
                        <select id="suplemento" v-model="solicitud.suplemento" name="suplemento" placeholder="Seleccione un suplemento..." class="bs-select form-control">
                        <option value="">Seleccione suplemento (opcional)</option>
                        <option v-for="opt in listado_suplementos" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                        <span v-for="error in errors.contrato" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-8">
                        <select id="cuenta_bancaria" v-model="solicitud.cuenta_bancaria" name="cuenta_bancaria" required="" class="bs-select form-control">
                          <option v-for="opt in listado_cuentas_tcp" v-bind:value="opt.id">{{opt.nombre}}</option>
                       </select>
                        <span v-for="error in errors.cuenta_bancaria" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tipo de pago:</label>
                      <div class="col-sm-8">
                      <select id="tipo" name="tipo" required="" class="bs-select form-control">
                      <option v-for="opt in listado_tipo_pago" v-bind:value="opt.nombre">{{opt.nombre}}</option>
                       </select>
                        <span v-for="error in errors.tipo" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <!-- checkbox
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Importe:</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" name="destino" v-model="solicitud.importe" placeholder="Importe">
                        <span v-for="error in errors.importe" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      <div class="progress-group col-md-12" style="margin-top: 5px">
                      Disponible:
                      <span><b>{{disponible}}</b></span>

                    </div>
                      </div>
                      <label class="col-sm-2 col-form-label" style="text-align: center;">Moneda:</label>
                      <div class="col-sm-3">
                        <select id="moneda" v-model="solicitud.moneda" name="moneda" required="" class="bs-select form-control">
                              <option value="CUP">CUP</option>
                       </select>
                        <span v-for="error in errors.moneda" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      -->

                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta / Tarea de Inversión:</label>
                      <div class="col-sm-8">
                       <select id="cuenta" v-model="solicitud.cuenta" name="cuenta" required="" class="bs-select form-control">
                              <option v-for="opt in listado_cuentas" v-bind:value="opt.id">{{opt.descripcion}}</option>
                       </select>
                        <span v-for="error in errors.cantidad" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Centro de Costo:</label>
                      <div class="col-sm-8">
                        <select id="centro_costo" v-model="solicitud.centro_costo" name="centro_costo" class="bs-select form-control"><option v-for="opt in listado_centros_costo" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                        <span v-for="error in errors.detalle" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Autoriza:</label>
                      <div class="col-sm-8">
                        <select id="select_autoriza" v-model="solicitud.autoriza" name="autoriza" required="" class="bs-select form-control">
                        <option v-for="opt in listado_autorizados" v-bind:value="opt.id">{{opt.usuario__first_name }} {{opt.usuario__last_name }}</option>
                       </select>
                        <span v-for="error in errors.autoriza" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Motivo de pago:</label>
                       <div class="col-sm-8">
                        <select id="motivo" v-model="solicitud.motivo" name="motivo" class="bs-select form-control" required="">
                              <option value="compra">Compra Venta o Suministro</option>
                              <option value="servicios">Servicios</option>
                        </select>
                        <span v-for="error in errors.motivo" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                       </div>
                      </div>

                     <div class="form-group row">
                      <label class="col-sm-3 col-form-label">Observación:</label>
                      <div class="col-sm-8">
                        <textarea type="text" class="form-control" name="observaciones" v-model="solicitud.observaciones" placeholder="Observación" style="height: 80px"></textarea>
                        <span v-for="error in errors.observaciones" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                     </div>

                     <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Concepto de pago:</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" name="concepto" v-model="solicitud.concepto" placeholder="Concepto de pago"></input>
                        <span v-for="error in errors.concepto" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                    </div>
           <div class="col-md-12">
              <div class="card">
              <div class="card-header">
                <h3 class="card-title">Documentos requeridos para el pago</h3>
                <div class="card-tools" style="margin: 0px">
                 <!-- <label >Disponible para pagar: <span class="badge badge-info" style="font-size: small;" id="disponible">0</span></label>-->
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">

                <div class="alert alert-danger alert-dismissible" id="error_factura" style="display: none;">
                   <i class="icon fas fa-ban"></i>
                  La factura <label id="referencia_error"></label> ya fue registrada para este proveedor en el año actual...
                </div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th style="text-align: center;">Facturas</th>
                      <th style="text-align: center;">Importe</th>
                      <th style="text-align: center;">Moneda</th>
                      <th style="text-align: center;">Fecha factura</th>
                      <th style="text-align: center;">Fecha recibida</th>
                      <th id="centro_costo_th" style="visibility: hidden;text-align: center;">Centro de Costo</th>
                      <th id="cuenta_th" style="visibility: hidden;text-align: center;">Tarea</th>
                      <th style="text-align: center;">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td style="width: auto"><input type="text" class="form-control" name="referencia" v-model="factura.referencia" id="factura_referencia" placeholder=""></td>
                      <td style="width: auto"><input type="text" class="form-control" name="impo" v-model="factura.importe" id="factura_importe" placeholder="0.00" min="0"></td>
                      <td style="width: auto"><select id="moneda_factura" v-model="factura.moneda" name="mon" required="" class="bs-select form-control">
                              <option value="CUP">CUP</option>
                              <option value="USD">USD</option>
                       </select>
                      </td>
                      <td style="width: auto"><input type="date" class="form-control" v-model="factura.fecha_factura" placeholder="" id="factura_fecha_factura"></td>
                       <td style="width: auto"><input type="date" class="form-control" v-model="factura.fecha" placeholder="" id="factura_fecha"></td>
                      <td style="width: 20%;visibility: hidden;" id="centro_costo_select2" ><select id="cc_factura"  v-model="factura.centro_costo" class="bs-select form-control">
                      <option  v-for="opt in listado_centros_costo_no_multiples" v-bind:value="opt.id">{{opt.descripcion}}</option>
                       </select>
                      </td>
                      <td style="width: 20%;visibility: hidden;" id="cuenta_select2" ><select id="cuenta_factura"  v-model="factura.cuenta" class="bs-select form-control">
                      <option  v-for="opt in listado_cuentas_facturas" v-bind:value="opt.id">{{opt.descripcion}}</option>
                       </select>
                      </td>
                      <td style="width: auto;display: block ruby;">
                        <a class="btn btn-primary" v-on:click.prevent="adicionar_factura()"><i class="fa fa-plus"></i> Adicionar factura</a>
                      </td>
                    </tr>
                    <tr v-for="(fact,index) in solicitud.facturas">
                    <td>{{fact.referencia}}</td>
                    <td>{{fact.importe}}</td>
                    <td>{{fact.moneda}}</td>
                    <td>{{fact.fecha_factura}}</td>
                    <td>{{fact.fecha}}</td>
                    <td>{{fact.centro_costo__descripcion}}</td>
                    <td>{{fact.cuenta__descripcion}}</td>
                    <td style="">
                      <button class="btn btn-xs btn-warning" v-on:click.prevent="editar_factura(index)" style="color:white"><i class="fa fa-edit"></i> Editar</button>
                      <button class="btn btn-xs btn-danger" v-on:click.prevent="eliminar_factura(index)"><i class="fa fa-trash"></i> Eliminar</button>
                    </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->


            <!-- /.card -->
            <!-- /.card -->

            <!-- /.card -->
          </div>

                  </div>
                  <div class="card-footer">
                  <!--
                  <button v-on:click.prevent="crear()" class="btn btn-success float-right" style="margin-left: 10px"><i class="fa fa-check"></i> Crear solicitud</button>
                  -->
                  <button type="submit" class="btn btn-primary float-right" style="margin-left: 10px"><i class="fa fa-save"></i> Actualizar solicitud</button>
                  <a v-on:click.prevent="descargar_anexo()" class="btn btn-warning float-right" style="margin-left: 10px;color: white"><i class="fa fa-download"></i> Anexo 3</a>
                  <a class="btn btn-default float-right" href="#/solicitante_inicio"><i class="fa fa-arrow-left"></i> Atrás</a>
                  </div>
                  </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

                  </div>

                </div>
              </div>
              <!-- /.card -->
            </div>
          </div>
</div>

<form method="POST" v-on:submit.prevent="actualizar_factura()">
      <div class="modal fade" id="modal_editar_factura">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Editar factura</h4>
            </div>
            <div class="modal-body">
              <div class="alert alert-danger alert-dismissible" id="error_factura_editar" style="display: none;">
                   <i class="icon fas fa-ban"></i>
                  La factura <label id="referencia_error_editar"></label> ya fue registrada para este proveedor en el año actual...
              </div>
              <table class="table table-bordered">
                  <thead>
                    <tr>
                    <th style="text-align: center;">Factura</th>
                      <th style="text-align: center;">Importe</th>
                      <th style="text-align: center;">Moneda</th>
                      <th style="text-align: center;">Fecha factura</th>
                      <th style="text-align: center;">Fecha recibida</th>
                      <th style="text-align: center;" id="centro_costo_th_editar">Centro de Costo</th>
                      <th style="text-align: center;" id="cuenta_th_editar">Tarea</th>
                    </tr>
                  </thead>
                  <tbody>
                     <tr>
                      <td style="width: 15%"><input type="text" class="form-control" name="referencia" v-model="factura_editar.referencia" placeholder=""></td>
                      <td style="width: 15%"><input type="text" class="form-control" name="impo" v-model="factura_editar.importe"  placeholder="0.00" min="0"></td>
                      <td style="width: 15%">
                        <select id="moneda_factura_editar" v-model="factura_editar.moneda" name="mon" required="" class="bs-select form-control"><option value="CUP">CUP</option>
                       </select>
                      </td>
                      <td style="width: 15%"><input type="date" class="form-control" v-model="factura_editar.fecha_factura"  placeholder="" id="factura_editar_fecha_factura"></td>
                      <td style="width: 15%"><input type="date" class="form-control" v-model="factura_editar.fecha"  placeholder="" id="factura_editar_fecha"></td>
                      <td style="width: 40%" id="centro_costo_select2_editar"><select id="cc_factura_editar" v-model="factura_editar.centro_costo__id" name="centro_costo"  class="bs-select form-control">
                          <option v-for="opt in listado_centros_costo_no_multiples" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                      </td>
                      <td style="width: 40%" id="cuenta_select2_editar"><select id="cuenta_factura_editar" v-model="factura_editar.cuenta_tarea__id" name="centro_costo"  class="bs-select form-control">
                          <option v-for="opt in listado_cuentas_facturas" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                      </td>
                    </tr>
                  </tbody>
                </table>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Actualizar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
</form>
  </div>
</template>

<script>
module.exports = {

  created: function(){
        var date=new Date();
        this.year=date.getFullYear();
        this.get_lista_facturas();
  },
  data(){
   return{
    url:'https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/',
    solicitud:{
    	   id:this.$route.params.id_solicitud,
         creada:'',
         referencia:'',
         tipo:'',
         division_territorial:'',
         departamento:'',
         estado:'',
         tcp:'',
         moneda:'',
         importe:'',
         concepto:'',
         cuenta:'',
         centro_costo:'',
         contrato:'',
         suplemento:'',
         observaciones:'',
         solicita:'',
         autoriza:'',
         motivo:'',
         permitir:'',
         facturas:[],
         numero_solicitud:'',
         fecha_instrumento:'',
         titular:'',
         cuenta_bancaria:'',
         poliza_creada:''
    },
     x:{
     referencia:'',
     tcp:'',
    },
    factura:{
     referencia:'',
     solicitud:'',
     moneda:'',
     importe:'',
     fecha:'',
     fecha_factura:'',
     dias:'',
     centro_costo__id:0,
     centro_costo__descripcion:'',
     cuenta_tarea__id:0,
     cuenta_tarea__descripcion:''
    },
    factura_editar:{
     index:'', 
     referencia:'',
     moneda:'',
     importe:'',
     fecha:'',
     fecha_factura:'',
     dias:'',
     centro_costo__id:0,
     centro_costo__descripcion:'',
     cuenta_tarea__id:0,
     cuenta_tarea__descripcion:''
    },
    trabajador:{
         id:'',
         division_territorial:'',
         usuario:'',
         rol:'',
         cargo:'',
         firma:'',
         firma_actual:''
    },
    errors:[],
    errors_editar:[],
    errors_trabajador:[],
    lista_solicitudes:[],
    listado_tcp:[],
    listado_contratos:[],
    listado_suplementos:[],
    listado_cuentas:[],
    listado_cuentas_facturas:[],
    listado_centros_costo:[],
    listado_centros_costo_no_multiples:[],
    listado_autorizados:[],
    listado_titulares_tcp:[],
    listado_cuentas_tcp:[],
    listado_tipo_pago:[],
    multiple:'',
    multiple_varias:'',
    pagado:0,
    maximo:0,
    disponible:0,
    cantidad_solicitudes:0,
    cantidad_facturas:0,
    year:'',
    year_buscar:'',
  }   
  },
  methods: {
    buscar:function(){
    this.year=this.year_buscar;
     
   },
    descargar_anexo:function(){
     window.open(this.url+'sistema/anexo3/'+this.solicitud.id+'/','Modelo',"fullscreen=YES");
    },
    crear:function(){
     this.solicitud.importe=this.solicitud.facturas.reduce((acc, curr) => acc + parseFloat(curr.importe), 0);
     
     if(this.solicitud.importe < 0 /*this.disponible*/){
       toastr.error('El importe de la solicitud no puede ser 0...');
     }
     else{ 
     var url=this.url+'sistema/adicionar_nuevamente/';
     var date = new Date();
     this.solicitud.creada=date.getFullYear();
     this.solicitud.estado='pendiente instrumento'
     axios.post(url,this.solicitud).then(response => {         
        //this.limpiar();
        this.errors=[];       
        toastr.success('Operación exitosa.');
        this.maximo=0;
        this.pagado=0;
        this.disponible=0;
        this.solicitud.facturas=[];
        window.open(this.url+'sistema/anexo3/'+response.data+'/','Modelo',"fullscreen=YES");
        //this.get_lista_solicitudes();
        window.location='#/solicitante_inicio';
        
    }).catch(error => {  
        this.errors=error.response.data.error;
        toastr.error('Existen errores.');
    });    
    }    
    },
     adicionar_factura:function(){
     var x=0;
     if(this.multiple!='Múltiples con facturas repetidas'){
     for (var i = 0; i < this.solicitud.facturas.length; i++) {
         if(this.solicitud.facturas[i].referencia==this.factura.referencia)
         x++;
      }
     } 
     var url=this.url+'sistema/factura_repetida/'+this.year+'/';
     this.x.referencia=this.factura.referencia;
     this.x.tcp=this.solicitud.tcp;
         axios.post(url,this.x).then(response => {
     if((response.data=='None' && x==0) || this.multiple=='Múltiples con facturas repetidas'){
      if(this.factura.importe!='' && this.factura.referencia!='' && this.factura.moneda!='' && this.factura.fecha!='' && this.factura.fecha_factura!=''){
     var date = new Date();
     var day1 = new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate());
     array=(this.factura.fecha).split('-');
     var day2 = new Date(array[0]+'/'+array[1]+'/'+array[2]);
     var difference= Math.abs(day1-day2);
     days = (difference/(1000 * 3600 * 24)).toFixed(0);
     
     this.factura.dias=days; 
     this.solicitud.facturas.push({...this.factura});
     this.factura.importe='';
     this.factura.referencia='';
     this.factura.fecha='';
     this.factura.fecha_factura='';
     this.factura.dias='';
     toastr.success('Operación exitosa');
     if(days>30){
     this.solicitud.permitir='No';      
     toastr.info('La fecha de la factura tiene más de 30 días de atraso, debe notificar a su jefe autorizado para poder imprimirla...');
     }
     document.getElementById("error_factura").style.display = "none";
     } 
     else{
     toastr.error('Debe llenar todos los campos de la factura...');
     }
     }
     else{
      document.getElementById("error_factura").style.display = "block";
      $('#referencia_error').text("'"+this.factura.referencia+"'");
     }
 
     });
     
      
    },
    eliminar_factura:function(index){
     this.solicitud.facturas.splice(index,1); 
     toastr.success('Operación exitosa'); 
    },
    editar_factura:function(index){
     x=this.solicitud.facturas[index];
     $('#modal_editar_factura').modal('show');
     this.factura_editar.index=index;
     this.factura_editar.referencia=x.referencia;
     this.factura_editar.importe=x.importe;
     this.factura_editar.moneda=x.moneda;
     this.factura_editar.fecha=x.fecha;
     this.factura_editar.fecha_factura=x.fecha_factura;
     $("#moneda_factura_editar").val(x.moneda).trigger('change');
     if(x.centro_costo__id!=undefined){
     this.factura_editar.centro_costo__id=x.centro_costo__id;
     $("#cc_factura_editar").val(x.centro_costo__id).trigger('change'); 
     }
     else
     this.factura_editar.centro_costo__id=0;
     if(x.cuenta_tarea__id!=undefined){
     this.factura_editar.cuenta_tarea__id=x.cuenta_tarea__id;
     $("#cuenta_factura_editar").val(x.cuenta_tarea__id).trigger('change'); 
     }
     else
     this.factura_editar.cuenta_tarea__id=0;
    },
    actualizar_factura:function(){
     var x=0; 
     index=this.factura_editar.index;
     var auxiliar=this.solicitud.facturas[index].referencia;
     this.solicitud.facturas[index].referencia=this.factura_editar.referencia;
     for (var i = 0; i < this.solicitud.facturas.length; i++) {
         if(this.solicitud.facturas[i].referencia==this.factura_editar.referencia)
         x++;
     }
     if(x==1 || this.multiple=='Múltiples con facturas repetidas'){
     var url=this.url+'sistema/factura_repetida/'+this.year+'/';
     this.x.referencia=this.factura_editar.referencia;
     this.x.tcp=this.solicitud.tcp;
         axios.post(url,this.x).then(response => {
     if(response.data=='None' || x==1 || this.multiple=='Múltiples con facturas repetidas'){
     if(this.factura_editar.importe!='' && this.factura_editar.referencia!='' && this.factura_editar.moneda!='' && this.factura_editar.fecha!='' && this.factura_editar.fecha_factura!=''){

     var date = new Date();
     var day1 = new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate());
     array=(this.factura_editar.fecha).split('-');
     var day2 = new Date(array[0]+'/'+array[1]+'/'+array[2]);
     var difference= Math.abs(day1-day2);
     days = (difference/(1000 * 3600 * 24)).toFixed(0);

     this.solicitud.facturas[index].dias=days;
     this.solicitud.facturas[index].referencia=this.factura_editar.referencia;
     this.solicitud.facturas[index].moneda=this.factura_editar.moneda;
     this.solicitud.facturas[index].importe=this.factura_editar.importe;
     this.solicitud.facturas[index].fecha=this.factura_editar.fecha;
     this.solicitud.facturas[index].fecha_factura=this.factura_editar.fecha_factura;
     if(this.factura_editar.centro_costo__id!=undefined){
     this.solicitud.facturas[index].centro_costo__id=this.factura_editar.centro_costo__id;
     }
     else{
     this.solicitud.facturas[index].centro_costo__id=0; 
     }
     this.solicitud.facturas[index].centro_costo__descripcion=this.factura_editar.centro_costo__descripcion;
     if(this.factura_editar.cuenta_tarea__id!=undefined){
     this.solicitud.facturas[index].cuenta_tarea__id=this.factura_editar.cuenta_tarea__id;
     }
     else{
     this.solicitud.facturas[index].cuenta_tarea__id=0; 
     }
     this.solicitud.facturas[index].cuenta_tarea__descripcion=this.factura_editar.cuenta_tarea__descripcion;
     toastr.success('Operación exitosa...'); 
     if(days>30){
     this.solicitud.permitir='No';
     toastr.info('La fecha de la factura tiene más de 30 días de atraso, debe notificar a su jefe autorizado para poder imprimirla...');
     }
     document.getElementById("error_factura_editar").style.display = "none";
     }
     else{
      toastr.error('Debe llenar todos los campos de la factura...');
     }
     }
     else{
      this.solicitud.facturas[index].referencia=auxiliar;
      document.getElementById("error_factura_editar").style.display = "block";
      $('#referencia_error_editar').text("'"+this.factura_editar.referencia+"'");
     }

    });
    }
    else{
      this.solicitud.facturas[index].referencia=auxiliar;
      document.getElementById("error_factura_editar").style.display = "block";
      $('#referencia_error_editar').text("'"+this.factura_editar.referencia+"'");
     }
    },
    onFileSelected:function(event){
     this.trabajador.firma=event.target.files[0];
    },
    get_editar:function(){
      this.errors=[];
      var url_editar=this.url+'sistema/detalles_solicitud/'+this.solicitud.id+'/';
      axios.get(url_editar).then(response => {
        
         this.solicitud.id=response.data.solicitud.id;
         this.solicitud.referencia=response.data.solicitud.referencia;
         this.solicitud.creada=response.data.creada;
         this.solicitud.estado=response.data.estado;
         this.solicitud.division_territorial=response.data.solicitud.division_territorial;
         this.solicitud.departamento=response.data.solicitud.departamento;
         this.solicitud.concepto=response.data.solicitud.concepto;
         this.solicitud.observaciones=response.data.solicitud.observaciones;
         this.solicitud.importe=response.data.solicitud.importe;
         this.solicitud.permitir=response.data.solicitud.permitir;
         this.solicitud.moneda=response.data.solicitud.moneda;
         this.solicitud.permitir=response.data.solicitud.permitir;
         this.solicitud.numero_solicitud=response.data.solicitud.numero_solicitud;
         this.solicitud.fecha_instrumento=response.data.solicitud.fecha_instrumento;
         this.solicitud.cuenta_bancaria=response.data.solicitud.cuenta_bancaria;
         this.solicitud.titular=response.data.solicitud.titular;
         this.solicitud.poliza_creada=response.data.solicitud.poliza_creada;
         
         $('#moneda').val(this.solicitud.moneda);
         $('#moneda').select2().trigger('change');
          
         this.solicitud.tipo=response.data.solicitud.tipo;
         
         //$('#tipo').val(response.data.solicitud.tipo);
         //$('#tipo').select2().trigger('change');
          
         this.solicitud.tcp=response.data.solicitud.tcp;
         //this.get_lista_tipo_pago(this.solicitud.tcp);

         //$('#tcp').val(response.data.solicitud.tcp);
         //$('#tcp').select2().trigger('change');

         var url_tcp=this.url+'sistema/cargar_tcps_editar/'+this.solicitud.tcp+'/';
         axios.get(url_tcp).then(response => {          
         this.listado_tcp=response.data;
         $('#tcp')
         .empty() //empty select
         .append($("<option/>") //add option tag in select
         .val(this.solicitud.tcp) //set value for option to post it
         .text(this.listado_tcp[0].nombre)) //set a text for show in select
         .val(this.solicitud.tcp) //select option of select2
         .trigger("change"); //apply to select2
         }).catch(error => {});

         this.get_lista_cargar_contratos_tcp(this.solicitud.tcp);
         this.cargar_pago_actual();

         this.solicitud.motivo=response.data.solicitud.motivo;
         $('#motivo').val(response.data.solicitud.motivo);
         $('#motivo').select2().trigger('change');

         this.solicitud.contrato=response.data.solicitud.contrato;
         this.get_lista_cargar_suplementos_contratos(this.solicitud.contrato);

         this.get_lista_cargar_cuentas_tcp(this.solicitud.tcp);
         this.get_lista_cargar_titular_tcp(this.solicitud.tcp);

         this.solicitud.suplemento=response.data.solicitud.suplemento;
         this.solicitud.cuenta=response.data.solicitud.cuenta;

         $('#cuenta').val(this.solicitud.cuenta);
         $('#cuenta').select2().trigger('change');

          x =$("#cuenta option:selected").text();
          if(x=='DESGLOSADO POR TAREAS'){
            $('#cuenta_th').css({
              "visibility":"visible"
            });
            $('#cuenta_select2').css({
              "visibility":"visible"
            });
            $('#cuenta_th_editar').css({
              "visibility":"visible"
            });
            $('#cuenta_select2_editar').css({
              "visibility":"visible"
            });
          }
          else{
            $('#cuenta_th').css({
              "visibility":"hidden"
            });
            $('#cuenta_select2').css({
              "visibility":"hidden"
            });
            $('#cuenta_th_editar').css({
              "visibility":"hidden"
            });
            $('#cuenta_select2_editar').css({
              "visibility":"hidden"
            });
          }

          this.solicitud.centro_costo=response.data.solicitud.centro_costo;
          $('#centro_costo').val(this.solicitud.centro_costo);
          $('#centro_costo').select2().trigger('change');
          this.multiple =$("#centro_costo option:selected").text();
          if(this.multiple=='Múltiples con facturas únicas' || this.multiple=='Múltiples con facturas repetidas'){
            $('#centro_costo_th').css({
              "visibility":"visible"
            });
            $('#centro_costo_select2').css({
              "visibility":"visible"
            });
            $('#centro_costo_th_editar').css({
              "visibility":"visible"
            });
            $('#centro_costo_select2_editar').css({
              "visibility":"visible"
            });
          }
          else{
            $('#centro_costo_th').css({
              "visibility":"hidden"
            });
            $('#centro_costo_select2').css({
              "visibility":"hidden"
            });
            $('#centro_costo_th_editar').css({
              "visibility":"hidden"
            });
            $('#centro_costo_select2_editar').css({
              "visibility":"hidden"
            });
          }

         this.solicitud.autoriza=response.data.solicitud.autoriza;
         $('#select_autoriza').val(this.solicitud.autoriza);
         $('#select_autoriza').select2().trigger('change');
      }).catch(error => {});
    },
    editar_solicitud:function(){
     if(this.solicitud.facturas.length>0){
     this.solicitud.importe=this.solicitud.facturas.reduce((acc, curr) => acc + parseFloat(curr.importe), 0);
     if(this.solicitud.importe<0/*this.disponible*/){
       toastr.error('El importe de la solicitud no puede ser menor que 0...');
     }
     else{
      this.solicitud.tipo=(this.solicitud.tipo).toLowerCase();
      var url=this.url+'sistema/editar_solicitud/'+this.solicitud.id+'/';
      axios.post(url,this.solicitud).then(response => {
      toastr.success('Operación exitosa.');
      this.errors=[];
      }).catch(error => {
        this.errors=error.response.data.error;
        toastr.error('Existen errores.');
      });
     }
     }
     else{
      toastr.warning('Debe adicionar una factura.');
     }
    },
    get_lista_tcp:function(dtar){      
      this.get_lista_cuentas(dtar);      
    },
    get_lista_facturas:function(){
      var url=this.url+'sistema/listado_factura/'+this.solicitud.id+'/';
      axios.get(url).then(response => {
      this.solicitud.facturas=response.data;
      }).catch(error => {});
    },
    get_lista_cuentas:function(dtar){
      var url=this.url+'sistema/cargar_cuentas_dtar/'+dtar+'/';
      axios.get(url).then(response => {
      this.listado_cuentas=response.data;
      this.get_lista_centros_costo(dtar);
      }).catch(error => {});
    },
    get_lista_cuentas_facturas:function(dtar){
      var url=this.url+'sistema/cargar_cuentas_facturas/'+dtar+'/';
      axios.get(url).then(response => {
      this.listado_cuentas_facturas=response.data;
      }).catch(error => {});
    },
    get_lista_centros_costo:function(dtar){
      var url=this.url+'sistema/cargar_centros_costo_dtar/'+dtar+'/';
      axios.get(url).then(response => {
      this.listado_centros_costo=response.data;
      this.get_cargar_autorizados(dtar);
      }).catch(error => {});
    },
    get_lista_centros_costo_no_multiples:function(dtar){
      var url=this.url+'sistema/costo_no_multiples/'+dtar+'/';
      axios.get(url).then(response =>{
      this.listado_centros_costo_no_multiples=response.data;
      }).catch(error => {});
    },
    get_lista_cargar_contratos_tcp:function(tcp){
      var url=this.url+'sistema/cargar_contratos_tcp/'+tcp+'/';
      axios.get(url).then(response => {
      this.listado_contratos=response.data;
      }).catch(error => {});
    },
    get_lista_cargar_suplementos_contratos:function(contrato){
      var url=this.url+'sistema/cargar_suplementos_contratos/'+contrato+'/';
      axios.get(url).then(response => {
      this.listado_suplementos=response.data;
      }).catch(error => {});
    },
    get_lista_cargar_cuentas_tcp:function(tcp){
      var url=this.url+'sistema/cargar_cuentas_tcp/'+tcp+'/';
      axios.get(url).then(response => {
      this.listado_cuentas_tcp=response.data;
      }).catch(error => {});
    },
    get_lista_cargar_titular_tcp:function(tcp){
      var url=this.url+'sistema/cargar_titular_tcp/'+tcp+'/';
      axios.get(url).then(response => {
      this.listado_titulares_tcp=response.data;
      }).catch(error => {});
    },
    get_lista_tipo_pago:function(tcp){
      var url=this.url+'sistema/cargar_tipo_pago_tcp/'+tcp+'/';
      axios.get(url).then(response =>{
      this.listado_tipo_pago=response.data;
      for (var i = 0; i < this.listado_tipo_pago.length; i++){
        if((this.listado_tipo_pago[i].nombre).toLowerCase()==(this.solicitud.tipo).toLowerCase()){
          $('#tipo').val(this.listado_tipo_pago[i].nombre);
          $('#tipo').select2().trigger('change');
        }
      }
      $
      }).catch(error => {});
    },
    get_cargar_autorizados:function(){
      var url=this.url+'sistema/cargar_autorizados/';
      axios.get(url).then(response => {
      this.listado_autorizados=response.data;
      this.get_editar();
      }).catch(error => {});
    },
    cargar_pago_actual:function(){
      var url=this.url+'sistema/cargar_pago_actual/'+this.solicitud.tcp+'/'+this.year+'/';
      axios.get(url).then(response => {
      if(response.data.length>0){
        //this.maximo=response.data[0].solicitud__tcp__importe_maximo;
        $('#maximo').text(this.maximo.toLocaleString('en-US', { minimumFractionDigits: 2}));
        this.pagado=response.data[0].pagado;
        $('#pagado').text(this.pagado.toLocaleString('en-US', { minimumFractionDigits: 2}));

        this.cantidad_solicitudes=response.data[0].solicitudes;
        this.cantidad_facturas=response.data[0].facturas;
        //this.disponible=this.maximo-this.pagado;
        $('#disponible').text(this.disponible.toLocaleString('en-US', { minimumFractionDigits: 2}));
      }
      else{
        this.pagado=0;
        $('#pagado').text(this.pagado.toLocaleString('en-US', { minimumFractionDigits: 2}));
        this.cantidad_solicitudes=0;
        this.cantidad_facturas=0;
        $('#disponible').text(this.disponible.toLocaleString('en-US', { minimumFractionDigits: 2}));
      }
      }).catch(error => {});
    },
  },
  mounted(){
    toastr.options = {
                 closeButton: true,
                 debug: false,
                 positionClass: 'toast-top-center',
                 onclick: null
    };
    vm=this;
    var date = new Date();
    var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());

    $('#factura_editar_fecha').attr('max',new Date().toISOString().split('T')[0]);
    $('#factura_fecha').attr('max', new Date().toISOString().split('T')[0]);
    $('#factura_editar_fecha_factura').attr('max',new Date().toISOString().split('T')[0]);
    $('#factura_fecha_factura').attr('max', new Date().toISOString().split('T')[0]);
    $('.bs-select').select2();


    var url=vm.url+'sistema/usuario/';
        axios.get(url).then(response => {

    vm.solicitud.solicita=response.data.trabajador_id;
    vm.solicitud.division_territorial=response.data.trabajador_dt;
    vm.solicitud.departamento=response.data.trabajador_departamento;
    vm.trabajador.id=response.data.trabajador_id;
    vm.trabajador.division_territorial=response.data.trabajador_dt;
    vm.trabajador.cargo=response.data.trabajador_cargo;
    vm.trabajador.rol=response.data.trabajador_rol;
    //vm.trabajador.firma_actual=response.data.trabajador_firma;
    vm.trabajador.usuario=response.data.trabajador_usuario;
    vm.get_lista_tcp(vm.solicitud.division_territorial);
    //vm.get_lista_cuentas(vm.solicitud.division_territorial);
    //vm.get_lista_centros_costo(vm.solicitud.division_territorial);
    vm.get_lista_centros_costo_no_multiples(vm.solicitud.division_territorial);
    vm.get_lista_cuentas_facturas(vm.solicitud.division_territorial);
    }).catch(error => {
        toastr.error('Existen errores.');
    });

      $('.bs-select').select2();
      $('#tipo').change(function (){
          vm.solicitud.tipo =$("#tipo option:selected").val();
      });
      $('#tipo_editar').change(function (){
          vm.solicitud_editar.tipo =$("#tipo_editar option:selected").val();
      });
      $('#moneda').change(function (){
          vm.solicitud.moneda =$("#moneda option:selected").val();
      });
      $('#titular').change(function (){
          vm.solicitud.titular =$("#titular option:selected").val();
      });
      $('#cuenta_bancaria').change(function (){
          vm.solicitud.cuenta_bancaria =$("#cuenta_bancaria option:selected").val();
      });
            $("#tcp").select2({
       placeholder: "Buscar por nombre...",
       language: {
        inputTooShort: function () {
        return 'Escriba más de 2 caracteres.';
        },
        "noResults": function(){
           return "No se encontraron resultados.";
       }
      },
    //tags: true,
    //multiple: true,
    // tokenSeparators: [',', ' '],
    minimumInputLength: 2,
    minimumResultsForSearch: 100,
    ajax: {
        url: vm.url+'sistema/cargar_tcps/',
        dataType: "json",
        type: "GET",
        data: function (params) {

            var queryParameters = {
                q: params.term
            }
            return queryParameters;
        },
        processResults: function (data) {
            vm.listado_tcp=data;
            return {
                results: $.map(data, function (item) {
                    return {
                        text: item.nombre,
                        id: item.id
                    }
                })
            };
        }
    }
    });
      $('#tcp').change(function (){
          vm.listado_contratos=[];
          vm.listado_suplementos=[];
          vm.listado_titulares_tcp = [];
          vm.listado_cuentas_tcp = [];
          vm.listado_tipo_pago=[];
          vm.solicitud.tcp =$("#tcp option:selected").val();
          // vm.disponible = vm.listado_tcp.find((e) => e.id == vm.solicitud.tcp).importe_maximo;
          vm.get_lista_cargar_contratos_tcp(vm.solicitud.tcp);
          vm.get_lista_cargar_suplementos_contratos(vm.solicitud.contrato);
          vm.get_lista_cargar_cuentas_tcp(vm.solicitud.tcp);
          vm.get_lista_cargar_titular_tcp(vm.solicitud.tcp);
          vm.get_lista_tipo_pago(vm.solicitud.tcp);
          vm.cargar_pago_actual();
      });
      $('#contrato').change(function (){
          vm.listado_suplementos=[];
          vm.solicitud.contrato =$("#contrato option:selected").val();
          vm.get_lista_cargar_suplementos_contratos(vm.solicitud.contrato);
      });
      $('#cuenta').change(function (){
          vm.solicitud.cuenta =$("#cuenta option:selected").val();
          x =$("#cuenta option:selected").text();
          if(x=='DESGLOSADO POR TAREAS'){
            $('#cuenta_th').css({
              "visibility":"visible"
            });
            $('#cuenta_select2').css({
              "visibility":"visible"
            });
            $('#cuenta_th_editar').css({
              "visibility":"visible"
            });
            $('#cuenta_select2_editar').css({
              "visibility":"visible"
            });
          }
          else{
            $('#cuenta_th').css({
              "visibility":"hidden"
            });
            $('#cuenta_select2').css({
              "visibility":"hidden"
            });
            $('#cuenta_th_editar').css({
              "visibility":"hidden"
            });
            $('#cuenta_select2_editar').css({
              "visibility":"hidden"
            });
          }
      });
      $('#centro_costo').change(function (){
          vm.solicitud.centro_costo =$("#centro_costo option:selected").val();
          vm.multiple =$("#centro_costo option:selected").text();
          if(vm.multiple=='Múltiples con facturas únicas' || vm.multiple=='Múltiples con facturas repetidas'){
            $('#centro_costo_th').css({
              "visibility":"visible"
            });
            $('#centro_costo_select2').css({
              "visibility":"visible"
            });
            $('#centro_costo_th_editar').css({
              "visibility":"visible"
            });
            $('#centro_costo_select2_editar').css({
              "visibility":"visible"
            });
          }
          else{
            $('#centro_costo_th').css({
              "visibility":"hidden"
            });
            $('#centro_costo_select2').css({
              "visibility":"hidden"
            });
            $('#centro_costo_th_editar').css({
              "visibility":"hidden"
            });
            $('#centro_costo_select2_editar').css({
              "visibility":"hidden"
            });
          }
      });
      $('#select_autoriza').change(function (){
          vm.solicitud.autoriza =$("#select_autoriza option:selected").val();
      });
      $('#moneda_factura').change(function (){
          vm.factura.moneda =$("#moneda_factura option:selected").val();
      });
      $('#moneda_factura_editar').change(function (){
          vm.factura_editar.moneda =$("#moneda_factura_editar option:selected").val();
      });
      $('#suplemento').change(function (){
          vm.solicitud.suplemento =$("#suplemento option:selected").val();
      });
      $('#motivo').change(function (){
          vm.solicitud.motivo =$("#motivo option:selected").val();
      });
      $('#cc_factura').change(function (){
          vm.factura.centro_costo__id = $("#cc_factura option:selected").val();
          vm.factura.centro_costo__descripcion = $("#cc_factura option:selected").text();
      });
      $('#cc_factura_editar').change(function (){
          vm.factura_editar.centro_costo__id =$("#cc_factura_editar option:selected").val();
          vm.factura_editar.centro_costo__descripcion = $("#cc_factura_editar option:selected").text();
      });
      $('#cuenta_factura').change(function (){
          vm.factura.cuenta_tarea__id = $("#cuenta_factura option:selected").val();
          vm.factura.cuenta_tarea__descripcion = $("#cuenta_factura option:selected").text();
      });
      $('#cuenta_factura_editar').change(function (){
          vm.factura_editar.cuenta_tarea__id =$("#cuenta_factura_editar option:selected").val();
          vm.factura_editar.cuenta_tarea__descripcion = $("#cuenta_factura_editar option:selected").text();
      });
  }
}
</script>