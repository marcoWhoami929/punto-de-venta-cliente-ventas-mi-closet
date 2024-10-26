<?php
require_once "conexion.php";

class ModelNotas
{
    static public function mdlListarNotas($url)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM notas WHERE codigo = '$url'");

        $stmt->execute();

        return $stmt->fetch();

        $stmt = null;
    }
}
