<?php
class ConexionsBd
{
    public $counter;

    public static function conectar()
    {

        $link =  new PDO(
            "mysql:host=localhost;dbname=sistemapos",
            "root",
            "",
            array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
            )
        );

        return $link;
    }
}
