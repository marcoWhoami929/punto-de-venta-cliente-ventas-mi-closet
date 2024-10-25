<?php
error_reporting(0);
include("../models/conexion.php");
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
        $query = ConexionsBd::conectar()->prepare($sql);
        $query->execute();
        $query = $query->fetchAll();
        return count($query);
    }

    public function getListaNotas($search)
    {
        $offset = $search['offset'];
        $per_page = $search['per_page'];

        if ($search["busqueda"] != "") {

            $sWhere = "WHERE titulo_nota LIKE '%" . $search['busqueda'] . "%' OR codigo LIKE '%" . $search['busqueda'] . "%'";
        } else {
            $sWhere = "";
        }


        $sql = "SELECT * FROM notas $sWhere LIMIT $per_page OFFSET $offset";

        $query = ConexionsBd::conectar()->prepare($sql);


        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT  * FROM notas";

        $nums_row = $this->countAll($sql1);

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
