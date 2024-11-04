<?php
session_start();
error_reporting(E_ALL);
require_once "../config/app.php";
require_once "../controllers/notas.controller.php";
date_default_timezone_set('America/Mexico_City');

$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != NULL) ? $_REQUEST['action'] : '';
function generarCodigoAleatorio($longitud)
{
    $codigo = "";
    $caracter = "Letra";
    for ($i = 1; $i <= $longitud; $i++) {
        if ($caracter == "Letra") {
            $letra_aleatoria = chr(rand(ord("a"), ord("z")));
            $letra_aleatoria = strtoupper($letra_aleatoria);
            $codigo .= $letra_aleatoria;
            $caracter = "Numero";
        } else {
            $numero_aleatorio = rand(0, 9);
            $codigo .= $numero_aleatorio;
            $caracter = "Letra";
        }
    }
    return $codigo;
}
function generarCodigoAleatorioNota($longitud, $correlativo)
{
    $codigo = "";
    $caracter = "Letra";
    for ($i = 1; $i <= $longitud; $i++) {
        if ($caracter == "Letra") {
            $letra_aleatoria = chr(rand(ord("a"), ord("z")));
            $letra_aleatoria = strtoupper($letra_aleatoria);
            $codigo .= $letra_aleatoria;
            $caracter = "Numero";
        } else {
            $numero_aleatorio = rand(0, 9);
            $codigo .= $numero_aleatorio;
            $caracter = "Letra";
        }
    }
    return $codigo . "-" . $correlativo;
}
if ($action == 'metodos_pago') {
    require_once "../models/notas.model.php";
    $tipo_entrega = strip_tags($_REQUEST['tipo_entrega']);

    $controlador = new ControllerNotas();

    $ventas = $controlador->ctrListarFormasPago($tipo_entrega);
    echo json_encode($ventas);
}
if ($action == 'totales_carrito') {
    $codigoNota = strip_tags($_REQUEST['codigoNota']);
?>

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
                                    <h4><?php echo MONEDA_SIMBOLO . number_format($_SESSION['subtotal' . $codigoNota], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h4>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="has-text-centered">
                                <td colspan="4"></td>
                                <td class="has-text-weight-bold">
                                    <h4>DESCUENTO</h4>
                                </td>
                                <td class="has-text-weight-bold">
                                    <h4><?php echo MONEDA_SIMBOLO . number_format($_SESSION['descuento' . $codigoNota], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h4>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="has-text-centered">
                                <td colspan="4"></td>
                                <td class="has-text-weight-bold">
                                    <h3>TOTAL</h3>
                                </td>
                                <td class="has-text-weight-bold">
                                    <h3><?php echo MONEDA_SIMBOLO . number_format($_SESSION['total' . $codigoNota], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h3>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <?php
}

if ($action == 'lista_notas') {

    include('../clases/notas.php');
    $database = new notas();
    //Recibir variables enviadas
    $busqueda = strip_tags($_REQUEST['busqueda']);
    $campoOrden = strip_tags($_REQUEST['campoOrden']);
    $orden = strip_tags($_REQUEST['orden']);
    $per_page = intval($_REQUEST['per_page']);
    $vista = strip_tags($_REQUEST['vista']);

    //Variables de paginación
    $page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $adjacents  = 4; //espacio entre páginas después del número de adyacentes
    $offset = ($page - 1) * $per_page;

    $search = array("busqueda" => $busqueda, "campoOrden" => $campoOrden, "orden" => $orden, "per_page" => $per_page, "offset" => $offset);
    //consulta principal para recuperar los datos
    $datos = $database->getListaNotas($search);
    $countAll = $database->getCounter();
    $row = $countAll;

    if ($row > 0) {
        $numrows = $countAll;;
    } else {
        $numrows = 0;
    }
    $total_pages = ceil($numrows / $per_page);


    //Recorrer los datos recuperados

    if ($numrows > 0) {
    ?>

        <?php
        $finales = 0;
        foreach ($datos as $key => $row) {

            $ahora = date("Y-m-d H:i:s");
            $fecha_publicacion =  date("Y-m-d H:i:s", strtotime($row["fecha_publicacion"]));
            $fecha_expiracion =  date("Y-m-d H:i:s", strtotime($row["fecha_expiracion"]));

            if ($fecha_publicacion > $ahora) {
                $estatus = "Inicia en";
                $estado = "Sin Iniciar";
                $card_color = "card-red";
            } else {
                if ($ahora > $fecha_expiracion) {
                    $estatus = "";
                    $estado = "Finalizada";
                    $card_color = "card-green";
                } else {
                    if ($fecha_expiracion > $fecha_publicacion) {
                        $estatus = "Finaliza en";
                        $estado = "Iniciado";
                        $card_color = "card-color";
                    }
                }
            }

        ?>
            <div class="col-lg-4 col-md-4 col-sm-6" onclick="<?= "cargarNota('" . $row["codigo"] . "','" . $ahora . "','" . $row["fecha_publicacion"] . "','" . $row["fecha_expiracion"] . "')" ?>" style="cursor:pointer">
                <div class="card mb-3">
                    <div class="card-header <?= $card_color ?>">
                        <h4><?= $estado ?></h4>
                    </div>

                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="<?= APP_URL_ADMIN . "app/ajax/codes/" . $row["codigo"] . ".png" ?>" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">

                            <div class="card-body">
                                <h5 class="card-title"><?= $row["codigo"] ?></h5>
                                <p class="card-text"><?= $row["titulo_nota"] ?></p>
                                <p class="card-text"><small class="text-muted"><?= $row["fecha_expiracion"] ?></small></p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer card-color">
                        <h4><?= $estatus ?></h4>
                        <div class="countdown" id="countdown<?= $row['id_nota']; ?>"><?= '<script>countDown("' . $row['fecha_publicacion'] . '","' . $row['fecha_expiracion'] . '","' . $row['id_nota'] . '","' . $row['estatus'] . '")</script>'; ?>

                        </div>
                    </div>

                </div>
            </div>
        <?php
            $finales++;
        }
        ?>

        <div class="clearfix">
            <?php
            $inicios = $offset + 1;
            $finales += $inicios - 1;
            echo '<div class="hint-text">Mostrando ' . $inicios . ' al ' . $finales . ' de ' . $numrows . ' registros</div>';


            include '../clases/pagination.php'; //include pagination class
            $pagination = new Pagination($page, $total_pages, $adjacents);
            echo $pagination->paginate($vista);

            ?>
        </div>
    <?php
    }
}
if ($action == 'detalle_nota') {

    include('../clases/notas.php');
    $database = new notas();
    //Recibir variables enviadas
    $codigo = strip_tags($_REQUEST['codigoNota']);


    $search = array("codigoNota" => $codigo);
    //consulta principal para recuperar los datos
    $datos = $database->getDetalleNota($search);
    $countAll = $database->getCounter();

    $row = $countAll;

    if ($row > 0) {
        $numrows = $countAll;;
    } else {
        $numrows = 0;
    }
    $total_pages = ceil($numrows / $per_page);


    //Recorrer los datos recuperados

    if ($numrows > 0) {
    ?>

        <?php
        $finales = 0;

        foreach ($datos as $key => $row) {

        ?>
            <div class="card card-gray mb-2">
                <div class="card-body">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <h6 class="card-subtitle"><?= $row["descripcion"] ?></h6>
                                <h5 class="card-subtitle-2"><?= $row["codigo"] ?></h5>
                            </div>
                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <div class="form-group">
                                    <div class="input-group d-flex align-items-center">
                                        <div class="input-group-append">
                                            <button class="btn btn-sm btn-info me-2" type="button" onclick="decrementar(<?= $row['id_producto'] ?>)">
                                                <i class="ti-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control" value="1" id="cantidad<?= $row['id_producto'] ?>" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-sm btn-info ms-2" type="button" onclick="incrementar(<?= $row['id_producto'] ?>)">
                                                <i class="ti-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-1 col-lg-1">
                                <div class="form-group">
                                    <label>Color</label>
                                    <select class="form-select" id="color<?= $row['id_producto'] ?>">
                                        <?php

                                        $colores = explode(",", $row['colores']);

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
                                    <select class="form-select" id="talla<?= $row['id_producto'] ?>">
                                        <?php

                                        $tallas = explode(",", $row['tallas']);

                                        foreach ($tallas as $key => $value) {
                                            echo '<option value="' . $value . '">' . $value . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <label>Precio</label>
                                <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($row['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                            </div>

                            <div class="col-md-1 col-sm-1 col-lg-1">
                                <button class="btn btn-md btn-info mt-4" type="button" onclick="agregarProductoCarrito('<?= $row["id_producto"] ?>','<?= $row["codigo"] ?>','<?= $row["descripcion"] ?>','<?= $row["porc_descuento"] ?>','<?= $row["precio_venta"] ?>','<?= $codigo ?>')">
                                    <i class="ti-shopping-cart" style="color:#ffffff"></i>Agregar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <?php
            $finales++;
        }
        ?>

        <?php
    }
}

if ($action == 'agregar_producto') {
    $token = generarCodigoAleatorio(8);
    $idProducto = strip_tags($_REQUEST['idProducto']);
    $codigo = strip_tags($_REQUEST['codigo']);
    $precio_venta = strip_tags($_REQUEST['precio_venta']);
    $porc_descuento = strip_tags($_REQUEST['porc_descuento']);
    $descuento = strip_tags($_REQUEST['descuento']);
    $cantidad = strip_tags($_REQUEST['cantidad']);
    $subtotal = strip_tags($_REQUEST['subtotal']);
    $color = strip_tags($_REQUEST['color']);
    $talla = strip_tags($_REQUEST['talla']);
    $total = strip_tags($_REQUEST['total']);
    $descripcion = strip_tags($_REQUEST['descripcion']);
    $codigoNota = strip_tags($_REQUEST['codigoNota']);



    if (empty($_SESSION['datos_producto_nota'][$codigoNota][$token])) {

        $_SESSION['datos_producto_nota'][$codigoNota][$token] = [
            "token" => $token,
            "id_producto" => $idProducto,
            "codigo" => $codigo,
            "precio_compra" => '0.00',
            "precio_venta" => $precio_venta,
            "porc_descuento" => $porc_descuento,
            "descuento" => $descuento,
            "cantidad" => $cantidad,
            "subtotal" => $subtotal,
            "colores" => $color,
            "tallas" => $talla,
            "total" => $total,
            "descripcion" => $descripcion
        ];
    }
    echo json_encode("agregado");
}
if ($action ==  'carrito_nota') {
    $codigoNota = strip_tags($_REQUEST['codigoNota']);
    if (isset($_SESSION['datos_producto_nota'][$codigoNota])) {

        if (count($_SESSION['datos_producto_nota'][$codigoNota]) > 0) {
        ?>

            <?php
            $finales = 0;
            $_SESSION['total' . $codigoNota] = 0;
            $_SESSION['subtotal' . $codigoNota] = 0;
            $_SESSION['descuento' . $codigoNota] = 0;
            foreach ($_SESSION['datos_producto_nota'][$codigoNota] as $key => $producto) {

            ?>
                <div class="card card-gray mb-2">
                    <div class="card-body">
                        <div class="container">
                            <div class="row">

                                <div class="col-md-2 col-sm-2 col-lg-2">
                                    <h6 class="card-subtitle"><?= $producto["descripcion"] ?></h6>
                                    <h5 class="card-subtitle-2"><?= $producto["codigo"] ?></h5>
                                </div>
                                <div class="col-md-2 col-sm-2 col-lg-2">
                                    <div class="form-group">
                                        <div class="input-group d-flex align-items-center">
                                            <div class="input-group-append">
                                                <button class="btn btn-sm btn-info me-2" type="button" onclick="decrementarCarrito('<?= $producto['token'] ?>','<?= $producto['precio_venta'] ?>','<?= $producto['porc_descuento'] ?>')">
                                                    <i class="ti-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control" value="<?= $producto['cantidad'] ?>" id="cantidadCarrito<?= $producto['token'] ?>" readonly>
                                            <div class="input-group-append">
                                                <button class="btn btn-sm btn-info ms-2" type="button" onclick="incrementarCarrito('<?= $producto['token'] ?>','<?= $producto['precio_venta'] ?>','<?= $producto['porc_descuento'] ?>')">
                                                    <i class="ti-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1 col-sm-1 col-lg-1">
                                    <div class="form-group">
                                        <label>Color</label>
                                        <select class="form-select">
                                            <?php

                                            $colores = explode(",", $producto['colores']);

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
                                        <select class="form-select">
                                            <?php

                                            $tallas = explode(",", $producto['tallas']);

                                            foreach ($tallas as $key => $value) {
                                                echo '<option value="' . $value . '">' . $value . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-lg-2">
                                    <label>Precio</label>
                                    <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($producto['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                                </div>
                                <div class="col-md-2 col-sm-2 col-lg-2">
                                    <label>Subtotal</label>
                                    <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($producto['subtotal'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                                </div>
                                <div class="col-md-1 col-sm-1 col-lg-1">
                                    <button class="btn btn-md btn-danger mt-4" type="button" onclick="removerProductoCarrito('<?= $producto["token"] ?>','<?= $codigoNota ?>')">
                                        <i class="ti-trash" style="color:#ffffff"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <?php
                $finales++;

                $_SESSION['subtotal' . $codigoNota] += $producto['subtotal'];
                $_SESSION['descuento' . $codigoNota] += $producto['descuento'];
                $_SESSION['total' . $codigoNota] += $producto['total'];
            }

            ?>


    <?php
        } else {
            $_SESSION['total' . $codigoNota] = 0;
            $_SESSION['subtotal' . $codigoNota] = 0;
            $_SESSION['descuento' . $codigoNota] = 0;
            echo ' <tr class="has-text-centered">
                                                <td colspan="13">
                                                    No hay productos agregados
                                                </td>
                                            </tr>';
        }
    } else {
        $_SESSION['total' . $codigoNota] = 0;
        $_SESSION['subtotal' . $codigoNota] = 0;
        $_SESSION['descuento' . $codigoNota] = 0;
        echo ' <tr class="has-text-centered">
                                                <td colspan="13">
                                                    No hay productos agregados
                                                </td>
                                            </tr>';
    }
    ?>

    <?php
}
if ($action == 'remover_producto') {

    $token = strip_tags($_REQUEST['token']);
    $codigoNota = strip_tags($_REQUEST['codigoNota']);

    unset($_SESSION['datos_producto_nota'][$codigoNota][$token]);

    if (empty($_SESSION['datos_producto_nota'][$codigoNota][$token])) {
        $alerta = "eliminado";
    } else {
        $alerta = "error";
    }
    echo json_encode($alerta);
}
if ($action == 'actualizar_producto') {
    $token = strip_tags($_REQUEST['token']);
    $cantidad = strip_tags($_REQUEST['cantidad']);
    $subtotal = strip_tags($_REQUEST['subtotal']);
    $descuento = strip_tags($_REQUEST['descuento']);
    $total = strip_tags($_REQUEST['total']);
    $codigoNota = strip_tags($_REQUEST['codigoNota']);


    if (!empty($_SESSION['datos_producto_nota'][$codigoNota][$token])) {


        $_SESSION['datos_producto_nota'][$codigoNota][$token]["cantidad"] = $cantidad;
        $_SESSION['datos_producto_nota'][$codigoNota][$token]["subtotal"] = $subtotal;
        $_SESSION['datos_producto_nota'][$codigoNota][$token]["descuento"] = $descuento;
        $_SESSION['datos_producto_nota'][$codigoNota][$token]["total"] = $total;

        echo json_encode("actualizado");
    } else {
        echo json_encode("error");
    }
}
if ($action == 'guardar_nota') {
    require_once "../models/notas.model.php";
    /*== Formateando variables ==*/
    $codigo_nota = strip_tags($_REQUEST['codigoNota']);
    if (isset($_SESSION['datos_producto_nota'][$codigo_nota])) {
        if (empty($_SESSION['datos_producto_nota'][$codigo_nota])) {
            echo json_encode("not-products");
        } else {

            $porc_descuento = strip_tags($_REQUEST['porc_descuento']);
            $tipo_entrega = strip_tags($_REQUEST['tipo_entrega']);
            $forma_pago = strip_tags($_REQUEST['forma_pago']);
            $pagado = "0.00";

            $pagado = number_format($pagado, MONEDA_DECIMALES, '.', '');
            $total = number_format($_SESSION['total' . $codigo_nota], MONEDA_DECIMALES, '.', '');
            $subtotal = number_format($_SESSION['subtotal' . $codigo_nota], MONEDA_DECIMALES, '.', '');
            $descuento = number_format($_SESSION['descuento' . $codigo_nota], MONEDA_DECIMALES, '.', '');
            $porc_descuento = number_format($porc_descuento, MONEDA_DECIMALES, '.', '');

            $fecha_venta = date("Y-m-d");
            $hora_venta = date("H:i:s");

            $total_final = $total;
            $total_final = number_format($total_final, MONEDA_DECIMALES, '.', '');

            $cambio = $total_final - $total_final;
            $cambio = number_format($cambio, MONEDA_DECIMALES, '.', '');
            $tipo_venta = "nota";
            $id_cliente = $_SESSION["id"];

            /***GENERAR CODIGO VENTA */

            $controlador = new ControllerNotas();

            $ventas = $controlador->ctrIdVenta();
            $ventas = count($ventas) + 1;


            $codigo_venta = generarCodigoAleatorioNota(10, $ventas);
            if ($tipo_entrega == "recoleccion") {
                if ($forma_pago != 1) {
                    $fecha_pago =  date("Y-m-d H:i:s", strtotime('+1 days'));
                } else {
                    $fecha_pago =  date("Y-m-d H:i:s", strtotime('+7 days'));
                }
            } else {
                $fecha_pago =  date("Y-m-d H:i:s", strtotime('+1 days'));
            }


            $datos_venta = [
                "tipo_venta" => $tipo_venta,
                "tipo_entrega" => $tipo_entrega,
                "forma_pago" => $forma_pago,
                "codigo" => $codigo_venta,
                "codigo_nota" => $codigo_nota,
                "fecha_venta" => $fecha_venta,
                "hora_venta" => $hora_venta,
                "subtotal" => $subtotal,
                "porc_descuento" => $porc_descuento,
                "descuento" => $descuento,
                "total" => $total_final,
                "pagado" => $pagado,
                "cambio" => $cambio,
                "id_usuario" => 1,
                "id_cliente" => $id_cliente,
                "id_caja" => 1,
                "estatus" => 1,
                "fecha_pago" => $fecha_pago,
                "estatus_pago" => 0,
            ];

            $generar_venta = $controlador->ctrGenerarVenta($datos_venta);

            if ($generar_venta == "ok") {
                foreach ($_SESSION['datos_producto_nota'][$codigo_nota] as $producto) {
                    $productos_venta = [
                        "id_producto" => $producto['id_producto'],
                        "token" => $producto['token'],
                        "descripcion" => $producto['descripcion'],
                        "codigo" => $codigo_venta,
                        "cantidad" => $producto['cantidad'],
                        "color" => $producto['colores'],
                        "talla" => $producto['tallas'],
                        "precio_venta" => $producto['precio_venta'],
                        "porc_descuento" => $producto['porc_descuento'],
                        "descuento" => $producto['descuento'],
                        "subtotal" => $producto['subtotal'],
                        "total" => $producto['total'],
                    ];


                    $guardarProductoVenta = $controlador->ctrGuardarProductoVenta($productos_venta);
                }
                unset($_SESSION["datos_producto_nota"][$codigo_nota]);
                unset($_SESSION["subtotal" . $codigo_nota]);
                unset($_SESSION["descuento" . $codigo_nota]);
                unset($_SESSION["total" . $codigo_nota]);
                echo json_encode("exito");
            } else {
                echo json_encode("error");
            }
        }
    } else {
        echo json_encode("not-exist");
    }
}
if ($action == 'lista_notas_adquiridas') {

    include('../clases/notas.php');
    $database = new notas();
    //Recibir variables enviadas
    $busqueda = strip_tags($_REQUEST['busqueda']);
    $campoOrden = strip_tags($_REQUEST['campoOrden']);
    $orden = strip_tags($_REQUEST['orden']);
    $per_page = intval($_REQUEST['per_page']);
    $vista = strip_tags($_REQUEST['vista']);
    $id_cliente = intval($_SESSION['id']);
    $visualizar = strip_tags($_REQUEST['visualizar']);

    //Variables de paginación
    $page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $adjacents  = 4; //espacio entre páginas después del número de adyacentes
    $offset = ($page - 1) * $per_page;

    $search = array("visualizar" => $visualizar, "id_cliente" => $id_cliente, "busqueda" => $busqueda, "campoOrden" => $campoOrden, "orden" => $orden, "per_page" => $per_page, "offset" => $offset);
    //consulta principal para recuperar los datos
    $datos = $database->getListaNotasAdquiridas($search);
    $countAll = $database->getCounter();
    $row = $countAll;

    if ($row > 0) {
        $numrows = $countAll;;
    } else {
        $numrows = 0;
    }
    $total_pages = ceil($numrows / $per_page);


    //Recorrer los datos recuperados

    if ($numrows > 0) {
    ?>

        <?php
        $finales = 0;
        foreach ($datos as $key => $row) {

            $ahora = date("Y-m-d H:i:s");
            $fecha_pago =  date("Y-m-d H:i:s", strtotime($row["fecha_pago"]));

            if ($row["estatus"] != 0) {
                if ($row["estatus_pago"] == 0) {

                    $estado = "Nota Sin Pagar";
                    $card_color = "card-red";
                } else {

                    $estado = "Nota Pagada";
                    $card_color = "card-green";
                }
            } else {
                $estado = "";
                $card_color = "card-red";
            }



        ?>
            <div class="col-lg-4 col-md-4 col-sm-6" onclick="<?= "visualizarNota('" . $row["codigo"] . "','" . $ahora . "','" . $row["fecha_pago"] . "','" . $row["estatus_pago"] . "','" . $row["estatus"] . "')" ?>" style="cursor:pointer">

                <div class="card mb-3">
                    <div class="card-header <?= $card_color ?>">
                        <div id="riboon<?= $row['id_venta']; ?>"></div>
                        <h4><?= $estado ?></h4>
                    </div>

                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="<?= APP_URL_ADMIN . "app/ajax/codes/" . $row["codigo_nota"] . ".png" ?>" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">

                            <div class="card-body">
                                <h5 class="card-title"><?= $row["codigo"] ?></h5>
                                <h4 class="card-title-total">$ <?= $row["total"] ?></h4>
                                <p class="card-text"><small class="text-muted"><?= $row["fecha_venta"] ?></small></p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer card-color">
                        <h4 id="estatusPagoNota<?= $row['id_venta']; ?>"></h4>
                        <div class="countdownVentas" id="countdownVentas<?= $row['id_venta']; ?>"><?= '<script>countDownVentas("' . $row['fecha_pago'] . '","' . $row['id_venta'] . '","' . $row['estatus'] . '","' . $row['estatus_pago'] . '","' . $row['forma_pago'] . '")</script>'; ?>

                        </div>
                    </div>

                </div>
            </div>
        <?php
            $finales++;
        }
        ?>

        <div class="clearfix">
            <?php
            $inicios = $offset + 1;
            $finales += $inicios - 1;
            echo '<div class="hint-text">Mostrando ' . $inicios . ' al ' . $finales . ' de ' . $numrows . ' registros</div>';


            include '../clases/pagination.php'; //include pagination class
            $pagination = new Pagination($page, $total_pages, $adjacents);
            echo $pagination->paginate($vista);

            ?>
        </div>
    <?php
    }
}
if ($action ==  'carrito_venta') {
    $codigoVenta = strip_tags($_REQUEST['codigoVenta']);
    include('../clases/notas.php');
    $database = new notas();
    //Recibir variables enviadas

    $search = array("codigoVenta" => $codigoVenta);
    //consulta principal para recuperar los datos
    $datos = $database->getDetalleVenta($search);
    $countAll = $database->getCounter();

    $row = $countAll;

    if ($row > 0) {
        $numrows = $countAll;;
    } else {
        $numrows = 0;
    }

    if ($numrows > 0) {
    ?>

        <?php
        $finales = 0;
        $_SESSION['total' . $codigoVenta] = 0;
        $_SESSION['subtotal' . $codigoVenta] = 0;
        $_SESSION['descuento' . $codigoVenta] = 0;
        foreach ($datos as $key => $producto) {

        ?>
            <div class="card card-gray mb-2">
                <div class="card-body">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <h6 class="card-subtitle"><?= $producto["descripcion"] ?></h6>
                                <h5 class="card-subtitle-2"><?= $producto["token"] ?></h5>
                                <h5 class="card-subtitle-2"><?php echo MONEDA_SIMBOLO . number_format($producto['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                            </div>
                            <div class="col-md-1 col-sm-1 col-lg-1">
                                <div class="form-group">
                                    <div class="input-group d-flex align-items-center">

                                        <h6 class="card-subtitle"><?= $producto["cantidad"] ?></h6>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-1 col-lg-1">
                                <div class="form-group">
                                    <label>Color</label>
                                    <select class="form-select">
                                        <?php

                                        $colores = explode(",", $producto['color']);

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
                                    <select class="form-select">
                                        <?php

                                        $tallas = explode(",", $producto['talla']);

                                        foreach ($tallas as $key => $value) {
                                            echo '<option value="' . $value . '">' . $value . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <label>Subtotal</label>
                                <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($producto['subtotal'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                            </div>
                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <label>Desc</label>
                                <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($producto['descuento'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                            </div>
                            <div class="col-md-2 col-sm-2 col-lg-2">
                                <label>Total</label>
                                <h5 class="card-subtitle"><?php echo MONEDA_SIMBOLO . number_format($producto['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . " " . MONEDA_NOMBRE; ?></h5>
                            </div>
                            <div class="col-md-1 col-sm-1 col-lg-1">
                                <button class="btn btn-md btn-danger mt-4" type="button" disabled onclick="removerProductoCarrito('<?= $producto["token"] ?>','<?= $codigoVenta ?>')">
                                    <i class="ti-trash" style="color:#ffffff"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <?php
            $finales++;

            $_SESSION['subtotal' . $codigoVenta] += $producto['subtotal'];
            $_SESSION['descuento' . $codigoVenta] += $producto['descuento'];
            $_SESSION['total' . $codigoVenta] += $producto['total'];
        }

        ?>


    <?php
    } else {
        $_SESSION['total' . $codigoVenta] = 0;
        $_SESSION['subtotal' . $codigoVenta] = 0;
        $_SESSION['descuento' . $codigoVenta] = 0;
        echo ' <tr class="has-text-centered">
                                                <td colspan="13">
                                                    No hay productos agregados
                                                </td>
                                            </tr>';
    }

    ?>

    <?php
}
if ($action == 'cancelar_venta') {
    require_once "../models/notas.model.php";
    $id_venta = strip_tags($_REQUEST['id_venta']);

    $controlador = new ControllerNotas();

    $cancelacion = $controlador->ctrCancelarVenta($id_venta);
    echo json_encode($cancelacion);
}
if ($action == 'listado_estatus_notas') {

    include('../clases/notas.php');
    $database = new notas();
    //Recibir variables enviadas
    $busqueda = strip_tags($_REQUEST['busqueda']);
    $campoOrden = strip_tags($_REQUEST['campoOrden']);
    $orden = strip_tags($_REQUEST['orden']);
    $per_page = intval($_REQUEST['per_page']);
    $vista = strip_tags($_REQUEST['vista']);

    //Variables de paginación
    $page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $adjacents  = 4; //espacio entre páginas después del número de adyacentes
    $offset = ($page - 1) * $per_page;

    $search = array("busqueda" => $busqueda, "campoOrden" => $campoOrden, "orden" => $orden, "per_page" => $per_page, "offset" => $offset);
    //consulta principal para recuperar los datos
    $datos = $database->getListaEstatusNotas($search);
    $countAll = $database->getCounter();
    $row = $countAll;

    if ($row > 0) {
        $numrows = $countAll;;
    } else {
        $numrows = 0;
    }
    $total_pages = ceil($numrows / $per_page);


    //Recorrer los datos recuperados

    if ($numrows > 0) {
    ?>

        <?php
        $finales = 0;
        foreach ($datos as $key => $row) {
            switch ($row["estatus"]) {
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
            if ($row["estatus_pago"] == 0) {
                $displaySinPagar = "";
                $displayPagado = "display:none";
            } else {
                $displaySinPagar = "display:none";
                $displayPagado = "";
            }

        ?>
            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-header">
                        <div class="ribbon right" style="--c: #CC333F;--f: 10px;<?= $displaySinPagar ?>">Sin Pagar</div>
                        <div class="ribbon right" style="--c: #27ae60;--f: 10px;<?= $displayPagado ?>">Nota Pagada</div>
                        <div class="row">
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <h3><?php echo $row["codigo"] ?></h3>
                            </div>

                        </div>


                    </div>
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
        <?php
            $finales++;
        }
        ?>

        <div class="clearfix">
            <?php
            $inicios = $offset + 1;
            $finales += $inicios - 1;
            echo '<div class="hint-text">Mostrando ' . $inicios . ' al ' . $finales . ' de ' . $numrows . ' registros</div>';


            include '../clases/pagination.php'; //include pagination class
            $pagination = new Pagination($page, $total_pages, $adjacents);
            echo $pagination->paginate($vista);

            ?>
        </div>
<?php
    }
}
?>