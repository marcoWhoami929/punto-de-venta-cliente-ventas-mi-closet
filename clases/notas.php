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
        $campoOrden =  $search["campoOrden"];
        $orden = $search['orden'];

        if ($search["busqueda"] != "") {

            $sWhere = "WHERE titulo_nota LIKE '%" . $search['busqueda'] . "%' OR codigo LIKE '%" . $search['busqueda'] . "%'";
        } else {
            $sWhere = "";
        }


        $sql = "SELECT * FROM notas $sWhere order by $campoOrden $orden LIMIT $per_page OFFSET $offset";

        $query = ConexionsBd::conectar()->prepare($sql);


        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT  * FROM notas $sWhere";

        $nums_row = $this->countAll($sql1);

        //Set counter
        $this->setCounter($nums_row);
        return $query;
    }
    public function getListaNotasAdquiridas($search)
    {
        $offset = $search['offset'];
        $per_page = $search['per_page'];
        $campoOrden =  $search["campoOrden"];
        $orden = $search['orden'];
        $id_cliente = $search['id_cliente'];


        $sWhere = "vent.id_cliente = '" . $id_cliente . "' ";
        if ($search["busqueda"] != "") {

            $sWhere .= "and vent.codigo LIKE '%" . $search['busqueda'] . "%' OR vent.codigo_nota LIKE '%" . $search['busqueda'] . "%'";
        }
        if ($search["visualizar"] != "") {
            if ($search["visualizar"] == "porPagar") {
                $sWhere .= "and vent.estatus_pago = 0 and vent.estatus = 1";
            }
            if ($search["visualizar"] == "pagadas") {
                $sWhere .= "and vent.estatus_pago = 1";
            }
            if ($search["visualizar"] == "canceladas") {
                $sWhere .= "and vent.estatus = 0";
            }
        }

        $sql = "SELECT met.metodo,vent.* FROM venta as vent INNER JOIN metodopago as met ON vent.forma_pago = met.id_metodo_pago WHERE  $sWhere order by $campoOrden $orden LIMIT $per_page OFFSET $offset";

        $query = ConexionsBd::conectar()->prepare($sql);


        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT met.metodo,vent.* FROM venta as vent INNER JOIN metodopago as met ON vent.forma_pago = met.id_metodo_pago WHERE  $sWhere";

        $nums_row = $this->countAll($sql1);

        //Set counter
        $this->setCounter($nums_row);
        return $query;
    }
    public function getDetalleNota($search)
    {
        $codigo = $search['codigoNota'];

        $sql = "SELECT prod.*,notas.porc_descuento FROM productos_notas as prod INNER JOIN notas on prod.codigo_nota = notas.codigo WHERE prod.codigo_nota = '$codigo'";

        $query = ConexionsBd::conectar()->prepare($sql);

        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT prod.*,notas.porc_descuento FROM productos_notas as prod INNER JOIN notas on prod.codigo_nota = notas.codigo WHERE prod.codigo_nota = '$codigo'";

        $nums_row = $this->countAll($sql1);

        //Set counter
        $this->setCounter($nums_row);
        return $query;
    }
    public function getDetalleVenta($search)
    {
        $codigo = $search['codigoVenta'];

        $sql = "SELECT * FROM venta_detalle as vent WHERE vent.codigo = '$codigo'";

        $query = ConexionsBd::conectar()->prepare($sql);

        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT * FROM venta_detalle as vent WHERE vent.codigo = '$codigo'";

        $nums_row = $this->countAll($sql1);

        //Set counter
        $this->setCounter($nums_row);
        return $query;
    }
    public function getListaEstatusNotas($search)
    {
        $offset = $search['offset'];
        $per_page = $search['per_page'];
        $campoOrden =  $search["campoOrden"];
        $orden = $search['orden'];
        $sWhere = "estatus != 0 ";
        if ($search["busqueda"] != "") {

            $sWhere .= "AND codigo_nota LIKE '%" . $search['busqueda'] . "%' OR codigo LIKE '%" . $search['busqueda'] . "%'";
        }


        $sql = "SELECT * FROM venta WHERE $sWhere order by $campoOrden $orden LIMIT $per_page OFFSET $offset";


        $query = ConexionsBd::conectar()->prepare($sql);


        $query->execute();

        $query = $query->fetchAll();

        $sql1 = "SELECT  * FROM venta WHERE $sWhere";

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
