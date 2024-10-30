<?php
session_start();
require_once "../config/app.php";
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
            date_default_timezone_set('America/Chihuahua');
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
?>