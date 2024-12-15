<?php

class ControllerUser
{
    static public function ctrPasswordEncrypt($pwd, $accion)
    {
        $encrypt = "AES-256-CBC";
        $secretKey = 'AA74CDCC2BBRT935136HH7B63C27';
        $secretIv = '5fgf5HJ5g27';
        $key = hash('sha256', $secretKey);
        $iv = substr(hash('sha256', $secretIv), 0, 16);
        if ($accion === 'encrypt') {
            $output = openssl_encrypt($pwd, $encrypt, $key, 0, $iv);
            $output = base64_encode($output);
        } else if ($accion === 'decrypt') {
            $output = openssl_decrypt(base64_decode($pwd), $encrypt, $key, 0, $iv);
        }
        return $output;
    }
    public function ctrAccesoUser()
    {
        if (isset($_POST["username"]) && isset($_POST["password"])) {


            $encriptar = $this->ctrPasswordEncrypt($_POST["password"], 'encrypt');


            $tabla = "cliente";
            $item = "usuario";
            $valor = $_POST["username"];

            $respuesta = ModelUser::mdlMostrarClientes($tabla, $item, $valor);

            if ($respuesta != false) {
                if ($respuesta["estatus"] == 0) {

                    echo '<script>
                        Swal.fire({
                           icon: "error",
                           title: "¡Por el momento te encuentras inactivo, comunicate con la tienda...!",
                           confirmButtonText: "Cerrar"
                         })
    
                    </script>';
                } else {

                    if ($respuesta["usuario"] == $_POST["username"] && $respuesta["password"] == $encriptar) {

                        $_SESSION["validarSesionBackend"] = "ok";
                        $_SESSION["id"] = $respuesta["id_cliente"];
                        $_SESSION["nombre"] = $respuesta["nombre"];
                        $_SESSION["usuario"] = $respuesta["usuario"];
                        $_SESSION["apellidos"] = $respuesta["apellidos"];


                        echo '<script>
                           
                                window.location = "listaNotas";
                              
    
                            </script>';
                    } else {

                        echo '<script>
                     Swal.fire({
                        icon: "error",
                        title: "¡Datos de acceso incorrectos, vuelve a intentarlo...!",
                        confirmButtonText: "Cerrar"
                      })
    
                 </script>';
                    }
                }
            } else {
                echo '<script>
                Swal.fire({
                   icon: "error",
                   title: "¡El usuario ingresado no se encuentra registrado...!",
                   confirmButtonText: "Cerrar"
                 })

            </script>';
            }
        }
    }
    public function ctrRegistroUser()
    {
        if (isset($_POST["usuarioFacebook"]) && isset($_POST["nombre"]) && isset($_POST["apellidos"]) && isset($_POST["celular"])) {
            $encriptar = $this->ctrPasswordEncrypt($_POST["password"], 'encrypt');

            $caracteres_permitidos = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $longitud = 8;
            $nombre = trim($_POST["nombre"]);
            $apellidos = trim($_POST["apellidos"]);
            $nombreCompleto = $nombre . " " . $apellidos;
            $iniciales = strtolower(preg_replace(['/(\w)\w+/', '/\s/'], ['${1}', ''], $nombreCompleto));

            $nombreUsuario =  strtoupper($iniciales . "-" . substr(str_shuffle($caracteres_permitidos), 0, $longitud));

            $datos = array(
                "tipo_cliente" => 'Facebook',
                "facebook" => $_POST["usuarioFacebook"],
                "nombre" => trim($_POST["nombre"]),
                "apellidos" => trim($_POST["apellidos"]),
                "usuario" => $nombreUsuario,
                "email" => trim($_POST["email"]),
                "password" => $encriptar,
                "telefono" => trim($_POST["telefono"]),
                "celular" => trim($_POST["celular"]),
                "domicilio" => trim($_POST["domicilio"]),
                "calle" => $_POST["route"],
                "numero" => $_POST["street_number"],
                "ciudad" => $_POST["locality"],
                "estado" => $_POST["administrative_area_level_1"],
                "cp" => $_POST["postal_code"],
                "pais" => $_POST["country"],
                "estatus" => 1,
            );
            $buscarCliente = ModelUser::mdlBuscarCliente($datos);


            if ($buscarCliente != false) {
                echo '<script>
                Swal.fire({
                        showDenyButton: false,
                        confirmButtonText: "Entendido",
                        icon: "warning",
                        title:"El usuario ya se encuentra registrado",
                        showConfirmButton: true,
                        }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "acceso";
                        }
                        });


            </script>';
            } else {
                $guardarCliente = ModelUser::mdlRegistroCliente($datos);


                if ($guardarCliente == "ok") {

                    echo '<script>

				 Swal.fire({
                        showDenyButton: false,
                        confirmButtonText: "Entendido",
                        denyButtonText: "Seguir modificando",
                        icon: "success",
                        text:"Este es su nombre de usuario para acceder al portal,porfavor tome captura o foto de su nombre de usuario",
                        title:"' . $nombreUsuario . '",
                        showConfirmButton: true,
                        }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "acceso";
                        }
                        });

					</script>';
                }
            }
        }
    }
}
