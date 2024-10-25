<?php


/*
	CONTROLLERS
 */
require_once "controllers/template.controller.php";
require_once "controllers/user.controller.php";
require_once "controllers/notas.controller.php";
/*
MODELS
 */
require_once "models/conexion.php";
require_once "models/user.model.php";
require_once "models/notas.model.php";



/*
OTHERS
 */
require_once "clases/notas.php";

require_once "models/rutas.php";

$plantilla = new ControladorPlantilla();
$plantilla->plantilla();
