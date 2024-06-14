<template>
  <div>

  <div class="row">
      <div class="col-12" style="margin-top: 10px">
          <h4>Solicitudes de Pago / Proveedores</h4>
      </div>
  </div>

<div class="row">
          <div class="col-12 col-sm-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false"><i class="fa fa-list"></i> Listado de Proveedores </a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content" id="custom-tabs-four-tabContent">

            <div class="tab-pane fade show active" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              	<div class="row">
              	 <div id="botones" style="margin-bottom: 5px" class="col-sm-10">
                 </div>
                 <div id="botones" style="margin-bottom: 5px;text-align: right;" class="col-sm-2">
                	<a href="#/proveedor_adicionar" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Adicionar proveedor</a>
                 </div>
              	</div>

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
                  </tr>
                                   
                  <tr>                    
                    <th>ID</th>
                    <th>Acciones</th>
                    <th>Nombre</th>                
                    <th>Info</th>
                    <th>Estado</th>
                    <th>Importe Máximo</th>                 
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
<form method="POST" v-on:submit.prevent="eliminar_proveedor()">
<div class="modal fade" id="delete">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header btn-danger">                 
                <h4>¿Confirma la eliminación de este proveedor?</h4>
            </div>
            <div class="modal-body">
              <table class="table table-striped table-bordered table-hover">
              <thead>
              <tr>                
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Nombre</td>
                  <td id="nombre"> </td>
                </tr>
                  <td>Información</td>
                  <td id="info"> </td>
                </tr>
                <tr>
                  <td>Importe máximo</td>
                  <td id="importe_maximo"> </td>
                </tr>
                <tr>
                  <td>Estado</td>
                  <td id="estado"> </td>
                </tr>
              </tbody>               
              </table>              
             </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cancelar</button>  
              <button type="submit" class="btn btn-danger"><i class="fa fa-check"></i> Confirmar</button> 
            </div>
        </div>
    </div>
</div>
</form>           
  </div>
</template>

<script>
module.exports = {

  created: function(){
        this.get_lista_proveedores();
  },
  data(){
   return{
    lista_proveedores:[],
  }   
  },
  methods: {
    get_lista_proveedores:function(){
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/listado_tcp/';
      axios.get(url).then(response => {
      this.lista_proveedores=response.data;       
      this.tabla_proveedores_config();
      }).catch(error => {});
    },
    eliminar_proveedor: function() {
     var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/eliminar_tcp/'+localStorage.getItem('eliminar_proveedor')+'/';
         axios.delete(url).then(response => {
         this.get_lista_proveedores();          
         $('#delete').modal('hide');
         toastr.success('Eliminado correctamente');                   
        });
    },
    tabla_proveedores_config:function(){
     $("#tabla_solicitudes").DataTable({
      "bDestroy":true,
      "data":this.lista_proveedores,
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
              "defaultContent": '<div style="text-align: center"> <button class="btn btn-xs btn-primary" title="Editar" style="color: white"><i class="fa fa-edit"></i></button> <button class="btn btn-xs btn-danger" title="Eliminar" style="color: white"><i class="fa fa-trash"></i></button> </div>'
            },
            { "data": "nombre"},
            { "data": "info"},
            { "data": "estado"},
            { "data": "importe_maximo"},
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
                  columns: [2,3,4,5],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5],
                  rows: ':visible'
            } 
            },]
    }).buttons().container().prependTo('#botones');
         
    },
    filterColumn:function(i){

      $('#tabla_solicitudes').DataTable().column( i ).search( 
        $('#col'+i+'_filter').val()
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

         $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
           localStorage.setItem('eliminar_proveedor',data.id);
           $('#nombre').text(data.nombre);
           $("#info").text(data.info);
           $("#estado").text(data.estado);
           $("#importe_maximo").text(data.importe_maximo);
           $('#delete').modal('show');
       

      } );

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-primary', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        window.location='#/proveedor_editar/'+data.id;
        
      } );
 
    $('.bs-select').select2();

    $('input.column_filter').on( 'keyup click', function () {
        vm.filterColumn( $(this).parents('td').attr('data-column') );
    } );

    $(document).on('shown.bs.tab', 'a[data-toggle="pill"]', function(e) {
        e.stopPropagation();
        $.fn.dataTable.tables({
            visible: true,
            api: true
        }).columns.adjust();
    });
    
    
    $('.bs-select').select2();
           
  }
}
</script>
<style>
.text-sm .select2-container--default .select2-selection--single, select.form-control-sm ~ .select2-container--default .select2-selection--single {
    height: 32px !important;
}
</style>  