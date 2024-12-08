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
    static public function ctrGenerarVenta($datos_venta)
    {

        $respuesta =  ModelNotas::mdlGenerarVenta($datos_venta);

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
}
