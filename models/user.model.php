<?php
require_once "conexion.php";
class ModelUser
{
    static public function mdlMostrarClientes($tabla, $item, $valor)
    {

        if ($item != null) {

            $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetch();
        } else {

            $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM $tabla");

            $stmt->execute();

            return $stmt->fetchAll();
        }
    }
    static public function mdlRegistroCliente($datos)
    {
        $stmt = ConexionsBd::conectar()->prepare("INSERT INTO cliente(tipo_cliente,facebook,nombre,apellidos,usuario,email,password,telefono,celular,domicilio,calle,numero,ciudad,estado,cp,pais,estatus) VALUES (:tipo_cliente,:facebook,:nombre,:apellidos,:usuario,:email,:password,:telefono,:celular,:domicilio,:calle,:numero,:ciudad,:estado,:cp,:pais,:estatus)");

        $stmt->bindParam(":tipo_cliente", $datos["tipo_cliente"], PDO::PARAM_STR);
        $stmt->bindParam(":facebook", $datos["facebook"], PDO::PARAM_STR);
        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":apellidos", $datos["apellidos"], PDO::PARAM_STR);
        $stmt->bindParam(":usuario", $datos["usuario"], PDO::PARAM_STR);
        $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
        $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
        $stmt->bindParam(":celular", $datos["celular"], PDO::PARAM_STR);
        $stmt->bindParam(":domicilio", $datos["domicilio"], PDO::PARAM_STR);
        $stmt->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
        $stmt->bindParam(":numero", $datos["numero"], PDO::PARAM_STR);
        $stmt->bindParam(":ciudad", $datos["ciudad"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":cp", $datos["cp"], PDO::PARAM_STR);
        $stmt->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
        $stmt->bindParam(":estatus", $datos["estatus"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();

        $stmt = null;
    }
    static public function mdlBuscarCliente($datos)
    {

        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM cliente WHERE facebook  = :facebook and nombre  = :nombre and apellidos  = :apellidos");

        $stmt->bindParam(":facebook", $datos["facebook"], PDO::PARAM_STR);
        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":apellidos", $datos["apellidos"], PDO::PARAM_STR);

        $stmt->execute();

        return $stmt->fetch();
    }
}
