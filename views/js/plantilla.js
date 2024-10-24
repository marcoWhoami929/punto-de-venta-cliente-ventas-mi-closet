$(function () {
  url = window.location.pathname;
  ruta = url.split("/");
  console.log(ruta[2]);
  switch (ruta[2]) {
    case "notas":
      listadoNotas(1);
      break;
  }
});
function listadoNotas(page) {
  var query = $("#name").val();
  var centroTrabajo = $("#centroTrabajo").val();
  var canalComercial = $("#canalComercial").val();
  var per_page = $("#per_page").val();
  var anio = $("#anio").val();
  var parametros = {
    action: "conceptoPinturas",
    page: page,
    query: query,
    CCENTROTRABAJO: centroTrabajo,
    CCANALCOMERCIAL: canalComercial,
    anio: anio,
    per_page: per_page,
  };
  $("#loader").fadeIn("slow");
  $.ajax({
    url: "ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {
      $("#loader").html("Cargando Porfavor Espere ........");
    },
    success: function (data) {
      $(".datos_ajax").html(data).fadeIn("slow");
      $("#loader").html("");
    },
  });
}
