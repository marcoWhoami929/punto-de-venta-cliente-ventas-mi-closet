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
    static public function mdlListarFormasPago()
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM metodopago ");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt = null;
    }
    static public function mdlIdVenta()
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT id_venta FROM venta");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt = null;
    }
    static public function mdlGenerarVenta($datos_venta)
    {

        $stmt = ConexionsBd::conectar()->prepare("INSERT INTO venta(tipo_venta,tipo_entrega,forma_pago,codigo,codigo_nota,fecha_venta,hora_venta,subtotal,porc_descuento,descuento,total,pagado,cambio,id_usuario,id_cliente,id_caja,estatus) VALUES(:tipo_venta,:tipo_entrega,:forma_pago,:codigo,:codigo_nota,:fecha_venta,:hora_venta,:subtotal,:porc_descuento,:descuento,:total,:pagado,:cambio,:id_usuario,:id_cliente,:id_caja,:estatus)");


        $stmt->bindParam(":tipo_venta", $datos_venta["tipo_venta"], PDO::PARAM_STR);
        $stmt->bindParam(":tipo_entrega", $datos_venta["tipo_entrega"], PDO::PARAM_STR);
        $stmt->bindParam(":forma_pago", $datos_venta["forma_pago"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo", $datos_venta["codigo"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo_nota", $datos_venta["codigo_nota"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_venta", $datos_venta["fecha_venta"], PDO::PARAM_STR);
        $stmt->bindParam(":hora_venta", $datos_venta["hora_venta"], PDO::PARAM_STR);
        $stmt->bindParam(":subtotal", $datos_venta["subtotal"], PDO::PARAM_STR);
        $stmt->bindParam(":porc_descuento", $datos_venta["porc_descuento"], PDO::PARAM_STR);
        $stmt->bindParam(":descuento", $datos_venta["descuento"], PDO::PARAM_STR);
        $stmt->bindParam(":total", $datos_venta["total"], PDO::PARAM_STR);
        $stmt->bindParam(":pagado", $datos_venta["pagado"], PDO::PARAM_STR);
        $stmt->bindParam(":cambio", $datos_venta["cambio"], PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $datos_venta["id_usuario"], PDO::PARAM_STR);
        $stmt->bindParam(":id_cliente", $datos_venta["id_cliente"], PDO::PARAM_STR);
        $stmt->bindParam(":id_caja", $datos_venta["id_caja"], PDO::PARAM_STR);
        $stmt->bindParam(":estatus", $datos_venta["estatus"], PDO::PARAM_STR);
        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }
        $stmt->close();

        $stmt = null;
    }
}
