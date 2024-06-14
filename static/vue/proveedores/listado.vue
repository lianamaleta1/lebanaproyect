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
                  </tr>
                  <tr>
                     <th>ID</th>
                    <th>Nombre</th>
                    <th>Actividad</th>
                    <th>Estado</th>
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
<form method="POST" v-on:submit.prevent="eliminar_contrato()">
<div class="modal fade" id="delete">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <h4>¿Confirma la eliminación de este contrato?</h4>
            </div>
            <div class="modal-body">
              <table class="table table-striped table-bordered table-hover">
              <thead>
              <tr>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Descripción</td>
                  <td id="descripcion"> </td>
                </tr>
                  <td>Proveedor</td>
                  <td id="tcp"> </td>
                </tr>
                <tr>
                  <td>Fecha Vencimiento</td>
                  <td id="fecha"> </td>
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
      Notiflix.Loading.standard('Cargando...');
      var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/listado_tcp/';
      axios.get(url).then(response => {
      this.lista_proveedores=response.data;       
      this.tabla_proveedores_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
    },
    eliminar_contrato: function() {
     var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/eliminar_contrato/'+localStorage.getItem('eliminar_contrato')+'/';
         axios.delete(url).then(response => {
         this.get_lista_contratos();
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
            { "data": "nombre"},
            { "data": "info"},
            { "data": "estado"},
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
                  columns: [1,2,3,4],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [1,2,3,4],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [1,2,3,4],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [1,2,3,4],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [1,2,3,4],
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
    
           
  }
}
</script> 