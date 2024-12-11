$(function () {
  url = window.location.pathname;

  ruta = url.split("/");

  switch (ruta[2]) {
    case "listaNotas":
      listadoNotas(1);
      break;
    case "notasAdquiridas":
      listadoNotasAdquiridas(1);
      break;
    case "estatusNotas":
      listadoEstatusNotas(1);
      break;
    case "inicio":
      break;
  }
  if (ruta[3] != undefined) {
    switch (ruta[2]) {
      case "detalleNota":
        codigoNota = ruta[3];
        detalleProductosNota(codigoNota);
        carritoNota(codigoNota);
        $("#modalProductos").modal("show");
        cargarMetodosPago();
        break;
      case "visualizarNota":
        codigoVenta = ruta[3];
        carritoVenta(codigoVenta);
        break;
    }
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
function countDownVentas(
  fechaPago,
  id_venta,
  estatus,
  estatus_pago,
  forma_pago
) {
  if (estatus_pago == 1) {
    return;
  }
  if (estatus == 0) {
    document.getElementById("estatusPagoNota" + id_venta).innerHTML = "";
    document.getElementById("riboon" + id_venta).innerHTML =
      '<div class="ribbon right" style="--c: #CC333F;--f: 10px;">Cancelada</div>';

    document.getElementById("countdownVentas" + id_venta).innerHTML = "";
    return;
  }
  var fechaPago = new Date(fechaPago).getTime();

  var _second = 1000;
  var _minute = _second * 60;
  var _hour = _minute * 60;
  var _day = _hour * 24;
  var timer;

  function showRemainingVentas() {
    var now = new Date();
    var distance = fechaPago - now;

    if (distance < 0) {
      clearInterval(timer);
      document.getElementById("estatusPagoNota" + id_venta).innerHTML =
        "No Se Puede Adquirir";
      document.getElementById("riboon" + id_venta).innerHTML =
        '<div class="ribbon-2 ">Por Cancelar</div>';

      document.getElementById("countdownVentas" + id_venta).innerHTML =
        "<span class='text-white'>Tiempo Agotado</span>";
      return;
    } else {
      var distance = fechaPago - now;
    }
    var days = Math.floor(distance / _day);
    var hours = Math.floor((distance % _day) / _hour);
    var minutes = Math.floor((distance % _hour) / _minute);
    var seconds = Math.floor((distance % _minute) / _second);
    document.getElementById("countdownVentas" + id_venta).innerHTML =
      '<div class="box">' +
      days +
      '<div class="text">DIAS</div></div><div class="box">' +
      hours +
      '<div class="text">HORAS</div></div><div class="box">' +
      minutes +
      '<div class="text">MIN</div></div><div class="box">' +
      seconds +
      '<div class="text">SEG</div></div>';
    document.getElementById("estatusPagoNota" + id_venta).innerHTML =
      "Tiempo Para Pagar";
  }
  timer = setInterval(showRemainingVentas, 1000);
}
function countDownVentasDetalle(
  fechaPago,
  id_venta,
  estatus,
  estatus_pago,
  forma_pago
) {
  if (estatus_pago == 1) {
    document.getElementById("countdownVentasDetalle" + id_venta).innerHTML =
      '<button type="button" class="btn btn-success mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;">Nota Pagada</button>';
    return;
  }
  var fechaPago = new Date(fechaPago).getTime();

  var _second = 1000;
  var _minute = _second * 60;
  var _hour = _minute * 60;
  var _day = _hour * 24;
  var timer;

  function showRemainingVentasDetalle() {
    var now = new Date();
    var distance = fechaPago - now;

    if (distance < 0) {
      clearInterval(timer);

      document.getElementById("countdownVentasDetalle" + id_venta).innerHTML =
        "<span class='text-white'>Tiempo Agotado</span>";
      return;
    } else {
      var distance = fechaPago - now;
    }
    var days = Math.floor(distance / _day);
    var hours = Math.floor((distance % _day) / _hour);
    var minutes = Math.floor((distance % _hour) / _minute);
    var seconds = Math.floor((distance % _minute) / _second);
    document.getElementById("countdownVentasDetalle" + id_venta).innerHTML =
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
  timer = setInterval(showRemainingVentasDetalle, 1000);
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
          }
        });
      }
    }
  }
}
function cargarMetodosPago() {
  var tipo_entrega = $("#tipo_entrega_nota").val();
  var parametros = {
    action: "metodos_pago",
    tipo_entrega: tipo_entrega,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      var metodos = JSON.parse(data);

      $("#forma_pago_nota").empty();
      for (var i = 0; i < metodos.length; i++) {
        var id = metodos[i]["id_metodo_pago"];
        var name = metodos[i]["metodo"];

        $("#forma_pago_nota").append(
          "<option value='" + id + "'>" + name + "</option>"
        );
      }
    },
  });
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

    var parametros = {
      action: "stock_producto",
      id_producto: idProducto,
    };
  
    $.ajax({
      url: "../ajax/notas.ajax.php",
      data: parametros,
      beforeSend: function (objeto) {},
      success: function (data) {
        var stock = JSON.parse(data);
        if(stock["stock_total"] < cantidad){
          Swal.fire({
            title: "No hay existencia de las unidades solicitadas",
            text: "Unidades disponibles "+stock["stock_total"]+"",
            icon: "warning",
            confirmButtonColor: "#B99654",
            confirmButtonText: "Entendido",
          });
        }else{
          $("#cantidad" + idProducto).val(cantidad);
        }
        
      },
    });


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
function detalleProductosVenta(codigoVenta) {
  var parametros = {
    action: "detalle_venta",
    codigoVenta: codigoVenta,
  };

  $.ajax({
    url: "../ajax/notas.ajax.php",
    data: parametros,
    beforeSend: function (objeto) {},
    success: function (data) {
      $(".detalle-venta").html(data).fadeIn("slow");
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
  new Promise(function (resolve) {
    resolve(
      $.ajax({
        url: "../ajax/notas.ajax.php",
        data: parametros,
        beforeSend: function (objeto) {},
        success: function (data) {
          $(".productos-nota").html(data).fadeIn("slow");
        },
      })
    );
  }).then(function (result) {
    totalesCarrito(codigoNota);
  });
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
function incrementarCarrito(id_producto,token, precio_venta, porc_descuento) {
  var actual = $("#cantidadCarrito" + token).val();

  var cantidad = Number.parseInt(actual) + 1;
  if (cantidad == 0) {
  } else {
    var parametros = {
      action: "stock_producto",
      id_producto: id_producto,
    };
  
    $.ajax({
      url: "../ajax/notas.ajax.php",
      data: parametros,
      beforeSend: function (objeto) {},
      success: function (data) {
        var stock = JSON.parse(data);
        if(stock["stock_total"] < cantidad){
          Swal.fire({
            title: "No hay existencia de las unidades solicitadas",
            text: "Unidades disponibles "+stock["stock_total"]+"",
            icon: "warning",
            confirmButtonColor: "#B99654",
            confirmButtonText: "Entendido",
          });
        }else{
          actualizarProductoCarrito(
            cantidad,
            precio_venta,
            porc_descuento,
            token,
            codigoNota
          );
        }
        
      },
    });
   
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
function guardarNota(codigoNota, porc_descuento) {
  Swal.fire({
    title: "Confirmar!",
    text: "Desea guardar su nota y solicitarla!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Guardar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      var tipo_entrega = $("#tipo_entrega_nota").val();
      var forma_pago = $("#forma_pago_nota").val();
      var parametros = {
        action: "guardar_nota",
        codigoNota: codigoNota,
        porc_descuento: porc_descuento,
        forma_pago: forma_pago,
        tipo_entrega: tipo_entrega,
      };

      $.ajax({
        url: "../ajax/notas.ajax.php",
        data: parametros,
        beforeSend: function (objeto) {},
        success: function (data) {
          var response = data.replace(/['"]+/g, "");

          if (response == "exito") {
            Swal.fire({
              title: "Exito!",
              text: "Nota creada exitosamente",
              icon: "success",
              confirmButtonColor: "#B99654",
              confirmButtonText: "Entendido",
            }).then((result) => {
              if (result.isConfirmed) {
                window.location.href = "http://localhost/pos2/notasAdquiridas";
              }
            });
          } else if (response == "not-products") {
            Swal.fire({
              title: "Error",
              text: "Agregue productos al carrito para guardar la nota",
              icon: "warning",
              confirmButtonColor: "#B99654",
              confirmButtonText: "Entendido",
            });
          } else {
            Swal.fire({
              title: "Error",
              text: "No se pudo registrar la nota intentalo mas tarde.",
              icon: "warning",
              confirmButtonColor: "#B99654",
              confirmButtonText: "Entendido",
            });
          }
        },
      });
    } else {
      Swal.fire({
        title: "Acción cancelada",
        text: "Puede seguir editando la nota.",
        icon: "info",
        confirmButtonColor: "#B99654",
        confirmButtonText: "Entendido",
      });
    }
  });
}
function listadoNotasAdquiridas(page) {
  var busqueda = $("#busqueda").val();
  var campoOrden = $("#campoOrden").val();
  var orden = $("#orden").val();
  var per_page = $("#per_page").val();
  var visualizar = $("#visualizar").val();

  var parametros = {
    action: "lista_notas_adquiridas",
    page: page,
    busqueda: busqueda,
    campoOrden: campoOrden,
    orden: orden,
    visualizar: visualizar,
    vista: "listadoNotasAdquiridas",
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
      $(".lista-notas-adquiridas").html(data).fadeIn("slow");
      $("#loader").html("");
    },
  });
}
function visualizarNota(
  codigo,
  fechaActual,
  fecha_pago,
  estatus_pago,
  estatus
) {
  var fechaActual = new Date(fechaActual);
  var fecha_pago = new Date(fecha_pago);
  if (estatus != 0) {
    if (fecha_pago > fechaActual) {
      if (estatus_pago == "0") {
        Swal.fire({
          title: "Exito",
          text: "Visualizar nota y proceder a pagarla.",
          icon: "success",
          showCancelButton: false,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Visualizar",
          cancelButtonText: "Cancelar",
        }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = "visualizarNota/" + codigo;
          }
        });
      } else {
        Swal.fire({
          title: "Exito",
          text: "Visualizar nota.",
          icon: "success",
          showCancelButton: false,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Visualizar",
          cancelButtonText: "Cancelar",
        }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = "visualizarNota/" + codigo;
          }
        });
      }
    } else {
      if (fechaActual > fecha_pago) {
        if (estatus_pago == "0") {
          Swal.fire({
            title: "Error",
            text: "La nota no puede ser pagada porque expiró el tiempo de pago.",
            icon: "warning",
            confirmButtonColor: "#B99654",
            confirmButtonText: "Entendido",
          });
        } else {
          Swal.fire({
            title: "Exito",
            text: "Visualizar nota.",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Visualizar",
            cancelButtonText: "Cancelar",
          }).then((result) => {
            if (result.isConfirmed) {
              window.location.href = "visualizarNota/" + codigo;
            }
          });
        }
      }
    }
  } else {
    Swal.fire({
      title: "Error",
      text: "La nota no puede ser visualizada porque se encuentra cancelada.",
      icon: "warning",
      confirmButtonColor: "#B99654",
      confirmButtonText: "Entendido",
    });
  }
}

function carritoVenta(codigoVenta) {
  var parametros = {
    action: "carrito_venta",
    codigoVenta: codigoVenta,
  };
  new Promise(function (resolve) {
    resolve(
      $.ajax({
        url: "../ajax/notas.ajax.php",
        data: parametros,
        beforeSend: function (objeto) {},
        success: function (data) {
          $(".productos-venta").html(data).fadeIn("slow");
        },
      })
    );
  }).then(function (result) {
    totalesCarrito(codigoVenta);
  });
}

function cancelarVenta(id_venta, estatus) {
  if (estatus == 1) {
    Swal.fire({
      title: "Desea cancelar la nota?",
      text: "",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, Cancelar",
      cancelButtonText: "No,cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        var parametros = {
          action: "cancelar_venta",
          id_venta: id_venta,
        };

        $.ajax({
          url: "../ajax/notas.ajax.php",
          data: parametros,
          beforeSend: function (objeto) {},
          success: function (data) {
            var response = data.replace(/['"]+/g, "");
            if (response == "ok") {
              Swal.fire({
                title: "Exito",
                text: "Venta cancelada exitosamente.",
                icon: "success",
                confirmButtonColor: "#B99654",
                confirmButtonText: "Entendido",
              }).then((result) => {
                if (result.isConfirmed) {
                  window.location.href =
                    "http://localhost/pos2/notasAdquiridas";
                }
              });
            }
          },
        });
      }
    });
  } else {
    Swal.fire({
      title: "Error",
      text: "La nota no puede ser cancelada porque se encuentra en preparación",
      icon: "warning",
      confirmButtonColor: "#B99654",
      confirmButtonText: "Entendido",
    });
  }
}
function listadoEstatusNotas(page) {
  var busqueda = $("#busqueda").val();
  var campoOrden = $("#campoOrden").val();
  var orden = $("#orden").val();
  var per_page = $("#per_page").val();

  var parametros = {
    action: "listado_estatus_notas",
    page: page,
    busqueda: busqueda,
    campoOrden: campoOrden,
    orden: orden,
    vista: "listadoEstatusNotas",
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
      $(".listado-estatus-notas").html(data).fadeIn("slow");
      $("#loader").html("");
    },
  });
}
function imprimirTicket(path, codigo) {
  var urlTicket = path + "pdf/ticket.php?code="+codigo+" ";
  
  
  window.open(
    urlTicket,
    "Imprimir ticket",
    "width=400,height=720,top=0,left=100,menubar=NO,toolbar=YES"
  );
  
}
