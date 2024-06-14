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
                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true"><i class="fa fa-plus"></i> Registrar Solicitud</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false" v-on:click.prevent="get_lista_solicitudes()"><i class="fa fa-list"></i> Listado de Solicitudes {{year}}</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-compra-tab" data-toggle="pill" href="#custom-tabs-compra" role="tab" aria-controls="custom-tabs-compra" aria-selected="false"><i class="fa fa-list"></i> Acta de Conciliación </a>
                  </li>
                  <!--
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-pagos-tab" data-toggle="pill" href="#custom-tabs-pagos" role="tab" aria-controls="custom-tabs-pagos" aria-selected="false" v-on:click.prevent="get_lista_total_pagos()"><i class="fa fa-list"></i> Listado Resumen de Pagos </a>
                  </li>
                  -->
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
                    <div class="col-sm-6">
                      <!-- checkbox -->
                      
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Páguese a:</label>
                      <div class="col-sm-8">
                        <select id="tcp" v-model="solicitud.tcp" name="tcp" required="" class="form-control">
                              <!-- <option v-for="opt in listado_tcp" v-bind:value="opt.id">{{opt.nombre }}</option> -->
                        </select>
                        <span v-for="error in errors.tcp" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      <div class="progress-group col-md-10" style="margin-top: 5px">
                       Pagado: <span class="badge badge-secondary" style="font-size: small;"> <b id="pagado">0</b></span><!--  de <span class="badge badge-info" style="font-size: small;"><b id="maximo">0</b></span> /--> Solicitudes: <span class="badge badge-primary" style="font-size: small;"> <b>{{cantidad_solicitudes}}</b></span> / Facturas: <span class="badge badge-primary" style="font-size: small;"><b>{{cantidad_facturas}}</b></span>
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
                              <option v-for="opt in listado_contratos" v-bind:value="opt.id">{{opt.descripcion}}</option>
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
                        <select id="cuenta_bancaria" v-model="solicitud.cuenta_bancaria" name="cuenta_bancaria" class="bs-select form-control">
                          <option v-for="opt in listado_cuentas_tcp" v-bind:value="opt.id">{{opt.nombre}}</option>
                        </select>
                        <span v-for="error in errors.cuenta_bancaria" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tipo de pago:</label>
                      <div class="col-sm-8">
                      <select id="tipo" v-model="solicitud.tipo" name="tipo" required="" class="bs-select form-control">
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
                              <option v-for="opt in listado_cuentas" v-bind:value="opt.id">{{opt.descripcion }}</option>
                       </select>
                        <span v-for="error in errors.cantidad" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Centro de Costo:</label>
                      <div class="col-sm-8">
                        <select id="centro_costo" v-model="solicitud.centro_costo" name="centro_costo"  class="bs-select form-control">
                              <option v-for="opt in listado_centros_costo" v-bind:value="opt.id">{{opt.descripcion}}</option>
                        </select>
                        <span v-for="error in errors.detalle" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Autoriza:</label>
                      <div class="col-sm-8">
                        <select id="select_autoriza" v-model="solicitud.autoriza" name="autoriza" required="" class="bs-select form-control">
                              <option v-for="opt in listado_autorizados" v-bind:value="opt.id">{{opt.usuario__first_name}} {{opt.usuario__last_name}}</option>
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
                        <label class="col-sm-3 col-form-label">Concepto de pago:</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" name="concepto" v-model="solicitud.concepto" placeholder="Concepto de pago"></input>
                        <span v-for="error in errors.concepto" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                     <div class="form-group row">
                      <label class="col-sm-3 col-form-label">Observación:</label>
                      <div class="col-sm-8">
                        <textarea type="text" class="form-control" name="observaciones" v-model="solicitud.observaciones" placeholder="Observación" style="height: 80px"></textarea>
                        <span v-for="error in errors.observaciones" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
                      </div>
                      </div>
                    </div>
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Documentos requeridos para el pago</h3>
                <div class="card-tools" style="margin: 0px">
                  <!--<label >Disponible para pagar: <span class="badge badge-info" style="font-size: small;" id="disponible">0</span></label>-->
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
                      <td style="width: auto"><input type="text" class="form-control money" name="impo" v-model="factura.importe" id="factura_importe" placeholder="0.00" min="0"></td>
                      <td style="width: 7%"><select id="moneda_factura" v-model="factura.moneda" name="mon" required="" class="bs-select form-control">
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
          </div>
          </div>
                  <div class="card-footer">
                  <button type="submit" class="btn btn-primary float-right"><i class="fa fa-file"></i> Crear solicitud</button>
                  </div>
                  </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
                  </div>
            <div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"></h3>
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

             <div class="tab-pane fade" id="custom-tabs-compra" role="tabpanel" aria-labelledby="custom-tabs-compra-tab">
                              <!-- /.card -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"></h3>

              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row" style="margin-bottom: 10px">
                <div class="col-md-2">
                <a  v-on:click.prevent="cargar_modal_reporte()" class="btn btn-primary"> <i class="fa fa-search"></i> Seleccionar parámetros</a>
                </div>
                  <div class="col-md-6 row"><h3 id="datos"></h3></div>
                  <div class="col-md-4"> <a class="pull-rigth btn btn-success" v-on:click.prevent="generar_pdf_acta()" v-if="lista_acta.length>0"><i class="fa fa-file-pdf"></i> Exportar Acta de Conciliación</a></div>   
                </div>
                <div id="botones_acta" style="margin-bottom: 5px"> </div>
                <table id="tabla_acta" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                        <td align="center" data-column="0"><input type="text" placeholder="" class="column_filter_acta form-control" style="width: 100%" id="col_acta_0_filter"></td>
                        <td align="center" data-column="1"><input type="text" placeholder="" class="column_filter_acta form-control" style="width: 100%" id="col_acta_1_filter"></td>
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_acta 
                        form-control" style="width: 100%"  id="col_acta_2_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_acta  
                        form-control" style="width: 100%" id="col_acta_3_filter"></td>
                        <td align="center" data-column="4"><input type="text" placeholder="" class="column_filter_acta 
                        form-control" style="width: 100%" id="col_acta_4_filter"></td>
                        <td align="center" data-column="5"><input type="text" placeholder="" class="column_filter_acta 
                        form-control" style="width: 100%" id="col_acta_5_filter"></td>
                        <td align="center" data-column="6"><input type="text" placeholder="" class="column_filter_acta form-control" style="width: 100%" id="col_acta_6_filter"></td>

                  </tr>

                  <tr>
                    <th>No. Solicitud</th>
                    <th>Fecha Solicitud</th>
                    <th>Importe</th>
                    <th>Moneda de Pago</th>
                    <th>Proveedor</th>
                    <th>No. Cheque/Transferencia</th>
                    <th>Fecha Cheque/Transferencia</th>

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
                <h3 class="card-title"><i class="fa fa-list"></i> Listado Resumen de Pagos {{year}}</h3>
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
                        <td align="center" data-column="2"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_4_filter"></td>
                        <td align="center" data-column="3"><input type="text" placeholder="" class="column_filter_pagos 
                        form-control" style="width: 100%"  id="col_pagos_5_filter"></td>
                  </tr>
                  <tr>
                    <th>Proveedor</th>
                    <th>Solicitudes</th>
                    <th>Facturas</th>
                    <th>Pagado</th>
                    <th>Disponible</th>
                    <th>Importe máximo</th>
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
<form method="POST" v-on:submit.prevent="eliminar_solicitud()">
<div class="modal fade" id="delete">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <h4>¿Confirma la eliminación de esta solicitud?</h4>
            </div>
            <div class="modal-body">
              <table class="table table-striped table-bordered table-hover">
              <thead>
              <tr>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Referencia</td>
                  <td id="referencia_eliminar"> </td>
                </tr>
                  <td>Fecha</td>
                  <td id="creada_eliminar"> </td>
                </tr>
                <tr>
                  <td>Tipo</td>
                  <td id="tipo_eliminar"> </td>
                </tr>
                <tr>
                  <td>Estado</td>
                  <td id="estado_eliminar"> </td>
                </tr>
                <tr>
                  <td>Proveedor</td>
                  <td id="proveedor_eliminar"> </td>
                </tr>
                <tr>
                  <td>Contrato</td>
                  <td id="contrato_eliminar"> </td>
                </tr>
                <tr>
                  <td>Importe</td>
                  <td id="importe_eliminar"> </td>
                </tr>
                <tr>
                  <td>Cuenta</td>
                  <td id="cuenta_eliminar"> </td>
                </tr>
                <tr>
                  <td>Centro de Costo</td>
                  <td id="centro_costo_eliminar"> </td>
                </tr>
                <tr>
                  <td>Autoriza</td>
                  <td id="autoriza_eliminar"> </td>
                </tr>
                <tr>
                  <td>Concepto</td>
                  <td id="concepto_eliminar"> </td>
                </tr>
                <tr>
                  <td>Observaciones</td>
                  <td id="observaciones_eliminar"> </td>
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
<form method="POST" v-on:submit.prevent="eliminar_compra()">
<div class="modal fade" id="delete_compra">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <h4>¿Confirma la eliminación de esta compra?</h4>
            </div>
            <div class="modal-body">
              <table class="table table-striped table-bordered table-hover">
              <thead>
              <tr>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Anexo 3</td>
                  <td id="compra_referencia_eliminar"> </td>
                </tr>
                  <td>Fecha</td>
                  <td id="compra_creada_eliminar"> </td>
                </tr>
                <tr>
                  <td>Proveedor</td>
                  <td id="compra_proveedor_eliminar"> </td>
                </tr>
                <tr>
                  <td>Contrato</td>
                  <td id="compra_contrato_eliminar"> </td>
                </tr>
                <tr>
                  <td>Importe</td>
                  <td id="compra_importe_eliminar"> </td>
                </tr>
                <tr>
                  <td>Número de Solicitud</td>
                  <td id="compra_numero"> </td>
                </tr>
                <tr>
                  <td>Destino</td>
                  <td id="compra_destino"> </td>
                </tr>
                <tr>
                  <td>Productos</td>
                  <td id="compra_productos"> </td>
                </tr>
                  <td>Autoriza</td>
                  <td id="compra_autoriza_eliminar"> </td>
                </tr>
                <tr>
                  <td>Concepto</td>
                  <td id="compra_concepto_eliminar"> </td>
                </tr>
                <tr>
                  <td>Observaciones</td>
                  <td id="compra_observaciones_eliminar"> </td>
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
                      <th style="text-align: center;visibility: hidden;" id="centro_costo_th_editar">Centro de Costo</th>
                      <th style="text-align: center;visibility: hidden;" id="cuenta_th_editar">Tarea</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td style="width: auto"><input type="text" class="form-control" name="referencia" v-model="factura_editar.referencia" placeholder=""></td>
                      <td style="width: auto">
                        <input type="text" class="form-control" name="impo" v-model="factura_editar.importe"  id="factura_importe_editar" placeholder="0.00" min="0">
                      </td>
                      <td style="width: 7%">
                        <select id="moneda_factura_editar" v-model="factura_editar.moneda" name="mon" required="" class="bs-select form-control"><option value="CUP">CUP</option>
                        </select>
                      </td>
                      <td style="width: auto"><input type="date" class="form-control" v-model="factura_editar.fecha_factura"  placeholder="" id="factura_editar_fecha_factura"></td>
                      <td style="width: auto"><input type="date" class="form-control" v-model="factura_editar.fecha"  placeholder="" id="factura_editar_fecha"></td>
                      <td style="width: 20%;visibility: hidden;" id="centro_costo_select2_editar"><select id="cc_factura_editar" v-model="factura_editar.centro_costo" name="centro_costo"  class="bs-select form-control">
                          <option v-for="opt in listado_centros_costo_no_multiples" v-bind:value="opt.id">
                             {{opt.descripcion }}
                          </option>
                       </select>
                      </td>
                      <td style="width: 20%;visibility: hidden;" id="cuenta_select2_editar"><select id="cuenta_factura_editar" v-model="factura_editar.cuenta" name="cuenta"  class="bs-select form-control">
                          <option v-for="opt in listado_cuentas_facturas" v-bind:value="opt.id">
                             {{opt.descripcion }}
                          </option>
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
<form method="POST" enctype='multipart/form-data' v-on:submit.prevent="editar_trabajador()">
      <div class="modal fade" id="modal-editar-firma">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header btn-primary">
              <h4 class="modal-title">Gestionar Firma</h4>
            </div>
            <div class="modal-body">
              <div class="col-md-12" style="margin-bottom: 10px;text-align: center;">
                <div class="fileinput fileinput-new" data-provides="fileinput">
                 <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                    <img v-bind:src="trabajador.firma_actual" alt=""/>
                 </div>
                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                </div>
                <div>
                                                    <span class="btn btn-default btn-file">
                                                        <span class="fileinput-new">
                                                             Seleccionar firma
                                                        </span>
                                                        <span class="fileinput-exists">
                                                             Cambiar
                                                        </span>
                                                        <input type="file" accept=".jpg,.jpeg,.png" @change="onFileSelected">
                                                    </span>
                    <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">
                        Eliminar
                    </a>
                </div>
               </div>
              </div>
               <span v-for="error in errors_trabajador" class="text-danger"><i class="fa fa-exclamation-triangle"></i> {{ error }}</span>
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

