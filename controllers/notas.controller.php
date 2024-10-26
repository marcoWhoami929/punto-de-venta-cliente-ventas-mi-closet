<?php

class ControllerNotas
{

    static public function ctrListarNotas($url)
    {

        $respuesta =  ModelNotas::mdlListarNotas($url);

        return $respuesta;
    }
}
