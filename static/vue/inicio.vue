<template>
  <div>
  </div>
</template>

<script>
module.exports = {

  mounted(){
        var url='https://'+document.location.hostname+':'+document.location.port+'/solicitud_pago/sistema/usuario/';
        axios.get(url).then(response => {
        if(response.data.trabajador_rol=='solicitante')
        window.location='#/solicitante_inicio';
        if(response.data.trabajador_rol=='autoriza')
        window.location='#/autorizado_inicio';
        if(response.data.trabajador_rol=='abogado')
        window.location='/solicitud_pago/admin/';
        if(response.data.trabajador_rol=='supervisor')
        window.location='#/autorizado_inicio';
        if(response.data.trabajador_rol=='economia')
        window.location='#/economia_inicio';
    }).catch(error => {
        //toastr.error('Existen errores.');
    });
  }
}
</script>