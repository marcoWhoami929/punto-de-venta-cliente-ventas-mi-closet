$(function () {
  url = window.location.pathname;
  ruta = url.split("/");

  switch (ruta[2]) {
    case "listaNotas":
      listadoNotas(1);

      break;
  }
});
function listadoNotas(page) {
  var busqueda = $("#busqueda").val();
  var campoOrden = $("#campoOrden").val();
  var orden = $("#orden").val();
  var per_page = $("#per_page").val();

  var parametros = {
    action: "lista_notas",
    page: page,
    busqueda: busqueda,
    campoOrden: campoOrden,
    orden: orden,
    vista: "listadoNotas",
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
      $(".lista-notas").html(data).fadeIn("slow");
      $("#loader").html("");
    },
  });
}
function countDown(fechaPublicacion, fechaExpiracion, id, estado) {
  if (estado == 0) {
    document.getElementById("countdown" + id).innerHTML =
      "<span class='text-white'>CURSO CANCELADO!</span>";
  } else {
    var publicacion = new Date(fechaPublicacion).getTime();
    var expiracion = new Date(fechaExpiracion).getTime();
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;

    function showRemaining() {
      var now = new Date();
      var distance = publicacion - now;

      if (distance < 0) {
        var distance = expiracion - now;
        /*
        clearInterval(timer);
        document.getElementById("countdown" + id).innerHTML =
          "<span class='text-white'>CURSO INICIADO!</span>";
        return;
        */
      }
      var days = Math.floor(distance / _day);
      var hours = Math.floor((distance % _day) / _hour);
      var minutes = Math.floor((distance % _hour) / _minute);
      var seconds = Math.floor((distance % _minute) / _second);
      document.getElementById("countdown" + id).innerHTML =
        '<div class="box">' +
        days +
        '<div class="text">DIAS</div></div><div class="box">' +
        hours +
        '<div class="text">HORAS</div></div><div class="box">' +
        minutes +
        '<div class="text">MIN</div></div><div class="box">' +
        seconds +
        '<div class="text">SEG</div></div>';
    }
    timer = setInterval(showRemaining, 1000);
  }
}
function cargarNota(fechaPublicacion, fechaExpiracion) {
  var now = new Date();
  var distance = fechaPublicacion - now;
  if (distance < 0) {
  } else {
    Swal.fire({
      title: "¿Quieres salir del sistema?",
      text: "La sesión actual se cerrará y saldrás del sistema",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, salir",
      cancelButtonText: "Cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        let url = this.getAttribute("href");
        window.location.href = url;
      }
    });
  }
}
