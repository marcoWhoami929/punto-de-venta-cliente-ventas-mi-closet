<?php

class ControllerNotas
{

    static public function ctrListarNotas($url)
    {

        $respuesta =  ModelNotas::mdlListarNotas($url);

        return $respuesta;
    }
    static public function ctrListarFormasPago($tipo_entrega)
    {

        $respuesta =  ModelNotas::mdlListarFormasPago($tipo_entrega);

        return $respuesta;
    }
    static public function ctrDetalleNota($codigo)
    {

        $respuesta =  ModelNotas::mdlDetalleNota($codigo);

        return $respuesta;
    }
    static public function ctrIdVenta()
    {

        $respuesta =  ModelNotas::mdlIdVenta();

        return $respuesta;
    }
    static public function ctrIdPago()
    {

        $respuesta =  ModelNotas::mdlIdPago();

        return $respuesta;
    }
    static public function ctrGenerarVenta($datos_venta)
    {

        $respuesta =  ModelNotas::mdlGenerarVenta($datos_venta);

        return $respuesta;
    }
    static public function ctrActualizarVenta($datos_venta)
    {

        $respuesta =  ModelNotas::mdlActualizarVenta($datos_venta);

        return $respuesta;
    }
    static public function ctrGuardarProductoVenta($productos_venta)
    {

        $respuesta =  ModelNotas::mdlGuardarProductoVenta($productos_venta);

        return $respuesta;
    }

    static public function ctrListarVentas($url)
    {

        $respuesta =  ModelNotas::mdlListarVentas($url);

        return $respuesta;
    }
    static public function ctrCancelarVenta($id_venta)
    {

        $respuesta =  ModelNotas::mdlCancelarVenta($id_venta);

        return $respuesta;
    }
    static public function ctrDetalleVenta($url)
    {

        $respuesta =  ModelNotas::mdlDetalleVenta($url);

        return $respuesta;
    }
    static public function ctrDetalleEmpresa()
    {

        $respuesta =  ModelNotas::mdlDetalleEmpresa();

        return $respuesta;
    }
    static public function ctrDetalleProductosVenta($codigo)
    {

        $respuesta =  ModelNotas::mdlDetalleProductosVenta($codigo);

        return $respuesta;
    }
    static public function ctrObtenerStockActual($id_producto)
    {

        $respuesta =  ModelNotas::mdlObtenerStockActual($id_producto);

        return $respuesta;
    }
    static public function ctrConsultarSesionDisponible()
    {

        $respuesta =  ModelNotas::mdlConsultarSesionDisponible();

        return $respuesta;
    }
    static public function ctrGenerarPago($datos_pago)
    {

        $respuesta =  ModelNotas::mdlGenerarPago($datos_pago);

        return $respuesta;
    }
    static public function ctrActualizarSesion($datos_sesion, $campo_nombre)
    {

        $respuesta =  ModelNotas::mdlActualizarSesion($datos_sesion, $campo_nombre);

        return $respuesta;
    }
    static public function ctrGuardarMovimientoCaja($datos_movimiento_caja)
    {

        $respuesta =  ModelNotas::mdlGuardarMovimientoCaja($datos_movimiento_caja);

        return $respuesta;
    }
    static public function ctrActualizarInventarioProducto($datos_inventario)
    {

        $respuesta =  ModelNotas::mdlActualizarInventarioProducto($datos_inventario);

        return $respuesta;
    }
    static public function ctrGenerarMovimientoInventario($datos_movimiento_inventario)
    {

        $respuesta =  ModelNotas::mdlGenerarMovimientoInventario($datos_movimiento_inventario);

        return $respuesta;
    }
}
