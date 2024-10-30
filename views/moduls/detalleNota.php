<?php
error_reporting(E_ALL);
require_once "controllers/notas.controller.php";
$url = explode("/", $_GET['ruta']);
$url = $url[1];
$tokenNota = $url;

$notas = new ControllerNotas();
$notas = $notas->ctrListarNotas($url);
$codigoNota = $notas["codigo"];

if ($notas != false) {

    date_default_timezone_set('America/Mexico_City');
    $ahora = date("Y-m-d H:i:s");
    $fecha_publicacion =  date("Y-m-d H:i:s", strtotime($notas["fecha_publicacion"]));
    $fecha_expiracion =  date("Y-m-d H:i:s", strtotime($notas["fecha_expiracion"]));

    if (isset($_SESSION["datos_producto_nota"])) {
        //unset($_SESSION["datos_producto_nota"]);
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