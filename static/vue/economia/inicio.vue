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
                  <!--
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false" v-on:click.prevent="get_lista_solicitudes()"><i class="fa fa-list"></i> Solicitudes Pendientes Entrada <span class="badge badge-primary">{{lista_solicitudes.length}}</span></a>
                  </li>
                  -->
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-pagos-tab" data-toggle="pill" href="#custom-tabs-pagos" role="tab" aria-controls="custom-tabs-pagos" aria-selected="false" v-on:click.prevent="get_lista_solicitudes_proceso()"><i class="fa fa-list"></i> Solicitudes Pendiente de Instrumento <span class="badge badge-primary">{{lista_solicitudes_proceso.length}}</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-prom_users-tab" data-toggle="pill" href="#custom-tabs-prom_users" role="tab" aria-controls="custom-tabs-prom_users" aria-selected="false" v-on:click.prevent="get_lista_instrumentos()"><i class="fa fa-list"></i> Instrumentos de Pago <!--<span class="badge badge-primary">{{listado_instrumentos.length}}</span>--></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-talonarios-tab" data-toggle="pill" href="#custom-tabs-talonarios" role="tab" aria-controls="custom-tabs-talonarios" aria-selected="false" v-on:click.prevent="get_lista_talonarios()"><i class="fa fa-list"></i> Talonarios </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-polizas-tab" data-toggle="pill" href="#custom-tabs-polizas" role="tab" aria-controls="custom-tabs-polizas" aria-selected="false" v-on:click.prevent="get_lista_polizas()"><i class="fa fa-list"></i> Pólizas </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-ordenes-tab" data-toggle="pill" href="#custom-tabs-ordenes" role="tab" aria-controls="custom-tabs-ordenes" aria-selected="false" v-on:click.prevent="get_lista_ordenes()"><i class="fa fa-list"></i> Órdenes de pago </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-estado_cuentas-tab" data-toggle="pill" href="#custom-tabs-estado_cuentas" role="tab" aria-controls="custom-tabs-estado_cuentas" aria-selected="false" v-on:click.prevent="get_listado_transito()"><i class="fa fa-list"></i> Estados de Cuentas</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-prom_prov-tab" data-toggle="pill" href="#custom-tabs-prom_prov" role="tab" aria-controls="custom-tabs-prom_prov" aria-selected="false" v-on:click.prevent="get_lista_prom_prov()"><i class="fa fa-list"></i> Pagos a TCP resumen ONAT </a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
           <div class="tab-content" id="custom-tabs-four-tabContent">
            <div class="tab-pane fade show" id="custom-tabs-estado_cuentas" role="tabpanel" aria-labelledby="custom-tabs-estado_cuentas-tab">
            <div class="card card-primary">
              <div class="card-header">
              <h3 class="card-title"><i class="fa fa-list"></i> Estados de Cuentas Bancarias</h3>               
              </div>
              <div class="card-body">                
                <div id="botones_estado_cuentas" style="margin-bottom: 5px"> </div>
                <table id="tabla_estado_cuentas" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_estado_cuentas form-control" style="width: 100%" id="col_estado_cuentas_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_estado_cuentas form-control" style="width: 100%" id="col_estado_cuentas_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_estado_cuentas form-control" style="width: 100%" id="col_estado_cuentas_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_estado_cuentas form-control" style="width: 100%" id="col_estado_cuentas_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_estado_cuentas form-control" style="width: 100%" id="col_estado_cuentas_4_filter"></td>
                    </tr>
                  <tr>
                    <th>ID</th>
                    <th>Cuenta Bancaria</th>
                    <th>Saldo en Banco</th>
                    <th>Saldo en Libro</th>
                    <th>Tránsito</th>                                        
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            </div>
            <div class="tab-pane fade show" id="custom-tabs-talonarios" role="tabpanel" aria-labelledby="custom-tabs-talonarios-tab">
            <div class="card card-primary">
              <div class="card-header">
              <h3 class="card-title"><i class="fa fa-list"></i> Listado de talonarios {{year}}</h3>
               <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_talonarios()">Buscar</button>
                  </span>
                </div>
              </div>
              <div class="card-body">
                <button type="button" class="btn btn-primary btn-flat" v-on:click.prevent="modal_talonarios()" style="margin-bottom:5px"><i class="fa fa-plus"></i>  Adicionar talonarios</button>
                <div id="botones_talonarios" style="margin-bottom: 5px"> </div>
                <table id="tabla_talonarios" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_talonario form-control" style="width: 100%" id="col_talonario_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_talonario form-control" style="width: 100%" id="col_talonario_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_talonario
                        form-control" style="width: 100%"  id="col_talonario_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_talonario
                        form-control" style="width: 100%" id="col_talonario_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_talonario
                        form-control" style="width: 100%" id="col_talonario_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_talonario
                        form-control" style="width: 100%" id="col_talonario_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_talonario
                        form-control" style="width: 100%" id="col_talonario_6_filter"></td>
                  </tr>
                  <tr>
                    <th>ID</th>
                    <th>No.</th>
                    <th>Creado</th>
                    <th>Cuenta Bancaria</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            </div>

            <div class="tab-pane fade show" id="custom-tabs-polizas" role="tabpanel" aria-labelledby="custom-tabs-polizas-tab">
            <div class="card card-primary">
              <div class="card-header">
              <h3 class="card-title"><i class="fa fa-list"></i> Listado de pólizas {{year}}</h3>
               <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                <span class="input-group-append">
                  <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_polizas()">Buscar</button>
                </span>
                </div>
              </div>
              <div class="card-body">
                <button type="button" class="btn btn-primary btn-flat" v-on:click.prevent="modal_add_poliza_sin_solicitud()" style="margin-bottom:5px"><i class="fa fa-plus"></i>  Crear póliza</button>
                <div id="botones_polizas" style="margin-bottom: 5px"> </div>
                <table id="tabla_polizas" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_poliza form-control" style="width: 100%" id="col_poliza_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_poliza form-control" style="width: 100%" id="col_poliza_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_6_filter"></td>
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_poliza
                        form-control" style="width: 100%" id="col_poliza_8_filter"></td>
                    </tr>
                  <tr>
                    <th>ID</th>
                    <th>Solicitud</th>
                    <th>Creada</th>
                    <th>Talonario</th>
                    <th>Solicitud</th>
                    <th>Proveedor</th>
                    <th>Importe</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            </div>
            <div class="tab-pane fade show" id="custom-tabs-ordenes" role="tabpanel" aria-labelledby="custom-tabs-ordenes-tab">
            <div class="card card-primary">
              <div class="card-header">
              <h3 class="card-title"><i class="fa fa-list"></i> Listado de órdenes de pago {{year}}</h3>
               <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                <span class="input-group-append">
                  <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_ordenes()">Buscar</button>
                </span>
                </div>
              </div>
              <div class="card-body">
                <button type="button" class="btn btn-primary btn-flat" v-on:click.prevent="modal_add_orden_pago()" style="margin-bottom:5px"><i class="fa fa-plus"></i>  Crear orden de pago</button>
                <div id="botones_ordenes" style="margin-bottom: 5px"> </div>
                <table id="tabla_ordenes" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_orden form-control" style="width: 100%" id="col_orden_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_orden form-control" style="width: 100%" id="col_orden_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_6_filter"></td>
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_8_filter"></td>
                        <td align="center" data-column="9"><input type="text" placeholder="" class="column_filter_orden
                        form-control" style="width: 100%" id="col_orden_9_filter"></td>
                    </tr>
                  <tr>
                    <th>ID</th>
                    <th>Solicitud</th>
                    <th>Creada</th>
                    <th>Número</th>
                    <th>Solicitud</th>
                    <th>Proveedor</th>
                    <th>Importe</th>
                    <th>Concepto</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            </div>

            <div class="tab-pane fade show active" id="custom-tabs-pagos" role="tabpanel" aria-labelledby="custom-tabs-pagos-tab">
            <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado de solicitudes pendientes instrumento {{year}}</h3>
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
                <table id="solicitudes_proceso" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_pendientes form-control" style="width: 100%" id="col_pendientes_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_pendientes form-control" style="width: 100%" id="col_pendientes_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%"  id="col_pendientes_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_pendientes form-control" style="width: 100%" id="col_pendientes_6_filter"></td>
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_pendientes form-control" style="width: 100%" id="col_pendientes_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_8_filter"></td>
                        <td align="center" data-column="9"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_9_filter"></td>
                        <td align="center" data-column="10"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_10_filter"></td>
                        <td align="center" data-column="11"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_11_filter"></td>
                        <td align="center" data-column="12"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_12_filter"></td>
                        <td align="center" data-column="13"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_13_filter"></td>
                        <td align="center" data-column="14"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_14_filter"></td>
                        <td align="center" data-column="15"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_15_filter"></td>
                        <td align="center" data-column="16"><input type="text" placeholder="" class="column_filter_pendientes
                        form-control" style="width: 100%" id="col_pendientes_16_filter"></td>
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

            <div class="tab-pane fade show" id="custom-tabs-prom_users" role="tabpanel" aria-labelledby="custom-tabs-prom_users-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Listado instrumentos de pago {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_prom_user()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones_instrumentos" style="margin-bottom: 5px"> </div>
                <table id="tabla_instrumentos" class="table table-bordered table-striped">
                  <thead>
                   <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_instrumentos form-control" style="width: 100%" id="col_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_instrumentos form-control" style="width: 100%" id="col_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%"  id="col_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_instrumentos form-control" style="width: 100%" id="col_6_filter"></td>
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_instrumentos form-control" style="width: 100%" id="col_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%"  id="col_8_filter"></td>
                        <td align="center" data-column="9"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_9_filter"></td>
                        <td align="center" data-column="10"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_10_filter"></td>
                        <td align="center" data-column="11"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_11_filter"></td>
                        <td align="center" data-column="12"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_12_filter"></td>
                        <td align="center" data-column="13"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_13_filter"></td>
                        <td align="center" data-column="14"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_14_filter"></td>
                        <td align="center" data-column="15"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_15_filter"></td>
                        <td align="center" data-column="16"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_16_filter"></td>
                        <td align="center" data-column="17"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_17_filter"></td> 
                        <td align="center" data-column="18"><input type="text" placeholder="" class="column_filter_instrumentos
                        form-control" style="width: 100%" id="col_18_filter"></td>                          
                  </tr>
                  <tr>
                    <th>ID</th>
                    <th>Modelos</th>
                    <th>Acciones</th>
                    <th>No. Instrumento</th>
                    <th>Creado</th>
                    <th>Fecha pago</th>
                    <th>Cheque-Transferencia</th>
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
           <div class="tab-pane fade show" id="custom-tabs-prom_prov" role="tabpanel" aria-labelledby="custom-tabs-prom_prov-tab">
           <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fa fa-list"></i> Pagos a TCP resumen ONAT  {{year}}</h3>
                <div class="input-group pull-rigth" style="width: 200px;margin-left: auto;margin-top: -5px;margin-bottom: -5px">
                  <input type="text" class="form-control rounded-0" v-model="year_buscar" placeholder="Buscar por año">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-default btn-flat" v-on:click.prevent="buscar_prom_prov()">Buscar</button>
                  </span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="botones_tcp" style="margin-bottom: 5px"> </div>
                <table id="tabla_tcp" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_6_filter"></td>
                        <td align="center" data-column="7"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_7_filter"></td>
                        <td align="center" data-column="8"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_8_filter"></td>
                        <td align="center" data-column="9"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_9_filter"></td>
                        <td align="center" data-column="10"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_10_filter"></td>
                        <td align="center" data-column="11"><input type="text" placeholder="" class="column_filter_tcp form-control" style="width: 100%" id="col_tcp_11_filter"></td>
                  </tr>
                  <tr>
                    <th colspan="2" style="text-align: center;">DETALLES DE LA ENTIDAD</th>
                    <th colspan="4" style="text-align: center;">DETALLES DEL CUENTAPROPISTA</th>
                    <th colspan="4" style="text-align: center;">DETALLES DEL PAGO</th>
                    <th colspan="2" style="text-align: center;">DPA</th>
                  </tr>
                  <tr>
                    <th>Nombre de la Entidad</th>
                    <th>NIT</th>
                    <th>Nombre</th>
                    <th>Carnet</th>
                    <th>Actividad</th>
                    <th>Dirección</th>
                    <th>Contrato</th>
                    <th>Cheque</th>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th>COD</th>
                    <th>Municipio</th>
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
    <form method="POST" v-on:submit.prevent="cancelar_solicitud()">
       <div class="modal fade" id="modal_cancelar">
        <div class="modal-dialog modal-medium">
          <div class="modal-content">
            <div class="modal-header btn-danger">
              <h4 class="modal-title">Cancelar solicitud {{cancelada.referencia}} de {{cancelada.solicita}}</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                      <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Motivo:</label>
                      <div class="col-sm-10">
                        <textarea type="textarea" class="form-control" v-model="cancelada.motivo_cancelacion" style="height: 200px"></textarea>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Cancelar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
 <form method="POST" v-on:submit.prevent="eliminar_talonario()">
       <div class="modal fade" id="modal_eliminar_talonario">
        <div class="modal-dialog modal-medium">
          <div class="modal-content">
            <div class="modal-header btn-danger">
              <h4 class="modal-title">Eliminar talonario</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                      <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Número:</label>
                      <div class="col-sm-8">
                            {{talonario_eliminar.numero}}
                      </div>
                      </div>
                    </div>
              </div>
              <div class="row">
                      <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-8">
                         {{talonario_eliminar.cuenta_bancaria}}
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-danger"><i class="fa fa-check"></i> Eliminar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>

    <form method="POST" v-on:submit.prevent="generar_instrumento()">
       <div class="modal fade" id="modal_generar_instrumento">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Instrumento solicitud {{solicitud.referencia}} de {{solicitud.solicita}}</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Revisado:</label>
                      <div class="col-sm-9">
                       <select id="economia" v-model="solicitud.economia" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_economia" v-bind:value="opt.id">{{opt.nombre }}</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Aprobado:</label>
                      <div class="col-sm-9">
                       <select id="direccion" v-model="solicitud.direccion" class="bs-select form-control" style="width: 100%">
                              <option v-for="opt in listado_direccion" v-bind:value="opt.id">{{opt.nombre }}</option>
                       </select>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Generar Instrumento</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
    <form method="POST" v-on:submit.prevent="adicionar_talonarios()">
       <div class="modal fade" id="modal_add_talonario">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Adicionar Talonarios</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-8">
                       <select id="cuenta_bancaria" v-model="talonario.economia" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}-{{opt.numero}}</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tipo:</label>
                      <div class="col-sm-8">
                       <select id="tipo_talonario" v-model="talonario.tipo" class="bs-select form-control" style="width: 100%">
                            <option value="Certificado">Certificado</option>
                            <option value="Nominativo">Nominativo</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Número inicial:</label>
                      <div class="col-sm-8">
                         <input type="text" class="form-control" name="" v-model="talonario.inicial" placeholder="Número inicial"></input>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Número final:</label>
                      <div class="col-sm-8">
                         <input type="text" class="form-control" name="" v-model="talonario.final" placeholder="Número final"></input>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Generar talonarios</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
    <form method="POST" v-on:submit.prevent="editar_talonarios()">
       <div class="modal fade" id="modal_editar_talonario">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Editar Talonarios</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-9">
                       <select id="cuenta_bancaria_editar"  class="bs-select form-control">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Número:</label>
                      <div class="col-sm-8">
                         <input type="text" class="form-control" name="" v-model="talonario_editar.numero" placeholder="Número inicial"></input>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Actualizar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
    <form method="POST" v-on:submit.prevent="adicionar_poliza()">
       <div class="modal fade" id="modal_add_poliza">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Crear póliza para instrumento {{poliza.numero_solicitud}}</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <!--<div class="form-group row">
                        <label class="col-sm-3 col-form-label">Instrumento de Pago:</label>
                      <div class="col-sm-8">
                       <select id="poliza_solicitud" v-model="poliza.solicitud" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_instrumentos_disponibles_para_polizas" v-bind:value="opt.id">{{opt.numero_solicitud }}-{{opt.departamento__nombre}}</option>
                       </select>
                      </div>
                      </div>
                      -->
                       <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-8">
                       <select id="poliza_cuenta_bancaria" v-model="poliza.cuenta_bancaria" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}-{{opt.numero}}</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tipo de Talonario:</label>
                      <div class="col-sm-8">
                       <select id="tipo_talonario_poliza" v-model="poliza.tipo" class="bs-select form-control" style="width: 100%">
                            <option value="Certificado">Certificado</option>
                            <option value="Nominativo">Nominativo</option>
                       </select>
                      </div>
                      </div>
                      </div>
                    </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
    <form method="POST" v-on:submit.prevent="adicionar_poliza()">
       <div class="modal fade" id="modal_add_poliza_sin_solicitud">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Crear póliza</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row" >
                      <label class="col-sm-3 col-form-label">Páguese a:</label>
                      <div class="col-sm-9">
                        <select id="proveedor_poliza" required="" class="form-control" style="width:100%"></select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Contrato:</label>
                      <div class="col-sm-9">
                        <select id="poliza_sin_solicitud_contrato" v-model="poliza_sin_solicitud.contrato" name="contrato" required="" class="bs-select form-control" style="width:100%">
                              <option v-for="opt in listado_contratos" v-bind:value="opt.id">{{opt.descripcion}}</option>
                        </select>
                       </div>
                      </div>
                      <div class="form-group row" >
                        <label class="col-sm-3 col-form-label">Area solicitante:</label>
                      <div class="col-sm-8">
                         <input type="text" v-model="poliza_sin_solicitud.area" class="form-control" required="">
                      </div>                      
                      </div>
                      <div class="form-group row" >
                        <label class="col-sm-3 col-form-label">Importe:</label>
                      <div class="col-sm-3">
                         <input type="text" v-model="poliza_sin_solicitud.importe" class="form-control" required="">
                      </div>
                      <label class="col-sm-2 col-form-label">Moneda:</label>
                      <div class="col-sm-3">
                         <select id="orden_moneda" v-model="poliza_sin_solicitud.moneda"  required="" class="form-control" style="width:100%">
                               <option  value="CUP">CUP</option>
                               <option  value="USD">USD</option>  
                        </select>
                      </div>
                      </div>
                      <div class="form-group row" >
                        <label class="col-sm-3 col-form-label">Factura:</label>
                      <div class="col-sm-8">
                         <input type="text" v-model="poliza_sin_solicitud.factura" class="form-control" required="">
                      </div>                      
                      </div>
                      <div class="form-group row" >
                        <label class="col-sm-3 col-form-label">Concepto:</label>
                      <div class="col-sm-8">
                         <textarea v-model="poliza_sin_solicitud.concepto" class="form-control" required=""></textarea>
                      </div>                      
                      </div>
                       <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-9">
                       <select id="poliza_sin_solicitud_cuenta_bancaria" v-model="poliza_sin_solicitud.cuenta_bancaria" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}-{{opt.numero}}</option>
                       </select>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tipo de Talonario:</label>
                      <div class="col-sm-9">
                       <select id="tipo_talonario_poliza_sin_solicitud" v-model="poliza_sin_solicitud.tipo" class="bs-select form-control" style="width: 100%">
                            <option value="Certificado">Certificado</option>
                            <option value="Nominativo">Nominativo</option>
                       </select>
                      </div>
                      </div>
                      </div>
                    </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
    <form method="POST" v-on:submit.prevent="adicionar_orden()">
       <div class="modal fade" id="modal_add_orden_sin_solicitud" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Crear orden de pago</h4>
              
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row" >
                      <label class="col-sm-3 col-form-label">Páguese a:</label>
                      <div class="col-sm-9">
                        <select id="proveedor" required="" class="form-control" style="width:100%"></select>
                      </div>
                      </div>
                      <div class="form-group row" >
                        <label class="col-sm-3 col-form-label">Importe:</label>
                      <div class="col-sm-3">
                         <input type="text" v-model="orden_sin_solicitud.importe" class="form-control" required="">
                      </div>
                      <label class="col-sm-2 col-form-label">Moneda:</label>
                      <div class="col-sm-2">
                         <select id="orden_moneda" v-model="orden_sin_solicitud.moneda"  required="" class="form-control" style="width:100%">
                               <option  value="CUP">CUP</option>
                               <option  value="USD">USD</option>  
                        </select>
                      </div>
                      </div>
                       <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-9">
                       <select id="orden_sin_solicitud_cuenta_bancaria" v-model="orden_sin_solicitud.cuenta_bancaria" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}-{{opt.numero}}</option>
                       </select>
                      </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Concepto:</label>
                      <div class="col-sm-8">
                       <textarea v-model="orden_sin_solicitud.concepto" class="form-control" style="width: 100%"></textarea>
                      </div>
                      </div>
                      </div>
                    </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
    <form method="POST" v-on:submit.prevent="adicionar_orden()">
       <div class="modal fade" id="modal_add_orden" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Crear orden de pago para instrumento {{orden.numero_solicitud}}</h4>
               
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                     
                       <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Cuenta Bancaria:</label>
                      <div class="col-sm-8">
                       <select id="orden_cuenta_bancaria" v-model="orden.cuenta_bancaria" class="bs-select form-control" style="width: 100%">
                            <option v-for="opt in listado_cuenta_bancaria" v-bind:value="opt.id">{{opt.nombre }}-{{opt.numero}}</option>
                       </select>
                      </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Concepto:</label>
                      <div class="col-sm-8">
                       <textarea v-model="orden.concepto" class="form-control" style="width: 100%"></textarea>
                      </div>
                      </div>
                      </div>
                    </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
        <form method="POST" v-on:submit.prevent="cambiar_estado_poliza()">
       <div class="modal fade" id="modal_cambiar_estado_poliza">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Cambiar estado de póliza (solicitud {{poliza.solicitud}})</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Estados:</label>
                      <div class="col-sm-9">
                       <select id="poliza_estado" v-model="poliza.estado" class="bs-select form-control" style="width: 100%">
                            <option value="tránsito">Tránsito</option>
                            <option value="pagada">Pagada</option>
                            <option value="cancelada">Cancelada</option>
                            <option value="caduca">Caduca</option>
                       </select>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
            <form method="POST" v-on:submit.prevent="cambiar_estado_orden()">
       <div class="modal fade" id="modal_cambiar_estado_ordenes">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Cambiar estado de orden de pago (solicitud {{orden.solicitud}})</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Estados:</label>
                      <div class="col-sm-9">
                       <select id="orden_estado" v-model="orden.estado" class="bs-select form-control" style="width: 100%">
                            <option value="tránsito">Tránsito</option>
                            <option value="pagada">Pagada</option>
                            <option value="cancelada">Cancelada</option>
                            <option value="caduca">Caduca</option>
                       </select>
                      </div>
                      </div>
                    </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cerrar</button>
              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Aceptar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
       </div>
    </form>
  </div>
  </div>
