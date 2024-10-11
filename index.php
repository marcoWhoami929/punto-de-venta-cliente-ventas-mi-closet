<?php 

/*
	CONTROLLERS
 */
require_once "controllers/template.controller.php";

/*
MODELS
 */

/*
OTHERS
 */
require_once "models/rutas.php";

$plantilla = new ControladorPlantilla();
$plantilla -> plantilla();
 ?>