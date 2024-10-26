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
    static public function mdlDetalleNota($codigo)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM productos_notas WHERE codigo_nota = '$codigo'");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt = null;
    }
}