</template>

<script>
module.exports = {

  created: function(){
        var date=new Date();
        this.year=date.getFullYear();
        this.get_lista_solicitudes_proceso();
        //this.get_lista_instrumentos();
        this.get_lista_cuenta_bancaria();
  },
  data(){
   return{
    url:'https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/',
    talonario_eliminar:{
    numero:'',
    cuenta_bancaria:'',
    },
    talonario:{
    cuenta_bancaria:'',
    inicial:'',
    final:'',
    tipo:''
    },
    talonario_editar:{
    division_territorial:'',
    cuenta_bancaria:'',
    numero:'',
    },
    poliza:{
     solicitud:'',
     cuenta_bancaria:'',
     tipo:'',
     numero_solicitud:'',
     estado:'tránsito',
     id:''
    },
    poliza_sin_solicitud:{
     solicitud:0,
     cuenta_bancaria:'',
     tipo:'',
     numero_solicitud:'',
     estado:'tránsito',
     id:'',
     proveedor:'',
     contrato:'',
     factura:'',
     importe:'',
     moneda:'CUP',
     area:'',
     concepto:''
    },
    orden:{
     solicitud:'',
     cuenta_bancaria:'',
     numero_solicitud:'',
     concepto:'',
     id:'',
     estado:'tránsito',
    },
    orden_sin_solicitud:{
     solicitud:'',
     cuenta_bancaria:'',
     numero_solicitud:'',
     concepto:'',
     id:'',
     estado:'tránsito',
     proveedor:'',
     importe:'',
     moneda:'CUP'
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
    solicitud:{
         id:'',
         cheque_transferencia:'',
         fecha_ok_economia:'',
         numero_solicitud:'',
         solicitante:'',
         referencia:'',
         solicita:'',
         economia:'',
         direccion:'',
    },
    lista_solicitudes:[],
    lista_solicitudes_proceso:[],
    listado_instrumentos:[],
    lista_prom_prov:[],
    lista_historial:[],
    listado_direccion:[],
    listado_economia:[],
    listado_talonario:[],
    listado_poliza:[],
    listado_ordenes:[],
    listado_cuenta_bancaria:[],
    listado_contratos:[],
    listado_instrumentos_disponibles_para_polizas:[],
    listado_transito:[],
    year:'',
    year_buscar:'',
    cancelada:{
      id:'',
      motivo_cancelacion:'',
      referencia:'',
      solicita:'',
    },
  }
  },
  methods: {
    buscar:function(){
    this.year=this.year_buscar;
    this.get_lista_solicitudes();
   },
    buscar_pagos:function(){
    this.year=this.year_buscar;
    this.get_lista_solicitudes_proceso();
   },
    buscar_prom_user:function(){
    this.year=this.year_buscar;
    this.get_lista_instrumentos();
   },
    buscar_prom_prov:function(){
    this.year=this.year_buscar;
    this.get_lista_prom_prov();
   },
   buscar_talonarios:function(){
    this.year=this.year_buscar;
    this.get_lista_talonarios();
   },
   buscar_polizas:function(){
    this.year=this.year_buscar;
    this.get_lista_polizas();
   },
   buscar_ordenes:function(){
    this.year=this.year_buscar;
    this.get_lista_ordenes();
   },
   limpiar_poliza:function(){
    this.poliza.solicitud='';
    this.poliza.cuenta_bancaria='';
    this.poliza.tipo='';
    $("#poliza_cuenta_bancaria").val('').trigger('change');
    $("#tipo_talonario_poliza").val('').trigger('change');
   },
   limpiar_poliza_sin_solicitud:function(){
    this.poliza_sin_solicitud.cuenta_bancaria='';
    $("#poliza_sin_solicitud_cuenta_bancaria").val('').trigger('change');
    this.poliza_sin_solicitud.tipo='';
    $("#tipo_talonario_poliza_sin_solicitud").val('').trigger('change');
    this.poliza_sin_solicitud.proveedor='';
    $("#proveedor_poliza").val('').trigger('change');
    this.poliza_sin_solicitud.contrato='';
    $("#poliza_sin_solicitud_contrato").val('').trigger('change');
    this.poliza_sin_solicitud.importe='';
    this.poliza_sin_solicitud.factura='';
    this.poliza_sin_solicitud.concepto='';
    this.poliza_sin_solicitud.area='';
   },
   limpiar_orden:function(){
    this.orden.cuenta_bancaria='';
    $("#orden_cuenta_bancaria").val('').trigger('change');
    this.orden.concepto='';
   },
   limpiar_orden_sin_solicitud:function(){
    this.orden_sin_solicitud.cuenta_bancaria='';
    $("#orden_sin_solicitud_cuenta_bancaria").val('').trigger('change');
    this.orden_sin_solicitud.concepto='';
    this.orden_sin_solicitud.importe='';
    this.orden_sin_solicitud.proveedor='';
    $("#proveedor").val('').trigger('change');
   },
   modal_add_orden_pago:function(){
      this.orden.solicitud=0;
      this.orden_sin_solicitud.solicitud=0;
      $('#modal_add_orden_sin_solicitud').modal('show');
   },
   modal_add_poliza_sin_solicitud:function(){
      this.poliza.solicitud=0;
      this.poliza_sin_solicitud.solicitud=0;
      $('#modal_add_poliza_sin_solicitud').modal('show');
   },
   adicionar_poliza:function(){
      Notiflix.Loading.standard('Cargando...');
      url=this.url+'sistema/adicionar_poliza/';
     if(this.poliza.solicitud==0)
      data=this.poliza_sin_solicitud;
      else 
      data=this.poliza; 
      axios.post(url,data).then(response => {
      //this.get_lista_polizas();
      this.get_lista_instrumentos();
      $('#modal_add_poliza').modal('hide');
      $('#modal_add_poliza_sin_solicitud').modal('hide');      
      if(this.poliza.solicitud > 0)
      window.open(this.url+'sistema/poliza/'+response.data+'/','Poliza',"fullscreen=YES");
      else{
      window.open(this.url+'sistema/poliza_sin_solicitud/'+response.data+'/','Poliza',"fullscreen=YES");
      this.get_lista_polizas();
      }
      this.poliza.solicitud='';
      this.limpiar_poliza();
      this.limpiar_poliza_sin_solicitud();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
    get_lista_cargar_contratos_tcp:function(tcp){
      var url=this.url+'sistema/cargar_contratos_tcp/'+tcp+'/';
      axios.get(url).then(response => {
      this.listado_contratos=response.data;
      }).catch(error => {});
    },
    cambiar_estado_poliza:function(){
      Notiflix.Loading.standard('Cargando...');
      let url=this.url+'sistema/cambiar_estado_poliza/'+this.poliza.id+'/';      
      axios.post(url,this.poliza).then(response => {
      this.get_lista_polizas();
      $('#modal_cambiar_estado_poliza').modal('hide');
      toastr.success('Operación exitosa');
      $("#poliza_estado").val('').trigger('change');
      this.poliza.estado='';
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      
   },
    cambiar_estado_orden:function(){
      Notiflix.Loading.standard('Cargando...');
      let url=this.url+'sistema/cambiar_estado_orden/'+this.orden.id+'/';      
      axios.post(url,this.orden).then(response => {
      this.get_lista_ordenes();
      $('#modal_cambiar_estado_ordenes').modal('hide');
      toastr.success('Operación exitosa');
      $("#orden_estado").val('').trigger('change');
      this.orden.estado='';
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      
   },
   adicionar_orden:function(){
      Notiflix.Loading.standard('Cargando...');      
      var url=this.url+'sistema/adicionar_orden_pago/';
      if(this.orden.solicitud==0)
      data=this.orden_sin_solicitud;
      else 
      data=this.orden;  
      axios.post(url,data).then(response => {
      //this.limpiar_talonarios();
      this.get_lista_instrumentos();
      $('#modal_add_orden').modal('hide');
      $('#modal_add_orden_sin_solicitud').modal('hide');
      if(this.orden.solicitud > 0)
        window.open(this.url+'sistema/orden/'+response.data+'/','Orden',"fullscreen=YES");
      else{
        window.open(this.url+'sistema/orden_pago_sin_solicitud/'+response.data+'/','Orden',"fullscreen=YES");
        this.get_lista_ordenes();
      }      
      toastr.success('Operación exitosa');
      this.limpiar_orden();
      this.limpiar_orden_sin_solicitud();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      
   },
   adicionar_talonarios:function(){
    Notiflix.Loading.standard('Cargando...');
    if(this.talonario.cuenta_bancaria!='' && this.talonario.inicial!='' && this.talonario.final!=''){
      var url=this.url+'sistema/adicionar_talonario/';
      axios.post(url,this.talonario).then(response => {
      this.limpiar_talonarios();
      this.get_lista_talonarios();
      $('#modal_add_talonario').modal('hide');
      Notiflix.Loading.remove('Cargando...');
      toastr.success('Operación exitosa');

      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      }
      else{
        toastr.error('No deje campos en blanco.');
      }
   },
   editar_talonarios:function(){
      var url=this.url+'sistema/editar_talonario/'+this.talonario_editar.id+'/';
      axios.post(url,this.talonario_editar).then(response => {
      this.get_lista_talonarios();
      toastr.success('Operación exitosa');
      }).catch(error => {});
   },
   eliminar_talonario:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/eliminar_talonario/'+this.talonario_eliminar.id+'/';
      axios.post(url).then(response => {
      this.get_lista_talonarios();
      toastr.success('Operación exitosa');
      $('#modal_eliminar_talonario').modal('hide');
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
   limpiar_talonarios:function(){
    this.talonario.inicial='';
    this.talonario.final='';
   },
   get_listado_instrumentos_disponibles_para_polizas:function(){
      this.listado_instrumentos_disponibles_para_polizas=[];
      var url=this.url+'sistema/listado_instrumentos_disponibles_para_polizas/';
      axios.get(url).then(response => {
      this.listado_instrumentos_disponibles_para_polizas=response.data;
      $('#modal_add_poliza').modal('show');
      }).catch(error => {});
   },
   get_lista_polizas:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_poliza/'+this.year+'/';
      axios.get(url).then(response => {
      this.listado_poliza=response.data;
      this.tabla_poliza_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
   tabla_poliza_config:function(){
     $("#tabla_polizas").DataTable({
      "bDestroy":true,
      "data":this.listado_poliza,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [0,1],
                  "visible": false,
                  "searchable": false,
                 }
      ],
      "columns": [
            { "data": "id" },
            { "data": "solicitud__id"},
            { "data": "creada",
              "render": function (data, type, row) {
                            return (row['creado']).replace('T',' ');
                        }
            },
            { "data": "talonario__numero" },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__numero_solicitud']+'-'+row['solicitud__departamento__nombre'];
                            else
                            return row['area'];
                        }
            },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__tcp__nombre'];
                            else
                            return row['proveedor__nombre'];
                        }
            },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__importe'].toLocaleString('en-US', { minimumFractionDigits: 2});
                            else
                            return row['importe'].toLocaleString('en-US', { minimumFractionDigits: 2});
                        }
            },
            { "data": "estado" },
            { "data": null,
              "render": function (data, type, row) {
                            return '<div style="text-align: center"><button class="btn btn-xs btn-secondary" title="Pagada" style="color: white"><i class="fa fa-check"></i></button> <button class="btn btn-xs btn-primary" title="Cambiar estado" style="color: white"><i class="fa fa-cog"></i></button> <button class="btn btn-xs btn-success" title="Descargar Póliza" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-danger" title="Eliminar" style="color: white"><i class="fa fa-trash"></i></button></div>';
                        }
            },
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
    }).buttons().container().prependTo('#botones_polizas');
   },
   get_lista_ordenes:function(){
    Notiflix.Loading.standard('Cargando...');
    var url=this.url+'sistema/listado_ordenes/'+this.year+'/';
      axios.get(url).then(response => {
      this.listado_ordenes=response.data;
      this.tabla_ordenes_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
   tabla_ordenes_config:function(){
     $("#tabla_ordenes").DataTable({
      "bDestroy":true,
      "data":this.listado_ordenes,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [0,1],
                  "visible": false,
                  "searchable": false,
                 }
      ],
      "columns": [
            { "data": "id" },
            { "data": "solicitud__id"},
            { "data": "creada",
              "render": function (data, type, row) {
                            return (row['creado']).replace('T',' ');
                        }
            },
            { "data": "numero" },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__numero_solicitud']+'-'+row['solicitud__departamento__nombre'];
                            else
                            return '';
                        }
            },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__tcp__nombre'];
                            else
                            return row['proveedor__nombre'];
                        }
            },
            { "data": null ,
                    "render": function (data, type, row) {
                            if(row['solicitud__id']!=null)
                            return row['solicitud__importe'].toLocaleString('en-US', { minimumFractionDigits: 2});
                            else
                            return row['importe'].toLocaleString('en-US', { minimumFractionDigits: 2});
                        }
            },
            { "data": "concepto"},
            { "data": "estado"},
            { "data": null,
              "render": function (data, type, row) {
                            return '<div style="text-align: center"><button class="btn btn-xs btn-secondary" title="Pagada" style="color: white"><i class="fa fa-check"></i></button> <button class="btn btn-xs btn-primary" title="Cambiar estado" style="color: white"><i class="fa fa-cog"></i></button> <button class="btn btn-xs btn-success" title="Descargar Orden" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-danger" title="Eliminar" style="color: white"><i class="fa fa-trash"></i></button></div>';
                        }
            },
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
    }).buttons().container().prependTo('#botones_ordenes');
   },
   tabla_talonario_config:function(){
     $("#tabla_talonarios").DataTable({
      "bDestroy":true,
      "data":this.listado_talonario,
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
            { "data": 'id' },
            { "data": 'numero'},
            { "data": 'creado',
              "render": function (data,type,row){
                            return (row['creado']).replace('T',' ');
                        }
            },
            { "data": 'cuenta_bancaria__nombre'},
            { "data": 'tipo'},
            { "data": 'estado'},
            /*{ "data": null,
              "render": function (data, type, row) {
                            if (row['poliza__id']!=null)
                            return '<div style="text-align: center"><a target="_blank"  class="btn btn-xs btn-success" title="Descargar" href="/solicitud_pago/sistema/poliza/'+row['poliza__id']+'/" ><i class="fa fa-download"></i></a></div>';
                            else
                            return '';
                        }
            },*/
            { "data": null,
              "render": function (data,type,row) {
                            return '<div style="text-align: center"><button class="btn btn-xs btn-warning" title="Editar" style="color: white"><i class="fa fa-edit"></i></button> <button class="btn btn-xs btn-danger" title="Eliminar" style="color: white"><i class="fa fa-trash"></i></button></div>';
                        }
            },
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
    }).buttons().container().prependTo('#botones_talonarios');
    },
   get_lista_cuenta_bancaria:function(){
      var url=this.url+'sistema/listado_cuenta_bancaria/';
      axios.get(url).then(response =>{
      this.listado_cuenta_bancaria=response.data;
      //this.tabla_estado_cuentas_config();
      }).catch(error => {});
   },
   get_listado_transito:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/total_transito/';
      axios.get(url).then(response =>{
      this.listado_transito=response.data;
      this.tabla_estado_cuentas_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
   tabla_estado_cuentas_config:function(){
     $("#tabla_estado_cuentas").DataTable({
      "bDestroy":true,
      "data":this.listado_transito,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [0],
                  "visible": false,
                  "searchable": false,
                 }
      ],
      "columns": [
            { "data": "id" },
            { "data": null ,
                    "render": function (data, type, row){                            
                            return row['nombre']+'-'+row['numero'];
                        }
            },
            { "data": null ,
                    "render": function (data, type, row){
                            return row['saldo'].toLocaleString('en-US', { minimumFractionDigits: 2}); 
                        }
            },
            { "data": null ,
                    "render": function (data, type, row){
                            return row['saldo_libro'].toLocaleString('en-US', { minimumFractionDigits: 2}); 
                        }
            },
            { "data": null ,
                    "render": function (data, type, row){
                             return row['transito'].toLocaleString('en-US', { minimumFractionDigits: 2});   
                        }
            }
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
    }).buttons().container().prependTo('#botones_estado_cuentas');
   },
   get_lista_talonarios:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_talonario/'+this.year+'/';
      axios.get(url).then(response =>{
      this.listado_talonario=response.data;
      this.tabla_talonario_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
   },
    get_lista_economia:function(){
      var url=this.url+'sistema/cargar_autorizados_economia/';
      axios.get(url).then(response => {
      this.listado_economia=response.data;
      }).catch(error => {});
    },
    get_lista_direccion:function(){
      var url=this.url+'sistema/cargar_autorizados_direccion/';
      axios.get(url).then(response => {
      this.listado_direccion=response.data;
      }).catch(error => {});
    },
    generar_instrumento:function(){
      var url=this.url+'sistema/generar_instrumento/';
      axios.post(url,this.solicitud).then(response => {
      this.get_lista_solicitudes_proceso();
      $('#modal_generar_instrumento').modal('hide');
      toastr.success('Operación exitosa');
      window.open(this.url+'sistema/instrumento/'+this.solicitud.id+'/','TICKET',"fullscreen=YES");
      }).catch(error => {});
    },
    get_lista_solicitudes:function(){
      Notiflix.Loading.standard('Standard Loading...');
      var url=this.url+'sistema/listado_solicitud_pendiente_economia/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_solicitudes=response.data;
      this.tabla_solicitudes_config();
      Notiflix.Loading.standard('Standard Loading...');
      }).catch(error => {
        Notiflix.Loading.standard('Standard Loading...');
      });
    },
    dar_ok:function(){
      var url=this.url+'sistema/dar_ok/';
      axios.post(url,this.solicitud).then(response => {
      this.get_lista_instrumentos();
      $('#modal_dar_ok').modal('hide');
      }).catch(error => {});
    },
    cancelar_solicitud:function(){
      var url=this.url+'sistema/cancelar/'+this.cancelada.id+'/';
      axios.post(url,this.cancelada).then(response => {
      this.get_lista_solicitudes_proceso();
      this.get_lista_instrumentos();
      $('#modal_cancelar').modal('hide');
      this.cancelada.id='';
      this.cancelada.motivo_cancelacion='';
      this.cancelada.referencia='';
      this.cancelada.solicita='';
      toastr.success('Operación exitosa');
      }).catch(error => {
      this.get_lista_solicitudes_proceso();
      this.get_lista_instrumentos();
      $('#modal_cancelar').modal('hide');
      this.cancelada.id='';
      this.cancelada.motivo_cancelacion='';
      this.cancelada.referencia='';
      this.cancelada.solicita='';
      toastr.success('Operación exitosa');
      });
    },
    get_lista_solicitudes_proceso:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_solicitud_proceso_economia/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_solicitudes_proceso=response.data;
      this.tabla_solicitudes_proceso_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');
      });
    },
    get_lista_instrumentos:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_instrumentos/'+this.year+'/';
      axios.get(url).then(response =>{
      this.listado_instrumentos=response.data;
      this.tabla_listado_instrumentos_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
    },
    get_lista_prom_prov:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_pagos_tcp_onat/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_prom_prov=response.data;
      this.tabla_prom_prov_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
    },
    modal_talonarios:function(){
     $('#modal_add_talonario').modal('show');
    },
    modal_poliza:function(){
     this.get_listado_instrumentos_disponibles_para_polizas();
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
                            return '<div style="text-align: center"> <button class="btn btn-xs btn-danger" title="Cancelar" style="color: white"><i class="fa fa-times"></i></button> <button class="btn btn-xs btn-warning" title="Descargar Modelo" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-info" title="Entrada" style="color: white"><i class="fa fa-check"></i></button> </div>';
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
            { "data": null,
              "render": function (data, type, row) {
                            return '<div style="text-align: center"> <button class="btn btn-xs btn-primary" title="Ver" style="color: white"><i class="fa fa-eye"></i></button>'+ row['contrato__descripcion'] +' </div>';
                        }
            },
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
    tabla_solicitudes_proceso_config:function(){
     $("#solicitudes_proceso").DataTable({
      "bDestroy":true,
      "data":this.lista_solicitudes_proceso,
      "responsive": true,
      "order": [],
      "columnDefs": [
                 {
                  "targets": [ 0],
                  "visible": false,
                  "searchable": false,
                 }
      ],
      "columns":
      [

            { "data": "id" },
            { "data": null,
              "render": function (data, type, row) {
                            return '<div style="text-align: center"> <button class="btn btn-xs btn-danger" title="Cancelar" style="color: white"><i class="fa fa-times"></i></button> <button class="btn btn-xs btn-warning" title="Descargar Anexo 3" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-info" title="Generar instrumento de pago" style="color: white"><i class="fa fa-file"></i></button> </div>';
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
            { "data": null,
              "render": function (data, type, row) {
                            if(row['contrato__modelo']!='null')
                            return '<a target="_blank" href="/media_solicitud_pago/'+row['contrato__modelo']+'" >'+row['contrato__descripcion']+'</a>';
                            else
                            return '';
                        }
            },
            { "data": null,
              "render": function (data, type, row) {
                            if (row['suplemento__modelo']!=null)
                            return '<a target="_blank" href="/media_solicitud_pago/'+row['suplemento__modelo']+'" >'+row['suplemento__descripcion']+'</a>';
                            else
                            return '';

                        }
            },
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
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
                  rows: ':visible',
            }
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
                  rows: ':visible'
            }
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
                  rows: ':visible'
            }
            },
            {
                extend: 'pdf',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
                  rows: ':visible'
            }
            },]
    }).buttons().container().prependTo('#botones_pagos');
    },
    tabla_listado_instrumentos_config:function(){
     $("#tabla_instrumentos").DataTable({
      "bDestroy":true,
      "data":this.listado_instrumentos,
      "responsive": true,
      "order": [3],
      "columnDefs": [
                 {
                  "targets": [ 0],
                  "visible": false,
                  "searchable": false,
                 }
      ],
      "columns":
      [

            { "data": "id" },
            { "data": null,
              "render": function (data, type, row) {
                            boton='';
                            if(row['estado']=='pagado')
                            boton=' <button class="btn btn-xs btn-primary" title="Descargar Póliza/Orden de Pago" style="color: white"><i class="fa fa-download"></i></button>'; 
                            return '<div style="text-align: center;display: ruby"> <button class="btn btn-xs btn-warning" title="Descargar Anexo 3" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-success" title="Descargar instrumento" style="color: white"><i class="fa fa-download"></i></button>'+boton+'</div>';
                            
                        }
            },
            { "data": null,
              "render": function (data, type, row) {
                            boton_acciones='';
                            if(row['estado']=='contabilización')
                            boton_acciones=' <button class="btn btn-xs btn-info" title="Generar Póliza/Orden de Pago" style="color: white"><i class="fa fa-check"></i></button>';
                            return '<div style="text-align: center;display: ruby"> <button class="btn btn-xs btn-danger" title="Cancelar" style="color: white"><i class="fa fa-times"></i></button> '+boton_acciones+'</div>';
                            
                        }
            },
            { "data": null ,
              "render": function (data, type, row) {
                            a=  (row['numero_solicitud']).split('/');
                            return parseInt(a[0]);
                        }
            },
            { "data": null ,
              "render": function (data, type, row) {
                            a= (row['fecha_instrumento']).split('T');
                            return a[0];
                        }
            },
            { "data": "fecha_ok_economia"},
            { "data": "cheque_transferencia"},
            { "data": "tipo" },
            { "data": "estado"},
            { "data": "tcp__nombre" },
            { "data": null,
              "render": function (data, type, row) {
                            if (row['contrato__modelo']!=null)
                            return '<a target="_blank" href="/media_solicitud_pago/'+row['contrato__modelo']+'" >'+row['contrato__descripcion']+'</a>';
                            else
                            return '';
                        }
            },
            { "data": null,
              "render": function (data, type, row) {
                            if (row['suplemento__modelo']!=null)
                            return '<a target="_blank" href="/media_solicitud_pago/'+row['suplemento__modelo']+'" >'+row['suplemento__descripcion']+'</a>';
                            else
                            return '';
                        }
            },
            { "data": "importe",
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
            { "data": "cuenta__descripcion" },
            { "data": "centro_costo__descripcion" },
            { "data": "solicita__usuario__username" },
            { "data": "autoriza__usuario__username" },
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
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
                  rows: ':visible',
            }
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
                  rows: ':visible'
            }
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
                  rows: ':visible'
            }
            },
            {
                extend: 'pdf',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
                  rows: ':visible'
            }
            },]
    }).buttons().container().prependTo('#botones_instrumentos');
    },
    tabla_prom_prov_config:function(){
     $("#tabla_tcp").DataTable({
      "bDestroy":true,
      "data":this.lista_prom_prov,
      "responsive": true,
      "order": [],
      "columns": [
            { "data": "tcp__division_territorial__nombre" },
            { "data": "tcp__nit"},
            { "data": "tcp__nombre" },
            { "data": "tcp__carnet"},
            { "data": "tcp__info" },
            { "data": "tcp__direccion"},
            { "data": "contrato__descripcion" },
            { "data": "cheque_transferencia"},
            { "data": "fecha_ok_economia" },
            { "data": "importe", 
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
            { "data": "tcp__municipio__cod" },
            { "data": "tcp__municipio__nombre"},
      ],
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
                  columns: [0,1,2,3,4,5,6,7,8,9,10,11],
                  rows: ':visible',
            }
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [0,1,2,3,4,5,6,7,8,9,10,11],
                  rows: ':visible'
            }
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [0,1,2,3,4,5,6,7,8,9,10,11],
                  rows: ':visible'
            }
            },
            {
                extend: 'pdf',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [0,1,2,3,4,5,6,7,8,9,10,11],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [0,1,2,3,4,5,6,7,8,9,10,11],
                  rows: ':visible'
            }
            },]
    }).buttons().container().prependTo('#botones_tcp');
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
    filterColumn_pendientes:function(i){

      $('#solicitudes_proceso').DataTable().column( i ).search( 
        $('#col_pendientes_'+i+'_filter').val()
      ).draw();
    },
    filterColumn_instrumentos:function(i){

      $('#tabla_instrumentos').DataTable().column( i ).search( 
        $('#col_'+i+'_filter').val()
      ).draw();
    },
    filterColumn_tcp:function(i){

      $('#tabla_tcp').DataTable().column( i ).search( 
        $('#col_tcp_'+i+'_filter').val()
      ).draw();
    },
    filterColumn_poliza:function(i){

      $('#tabla_polizas').DataTable().column( i ).search( 
        $('#col_poliza_'+i+'_filter').val()
      ).draw();
    },
    filterColumn_talonario:function(i){
      $('#tabla_talonarios').DataTable().column( i ).search( 
        $('#col_talonario_'+i+'_filter').val()
      ).draw();
    },
    filterColumn_orden:function(i){
      $('#tabla_ordenes').DataTable().column( i ).search( 
        $('#col_orden_'+i+'_filter').val()
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
    $('#proveedor_poliza').change(function (){
        vm.listado_contratos=[];
        vm.poliza_sin_solicitud.proveedor = $("#proveedor_poliza option:selected").val();
        vm.get_lista_cargar_contratos_tcp(vm.poliza_sin_solicitud.proveedor);
    });
    $("#proveedor_poliza").select2({
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
    minimumResultsForSearch: 10,
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

    $('#proveedor').change(function (){
        vm.orden_sin_solicitud.proveedor = $("#proveedor option:selected").val();
    });
    $("#proveedor").select2({
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
    minimumResultsForSearch: 10,
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
    $('.bs-select').select2();
    $('#cuenta_bancaria').change(function (){
          vm.talonario.cuenta_bancaria =$("#cuenta_bancaria option:selected").val();
    });
    $('#tipo_talonario').change(function (){
          vm.talonario.tipo =$("#tipo_talonario option:selected").val();
    });
    $('#tipo_talonario_poliza').change(function (){
          vm.poliza.tipo =$("#tipo_talonario_poliza option:selected").val();
    });
    $('#tipo_talonario_poliza_sin_solicitud').change(function (){
          vm.poliza_sin_solicitud.tipo =$("#tipo_talonario_poliza_sin_solicitud option:selected").val();
    });
    $('#poliza_solicitud').change(function (){
          vm.poliza.solicitud =$("#poliza_solicitud option:selected").val();
    });
    $('#poliza_cuenta_bancaria').change(function (){
          vm.poliza.cuenta_bancaria =$("#poliza_cuenta_bancaria option:selected").val();
    });
    $('#orden_cuenta_bancaria').change(function (){
          vm.orden.cuenta_bancaria =$("#orden_cuenta_bancaria option:selected").val();
    });
    $('#orden_sin_solicitud_cuenta_bancaria').change(function (){
          vm.orden_sin_solicitud.cuenta_bancaria =$("#orden_sin_solicitud_cuenta_bancaria option:selected").val();
    });
    $('#poliza_sin_solicitud_cuenta_bancaria').change(function (){
          vm.poliza_sin_solicitud.cuenta_bancaria =$("#poliza_sin_solicitud_cuenta_bancaria option:selected").val();
    });
    $('#poliza_sin_solicitud_contrato').change(function (){
          vm.poliza_sin_solicitud.contrato =$("#poliza_sin_solicitud_contrato option:selected").val();
    });
    $('#direccion').change(function (){
          vm.solicitud.direccion =$("#direccion option:selected").val();
    });
    $('#economia').change(function (){
          vm.solicitud.economia =$("#economia option:selected").val();
    });
    $('#poliza_estado').change(function (){
          vm.poliza.estado =$("#poliza_estado option:selected").val();
    });
    $('#orden_estado').change(function (){
          vm.orden.estado =$("#orden_estado option:selected").val();
    });
    var url=vm.url+'sistema/usuario/';
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
    $('input.column_filter_pendientes').on( 'keyup click', function () {
        vm.filterColumn_pendientes( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_instrumentos').on( 'keyup click', function () {
        vm.filterColumn_instrumentos( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_tcp').on( 'keyup click', function () {
        vm.filterColumn_tcp( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_poliza').on( 'keyup click', function () {
        vm.filterColumn_poliza( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_talonario').on( 'keyup click', function () {
        vm.filterColumn_talonario( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_orden').on( 'keyup click', function () {
        vm.filterColumn_orden( $(this).parents('td').attr('data-column') );
    } );
    $(document).on('shown.bs.tab', 'a[data-toggle="pill"]', function(e){
        e.stopPropagation();
        $.fn.dataTable.tables({
            visible: true,
            api: true
        }).columns.adjust();
    });
    $('#solicitudes_proceso').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#solicitudes_proceso').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open(vm.url+'sistema/anexo3/'+data.id+'/','TICKET',"fullscreen=YES");
    });

    $('#tabla_instrumentos').on( 'click', 'tbody tr .btn-primary', function () {
        tablee=$('#tabla_instrumentos').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.tipo=='cheque')
        window.open(vm.url+'sistema/poliza/'+data.id+'/','TICKET',"fullscreen=YES");
        if(data.tipo=='transferencia')
        window.open(vm.url+'sistema/orden/'+data.id+'/','TICKET',"fullscreen=YES");  

    });

    $('#tabla_instrumentos').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#tabla_instrumentos').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open(vm.url+'sistema/anexo3/'+data.id+'/','TICKET',"fullscreen=YES");
    });

    $('#tabla_pagos').on('click','tbody tr .btn-primary', function() {
        tablee=$('#tabla_pagos').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        var url=vm.url+'sistema/resumen_facturas/'+data.solicitud__tcp__id+'/'+vm.year+'/';
        axios.get(url).then(response => {
        vm.lista_historial=response.data;
        vm.tabla_historial_config();
        $('#modal_facturas').modal('show');
      }).catch(error => {});
     });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-info', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        var url=vm.url+'sistema/entrada/'+data.id+'/';
        axios.get(url).then(response => {
          vm.get_lista_solicitudes();
        }).catch(error => {});
     });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        vm.cancelada.id=data.id;
        vm.cancelada.referencia=data.referencia;
        vm.cancelada.solicita=data.solicita__usuario__username;
        $('#modal_cancelar').modal('show');

     });

     $('#tabla_instrumentos').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_instrumentos').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        vm.cancelada.id=data.id;
        vm.cancelada.referencia=data.referencia;
        vm.cancelada.solicita=data.solicita__usuario__username;
        $('#modal_cancelar').modal('show');

     });

      $('#tabla_instrumentos').on( 'click', 'tbody tr .btn-info', function () {
        tablee=$('#tabla_instrumentos').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.tipo=='cheque'){
        vm.poliza.numero_solicitud=data.numero_solicitud;
        vm.poliza.solicitud=data.id;
        $('#modal_add_poliza').modal('show');
        }
        else{
        vm.orden.numero_solicitud=data.numero_solicitud;
        vm.orden.solicitud=data.id;
        $('#modal_add_orden').modal('show');
        }

     });

     $('#tabla_instrumentos').on( 'click', 'tbody tr .btn-success', function () {
        tablee=$('#tabla_instrumentos').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open(vm.url+'sistema/instrumento/'+data.id+'/','TICKET',"fullscreen=YES");
     });

    $('#solicitudes_proceso').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#solicitudes_proceso').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        vm.cancelada.id=data.id;
        vm.cancelada.referencia=data.referencia;
        vm.cancelada.solicita=data.solicita__usuario__username;
        $('#modal_cancelar').modal('show');
     });

     $('#solicitudes_proceso').on( 'click', 'tbody tr .btn-info', function () {
        tablee=$('#solicitudes_proceso').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        vm.solicitud.id=data.id;
        vm.solicitud.referencia=data.referencia;
        vm.solicitud.solicita=data.solicita__usuario__username;
        vm.get_lista_direccion();
        vm.get_lista_economia();
        $('#modal_generar_instrumento').modal('show');
     });

      $('#tabla_talonarios').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#tabla_talonarios').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.poliza__id==null){
        var url=vm.url+'sistema/detalles_talonario/'+data.id+'/';
        axios.get(url).then(response => {
        vm.talonario_editar.cuenta_bancaria=response.data.talonario.cuenta_bancaria;
        vm.talonario_editar.numero=response.data.talonario.numero;
        vm.talonario_editar.division_territorial=response.data.talonario.division_territorial;
        vm.talonario_editar.id=response.data.talonario.id;
        $('#cuenta_bancaria_editar').val(vm.talonario_editar.cuenta_bancaria);
        $('#cuenta_bancaria_editar').select2().trigger('change');
        $('#modal_editar_talonario').modal('show');
        }).catch(error => {});
        }
        else{
          toastr.error('No se puede editar el talonario, existe una póliza asociada.')
        }
      });

      $('#tabla_talonarios').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_talonarios').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.poliza__id==null){
        vm.talonario_eliminar.id=data.id;
        vm.talonario_eliminar.numero=data.numero;
        vm.talonario_eliminar.cuenta_bancaria=data.cuenta_bancaria__nombre;
        $('#modal_eliminar_talonario').modal('show');
        }
        else{
          toastr.error('No se puede eliminar el talonario, existe una póliza asociada.')
        }
      });
      $('#tabla_polizas').on( 'click', 'tbody tr .btn-success', function () {
        tablee=$('#tabla_polizas').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        if(data.solicitud__id!=null)
        window.open(vm.url+'sistema/poliza/'+data.solicitud__id+'/','TICKET',"fullscreen=YES");
        else
        window.open(vm.url+'sistema/poliza_sin_solicitud/'+data.id+'/','TICKET',"fullscreen=YES");  
      });

      $('#tabla_polizas').on( 'click', 'tbody tr .btn-primary', function () {
        tablee=$('#tabla_polizas').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        vm.poliza.solicitud=data.solicitud__numero_solicitud+' '+data.solicitud__departamento__nombre;
        vm.poliza.id=data.id;
        $('#modal_cambiar_estado_poliza').modal('show');
      });

      $('#tabla_ordenes').on( 'click', 'tbody tr .btn-primary', function () {
        tablee=$('#tabla_ordenes').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        vm.orden.solicitud=data.solicitud__numero_solicitud+' '+data.solicitud__departamento__nombre;
        vm.orden.id=data.id;
        $('#modal_cambiar_estado_ordenes').modal('show');
      });

      $('#tabla_polizas').on( 'click', 'tbody tr .btn-secondary', function () {
        tablee=$('#tabla_polizas').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        vm.poliza.id=data.id;
        vm.poliza.estado='pagada';
        vm.cambiar_estado_poliza();
      });

      $('#tabla_ordenes').on( 'click', 'tbody tr .btn-secondary', function () {
        tablee=$('#tabla_ordenes').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        vm.orden.id=data.id;
        vm.orden.estado='pagada';
        vm.cambiar_estado_orden();
      });

      $('#tabla_polizas').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_polizas').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        var url=vm.url+'sistema/eliminar_poliza/'+data.id+'/';
        axios.post(url).then(response => {
        vm.get_lista_polizas();
        }).catch(error => {});
      });

      $('#tabla_ordenes').on( 'click', 'tbody tr .btn-success', function () {
        tablee=$('#tabla_ordenes').DataTable();
        var data = tablee.row( $(this).parents('tr')).data();
        if(data.solicitud__id!=null)
        window.open(vm.url+'sistema/orden/'+data.solicitud__id+'/','TICKET',"fullscreen=YES");
        else
        window.open(vm.url+'sistema/orden_pago_sin_solicitud/'+data.id+'/','TICKET',"fullscreen=YES");  
      });
      $('#tabla_ordenes').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_ordenes').DataTable();
        var data = tablee.row( $(this).parents('tr') ).data();
        var url=vm.url+'sistema/eliminar_orden_pago/'+data.id+'/';
        axios.post(url).then(response => {
        vm.get_lista_ordenes();
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
tr.group,
tr.group:hover {
    background-color: #ddd !important;
}
</style>
