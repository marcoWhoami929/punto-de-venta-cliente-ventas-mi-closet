<?php

class ControllerNotas
{

    static public function ctrListarNotas($url)
    {

        $respuesta =  ModelNotas::mdlListarNotas($url);

        return $respuesta;
    }
    static public function ctrListarFormasPago()
    {

        $respuesta =  ModelNotas::mdlListarFormasPago();

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
}
