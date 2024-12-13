<?php

/**
 * Integración avanzada de Checkout Pro de Mercado Pago
 * usando el SDK versión 3 para PHP y el SDK JS versión 2
 *
 * @author mroblesdev
 */

// Desactiva la notificación de errores deprecados en PHP
error_reporting(~E_DEPRECATED);

// Carga el autoload de Composer para gestionar dependencias
require_once 'vendor/autoload.php';

// Importa las clases necesarias del SDK de MercadoPago
use MercadoPago\Client\Preference\PreferenceClient;
use MercadoPago\MercadoPagoConfig;

// Agrega credenciales ACCESS_TOKEN
MercadoPagoConfig::setAccessToken("APP_USR-5989808524245743-121311-53589ed4cf179ed2d356c43555e7eb60-2144285800");

// Crea una instancia del cliente de preferencias de MercadoPago
$client = new PreferenceClient();

// Define las URLs de retorno para los diferentes estados de pago
$backUrls = [
    "success" => "https://occhimarket.com.mx/mercado-pago/success",
    "failure" => "https://occhimarket.com.mx/mercado-pago/failure",
    "pending" => "https://occhimarket.com.mx/mercado-pago/pending"
];

// Crea una preferencia de pago con los detalles del producto y otras configuraciones
$preference = $client->create([
    "items" => [
        [ // Primer producto
            "id" => "DEP-0001",
            "title" => "Balon de Futbol",
            "description" => "Balon para jugar futbol", // Opcional
            "picture_url" => "https://codigosdeprogramacion.com/contact/images/paquete.jpg",  // Opcional
            "category_id" => "Deportes",  // Opcional
            "quantity" => 1,
            "currency_id" => "MXN", // Opcional
            "unit_price" => 100
        ],
        [ // Segundo producto
            "id" => "DEP-0002",
            "title" => "Tenis deportivo",
            "quantity" => 1,
            "unit_price" => 120
        ]
    ],

    // URLs de retorno configuradas anteriormente
    "back_urls" => $backUrls,
    // Configura la redirección automática en caso de que el pago sea aprobado
    "auto_return" => "approved",
    // Modo binario de pago (true significa que solo se aceptan pagos completos y no se permite un estado pendiente)
    "binary_mode" => true,
    // Referencia externa para identificar la transacción en el sistema del vendedor
    "external_reference" => "CDP001",
    // Descripción que aparecerá en el extracto de la tarjeta del comprador
    "statement_descriptor" => "MI TIENDA CDP",
    // Configuración de métodos de pago
    "payment_methods" => [
        // Métodos de pago excluidos (por ejemplo, American Express)
        "excluded_payment_methods" => [
            [
                "id" => "amex"
            ]
        ],
        // Tipos de pago excluidos (por ejemplo, transferencia bancaria)
        //
        /*
        "excluded_payment_types" => [
            [
                "id" => "bank_transfer"
            ]
        ],
        */
        // Número máximo de cuotas permitido
        "installments" => 12
    ],
    // Configuración de envíos
    "shipments" => [
        "cost" => 250,
        "mode" => "not_specified",
    ],
]);


require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];
$tokenNota = $url;

$controlador = new ControllerNotas();
$notas = $controlador->ctrListarNotas($url);

$codigoNota = $notas["codigo"];

//var_dump($_SESSION["datos_producto_nota"][$codigoNota]);
if ($notas != false) {

    date_default_timezone_set('America/Mexico_City');
    $ahora = date("Y-m-d H:i:s");
    $fecha_publicacion =  date("Y-m-d H:i:s", strtotime($notas["fecha_publicacion"]));
    $fecha_expiracion =  date("Y-m-d H:i:s", strtotime($notas["fecha_expiracion"]));

    if (isset($_SESSION["datos_producto_nota"][$codigoNota])) {
        //unset($_SESSION["datos_producto_nota"][$codigoNota]);
    } else {
    }


    if ($fecha_publicacion > $ahora) {
        unset($_SESSION["datos_producto_nota"][$tokenNota]);
        unset($_SESSION["subtotal" . $tokenNota]);
        unset($_SESSION["descuento" . $tokenNota]);
        unset($_SESSION["total" . $tokenNota]);
        echo '<script>Swal.fire({
            title: "Nota sin iniciar",
            text: "La nota aun no se encuentra disponible para adquirir, porfavor espere el tiempo restante.",
            icon: "warning",
            confirmButtonColor: "#B99654",
            confirmButtonText: "Entendido",
          }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = "../listaNotas";
          }
        })</script>';
    } else {

        if ($ahora > $fecha_expiracion) {
            unset($_SESSION["datos_producto_nota"][$tokenNota]);
            unset($_SESSION["subtotal" . $tokenNota]);
            unset($_SESSION["descuento" . $tokenNota]);
            unset($_SESSION["total" . $tokenNota]);
            echo '<script>Swal.fire({
                title: "Nota finalizada",
                text: "El tiempo de la nota ha expirado, no se puede adquirir la nota",
                icon: "warning",
                confirmButtonColor: "#B99654",
                confirmButtonText: "Entendido",
              }).then((result) => {
              if (result.isConfirmed) {
                window.location.href = "../listaNotas";
              }
            })</script>';
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
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                        <div class="form-group">
                                                            <label style="color:#B99654">Publicación</label>
                                                            <h5 class="card-subtitle-2"><?= $notas["fecha_publicacion"] ?></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                        <div class="form-group">
                                                            <label style="color:#B99654">Expiración</label>
                                                            <h5 class="card-subtitle-2"><?= $notas["fecha_expiracion"] ?></h5>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                        <div class="form-group">
                                                            <label style="color:#B99654">Tipo Entrega</label>
                                                            <select id="tipo_entrega_nota" class="form-select form-select-lg" onchange="cargarMetodosPago()">
                                                                <option value="recoleccion">Recolección en tienda</option>
                                                                <option value="envio">Envio</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                        <div class="form-group">
                                                            <label style="color:#B99654">Forma de Pago</label>
                                                            <div id="wallet_container"></div>
                                                            <!--
                                                            <select id="forma_pago_nota" class="form-select form-select-lg">

                                                            </select>
            -->
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
                                            <button type="button" class="btn btn-primary mx-2 mb-2 btn-lg" data-bs-toggle="modal" data-bs-target="#modalProductos" style="justify-content: center;align-items: center;">
                                                Productos Nota
                                            </button>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 " style="display:grid">
                                            <button type="button" class="btn btn-primary mx-2 mb-3  btn-lg" onclick="guardarNota('<?= $notas['codigo'] ?>','<?= $notas['porc_descuento'] ?>')" style="justify-content: center;align-items: center;">
                                                Guardar Nota
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body productos-nota">
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

<script>
    // Inicializa el objeto MercadoPago con el PUBLIC_KEY
    const mp = new MercadoPago('APP_USR-bfdf0cd3-a019-41dc-a359-e244547669b6', {
        locale: 'es-MX'
    });

    // Crea un componente de billetera de MercadoPago en el contenedor con id "wallet_container"
    mp.bricks().create("wallet", "wallet_container", {
        initialization: {
            preferenceId: '<?php echo $preference->id; ?>',
            redirectMode: 'self'
        },
        customization: {
            texts: {
                action: "pay",
                valueProp: 'security_safety',
            },
        },
    });
</script>