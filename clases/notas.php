<?php
include("../models/db_conexion.php");
class notas extends ConexionsBd
{
    public $mysqli;
    public $counter; //Propiedad para almacenar el numero de registro devueltos por la consulta

    function __construct()
    {
        $this->mysqli = $this->conectar();
    }

    public function countAll($sql)
    {
        $query = $this->mysqli->query($sql);
        $query = $query->fetchAll();
        return count($query);
    }
    public function countAllBitacora($sql)
    {
        $query = ConexionsBd::conectar()->prepare($sql);
        $query->execute();
        $query = $query->fetchAll();
        return count($query);
    }

    public function getDetalleBoxLayot($search)
    {
        $offset = $search['offset'];
        $per_page = $search['per_page'];


        $sql = "SELECT CONCAT(fila,'-', marca,'-',seccion) as 'ubicacion',modelo,paleta,noModelo,color,codigo FROM `colorbox` LIMIT $per_page OFFSET $offset";

        $query = ConexionsBd::conectar()->prepare($sql);

        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT  CONCAT(fila,'-', marca,'-',seccion) as 'ubicacion',modelo,paleta,noModelo,color,codigo FROM  colorbox ";

        $nums_row = $this->countAllBitacora($sql1);

        //Set counter
        $this->setCounter($nums_row);
        return $query;
    }
    function setCounter($counter)
    {
        $this->counter = $counter;
    }
    function getCounter()
    {
        return $this->counter;
    }
}
