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
    static public function mdlListarFormasPago($tipo_entrega)
    {
        if ($tipo_entrega == "recoleccion") {
            $sWhere = "WHERE id_metodo_pago NOT IN(5)";
        } else {
            $sWhere = "WHERE id_metodo_pago NOT IN(1,5)";
        }
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM metodopago $sWhere");

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

        $stmt = ConexionsBd::conectar()->prepare("INSERT INTO venta(tipo_venta,tipo_entrega,forma_pago,codigo,codigo_nota,fecha_venta,hora_venta,subtotal,porc_descuento,descuento,total,pagado,cambio,id_usuario,id_cliente,id_caja,estatus,fecha_pago,estatus_pago) VALUES(:tipo_venta,:tipo_entrega,:forma_pago,:codigo,:codigo_nota,:fecha_venta,:hora_venta,:subtotal,:porc_descuento,:descuento,:total,:pagado,:cambio,:id_usuario,:id_cliente,:id_caja,:estatus,:fecha_pago,:estatus_pago)");


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
        $stmt->bindParam(":fecha_pago", $datos_venta["fecha_pago"], PDO::PARAM_STR);
        $stmt->bindParam(":estatus_pago", $datos_venta["estatus_pago"], PDO::PARAM_INT);
        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }
        $stmt->close();

        $stmt = null;
    }
    static public function mdlGuardarProductoVenta($productos_venta)
    {

        $stmt = ConexionsBd::conectar()->prepare("INSERT INTO venta_detalle(id_producto,token,descripcion,codigo,cantidad,color,talla,precio_venta,porc_descuento,descuento,subtotal,total) VALUES(  :id_producto,:token,:descripcion,:codigo,:cantidad,:color,:talla,:precio_venta,:porc_descuento,:descuento,:subtotal,:total)");

        $stmt->bindParam(":id_producto", $productos_venta["id_producto"], PDO::PARAM_INT);
        $stmt->bindParam(":token", $productos_venta["token"], PDO::PARAM_STR);
        $stmt->bindParam(":descripcion", $productos_venta["descripcion"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo", $productos_venta["codigo"], PDO::PARAM_STR);
        $stmt->bindParam(":cantidad", $productos_venta["cantidad"], PDO::PARAM_STR);
        $stmt->bindParam(":color", $productos_venta["color"], PDO::PARAM_STR);
        $stmt->bindParam(":talla", $productos_venta["talla"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_venta", $productos_venta["precio_venta"], PDO::PARAM_STR);
        $stmt->bindParam(":porc_descuento", $productos_venta["porc_descuento"], PDO::PARAM_STR);
        $stmt->bindParam(":descuento", $productos_venta["descuento"], PDO::PARAM_STR);
        $stmt->bindParam(":subtotal", $productos_venta["subtotal"], PDO::PARAM_STR);
        $stmt->bindParam(":total", $productos_venta["total"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }
        $stmt->close();

        $stmt = null;
    }
    static public function mdlListarVentas($url)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT vent.*,met.metodo FROM venta as vent inner join metodopago as met ON vent.forma_pago = met.id_metodo_pago WHERE vent.codigo = '$url'");

        $stmt->execute();

        return $stmt->fetch();

        $stmt = null;
    }
    static public function mdlCancelarVenta($id_venta)
    {

        $stmt = ConexionsBd::conectar()->prepare("UPDATE venta set estatus = 0 WHERE id_venta = '" . $id_venta . "'");

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }
        $stmt->close();

        $stmt = null;
    }
    static public function mdlDetalleVenta($url)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT ven.*,caja.*,cli.nombre as 'nombreCliente',cli.celular,cli.apellidos,cli.domicilio,usu.nombre as 'nombreCajero' FROM venta as ven INNER JOIN cliente as cli ON ven.id_cliente=cli.id_cliente INNER JOIN usuario as usu ON ven.id_usuario=usu.id_usuario INNER JOIN caja as caja ON ven.id_caja=caja.id_caja WHERE codigo = '$url'");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt = null;
    }
    static public function mdlDetalleEmpresa()
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM empresa");

        $stmt->execute();

        return $stmt->fetch();

        $stmt = null;
    }
    static public function mdlDetalleProductosVenta($codigo)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT * FROM venta_detalle  WHERE codigo = '$codigo'");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt = null;
    }
    static public function mdlObtenerStockActual($id_producto)
    {
        $stmt = ConexionsBd::conectar()->prepare("SELECT prod.*,inven.stock_total FROM producto as prod INNER JOIN inventario as inven ON prod.cid_producto = inven.id_producto WHERE prod.cid_producto= '$id_producto'");

        $stmt->execute();

        return $stmt->fetch();

        $stmt = null;
    }
}
