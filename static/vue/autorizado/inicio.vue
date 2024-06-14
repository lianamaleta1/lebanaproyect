<template>
  <div>

  <div class="row">
      <div class="col-12" style="margin-top: 10px">
          <h4>Solicitudes de Pago</h4>
      </div>
  </div>

<div class="row">          
          <div class="col-12 col-sm-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                   
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false" v-on:click.prevent="get_lista_solicitudes()"><i class="fa fa-list"></i> Listado de Solicitudes </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-pagos-tab" data-toggle="pill" href="#custom-tabs-pagos" role="tab" aria-controls="custom-tabs-pagos" aria-selected="false" v-on:click.prevent="get_lista_total_pagos()"><i class="fa fa-list"></i> Listado Resumen de Pagos </a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-prom_users-tab" data-toggle="pill" href="#custom-tabs-prom_users" role="tab" aria-controls="custom-tabs-prom_users" aria-selected="false" v-on:click.prevent="get_lista_prom_users()"><i class="fa fa-list"></i> Listado Demora Promedio Usuarios </a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-prom_prov-tab" data-toggle="pill" href="#custom-tabs-prom_prov" role="tab" aria-controls="custom-tabs-prom_prov" aria-selected="false" v-on:click.prevent="get_lista_prom_prov()"><i class="fa fa-list"></i> Listado Demora Promedio Proveedores </a>
                  </li> 
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content" id="custom-tabs-four-tabContent">

            <div class="tab-pane fade show active" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado de solitudes {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones" style="margin-bottom: 5px"> </div>
                <table id="tabla_solicitudes" class="table table-bordered table-striped">                
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter form-control" style="width: 100%" id="col0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter form-control" style="width: 100%" id="col1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%"  id="col2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter  
                        form-control" style="width: 100%" id="col3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col4_filter"></td>                        
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter form-control" style="width: 100%" id="col6_filter"></td>                         
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter form-control" style="width: 100%" id="col7_filter"></td>                       
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%"  id="col8_filter"></td>                    
                        <td align="center" data-column="9"><input type="text" placeholder="" class="column_filter  
                        form-control" style="width: 100%" id="col9_filter"></td>                      
                        <td align="center" data-column="10"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col10_filter"></td>                        
                        <td align="center" data-column="11"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col11_filter"></td>
                        <td align="center" data-column="12"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col12_filter"></td>
                        <td align="center" data-column="13"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col13_filter"></td>
                        <td align="center" data-column="14"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col14_filter"></td>
                        <td align="center" data-column="15"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col15_filter"></td>
                        <td align="center" data-column="16"><input type="text" placeholder="" class="column_filter 
                        form-control" style="width: 100%" id="col16_filter"></td>
                        
                  </tr>
                                   
                  <tr>                    
                    <th>ID</th>
                    <th>Acciones</th>
                    <th>Referencia</th>                
                    <th>Creada</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th>Proveedor</th>
                    <th>Contrato</th>
                    <th>Suplemento</th>
                    <th>Importe</th>
                    <th>Cuenta/Tarea</th>
                    <th>Centro Costo</th>
                    <th>Solicita</th>
                    <th>Autoriza</th>
                    <th>Motivo</th>
                    <th>Concepto</th>
                    <th>Observaciones</th>                  
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                   
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                              <!-- /.card -->

            </div>
            <div class="tab-pane fade show" id="custom-tabs-pagos" role="tabpanel" aria-labelledby="custom-tabs-pagos-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado Total de Pagos {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_pagos()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones_pagos" style="margin-bottom: 5px"> </div>
                <table id="tabla_pagos" class="table table-bordered table-striped">                
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_pagos form-control" style="width: 100%" id="col_pagos_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_pagos form-control" style="width: 100%" id="col_pagos_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_5_filter"></td>                       
                  </tr>
                                   
                  <tr>
                    <th>ID</th> 
                    <th>Historial de facturas</th>                    
                    <th>Proveedor</th>
                    <th>Solicitudes</th>
                    <th>Facturas</th>
                    <th>Pagado</th>                    
                                                         
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                   
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                              <!-- /.card -->

            </div>

            <div class="tab-pane fade show" id="custom-tabs-prom_users" role="tabpanel" aria-labelledby="custom-tabs-prom_users-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado Demora Promedio Usuarios {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_prom_user()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones_prom_users" style="margin-bottom: 5px"> </div>
                <table id="tabla_prom_users" class="table table-bordered table-striped">                
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_prom_users form-control" style="width: 100%" id="col_prom_users_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_prom_users form-control" style="width: 100%" id="col_prom_users_1_filter"></td>
                        
                  </tr>
                                   
                  <tr>                    
                    <th>Usuario</th>
                    <th>Demora Promedio (días)</th>
                                  
                                       
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                   
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                              <!-- /.card -->

            </div>
           <div class="tab-pane fade show" id="custom-tabs-prom_prov" role="tabpanel" aria-labelledby="custom-tabs-prom_prov-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado Demora Promedio Proveedores {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_prom_prov()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones_prom_prov" style="margin-bottom: 5px"> </div>
                <table id="tabla_prom_prov" class="table table-bordered table-striped">                
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_prom_prov form-control" style="width: 100%" id="col_prom_prov_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_prom_prov form-control" style="width: 100%" id="col_prom_prov_1_filter"></td>                        
                  </tr>
                                   
                  <tr>                    
                    <th>Proveedor</th>
                    <th>Demora Promedio (días)</th>                
                                       
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                   
                </table>
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
<div class="modal fade right" id="modal_facturas" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    <div class="modal-dialog-full-width modal-dialog momodel modal-fluid" role="document">
        <div class="modal-content-full-width modal-content ">
            <div class=" modal-header-full-width   modal-header text-center">
                <h5 class="modal-title w-100" id="exampleModalPreviewLabel"> <label class="float-left">Solicitudes de Pago</label> Historial de Facturas --- ({{year}})</h5>
                <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                    <span style="font-size: 1.3em;" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               <div id="botones_historial" style="margin-bottom: 5px"> </div>
                <table id="tabla_historial" class="table table-bordered table-striped">                
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_0_filter"></td> 
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_2_filter"></td> 
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_4_filter"></td> 
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_6_filter"></td> 
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_historial 
                        form-control" style="width: 100%"  id="col_historial_8_filter"></td>                        
                  </tr>                                   
                  <tr>
                    
                    <th>Proveedor</th>                    
                    <th>Solicitante</th>
                    <th>Observaciones</th>
                    <th>Solicitud</th> 
                    <th>Factura</th>
                    <th>Centro Costo</th>                    
                    <th>Importe</th>
                    <th>Moneda</th>
                    <th>Fecha Factura</th>                                   
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                   
                </table>
            </div>
            <div class="modal-footer-full-width  modal-footer">
                <button type="button" class="btn btn-danger btn-md btn-rounded" data-dismiss="modal"><i class="fa fa-times"></i> Cerrar</button>
            </div>
        </div>
    </div>
</div>
    
      </div>           
  </div>
</template>

<script>
module.exports = {

  created: function(){
        var date=new Date();
        this.year=date.getFullYear();
        this.get_lista_solicitudes(); 

  },
  data(){
   return{
    trabajador:{
         id:'',
         division_territorial:'',
         usuario:'',
         rol:'',
         cargo:'',
         firma:'',
         firma_actual:''
    },
    lista_solicitudes:[],
    lista_pagos:[],
    lista_prom_users:[],
    lista_prom_prov:[],
    lista_historial:[],
    year:'',
    year_buscar:'',
  }   
  },
  methods: {
    buscar:function(){
    this.year=this.year_buscar;
    this.get_lista_solicitudes();
   },
   buscar_pagos:function(){
    this.year=this.year_buscar;
    this.get_lista_total_pagos();
   },
   buscar_prom_user:function(){
    this.year=this.year_buscar;
    this.get_lista_prom_users();
   },
   buscar_prom_prov:function(){
    this.year=this.year_buscar;
    this.get_lista_prom_prov();
   },
    get_lista_solicitudes:function(){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/listado_solicitud_autorizado/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_solicitudes=response.data;
       
      this.tabla_solicitudes_config();
      }).catch(error => {});
    },
    get_lista_total_pagos:function(){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/cargar_tcp_estado_actual/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_pagos=response.data;
       
      this.tabla_pagos_config();
      }).catch(error => {});
    },
    get_lista_prom_users:function(){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/demora_promedio_usuarios/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_prom_users=response.data;       
      this.tabla_prom_users_config();
      }).catch(error => {});
    },
    get_lista_prom_prov:function(){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/demora_promedio_proveedores/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_prom_prov=response.data;       
      this.tabla_prom_prov_config();
      }).catch(error => {});
    },
    tabla_solicitudes_config:function(){
     $("#tabla_solicitudes").DataTable({
      "bDestroy":true,
      "data":this.lista_solicitudes,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [ 0],
                  "visible": false,
                  "searchable": false, 
                 }
      ],
      "columns": [
            { "data": "id" },
            { "data": null,
              "render": function (data, type, row) {
                           if(row['permitir']=='No'){
                            return '<div style="text-align: center"><button class="btn btn-xs btn-warning" title="Descargar Modelo" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-info" title="Permitir impresión" style="color: white"><i class="fa fa-check"></i></button></div>';
                           }
                           else{
                            return '<div style="text-align: center"><button class="btn btn-xs btn-warning" title="Descargar Modelo" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-danger" title="Bloquear impresión" style="color: white"><i class="fa fa-times"></i></button></div>';
                           }
                        }
            },
            { "data": "referencia" },
            { "data": "creada", 
              "render": function (data, type, row) {
                            return (row['creada']).replace('T',' ');
                        } 
            },
            { "data": "tipo" },
            { "data": "estado"},
            { "data": "tcp__nombre" },
            { "data": "contrato__descripcion" },
            { "data": "suplemento__descripcion" },
            { "data": "importe", 
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},                        
            { "data": "cuenta__descripcion" },
            { "data": "centro_costo__descripcion" },
            { "data": "solicita__usuario__username" }, 
            { "data": "autoriza__usuario__username" },
            { "data": "motivo" },
            { "data": "concepto" },
            { "data": "observaciones" },
      ],
      "processing": true,
      "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "Todos"] // change per page values here
            ],
      "pageLength": -1,  
      "pagingType": "full_numbers",
      "language": {
                "search": "",
                "sSearchPlaceholder":'Buscar',
                "lengthMenu": "_MENU_",
                "paginate": {
                    "previous":"Anterior",
                    "next": "Siguiente",
                    "last": "Última",
                    "first": "Primera"
                },
                "emptyTable": "No hay registros disponibles",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "infoEmpty": "No se encontraron resultados",
                "zeroRecords": "No se encontraron resultados"
            },         
      "responsive": false, "lengthChange": true, "autoWidth": false,"scrollX": true,
      /*"select": {
            style: "multi"
        },
      */
      "buttons": [
            {
                extend: "copy",
                footer: true,
                title: 'Copiado',
                text:'<span class="fa fa-copy"></span> Copiar',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones');
         
    },
    tabla_pagos_config:function(){
     $("#tabla_pagos").DataTable({
      "bDestroy":true,
      "data":this.lista_pagos,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [ 0],
                  "visible": false,
                  "searchable": false, 
                 }
      ],
      "columns": [
            {"data":"solicitud__tcp__id"},        
            { "data": null,
               "render":function (data, type, row) {
                          return '<div style="text-align: center"><button class="btn btn-xs btn-primary" title="Historial de facturas" style="color: white"><i class="fa fa-eye"></i></div>';
               }
            },
            { "data": "solicitud__tcp__nombre"},
            { "data": "solicitudes"},
            { "data": "facturas"},
            
            { "data": "pagado", 
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
            /*
            { "data": null,
               "render":function (data, type, row) {
                          return (row['solicitud__tcp__importe_maximo']-row['pagado']).toLocaleString('en-US', { minimumFractionDigits: 2});
               }
            },
            { "data": "solicitud__tcp__importe_maximo", 
                   render: $.fn.dataTable.render.number( ',', '.', 2, '' ) },*/
      ],
      "processing": true,
      "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "Todos"] // change per page values here
            ],
      "pageLength": -1,  
      "pagingType": "full_numbers",
      "language": {
                "search": "",
                "sSearchPlaceholder":'Buscar',
                "lengthMenu": "_MENU_",
                "paginate": {
                    "previous":"Anterior",
                    "next": "Siguiente",
                    "last": "Última",
                    "first": "Primera"
                },
                "emptyTable": "No hay registros disponibles",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "infoEmpty": "No se encontraron resultados",
                "zeroRecords": "No se encontraron resultados"
            },         
      "responsive": false, "lengthChange": true, "autoWidth": false,"scrollX": true,
      /*"select": {
            style: "multi"
        },
      */
      "buttons": [
            {
                extend: "copy",
                footer: true,
                title: 'Copiado',
                text:'<span class="fa fa-copy"></span> Copiar',
                exportOptions: {
                  columns: [2,3,4,5,6,7],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones_pagos');
         
    },
    tabla_prom_users_config:function(){
     $("#tabla_prom_users").DataTable({
      "bDestroy":true,
      "data":this.lista_prom_users,
      "responsive": true,
      "order": [],
      "columns": [
            { "data": "solicitud__solicita__usuario__username" },
            { "data": "demora"},
      ],
      "processing": true,
      "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "Todos"] // change per page values here
            ],
      "pageLength": -1,  
      "pagingType": "full_numbers",
      "language": {
                "search": "",
                "sSearchPlaceholder":'Buscar',
                "lengthMenu": "_MENU_",
                "paginate": {
                    "previous":"Anterior",
                    "next": "Siguiente",
                    "last": "Última",
                    "first": "Primera"
                },
                "emptyTable": "No hay registros disponibles",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "infoEmpty": "No se encontraron resultados",
                "zeroRecords": "No se encontraron resultados"
            },         
      "responsive": false, "lengthChange": true, "autoWidth": false,"scrollX": true,
      /*"select": {
            style: "multi"
        },
      */
      "buttons": [
            {
                extend: "copy",
                footer: true,
                title: 'Copiado',
                text:'<span class="fa fa-copy"></span> Copiar',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones_prom_users');
         
    },
    tabla_prom_prov_config:function(){
     $("#tabla_prom_prov").DataTable({
      "bDestroy":true,
      "data":this.lista_prom_prov,
      "responsive": true,
      "order": [],
      "columns": [
            { "data": "solicitud__tcp__nombre" },
            { "data": "demora"},
      ],
      "processing": true,
      "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "Todos"] // change per page values here
            ],
      "pageLength": -1,  
      "pagingType": "full_numbers",
      "language": {
                "search": "",
                "sSearchPlaceholder":'Buscar',
                "lengthMenu": "_MENU_",
                "paginate": {
                    "previous":"Anterior",
                    "next": "Siguiente",
                    "last": "Última",
                    "first": "Primera"
                },
                "emptyTable": "No hay registros disponibles",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "infoEmpty": "No se encontraron resultados",
                "zeroRecords": "No se encontraron resultados"
            },         
      "responsive": false, "lengthChange": true, "autoWidth": false,"scrollX": true,
      /*"select": {
            style: "multi"
        },
      */
      "buttons": [
            {
                extend: "copy",
                footer: true,
                title: 'Copiado',
                text:'<span class="fa fa-copy"></span> Copiar',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones_prom_prov');
         
    }, 
    tabla_historial_config:function(){
     $("#tabla_historial").DataTable({
      "bDestroy":true,
      "data":this.lista_historial,
      "responsive": false,
      "order": [],
      "columns": [
           
            { "data": "solicitud__tcp__nombre" },
            { "data": "solicitud__solicita__usuario__username" },
            { "data": "solicitud__observaciones" },
            { "data": "solicitud__referencia" },
            { "data": "referencia" },
            { "data": "centro_costo__descripcion" },
            { "data": "importe" },
            { "data": "moneda" },
            { "data": "fecha" }
      ],
      "processing": true,
      "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "Todos"] // change per page values here
            ],
      "pageLength": -1,  
      "pagingType": "full_numbers",
      "language": {
                "search": "",
                "sSearchPlaceholder":'Buscar',
                "lengthMenu": "_MENU_",
                "paginate": {
                    "previous":"Anterior",
                    "next": "Siguiente",
                    "last": "Última",
                    "first": "Primera"
                },
                "emptyTable": "No hay registros disponibles",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "infoEmpty": "No se encontraron resultados",
                "zeroRecords": "No se encontraron resultados"
            },         
      "responsive": false, "lengthChange": true, "autoWidth": false,"scrollX": true,
      /*"select": {
            style: "multi"
        },
      */
      "buttons": [
            {
                extend: "copy",
                footer: true,
                title: 'Copiado',
                text:'<span class="fa fa-copy"></span> Copiar',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [0,1],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones_historial');
        $('#modal_facturas').on('shown.bs.modal', function () {
        var table = $('#tabla_historial').DataTable();
        table.columns.adjust();
        });   
    },
    filterColumn:function(i){

      $('#tabla_solicitudes').DataTable().column( i ).search( 
        $('#col'+i+'_filter').val()
      ).draw();
     
    },
    filterColumn_pagos:function(i){

      $('#tabla_pagos').DataTable().column( i ).search( 
        $('#col_pagos_'+i+'_filter').val()
      ).draw();
     
    },
    filterColumn_prom_users:function(i){

      $('#tabla_prom_users').DataTable().column( i ).search( 
        $('#col_prom_users_'+i+'_filter').val()
      ).draw();
     
    },
    filterColumn_prom_prov:function(i){

      $('#tabla_prom_prov').DataTable().column( i ).search( 
        $('#col_prom_prov_'+i+'_filter').val()
      ).draw();
     
    },
    filterColumn_historial:function(i){

      $('#tabla_historial').DataTable().column( i ).search( 
        $('#col_historial_'+i+'_filter').val()
      ).draw();
     
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
    
    $('.bs-select').select2();
 
    var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/usuario/';
        axios.get(url).then(response => {
    
    
    vm.trabajador.id=response.data.trabajador_id;
    vm.trabajador.division_territorial=response.data.trabajador_dt;
    vm.trabajador.cargo=response.data.trabajador_cargo;
    vm.trabajador.rol=response.data.trabajador_rol;
    //vm.trabajador.firma_actual=response.data.trabajador_firma;
    vm.trabajador.usuario=response.data.trabajador_usuario;
    }).catch(error => {
        toastr.error('Existen errores.');
    });

    $('input.column_filter').on( 'keyup click', function () {
        vm.filterColumn( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_pagos').on( 'keyup click', function () {
        vm.filterColumn_pagos( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_prom_users').on( 'keyup click', function () {
        vm.filterColumn_prom_users( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_prom_prov').on( 'keyup click', function () {
        vm.filterColumn_prom_prov( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_historial').on( 'keyup click', function () {
        vm.filterColumn_historial( $(this).parents('td').attr('data-column') );
    } );

    $(document).on('shown.bs.tab', 'a[data-toggle="pill"]', function(e){
        e.stopPropagation();
        $.fn.dataTable.tables({
            visible: true,
            api: true
        }).columns.adjust();
    });
    
    $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open('https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/anexo3/'+data.id+'/','TICKET',"fullscreen=YES");
     });

    $('#tabla_pagos').on('click','tbody tr .btn-primary', function() {

        tablee=$('#tabla_pagos').DataTable();

        var data = tablee.row( $(this).parents('tr') ).data();
        var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/resumen_facturas/'+data.solicitud__tcp__id+'/'+vm.year+'/';
        axios.get(url).then(response => {
        vm.lista_historial=response.data;       
        vm.tabla_historial_config();

        $('#modal_facturas').modal('show');
      }).catch(error => {});
        
     });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-info', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/permitir/'+data.id+'/';
        axios.get(url).then(response => {
          vm.get_lista_solicitudes();
        }).catch(error => {}); 

     });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/permitir/'+data.id+'/';
        axios.get(url).then(response => {
          vm.get_lista_solicitudes();
        }).catch(error => {}); 

     });    
    
    $('.bs-select').select2();
           
  }
}
</script>
<style>
.text-sm .select2-container--default .select2-selection--single, select.form-control-sm ~ .select2-container--default .select2-selection--single {
    height: 32px !important;
}
.modal-dialog-full-width {
        width: 100% !important;
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        max-width:none !important;

}
.modal-content-full-width  {
        height: auto !important;
        min-height: 100% !important;
        border-radius: 0 !important;
        background-color: #fff !important 
}

.modal-header-full-width  {
        border-bottom: 1px solid #9ea2a2 !important;
}

.modal-footer-full-width  {
        border-top: 1px solid #9ea2a2 !important;
}
</style>