<div class="modal fade" id="reporte">
    <div class="modal-dialog modal-medium">
        <div class="modal-content">
            <div class="modal-header btn-primary">
                <h4> Seleccione para generar acta de conciliación</h4>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Tipo</label>
                      <div class="col-sm-8">
                      <select id="reporte_tipo" required="" class="bs-select form-control" style="width: 100%">
                              <option value="personal">Personal</option>
                              <option value="area">Departamento</option>
                       </select>
                      </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Mes</label>
                      <div class="col-sm-8">
                      <select id="reporte_mes" required="" class="bs-select form-control" style="width: 100%">
                              <option value="01">Enero</option>
                              <option value="02">Febrero</option>
                              <option value="03">Marzo</option>
                              <option value="04">Abril</option>
                              <option value="05">Mayo</option>
                              <option value="06">Junio</option>
                              <option value="07">Julio</option>
                              <option value="08">Agosto</option>
                              <option value="09">Septiembre</option>
                              <option value="10">Octubre</option>
                              <option value="11">Noviembre</option>
                              <option value="12">Diciembre</option>
                       </select>
                      </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Año</label>
                      <div class="col-sm-8">
                      <input type="number" name="" required="" min="0" id="reporte_year" class="form-control" >
                      </div>
                  </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Cancelar</button>
              <a v-on:click.prevent="obtener_acta()"  class="btn btn-primary"><i class="fa fa-check"></i> Generar</a> 
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
        this.get_cargar_autorizados();
  },
  data(){
   return{
    url:'https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/',
    solicitud:{
         creada:'',
         referencia:'',
         tipo:'',
         division_territorial:'',
         departamento:'',
         estado:'pendiente instrumento',
         tcp:'',
         moneda:'CUP',
         concepto:'',
         cuenta:'',
         importe:'',
         centro_costo:'',
         contrato:'',
         suplemento:'',
         observaciones:'',
         solicita:'',
         autoriza:'',
         titular:'',
         cuenta_bancaria:'',
         motivo:'',
         permitir:'Si',
         poliza_creada:'No',
         facturas:[]
    },
    solicitud_editar:{
         id:'',
         creada:'',
         referencia:'',
         tipo:'',
         division_territorial:'',
         departamento:'',
         estado:'',
         tcp:'',
         moneda:'',
         concepto:'',
         cuenta:'',
         centro_costo:'',
         contrato:'',
         observaciones:'',
         solicita:'',
         autoriza:''
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
     centro_costo:0,
     centro_costo__descripcion:'',
     cuenta:0,
     cuenta__descripcion:''
    },
    factura_editar:{
     index:'', 
     referencia:'',
     moneda:'',
     importe:'',
     fecha:'',
     fecha_factura:'',
     dias:'',
     centro_costo:0,
     centro_costo__descripcion:'',
     cuenta:0,
     cuenta__descripcion:''
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
    listado_cuentas:[],
    listado_cuentas_facturas:[],
    listado_cuentas_tcp:[],
    listado_titulares_tcp:[],
    listado_centros_costo:[],
    listado_centros_costo_no_multiples:[],
    listado_autorizados:[],
    listado_suplementos:[],
    listado_tipo_pago:[],
    lista_pagos:[],
    lista_compras:[],
    lista_acta:[],
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
    this.get_lista_solicitudes();
   },
   buscar_pagos:function(){
    this.year=this.year_buscar;
    this.get_lista_total_pagos();
   },
   buscar_compras:function(){
    this.year=this.year_buscar;
    this.get_lista_compras();
   },
   crear:function(){
     Notiflix.Loading.standard('Cargando...');
     if(this.solicitud.facturas.length>0){
     this.solicitud.importe=this.solicitud.facturas.reduce((acc, curr) => acc + parseFloat(curr.importe), 0);
     if(this.solicitud.importe<0 /*this.disponible*/){
       toastr.error('El importe de la solicitud no puede ser menor que 0...');
     }
     else{
     var url=this.url+'sistema/adicionar_solicitud/';
     var date = new Date();
     this.solicitud.creada=date.getFullYear();
     this.solicitud.tipo=(this.solicitud.tipo).toLowerCase();
     axios.post(url,this.solicitud).then(response => {
        this.limpiar();
        this.errors=[];
        toastr.success('Operación exitosa.');
        this.maximo=0;
        this.pagado=0;
        this.disponible=0;
        this.solicitud.facturas=[];
        this.cantidad_facturas=0;
        this.cantidad_solicitudes=0;
        $('#disponible').text(0);
        //$('#maximo').text(0);
        $('#pagado').text(0);
        window.open(this.url+'sistema/anexo3/'+response.data+'/','Modelo',"fullscreen=YES");
        //this.get_lista_solicitudes();
        Notiflix.Loading.remove('Cargando...');
    }).catch(error => {
        console.log(error);
        this.errors=error.response.data.error;
        toastr.error('Existen errores.');
        Notiflix.Loading.remove('Cargando...');
    });
    }
    }
    else{
     toastr.warning('Debe adicionar una factura.');
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
     if(response.data=='None' && x==0){
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
    cargar_modal_reporte:function(){
      $('#reporte').modal('show');
    },
    obtener_acta:function(){
      Notiflix.Loading.standard('Cargando...');
     tipo=$('#reporte_tipo').val();
     mes=$('#reporte_mes').val();
     year=$('#reporte_year').val();

      if(tipo=='personal'){
        var url=this.url+'sistema/listado_conciliacion_usuario/'+year+'/'+mes+'/';
      axios.get(url).then(response => {
      this.lista_acta= response.data; 
      this.tabla_acta_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      }
      else{
        var url=this.url+'sistema/listado_conciliacion_departamento/'+year+'/'+mes+'/';
      axios.get(url).then(response => {
      this.lista_acta=response.data;  
      this.tabla_acta_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
      }
      if(tipo=='area')
      tipo="Departamento"
      else
      tipo='Personal'  
      $('#datos').text('Reporte: "'+tipo+'" con fecha "'+mes+'-'+year+'"');
      $('#reporte').modal('hide');
    },
    generar_pdf_acta:function(){
      Notiflix.Loading.standard('Cargando...');
     tipo=$('#reporte_tipo').val();
     mes=$('#reporte_mes').val();
     year=$('#reporte_year').val();

    window.open(this.url+'sistema/conciliacion/'+tipo+'/'+year+'/'+mes+'/','TICKET',"fullscreen=YES");
    Notiflix.Loading.remove('Cargando...'); 
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
     if(x.centro_costo!=undefined){
     this.factura_editar.centro_costo=x.centro_costo;
     $("#cc_factura_editar").val(x.centro_costo).trigger('change'); 
     }
     else
     this.factura_editar.centro_costo__id=0;
     if(x.cuenta!=undefined){
     this.factura_editar.cuenta=x.cuenta;
     $("#cuenta_factura_editar").val(x.cuenta).trigger('change'); 
     }
     else
     this.factura_editar.cuenta__id=0;
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
     if(response.data=='None'){     
     index=this.factura_editar.index;
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
     if(this.factura_editar.centro_costo!=undefined){
     this.solicitud.facturas[index].centro_costo=this.factura_editar.centro_costo;
     }
     else{
     this.solicitud.facturas[index].centro_costo=0; 
     }
     this.solicitud.facturas[index].centro_costo__descripcion=this.factura_editar.centro_costo__descripcion;
     if(this.factura_editar.cuenta!=undefined){
     this.solicitud.facturas[index].cuenta=this.factura_editar.cuenta;
     }
     else{
     this.solicitud.facturas[index].cuenta=0; 
     }
     this.solicitud.facturas[index].cuenta__descripcion=this.factura_editar.cuenta__descripcion;
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
    get_editar:function(id){
      this.errors_editar=[];
      var url=this.url+'sistema/detalles_solicitud/'+id+'/';
      axios.get(url).then(response => {
         this.solicitud_editar.id=response.data.solicitud.id;
         this.solicitud_editar.referencia=response.data.solicitud.referencia;
         this.solicitud_editar.division_territorial=response.data.solicitud.division_territorial;
         this.solicitud_editar.trabajador=response.data.solicitud.trabajador;
         this.solicitud_editar.tipo=response.data.solicitud.tipo;
         $('#tipo_editar').val(this.solicitud_editar.tipo);
         $('#tipo_editar').select2().trigger('change');
         this.solicitud_editar.carga=response.data.solicitud.carga;
         this.solicitud_editar.fecha=response.data.solicitud.fecha;     
         this.solicitud_editar.origen=response.data.solicitud.origen;
         this.solicitud_editar.destino=response.data.solicitud.destino;
         this.solicitud_editar.cantidad=response.data.solicitud.cantidad;
         this.solicitud_editar.detalle=response.data.solicitud.detalle;
         $('#fecha2').val((response.data.solicitud.fecha).replace('T',' '));
      }).catch(error =>{});
    },

    editar_trabajador:function(){
      var url=this.url+'sistema/editar_trabajador/'+this.trabajador.id+'/';
      const fd =new FormData();
      fd.append('firma',this.trabajador.firma,this.trabajador.firma.name);
      fd.append('usuario',this.trabajador.usuario);
      fd.append('rol',this.trabajador.rol);
      fd.append('cargo',this.trabajador.cargo);
      fd.append('division_territorial',this.trabajador.division_territorial);
      fd.append('id',this.trabajador.id);
      axios.post(url,fd).then(response => {  
      toastr.success('Operación exitosa.');
      this.errors_trabajador=[];
      }).catch(error => {
         this.errors_trabajador=error.response.data.error;
         toastr.error('Existen errores.');
      });
      
    },
    editar_solicitud:function(){
      var url=this.url+'sistema/editar_solicitud/'+this.solicitud_editar.id+'/';
      this.solicitud_editar.fecha=$('#fecha2').val();
      axios.post(url,this.solicitud_editar).then(response => {
      toastr.success('Operación exitosa.');
      this.errors_editar=[];
      this.get_lista_demandas();
      }).catch(error => {
        this.errors_editar=error.response.data.error;
        toastr.error('Existen errores.');
      });
    },
    eliminar_solicitud: function(persona) {
         var url=this.url+'sistema/eliminar_solicitud/'+localStorage.getItem('eliminar')+'/';
         axios.delete(url).then(response => {
         this.get_lista_solicitudes();
         $('#delete').modal('hide');
         toastr.success('Eliminado correctamente');
        });
    },
    eliminar_compra: function(persona) {
         var url=this.url+'sistema/eliminar_compra/'+localStorage.getItem('eliminar_compra')+'/';
         axios.delete(url).then(response => {
         this.get_lista_compras();
         $('#delete_compra').modal('hide');
         toastr.success('Eliminado correctamente');
        });
    },
    limpiar:function(){
        this.solicitud.creada='';
        this.solicitud.referencia='';
        this.solicitud.tipo='';
        $("#tipo").val('').trigger('change');
        this.solicitud.tcp='';
        $("#tcp").val('').trigger('change');
        this.solicitud.importe='';
        this.solicitud.concepto='';
        this.solicitud.cuenta='';
        $("#cuenta").val('').trigger('change');
        this.solicitud.centro_costo='';
        $("#centro_costo").val('').trigger('change');
        this.solicitud.contrato='';
        $("#contrato").val('').trigger('change');
        this.solicitud.observaciones='';
        this.solicitud.autoriza='';
        $("#select_autoriza").val('').trigger('change');
        this.solicitud.motivo='';
        $("#motivo").val('').trigger('change');
        this.solicitud.cuenta_bancaria='';
        $("#cuenta_bancaria").val('').trigger('change');
        this.solicitud.titular='';
        $("#titular").val('').trigger('change');
    },
    get_lista_solicitudes:function(){
      Notiflix.Loading.standard('Cargando...');
      var url=this.url+'sistema/listado_solicitud_solicitante/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_solicitudes=response.data;
      this.tabla_solicitudes_config();
      Notiflix.Loading.remove('Cargando...');
      }).catch(error => {
      Notiflix.Loading.remove('Cargando...');  
      });
    },
    get_lista_compras:function(){
      var url=this.url+'sistema/listado_compras_solicitante/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_compras=response.data;
      this.tabla_compras_config();
      }).catch(error => {});
    },
    get_lista_tcp:function(dtar){
      var url=this.url+'sistema/cargar_tcps/';
      axios.get(url).then(response =>{
      this.listado_tcp=response.data;
      }).catch(error => {});
    },
    get_lista_cuentas:function(dtar){
      var url=this.url+'sistema/cargar_cuentas_dtar/'+dtar+'/';
      axios.get(url).then(response => {
      this.listado_cuentas=response.data;
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
      axios.get(url).then(response => {
      this.listado_tipo_pago=response.data;
      }).catch(error => {});
    },
    get_lista_cargar_suplementos_contratos:function(contrato){
      var url=this.url+'sistema/cargar_suplementos_contratos/'+contrato+'/';
      axios.get(url).then(response => {
      this.listado_suplementos=response.data;
      }).catch(error => {});
    },
    get_cargar_autorizados:function(){
      var url=this.url+'sistema/cargar_autorizados/';
      axios.get(url).then(response => {
      this.listado_autorizados=response.data;
      }).catch(error => {});
    },
    get_lista_total_pagos:function(){
      var url=this.url+'sistema/cargar_tcp_estado_actual/'+this.year+'/';
      axios.get(url).then(response => {
      this.lista_pagos=response.data;
      this.tabla_pagos_config();
      }).catch(error => {});
    },
    tabla_pagos_config:function(){
     $("#tabla_pagos").DataTable({
      "bDestroy":true,
      "data":this.lista_pagos,
      "responsive": true,
      "order": [],
      "columns": [
            { "data": "solicitud__tcp__nombre" },
            { "data": "solicitudes"},
            { "data": "facturas"},
            { "data": "pagado",
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
            
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
                  columns: [0,1,2,3,4,5],
                  rows: ':visible',
            }
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [0,1,2,3,4,5],
                  rows: ':visible'
            }
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [0,1,2,3,4,5],
                  rows: ':visible'
            }
            },
            {
                extend: 'pdf',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [0,1,2,3,4,5],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [0,1,2,3,4,5],
                  rows: ':visible'
            }
            },]
    }).buttons().container().prependTo('#botones_pagos');
    },
    cargar_pago_actual:function(){
      var url=this.url+'sistema/cargar_pago_actual/'+this.solicitud.tcp+'/'+this.year+'/';
      axios.get(url).then(response => {
      if(response.data.length>0){
      //this.maximo=response.data[0].solicitud__tcp__importe_maximo;
      //$('#maximo').text(this.maximo.toLocaleString('en-US', { minimumFractionDigits: 2}));
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
        //$('#maximo').text(this.disponible.toLocaleString('en-US', { minimumFractionDigits: 2}));
      }
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
              "defaultContent": '<div style="text-align: center;display:ruby-base"> <button class="btn btn-xs btn-warning" title="Descargar Modelo" style="color: white"><i class="fa fa-download"></i></button> <button class="btn btn-xs btn-primary" title="Editar" style="color: white"><i class="fa fa-edit"></i></button> <button class="btn btn-xs btn-danger" title="Eliminar" style="color: white"><i class="fa fa-trash"></i></button> </div>'
            },
            { "data": "referencia" },
            { "data": "creada" ,
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
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible',
            }
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            }
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            }
            },
            {
                extend: 'pdf',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            }
            }]
    }).buttons().container().prependTo('#botones');
    },
    tabla_acta_config:function(){
     $("#tabla_acta").DataTable({
      "bDestroy":true,
      "data":this.lista_acta,
      "responsive": true,
      "order": [],
      "columns": [
             { "data": null , 
              "render": function (data, type, row) {
                            a=  (row['referencia']).split('/');
                            return parseInt(a[0]);
                        } 
            },
            { "data": null , 
              "render": function (data, type, row) {
                            a= (row['creada']).split('T');
                            return a[0];
                        } 
            },
            { "data": "importe", 
              render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
            { "data": "moneda" },
            { "data": "tcp__nombre" },
            { "data": "cheque_transferencia"},
            { "data": "fecha_ok_economia"}
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
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible',
            }  
            },
            {
                extend: "csv",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file"></span> CSV',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            } 
            },
            {
                extend: "excel",
                footer: true,
                title: 'Listado',
                text:'<span class="fa fa-file-excel"></span> EXCEL',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            } 
            },
            {
                extend: 'pdf',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-file-pdf"></span> PDF',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            }
            },
            {
                extend: 'print',
                footer: true, 
                title: 'Listado',
                text:'<span class="fa fa-print"></span> Imprimir',
                exportOptions: {
                  columns: [2,3,4,5,6,7,8,9,10,11,12,13,14],
                  rows: ':visible'
            } 
            }]
    }).buttons().container().prependTo('#botones_acta');
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
    filterColumn_acta:function(i){

      $('#tabla_acta').DataTable().column( i ).search( 
        $('#col_acta_'+i+'_filter').val()
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
    var date = new Date();
    var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());

    $('#factura_editar_fecha').attr('max',new Date().toISOString().split('T')[0]);
    $('#factura_fecha').attr('max', new Date().toISOString().split('T')[0]);
    $('#factura_editar_fecha_factura').attr('max',new Date().toISOString().split('T')[0]);
    $('#factura_fecha_factura').attr('max', new Date().toISOString().split('T')[0]);

     
    $('#reservationdate').datetimepicker({
      format:'YYYY-MM-DD HH:mm:ss',
      timePicker: true,
      pick12HourFormat: false,
      locale: 'es',
      minDate: today,
      icons: {
        time: "fa fa-clock",
      }
    });

    $('#reservationdate2').datetimepicker({
      format:'YYYY-MM-DD HH:mm:ss',
      timePicker: true,
      pick12HourFormat: false,
      locale: 'es',
      minDate: today,
      icons: {
        time: "fa fa-clock",
      }
    });
    $('.bs-select').select2();

    $('#miSelect').change(function (){
          vm.entrega.destino =$("#miSelect option:selected").val();
    });
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
   // vm.get_lista_tcp(vm.solicitud.division_territorial);
    vm.get_lista_cuentas(vm.solicitud.division_territorial);
    vm.get_lista_centros_costo(vm.solicitud.division_territorial);
    vm.get_lista_centros_costo_no_multiples(vm.solicitud.division_territorial);
    vm.get_lista_cuentas_facturas(vm.solicitud.division_territorial);

    }).catch(error => {
        toastr.error('Existen errores.');
    });



    $('input.column_filter').on( 'keyup click', function () {
        vm.filterColumn( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_pagos').on( 'keyup click', function () {
        vm.filterColumn_pagos( $(this).parents('td').attr('data-column') );
    } );
    $('input.column_filter_acta').on( 'keyup click', function () {
        vm.filterColumn_acta( $(this).parents('td').attr('data-column') );
    } );

    $(document).on('shown.bs.tab', 'a[data-toggle="pill"]', function(e) {
        e.stopPropagation();
        $.fn.dataTable.tables({
            visible: true,
            api: true
        }).columns.adjust();
    });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open(vm.url+'sistema/anexo3/'+data.id+'/','TICKET',"fullscreen=YES");
     });

     $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.estado!='pendiente instrumento'){
          toastr.error('No puedes eliminar la solicitud en este estado...');
        }
        else{

           localStorage.setItem('eliminar',data.id);
           $('#referencia_eliminar').text(data.referencia);
           $("#creada_eliminar").text(data.creada);
           $("#tipo_eliminar").text(data.tipo);
           $("#estado_eliminar").text(data.estado);
           $("#proveedor_eliminar").text(data.tcp__nombre);
           $("#contrato_eliminar").text(data.contrato__descripcion);
           $("#importe_eliminar").text(data.importe);
           $("#cuenta_eliminar").text(data.cuenta__descripcion);
           $("#centro_costo_eliminar").text(data.centro_costo__descripcion);
           $("#autoriza_eliminar").text(data.autoriza__usuario__username);
           $("#concepto_eliminar").text(data.concepto);
           $("#observaciones_eliminar").text(data.observaciones);
           $('#delete').modal('show');

       }

      });

      $('#tabla_solicitudes').on( 'click', 'tbody tr .btn-primary', function () {
        tablee=$('#tabla_solicitudes').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        if(data.estado == 'pendiente instrumento')
        window.location='#/solicitud_editar/'+data.id;
        else
        toastr.warning('No se puede editar la solicitud en este estado...');
      } );

     $('#tabla_compras').on( 'click', 'tbody tr .btn-warning', function () {
        tablee=$('#tabla_compras').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();
        window.open(vm.url+'sistema/compra/'+data.id+'/','TICKET',"fullscreen=YES");
     });

     $('#tabla_compras').on( 'click', 'tbody tr .btn-danger', function () {
        tablee=$('#tabla_compras').DataTable(); 
        var data = tablee.row( $(this).parents('tr') ).data();

           localStorage.setItem('eliminar_compra',data.id);
           $('#compra_referencia_eliminar').text(data.solicitud__referencia);
           $("#compra_creada_eliminar").text(data.creada);
           $("#compra_numero").text(data.numero);
           $("#compra_destino").text(data.destino);
           $("#compra_productos").text(data.productos);
           $("#compra_proveedor_eliminar").text(data.solicitud__tcp__nombre);
           $("#compra_contrato_eliminar").text(data.solicitud__contrato__descripcion);
           $("#compra_importe_eliminar").text(data.solicitud__importe);
           $("#compra_autoriza_eliminar").text(data.solicitud__autoriza__usuario__username);
           $("#compra_concepto_eliminar").text(data.solicitud__concepto);
           $("#compra_observaciones_eliminar").text(data.solicitud__observaciones);
           $('#delete_compra').modal('show'); 

      } );

      $('.bs-select').select2({
         placeholder: "Seleccione...",
         
      });

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
      $('#tcp').change(function (){
          vm.listado_contratos = [];
          vm.listado_suplementos = [];
          vm.listado_titulares_tcp = [];
          vm.listado_cuentas_tcp = [];
          vm.listado_tipo_pago = [];
          vm.solicitud.tcp = $("#tcp option:selected").val();
          if(vm.solicitud.tcp>0){
          //vm.disponible = vm.listado_tcp.find((e) => e.id == vm.solicitud.tcp).importe_maximo;
          vm.get_lista_cargar_contratos_tcp(vm.solicitud.tcp);
          vm.get_lista_cargar_cuentas_tcp(vm.solicitud.tcp);
          vm.get_lista_cargar_titular_tcp(vm.solicitud.tcp);
          vm.get_lista_tipo_pago(vm.solicitud.tcp);
          vm.cargar_pago_actual();  
          }          
          else
          vm.disponible=0;          
      });

      $('#cuenta').change(function (){
          vm.solicitud.cuenta =$("#cuenta option:selected").val();
          x=$("#cuenta option:selected").text();

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
      $('#contrato').change(function (){
          vm.solicitud.contrato =$("#contrato option:selected").val();
          vm.listado_suplementos=[];
          if(vm.solicitud.contrato>0)
          vm.get_lista_cargar_suplementos_contratos(vm.solicitud.contrato);
      });
      $('#suplemento').change(function (){
          vm.solicitud.suplemento =$("#suplemento option:selected").val();
      });
      $('#motivo').change(function (){
          vm.solicitud.motivo =$("#motivo option:selected").val();
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
      $('#cc_factura').change(function (){
          vm.factura.centro_costo = $("#cc_factura option:selected").val();
          vm.factura.centro_costo__descripcion = $("#cc_factura option:selected").text();
      });
      $('#cc_factura_editar').change(function (){
          vm.factura_editar.centro_costo =$("#cc_factura_editar option:selected").val();
          vm.factura_editar.centro_costo__descripcion = $("#cc_factura_editar option:selected").text();          
      });
      $('#cuenta_factura').change(function (){
          vm.factura.cuenta = $("#cuenta_factura option:selected").val();
          vm.factura.cuenta__descripcion = $("#cuenta_factura option:selected").text();
      });
      $('#cuenta_factura_editar').change(function (){
          vm.factura_editar.cuenta =$("#cuenta_factura_editar option:selected").val();
          vm.factura_editar.cuenta__descripcion = $("#cuenta_factura_editar option:selected").text();          
      }); 
    
  }
}
</script>
 
