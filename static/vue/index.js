'use strict';
var ruta='https://'+document.location.hostname+':'+document.location.port+'/estaticos_solicitud_pago';
var inicio = httpVueLoader(ruta+'/vue/inicio.vue');
var solicitante_inicio = httpVueLoader(ruta+'/vue/solicitante/inicio.vue');
var solicitud_editar = httpVueLoader(ruta+'/vue/solicitante/editar.vue');
var autorizado_inicio = httpVueLoader(ruta+'/vue/autorizado/inicio.vue');
var abogado_inicio = httpVueLoader(ruta+'/vue/abogado/inicio.vue');
var proveedor_editar = httpVueLoader(ruta+'/vue/abogado/proveedores/editar.vue');
var proveedor_adicionar = httpVueLoader(ruta+'/vue/abogado/proveedores/adicionar.vue');
var proveedor_listado = httpVueLoader(ruta+'/vue/abogado/proveedores/listado.vue');
var contrato_editar = httpVueLoader(ruta+'/vue/abogado/contratos/editar.vue');
var contrato_adicionar = httpVueLoader(ruta+'/vue/abogado/contratos/adicionar.vue');
var contrato_listado = httpVueLoader(ruta+'/vue/abogado/contratos/listado.vue');
var suplemento_editar = httpVueLoader(ruta+'/vue/abogado/suplementos/editar.vue');
var suplemento_adicionar = httpVueLoader(ruta+'/vue/abogado/suplementos/adicionar.vue');
var suplemento_listado = httpVueLoader(ruta+'/vue/abogado/suplementos/listado.vue');
var economia_inicio = httpVueLoader(ruta+'/vue/economia/inicio.vue');
var contrato_listado_ver = httpVueLoader(ruta+'/vue/contratos/listado.vue');
var proveedor_listado_ver = httpVueLoader(ruta+'/vue/proveedores/listado.vue');
var suplemento_listado_ver = httpVueLoader(ruta+'/vue/suplementos/listado.vue');

var routes = [
{
  path: '/',
  name: 'inicio',
  component: inicio
},
{
  path: '/solicitante_inicio',
  name: 'solicitante_inicio',
  component: solicitante_inicio
},
{
  path: '/solicitud_editar/:id_solicitud',
  name: 'solicitud_editar',
  component: solicitud_editar
},
{
  path: '/autorizado_inicio',
  name: 'autorizado_inicio',
  component: autorizado_inicio
},
{
  path: '/abogado_inicio',
  name: 'abogado_inicio',
  component: abogado_inicio
},
{
  path: '/proveedor_adicionar',
  name: 'proveedor_adicionar',
  component: proveedor_adicionar
},
{
  path: '/proveedor_editar/:id_proveedor',
  name: 'proveedor_editar',
  component: proveedor_editar
},
{
  path: '/proveedor_listado',
  name: 'proveedor_listado',
  component: proveedor_listado
},
{
  path: '/contrato_adicionar',
  name: 'contrato_adicionar',
  component: contrato_adicionar
},
{
  path: '/contrato_editar/:id_contrato',
  name: 'contrato_editar',
  component: contrato_editar
},
{
  path: '/contrato_listado',
  name: 'contrato_listado',
  component: contrato_listado
},
{
  path: '/suplemento_adicionar',
  name: 'suplemento_adicionar',
  component: suplemento_adicionar
},
{
  path: '/suplemento_editar/:id_contrato',
  name: 'suplemento_editar',
  component: suplemento_editar
},
{
  path: '/suplemento_listado',
  name: 'suplemento_listado',
  component: suplemento_listado
},
{
  path: '/contrato_listado_ver',
  name: 'contrato_listado_ver',
  component: contrato_listado_ver
},
{
  path: '/proveedor_listado_ver',
  name: 'proveedor_listado_ver',
  component: proveedor_listado_ver
},
{
  path: '/suplemento_listado_ver',
  name: 'suplemento_listado_ver',
  component: suplemento_listado_ver
},
{
  path: '/economia_inicio',
  name: 'economia_inicio',
  component: economia_inicio
},
];

var router = new VueRouter({
  routes: routes,
});

var app = new Vue({
  router: router
}).$mount('#app');
