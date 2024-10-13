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


                        echo '<script>
                           
                                window.location = "inicio";
                              
    
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
}
