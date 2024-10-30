$(function () {
  url = window.location.pathname;
  ruta = url.split("/");

  switch (ruta[2]) {
    case "listaNotas":
      listadoNotas(1);
      break;
  }
  if (ruta[3] != undefined) {
    codigoNota = ruta[3];
    detalleProductosNota(codigoNota);
    carritoNota(codigoNota);
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
      var distance2 = expiracion - now;

      if (distance < 0) {
        if (distance2 < 0) {
          document.getElementById("countdown" + id).innerHTML =
            "<span class='text-white'>Nota Finalizada</span>";
          return;
        } else {
          var distance = expiracion - now;
        }

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
function cargarNota(codigo, fechaActual, fechaPublicacion, fechaExpiracion) {
  var fechaActual = new Date(fechaActual);
  var fechaPublicacion = new Date(fechaPublicacion);
  var fechaExpiracion = new Date(fechaExpiracion);

  if (fechaPublicacion > fechaActual) {
    Swal.fire({
      title: "Nota sin iniciar",
      text: "La nota aun no se encuentra disponible para adquirir, porfavor espere el tiempo restante.",
      icon: "warning",
      confirmButtonColor: "#B99654",
      confirmButtonText: "Entendido",
    });
  } else {
    if (fechaActual > fechaExpiracion) {
      Swal.fire({
        title: "Nota finalizada",
        text: "El tiempo de la nota ha expirado, no se puede adquirir la nota",
        icon: "warning",
        confirmButtonColor: "#B99654",
        confirmButtonText: "Entendido",
      });
    } else {
      if (fechaExpiracion > fechaPublicacion) {
        Swal.fire({
          title: "Adquirir Nota",
          text: "Visualizar para poder elegir los productos de la nota.",
          icon: "info",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Visualizar",
          cancelButtonText: "Cancelar",
        }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = "detalleNota/" + codigo;
          } else {
            alert("cancelado");
          }
        });
      }
    }
  }
}
/***
 * FUNCIONES INCREMENT DECREMENT LISTADO
 */
function decrementar(idProducto) {
  var actual = $("#cantidad" + idProducto).val();
  var cantidad = Number.parseInt(actual) - 1;
  if (cantidad == 0) {
  } else {
    $("#cantidad" + idProducto).val(cantidad);
  }
}
function incrementar(idProducto) {
  var actual = $("#cantidad" + idProducto).val();
  var cantidad = Number.parseInt(actual) + 1;
  if (cantidad == 0) {
  } else {
    $("#cantidad" + idProducto).val(cantidad);
  }
}
function detalleProductosNota(codigoNota) {
  var parametros = {
    action: "detalle_nota",
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      $(".detalle-notas").html(data).fadeIn("slow");
    },
  });
}
function totalesCarrito(codigoNota) {
  var parametros = {
    action: "totales_carrito",
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      $(".container-totales").html(data).fadeIn("slow");
    },
  });
}
function agregarProductoCarrito(
  idProducto,
  codigo,
  descripcion,
  porc_descuento,
  precio_venta,
  codigoNota
) {
  var cantidad = $("#cantidad" + idProducto).val();
  var color = $("#color" + idProducto).val();
  var talla = $("#talla" + idProducto).val();

  var descuento =
    (Number.parseFloat(precio_venta) *
      Number.parseFloat(cantidad) *
      Number.parseFloat(porc_descuento)) /
    100;

  var subtotal = Number.parseFloat(cantidad) * Number.parseFloat(precio_venta);
  var total = Number.parseFloat(subtotal) - Number.parseFloat(descuento);

  var parametros = {
    action: "agregar_producto",
    idProducto: idProducto,
    codigo: codigo,
    precio_venta: precio_venta,
    porc_descuento: porc_descuento,
    descuento: descuento,
    cantidad: cantidad,
    subtotal: subtotal,
    color: color,
    talla: talla,
    total: total,
    descripcion: descripcion,
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      var response = data.replace(/['"]+/g, "");
      if (response == "agregado") {
        carritoNota(codigoNota);
      }
    },
  });
}
function carritoNota(codigoNota) {
  var parametros = {
    action: "carrito_nota",
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      $(".productos-nota").html(data).fadeIn("slow");
    },
  });
  totalesCarrito(codigoNota);
}
function removerProductoCarrito(tokenProducto, codigoNota) {
  var parametros = {
    action: "remover_producto",
    token: tokenProducto,
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      var response = data.replace(/['"]+/g, "");
      if (response == "eliminado") {
        carritoNota(codigoNota);
      } else {
        alert("Ocurrio un error al eliminar el producto del carrito");
      }
    },
  });
}
/***
 * FUNCIONES INCREMENT DECREMENT CARRITO
 */
function decrementarCarrito(token, precio_venta, porc_descuento) {
  var actual = $("#cantidadCarrito" + token).val();
  var cantidad = Number.parseInt(actual) - 1;
  if (cantidad == 0) {
  } else {
    actualizarProductoCarrito(
      cantidad,
      precio_venta,
      porc_descuento,
      token,
      codigoNota
    );
  }
}
function incrementarCarrito(token, precio_venta, porc_descuento) {
  var actual = $("#cantidadCarrito" + token).val();

  var cantidad = Number.parseInt(actual) + 1;
  if (cantidad == 0) {
  } else {
    actualizarProductoCarrito(
      cantidad,
      precio_venta,
      porc_descuento,
      token,
      codigoNota
    );
  }
}
function actualizarProductoCarrito(
  cantidad,
  precio_venta,
  porc_descuento,
  token,
  codigoNota
) {
  var descuento =
    (Number.parseFloat(precio_venta) *
      Number.parseFloat(cantidad) *
      Number.parseFloat(porc_descuento)) /
    100;

  var subtotal = Number.parseFloat(cantidad) * Number.parseFloat(precio_venta);
  var total = Number.parseFloat(subtotal) - Number.parseFloat(descuento);
  var parametros = {
    action: "actualizar_producto",
    token: token,
    cantidad: cantidad,
    descuento: descuento,
    subtotal: subtotal,
    total: total,
    codigoNota: codigoNota,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      var response = data.replace(/['"]+/g, "");
      if (response == "actualizado") {
        carritoNota(codigoNota);
      } else {
        alert("Ocurrio un error al actualizar el producto del carrito");
      }
    },
  });
}
