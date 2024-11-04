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
}
