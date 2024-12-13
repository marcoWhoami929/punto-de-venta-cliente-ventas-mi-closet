<?php
error_reporting(E_ALL);
require_once "config/app.php";
require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];
$tokenVenta = $url;

$controlador = new ControllerNotas();
$ventas = $controlador->ctrListarVentas($url);

$codigoNota = $ventas["codigo"];



if ($ventas != false) {

    date_default_timezone_set('America/Mexico_City');
    $ahora = date("Y-m-d H:i:s");
    $fecha_pago =  date("Y-m-d H:i:s", strtotime($ventas["fecha_pago"]));


    if ($fecha_pago > $ahora) {
        if ($ventas["estatus_pago"] == "0") {

            if ($ventas["tipo_entrega"] == "recoleccion") {
                $disabledPago = "disabled";
                //$disabledCancelar = "";
                $displayContador = "";
            } else {
                $disabledPago = "";
                //$disabledCancelar = "";
                $displayContador = "";
            }
            $displayPagado = "display:none";
            $displaySinPagar = "";
        } else {
            $disabledPago = "disabled";
            //$disabledCancelar = "disabled";
            $displayContador = "display:none";
            $displayPagado = "";
            $displaySinPagar = "display:none";
        }

        switch ($ventas["estatus"]) {
            case '1':
                $estatus1 = "completed";
                $estatus2 = "";
                $estatus3 = "";
                $estatus4 = "";
                //$color = 'style="background:#00D1B2"';
                break;
            case '2':
                $estatus1 = "completed";
                $estatus2 = "completed";
                $estatus3 = "";
                $estatus4 = "";
                //$color = 'style="background:#00D1B2"';
                break;
            case '3':
                $estatus1 = "completed";
                $estatus2 = "completed";
                $estatus3 = "completed";
                $estatus4 = "";
                //$color = 'style="background:#23D160"';
                break;
            case '4':
                $estatus1 = "completed";
                $estatus2 = "completed";
                $estatus3 = "completed";
                $estatus4 = "completed";
                //$color = 'style="background:#FFDD57"';
                break;
        }


?>
        <div class="main-panel">

            <div class="content-wrapper">

                <div class="row">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">

                                            <div class="step <?= $estatus1 ?>">
                                                <div class="step-icon-wrap">
                                                    <div class="step-icon" style="background:#00D1B2"><i class="ti-shopping-cart"></i></div>
                                                </div>
                                                <h4 class="step-title">Recibido</h4>
                                            </div>
                                            <div class="step <?= $estatus2  ?>">
                                                <div class="step-icon-wrap">
                                                    <div class="step-icon" style="background:#209CEE"><i class="ti-package"></i></div>
                                                </div>
                                                <h4 class="step-title">En Preparación</h4>
                                            </div>
                                            <div class="step <?= $estatus3  ?>">
                                                <div class="step-icon-wrap">
                                                    <div class="step-icon" style="background:#23D160"><i class="ti-truck"></i></div>
                                                </div>
                                                <h4 class="step-title">Enviado</h4>
                                            </div>
                                            <div class="step <?= $estatus4  ?>">
                                                <div class="step-icon-wrap">
                                                    <div class="step-icon" style="background:#FFDD57"><i class="ti-check-box"></i></div>
                                                </div>
                                                <h4 class="step-title">Entregado</h4>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
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
                                        <div class="ribbon right" style="--c: #CC333F;--f: 10px;<?= $displaySinPagar ?>">Sin Pagar</div>
                                        <div class="ribbon right" style="--c: #27ae60;--f: 10px;<?= $displayPagado ?>">Nota Pagada</div>
                                        <div class="row">
                                            <div class="col-md-4 col-lg-4 col-sm-4 grid-margin stretch-card">
                                                <h4 class="card-title" style="margin-top:20px;color:#ffffff"><?= $ventas["codigo"] ?></h4>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                <button type="button" class="btn btn-warning mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:20px" onclick="imprimirTicket('<?= APP_URL_CLIENT ?>','<?= $ventas["codigo"] ?>')">
                                                    <i class=" ti-printer"></i> Imprimir Ticket
                                                </button>
                                            </div>

                                            <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card" style="<?= $displayContador ?>">
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

                                                    <h5 class="card-subtitle"><?= ucfirst($ventas["tipo_entrega"]) ?></h5>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="form-group">
                                                    <label style="color:#B99654">Forma de Pago</label>
                                                    <h5 class="card-subtitle"><?= $ventas["metodo"] ?></h5>
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
                                <!--
                                <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                    <button type="button" class="btn btn-danger mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" <?= $disabledCancelar ?> onclick="cancelarVenta(' <?= $ventas["id_venta"] ?>','<?= $ventas["estatus"] ?>')">
                                        Cancelar Nota
                                    </button>
                                </div>
    -->
                                <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                    <button type="button" class="btn btn-success mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" <?= $disabledPago ?>>

                                        Pagar Nota
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card ">
                        <div class="card ">
                            <div class="row mt-2 mb-1">

                                <div class="col-lg-1 col-md-1 col-sm-1 " style="display:grid">

                                    <button type="button" class="btn" style="background:#fdb3b3"></button>
                                </div>
                                <div class="col-lg-11 col-md-11 col-sm-11 " style="display:grid">

                                    *Nota: si el producto se encuentra marcado en rojo, las unidades han sido actualizadas de acuerdo a la existencia del producto.
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

            if ($ventas["estatus_pago"] == "0") {

                if ($ventas["tipo_entrega"] == "recoleccion") {
                    $disabledPago = "disabled";
                    //$disabledCancelar = "";
                    $displayContador = "";
                } else {
                    $disabledPago = "";
                    //$disabledCancelar = "";
                    $displayContador = "";
                }
                $displayPagado = "display:none";
                $displaySinPagar = "";
            } else {
                $disabledPago = "disabled";
                //$disabledCancelar = "disabled";
                $displayContador = "display:none";
                $displayPagado = "";
                $displaySinPagar = "display:none";
            }

            switch ($ventas["estatus"]) {
                case '1':
                    $estatus1 = "completed";
                    $estatus2 = "";
                    $estatus3 = "";
                    $estatus4 = "";
                    //$color = 'style="background:#00D1B2"';
                    break;
                case '2':
                    $estatus1 = "completed";
                    $estatus2 = "completed";
                    $estatus3 = "";
                    $estatus4 = "";
                    //$color = 'style="background:#00D1B2"';
                    break;
                case '3':
                    $estatus1 = "completed";
                    $estatus2 = "completed";
                    $estatus3 = "completed";
                    $estatus4 = "";
                    //$color = 'style="background:#23D160"';
                    break;
                case '4':
                    $estatus1 = "completed";
                    $estatus2 = "completed";
                    $estatus3 = "completed";
                    $estatus4 = "completed";
                    //$color = 'style="background:#FFDD57"';
                    break;
            }
        ?>
            <div class="main-panel">
                <div class="content-wrapper">

                    <div class="row">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
                                                <div class="step <?php echo  $estatus1 ?>">
                                                    <div class="step-icon-wrap">
                                                        <div class="step-icon" style="background:#00D1B2"><i class="ti-shopping-cart"></i></div>
                                                    </div>
                                                    <h4 class="step-title">Recibido</h4>
                                                </div>
                                                <div class="step <?php echo  $estatus2  ?>">
                                                    <div class="step-icon-wrap">
                                                        <div class="step-icon" style="background:#209CEE"><i class="ti-package"></i></div>
                                                    </div>
                                                    <h4 class="step-title">En Preparación</h4>
                                                </div>
                                                <div class="step <?php echo  $estatus3  ?>">
                                                    <div class="step-icon-wrap">
                                                        <div class="step-icon" style="background:#23D160"><i class="ti-truck"></i></div>
                                                    </div>
                                                    <h4 class="step-title">Enviado</h4>
                                                </div>
                                                <div class="step <?php echo  $estatus4  ?>">
                                                    <div class="step-icon-wrap">
                                                        <div class="step-icon" style="background:#FFDD57"><i class="ti-check-box"></i></div>
                                                    </div>
                                                    <h4 class="step-title">Entregado</h4>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
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

                                            <div class="ribbon right" style="--c: #27ae60;--f: 10px;">Nota Pagada</div>
                                            <div class="row">
                                                <div class="col-md-4 col-lg-4 col-sm-4 grid-margin stretch-card">
                                                    <h4 class="card-title" style="margin-top:20px;color:#ffffff"><?= $ventas["codigo"] ?></h4>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <button type="button" class="btn btn-warning mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:20px" onclick="imprimirTicket('<?= APP_URL_CLIENT ?>','<?= $ventas["codigo"] ?>')">
                                                        <i class="ti-printer"></i> Imprimir Ticket
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
                                                        <h5 class="card-subtitle"><?= $ventas["tipo_entrega"] ?></h5>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Forma de Pago</label>
                                                        <h5 class="card-subtitle"><?= $ventas["metodo"] ?></h5>
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
                                    <!--
                                    <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                        <button type="button" class="btn btn-danger mx-2 mb-3  btn-lg" style="justify-content: center;align-items: center;font-weight:bold;color:#ffffff;font-size:18px" disabled>
                                            Cancelar Nota
                                        </button>
                                    </div>
        -->

                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card ">
                            <div class="card ">
                                <div class="row mt-3 mb-3">

                                    <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                        *Nota: si el producto se encuentra marcado en rojo, las unidades han sido actualizadas de acuerdo a la existencia del producto.
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

    .steps .step {
        display: block;
        width: 100%;
        margin-bottom: 35px;
        text-align: center
    }

    .steps .step .step-icon-wrap {
        display: block;
        position: relative;
        width: 100%;
        height: 80px;
        text-align: center
    }

    .steps .step .step-icon-wrap::before,
    .steps .step .step-icon-wrap::after {
        display: block;
        position: absolute;
        top: 50%;
        width: 50%;
        height: 13px;
        margin-top: -1px;
        background-color: #B99654;
        content: '';
        z-index: 1
    }

    .steps .step .step-icon-wrap::before {
        left: 0
    }

    .steps .step .step-icon-wrap::after {
        right: 0
    }

    .steps .step .step-icon {
        display: inline-block;
        position: relative;
        width: 80px;
        height: 80px;
        border: 1px solid #e1e7ec;
        border-radius: 50%;
        background-color: #f5f5f5;
        color: #374250;
        font-size: 38px;
        line-height: 81px;
        z-index: 5
    }

    .steps .step .step-title {
        margin-top: 16px;
        margin-bottom: 0;
        color: #606975;
        font-size: 14px;
        font-weight: 500
    }

    .steps .step:first-child .step-icon-wrap::before {
        display: none
    }

    .steps .step:last-child .step-icon-wrap::after {
        display: none
    }

    .steps .step.completed .step-icon-wrap::before,
    .steps .step.completed .step-icon-wrap::after {
        background-color: #0da9ef
    }

    .steps .step.completed .step-icon {
        border-color: #0da9ef;
        background-color: #0da9ef;
        color: #fff
    }

    @media (max-width: 576px) {

        .flex-sm-nowrap .step .step-icon-wrap::before,
        .flex-sm-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 768px) {

        .flex-md-nowrap .step .step-icon-wrap::before,
        .flex-md-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 991px) {

        .flex-lg-nowrap .step .step-icon-wrap::before,
        .flex-lg-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 1200px) {

        .flex-xl-nowrap .step .step-icon-wrap::before,
        .flex-xl-nowrap .step .step-icon-wrap::after {}
    }

    .bg-faded,
    .bg-secondary {
        background-color: #f5f5f5 !important;
    }

    /***RIBBON CSS */
    .ribbon {
        --f: 15px;
        /* control the folded part */
        height: 50px;
        position: absolute;
        top: 0;
        color: #fff;
        padding: .6em 1.8em;
        background: var(--c, #45ADA8);
        border-bottom: var(--f) solid #0007;
        clip-path: polygon(100% calc(100% - var(--f)), 100% 100%, calc(100% - var(--f)) calc(100% - var(--f)), var(--f) calc(100% - var(--f)), 0 100%, 0 calc(100% - var(--f)), 999px calc(100% - var(--f) - 999px), calc(100% - 999px) calc(100% - var(--f) - 999px))
    }

    .right {
        right: 0;
        transform: translate(calc((1 - cos(45deg))*100%), -100%) rotate(45deg);
        transform-origin: 0% 100%;
    }
</style>