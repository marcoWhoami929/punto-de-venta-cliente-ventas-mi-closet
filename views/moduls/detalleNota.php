<?php
error_reporting(E_ALL);
require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];

$notas = new ControllerNotas();
$notas = $notas->ctrListarNotas($url);
$codigoNota = $notas["codigo"];

if ($notas != false) {

    date_default_timezone_set('America/Chihuahua');
    $ahora = date("Y-m-d H:i:s");
    $fecha_publicacion =  date("Y-m-d H:i:s", strtotime($notas["fecha_publicacion"]));
    $fecha_expiracion =  date("Y-m-d H:i:s", strtotime($notas["fecha_expiracion"]));

    if (isset($_SESSION["datos_producto_venta"])) {
        unset($_SESSION["datos_producto_venta"]);
    } else {
        /*
        $detalle = new ControllerNotas();
        $detalle = $detalle->ctrDetalleNota($codigoNota);
        foreach ($detalle as $key => $value) {
            $porc_descuento = $notas["porc_descuento"];
            $cantidad = 1;

            $descuento = (($value['precio_venta'] * $cantidad) * $porc_descuento) / 100;
            $subtotal = ($cantidad * $value['precio_venta']);
            $subtotal = number_format($subtotal, MONEDA_DECIMALES, '.', '');
            $total = ($subtotal - $descuento);
            $total = number_format($total, MONEDA_DECIMALES, '.', '');

            $_SESSION['datos_producto_venta'][$value['codigo']] = [
                "id_producto" => $value['id_producto'],
                "codigo" => $value['codigo'],
                "precio_compra" => '0.00',
                "precio_venta" => $value['precio_venta'],
                "porc_descuento" => $porc_descuento,
                "descuento" => $descuento,
                "cantidad" => $cantidad,
                "subtotal" => $subtotal,
                "colores" => $value["colores"],
                "tallas" => $value["tallas"],
                "total" => $total,
                "descripcion" => $value['descripcion']
            ];
        }
        */
    }


    if ($fecha_publicacion > $ahora) {
        var_dump("sin iniciar");
    } else {
        if ($ahora > $fecha_expiracion) {
            var_dump("finalizada");
        } else {
            if ($fecha_expiracion > $fecha_publicacion) {
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
                                                        <img src="<?= APP_URL_ADMIN . "app/ajax/codes/" . $notas["codigo"] . ".png" ?>" alt="">
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
                                                        <h4 class="card-title" style="margin-top:20px;color:#ffffff"><?= $notas["codigo"] ?></h4>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card">
                                                        <div class="countdown" id="countdown<?= $notas['id_nota']; ?>"><?= '<script>countDown("' . $notas['fecha_publicacion'] . '","' . $notas['fecha_expiracion'] . '","' . $notas['id_nota'] . '","' . $notas['estatus'] . '")</script>'; ?>

                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-subtitle"><?= $notas["titulo_nota"] ?></h5>
                                                <form class="forms-sample">
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Publicación</label>
                                                        <h5 class="card-subtitle-2"><?= $notas["fecha_publicacion"] ?></h5>
                                                    </div>
                                                    <div class="form-group">
                                                        <label style="color:#B99654">Expiración</label>
                                                        <h5 class="card-subtitle-2"><?= $notas["fecha_expiracion"] ?></h5>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">

                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalProductos">
                                        Ver Productos Nota
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body productos-nota">
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">


                                        <?php
                                        if (isset($_SESSION['datos_producto_venta']) && count($_SESSION['datos_producto_venta']) >= 1) {

                                            $_SESSION['total'] = 0;
                                            $_SESSION['subtotal'] = 0;
                                            $_SESSION['descuento'] = 0;
                                            $cc = 1;

                                            foreach ($_SESSION['datos_producto_venta'] as $productos) {

                                        ?>
                                                <div class="card card-gray mb-2">
                                                    <div class="card-body">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-md-1 col-sm-1 col-lg-1">
                                                                    <button class="btn btn-md btn-info mt-4" type="button" onclick="clonarProducto('<?= $productos["codigo"] ?>','<?= $notas["codigo"] ?>')">
                                                                        <i class="ti-files"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="col-md-2 col-sm-2 col-lg-2">
                                                                    <h6 class="card-subtitle"><?= $productos["descripcion"] ?></h6>
                                                                    <h5 class="card-subtitle-2"><?= $productos["codigo"] ?></h5>
                                                                </div>
                                                                <div class="col-md-2 col-sm-2 col-lg-2">
                                                                    <div class="form-group">
                                                                        <div class="input-group d-flex align-items-center">
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-sm btn-info me-2" type="button">
                                                                                    <i class="ti-minus"></i>
                                                                                </button>
                                                                            </div>
                                                                            <input type="number" class="form-control" value="<?php echo $productos['cantidad']; ?>">
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-sm btn-info ms-2" type="button">
                                                                                    <i class="ti-plus"></i>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-1 col-sm-1 col-lg-1">
                                                                    <div class="form-group">
                                                                        <label>Color</label>
                                                                        <select class="form-select" id="exampleSelectGender">
                                                                            <?php

                                                                            $colores = explode(",", $productos['colores']);

                                                                            foreach ($colores as $key => $value) {
                                                                                echo '<option value="' . $value . '">' . $value . '</option>';
                                                                            }
                                                                            ?>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-1 col-sm-1 col-lg-1">
                                                                    <div class="form-group">
                                                                        <label>Talla</label>
                                                                        <select class="form-select" id="exampleSelectGender">
                                                                            <?php

                                                                            $tallas = explode(",", $productos['tallas']);

                                                                            foreach ($tallas as $key => $value) {
                                                                                echo '<option value="' . $value . '">' . $value . '</option>';
                                                                            }
                                                                            ?>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2 col-sm-2 col-lg-2">
                                                                    <label>Precio</label>
                                                                    <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($productos['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                                                                </div>
                                                                <div class="col-md-2 col-sm-2 col-lg-2">
                                                                    <label>Total</label>
                                                                    <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($productos['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                                                                </div>
                                                                <div class="col-md-1 col-sm-1 col-lg-1">
                                                                    <button class="btn btn-md btn-danger mt-4" type="button">
                                                                        <i class="ti-trash" style="color:#ffffff"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            <?php
                                                $cc++;

                                                $_SESSION['subtotal'] += $productos['subtotal'];
                                                $_SESSION['descuento'] += $productos['descuento'];
                                                $_SESSION['total'] += $productos['total'];
                                            }
                                            ?>

                                        <?php
                                        } else {
                                            $_SESSION['total'] = 0;
                                            $_SESSION['subtotal'] = 0;
                                            $_SESSION['descuento'] = 0;
                                        ?>
                                            <tr class="has-text-centered">
                                                <td colspan="13">
                                                    No hay productos agregados
                                                </td>
                                            </tr>
                                        <?php } ?>

                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3 col-lg-3 col-sm-3 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <table>
                                                    <tbody>

                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                <h4>SUBTOTAL</h4>
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <h4><?php echo MONEDA_SIMBOLO . number_format($_SESSION['subtotal'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h4>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                <h4>DESCUENTO</h4>
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <h4><?php echo MONEDA_SIMBOLO . number_format($_SESSION['descuento'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h4>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                <h3>TOTAL</h3>
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <h3><?php echo MONEDA_SIMBOLO . number_format($_SESSION['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h3>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- main-panel ends -->
<?php
            }
        }
    }
} else {
}

?>
<!-- Modal -->
<div class="modal fade" id="modalProductos" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header card-color">
                <h5 class="modal-title" id="exampleModalLabel">Productos</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                    <div class="card">

                        <div class="card-body detalle-notas">

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cerrar</button>

            </div>
        </div>
    </div>
</div>
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