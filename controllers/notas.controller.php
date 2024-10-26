<?php

class ControllerNotas
{

    static public function ctrListarNotas($url)
    {

        $respuesta =  ModelNotas::mdlListarNotas($url);

        return $respuesta;
    }

    static public function ctrDetalleNota($codigo)
    {

        $respuesta =  ModelNotas::mdlDetalleNota($codigo);

        return $respuesta;
    }
}
