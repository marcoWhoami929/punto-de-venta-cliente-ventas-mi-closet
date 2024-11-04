<?php
error_reporting(E_ALL);
require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];
$tokenVenta = $url;

$controlador = new ControllerNotas();
$ventas = $controlador->ctrListarVentas($url);

$codigoNota = $ventas["codigo"];


//var_dump($_SESSION["datos_producto_nota_detalle"][$codigoNota]);
if ($ventas != false) {

    date_default_timezone_set('America/Mexico_City');
    $ahora = date("Y-m-d H:i:s");
    $fecha_pago =  date("Y-m-d H:i:s", strtotime($ventas["fecha_pago"]));


    if ($fecha_pago > $ahora) {
        if ($ventas["estatus_pago"] == "0") {
            $disabled = "";
        } else {
            $disabled = "disabled";
        }

?>
        <div class="main-panel">
            <div class="content-wrapper">

                <div class="row">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <div class="d-flex align-items-center pt-4" style="margin-left: 10%;">
                                                <img src="<?= APP_URL_ADMIN . "app/ajax/codes/" . $ventas["codigo_nota"] . ".png" ?>" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9 col-lg-9 col-sm-9 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-md-9 col-lg-9 col-sm-9 grid-margin stretch-card">
                                                <h4 class="card-title" style="margin-top:20px;color:#ffffff"><?= $ventas["codigo"] ?></h4>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card">
                                                <div class="countdown" id="countdownVentas<?= $ventas['id_venta']; ?>"><?= '<script>countDownVentas("' . $ventas['fecha_pago'] . '","' . $ventas['id_venta'] . '","' . $ventas['estatus'] . '","' . $ventas['estatus_pago'] . '","' . $ventas['forma_pago'] . '")</script>'; ?>

                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label style="color:#B99654">Nota Origen</label>
                                            <h5 class="card-subtitle"><?= $ventas["codigo_nota"] ?></h5>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="form-group">
                                                    <label style="color:#B99654">Fecha Venta</label>
                                                    <h5 class="card-subtitle-2"><?= $ventas["fecha_venta"] . " " . $ventas["hora_venta"] ?></h5>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="form-group">
                                                    <label style="color:#B99654">Fecha Pago</label>
                                                    <h5 class="card-subtitle-2"><?= $ventas["fecha_pago"] ?></h5>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="form-group">
                                                    <label style="color:#B99654">Tipo Entrega</label>
                                                    <select id="tipo_entrega_nota" class="form-select form-select-lg" value="<?= $ventas["tipo_entrega"] ?>" disabled>
                                                        <option value="recoleccion">Recolección en tienda</option>
                                                        <option value="envio">Envio</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="form-group">
                                                    <label style="color:#B99654">Forma de Pago</label>
                                                    <select id="forma_pago_nota" class="form-select form-select-lg" value="<?= $ventas["forma_pago"] ?>" disabled>
                                                        <option value="1">Efectivo</option>
                                                        <option value="2">Transferencia Electrónica</option>
                                                        <option value="3">Tarjeta de Crédito</option>
                                                        <option value="4">Tarjeta de Débito</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card ">
                        <div class="card ">
                            <div class="row mt-3 mb-3">

                                <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                    <button type="button" class="btn btn-danger mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" <?= $disabled ?>>
                                        Cancelar Nota
                                    </button>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                    <button type="button" class="btn btn-success mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" <?= $disabled ?>>

                                        Pagar Nota
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body productos-venta">
                            </div>

                        </div>
                    </div>


                    <div class="container container-totales">
                    </div>

                </div>
            </div>

        </div>
        <!-- main-panel ends -->
        <?php

    } else {
        if ($ventas["estatus_pago"] == "0") {
            //unset($_SESSION["datos_producto_nota_detalle"][$tokenVenta]);
            unset($_SESSION["subtotal" . $tokenVenta]);
            unset($_SESSION["descuento" . $tokenVenta]);
            unset($_SESSION["total" . $tokenVenta]);
            echo '<script>Swal.fire({
                title: "Nota sin pagar",
                text: "La nota no puede ser pagada porque el tiempo de pago expiró.",
                icon: "warning",
                confirmButtonColor: "#B99654",
                confirmButtonText: "Entendido",
              }).then((result) => {
              if (result.isConfirmed) {
                window.location.href = "../notasAdquiridas";
              }
            })</script>';
        } else {


        ?>
            <div class="main-panel">
                <div class="content-wrapper">

                    <div class="row">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <div class="d-flex align-items-center pt-4" style="margin-left: 10%;">
                                                    <img src="<?= APP_URL_ADMIN . "app/ajax/codes/" . $ventas["codigo_nota"] . ".png" ?>" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9 col-lg-9 col-sm-9 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <h4 class="card-title" style="margin-top:20px;color:#ffffff"><?= $ventas["codigo"] ?></h4>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                                    <button type="button" class="btn btn-success mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:20px" disabled>
                                                        Nota Pagada
                                                    </button>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label style="color:#B99654">Nota Origen</label>
                                                <h5 class="card-subtitle"><?= $ventas["codigo_nota"] ?></h5>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Fecha Venta</label>
                                                        <h5 class="card-subtitle-2"><?= $ventas["fecha_venta"] . " " . $ventas["hora_venta"] ?></h5>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Fecha Pago</label>
                                                        <h5 class="card-subtitle-2"><?= $ventas["fecha_pago"] ?></h5>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Tipo Entrega</label>
                                                        <select id="tipo_entrega_nota" class="form-select form-select-lg" value="<?= $ventas["tipo_entrega"] ?>" disabled>
                                                            <option value="recoleccion">Recolección en tienda</option>
                                                            <option value="envio">Envio</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Forma de Pago</label>
                                                        <select id="forma_pago_nota" class="form-select form-select-lg" value="<?= $ventas["forma_pago"] ?>" disabled>
                                                            <option value="1">Efectivo</option>
                                                            <option value="2">Transferencia Electrónica</option>
                                                            <option value="3">Tarjeta de Crédito</option>
                                                            <option value="4">Tarjeta de Débito</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card ">
                            <div class="card ">
                                <div class="row mt-3 mb-3">

                                    <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">

                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                        <button type="button" class="btn btn-danger mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" disabled>
                                            Cancelar Nota
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body productos-venta">
                                </div>

                            </div>
                        </div>


                        <div class="container container-totales">
                        </div>

                    </div>
                </div>

            </div>
            <!-- main-panel ends -->

<?php
        }
    }
} else {
}

?>

<style>
    .countdown {
        width: 300px;
        margin: 0 auto;
        border: 1px solid transparent;
        background: transparent;
        padding: 20px 0px;
        display: flex;
        justify-content: space-evenly;
        border-radius: 10px;
    }

    .box {
        background: #fff;
        border: 2px solid #B99654;
        width: 60px;
        font-size: 20px;
        text-align: center;
        border-radius: 10px;
        color: #B99654;
    }

    .box .text {
        font-size: 12px;
        background: #B99654;
        color: #ffffff;
        padding: 5px 0;
        border-radius: 0px 0px 8px 8px;
    }

    .text-white {
        font-size: 20px;
        text-align: center;
        color: #B99654;
    }
</style>