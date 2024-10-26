<?php

require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];

$notas = new ControllerNotas();
$notas = $notas->ctrListarNotas($url);

if ($notas != false) {

    date_default_timezone_set('America/Chihuahua');
    $ahora = date("Y-m-d H:i:s");
    $fecha_publicacion =  date("Y-m-d H:i:s", strtotime($notas["fecha_publicacion"]));
    $fecha_expiracion =  date("Y-m-d H:i:s", strtotime($notas["fecha_expiracion"]));

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
                                    <div class="card-body">
                                        <div class="table-container">
                                            <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                                                <thead style="background:#B99654;color:#ffffff;">
                                                    <tr>
                                                        <th class="has-text-centered" style="color:#ffffff">#</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Código de barras</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Producto</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Cant.</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Precio</th>
                                                        <th class="has-text-centered" style="color:#ffffff">% Desc</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Desc</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Subtotal</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Total</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Actualizar</th>
                                                        <th class="has-text-centered" style="color:#ffffff">Remover</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    if (isset($_SESSION['datos_producto_venta']) && count($_SESSION['datos_producto_venta']) >= 1) {

                                                        $_SESSION['total'] = 0;
                                                        $_SESSION['subtotal'] = 0;
                                                        $_SESSION['descuento'] = 0;
                                                        $cc = 1;

                                                        foreach ($_SESSION['datos_producto_venta'] as $productos) {
                                                    ?>
                                                            <tr class="has-text-centered">
                                                                <td><?php echo $cc; ?></td>
                                                                <td><?php echo $productos['codigo']; ?></td>
                                                                <td><?php echo $productos['descripcion']; ?></td>
                                                                <td>
                                                                    <div class="control">
                                                                        <input class="input sale_input-cant has-text-centered" value="<?php echo $productos['cantidad']; ?>" id="sale_input_<?php echo str_replace(" ", "_", $productos['codigo']); ?>" onchange="actualizar_cantidad('#sale_input_<?php echo str_replace(" ", "_", $productos['codigo']); ?>','<?php echo $productos['codigo']; ?>')" type="number" style="max-width: 80px;">
                                                                    </div>
                                                                </td>
                                                                <td><?php echo MONEDA_SIMBOLO . number_format($productos['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></td>
                                                                <td>
                                                                    <div class="control">
                                                                        <input class="input sale_input-cant has-text-centered" value="<?php echo $productos['porc_descuento']; ?>" id="porc_descuento<?php echo str_replace(" ", "_", $productos['codigo']); ?>" type="number" style="max-width: 80px;" readonly>
                                                                    </div>
                                                                </td>
                                                                <td><?php echo MONEDA_SIMBOLO . number_format($productos['descuento'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></td>
                                                                <td><?php echo MONEDA_SIMBOLO . number_format($productos['subtotal'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></td>
                                                                <td><?php echo MONEDA_SIMBOLO . number_format($productos['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></td>

                                                                <td>
                                                                    <button type="button" class="button is-success is-rounded is-small" onclick="actualizar_cantidad('#sale_input_<?php echo str_replace(" ", "_", $productos['codigo']); ?>','<?php echo $productos['codigo']; ?>')">
                                                                        <i class="fas fa-redo-alt fa-fw"></i>
                                                                    </button>
                                                                </td>
                                                                <td>
                                                                    <form class="FormularioAjax" action="<?php echo APP_URL; ?>app/ajax/ventaAjax.php" method="POST" autocomplete="off">

                                                                        <input type="hidden" name="codigo" value="<?php echo $productos['codigo']; ?>">
                                                                        <input type="hidden" name="modulo_venta" value="remover_producto">

                                                                        <button type="submit" class="button is-danger is-rounded is-small" title="Remover producto">
                                                                            <i class="fas fa-trash-restore fa-fw"></i>
                                                                        </button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                            $cc++;

                                                            $_SESSION['subtotal'] += $productos['subtotal'];
                                                            $_SESSION['descuento'] += $productos['descuento'];
                                                            $_SESSION['total'] += $productos['total'];
                                                        }
                                                        ?>
                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                SUBTOTAL
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <?php echo MONEDA_SIMBOLO . number_format($_SESSION['subtotal'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                DESCUENTO
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <?php echo MONEDA_SIMBOLO . number_format($_SESSION['descuento'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                        <tr class="has-text-centered">
                                                            <td colspan="4"></td>
                                                            <td class="has-text-weight-bold">
                                                                TOTAL
                                                            </td>
                                                            <td class="has-text-weight-bold">
                                                                <?php echo MONEDA_SIMBOLO . number_format($_SESSION['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?>
                                                            </td>
                                                            <td colspan="5"></td>
                                                        </tr>
                                                    <?php
                                                    } else {
                                                        $_SESSION['total'] = 0;
                                                    ?>
                                                        <tr class="has-text-centered">
                                                            <td colspan="13">
                                                                No hay productos agregados
                                                            </td>
                                                        </tr>
                                                    <?php } ?>
                                                </tbody>
                                            </table>
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