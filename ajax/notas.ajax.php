<?php

require_once "../config/app.php";
$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != NULL) ? $_REQUEST['action'] : '';
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
                                        <input type="number" class="form-control" value="1" id="cantidad<?= $row['id_producto'] ?>">
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
                                <button class="btn btn-md btn-info mt-4" type="button" onclick="agregarProducto('<?= $row["id_producto"] ?>','<?= $row["codigo"] ?>','<?= $row["descripcion"] ?>','<?= $row["porc_descuento"] ?>','<?= $row["precio_venta"] ?>')">
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



    if (empty($_SESSION['datos_producto_venta'][$codigo])) {

        $_SESSION['datos_producto_venta'][$codigo] = [
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


    if (count($_SESSION['datos_producto_venta']) > 0) {
    ?>

        <?php
        $finales = 0;
        foreach ($_SESSION['datos_producto_venta'] as $producto) {

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
                                            <button class="btn btn-sm btn-info me-2" type="button" onclick="decrementar(<?= $producto['id_producto'] ?>)">
                                                <i class="ti-minus"></i>
                                            </button>
                                        </div>
                                        <input type="number" class="form-control" value="" id="cantidad<?= $producto['id_producto'] ?>">
                                        <div class="input-group-append">
                                            <button class="btn btn-sm btn-info ms-2" type="button" onclick="incrementar(<?= $producto['id_producto'] ?>)">
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
                                <button class="btn btn-md btn-info mt-4" type="button" onclick="agregarProducto('<?= $row["id_producto"] ?>','<?= $row["codigo"] ?>','<?= $row["descripcion"] ?>','<?= $row["porc_descuento"] ?>','<?= $row["precio_venta"] ?>')">
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
?>