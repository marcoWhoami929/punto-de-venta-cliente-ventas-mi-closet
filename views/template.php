<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Ventas Mi Closet | Notas</title>
	<!-- plugins:css -->
	<link rel="stylesheet" href="views/vendors/feather/feather.css">
	<link rel="stylesheet" href="views/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="views/vendors/css/vendor.bundle.base.css">
	<link rel="stylesheet" href="views/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="views/vendors/mdi/css/materialdesignicons.min.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<!-- <link rel="stylesheet" href="views/vendors/datatables.net-bs4/dataTables.bootstrap4.css"> 
	<link rel="stylesheet" href="views/vendors/datatables.net-bs5/dataTables.bootstrap5.css">-->
	<link rel="stylesheet" href="views/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="views/js/select.dataTables.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="views/css/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="views/images/logo.png" />


	<!-- Required Jquery -->
	<script type="text/javascript" src="views/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="views/js/jquery-ui/jquery-ui.min.js"></script>
	<!-- Sweet Alert -->
	<script src="views/vendors/sweet-alert/sweetalert.js"></script>
</head>

<body>
	<?php

	if (isset($_SESSION["validarSesionBackend"]) && $_SESSION["validarSesionBackend"] === "ok") {
		echo '<div class="container-scroller">';
		include "moduls/header.php";
		echo '<div class="container-fluid page-body-wrapper">';


		include "moduls/sidebar.php";

		if (isset($_GET["ruta"])) {

			$carpeta = "views/moduls/";
			$class = $carpeta . $_GET["ruta"] . '.php';

			if (!file_exists($class)) {

				include "moduls/404.php";
			} else {

				include $class;
			}
		} else {


			include "moduls/inicio.php";
		}
		echo '</div>';
	} else {
		if (isset($_GET["ruta"])) {

			if ($_GET["ruta"] == "registro") {
				include "moduls/registro.php";
			}
			if ($_GET["ruta"] == "acceso") {
				include "moduls/acceso.php";
			}
		} else {


			include "moduls/acceso.php";
		}
	}
	echo '</div>';



	?>
	<!-- plugins:js -->

	<script src="views/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="views/vendors/chart.js/chart.umd.js"></script>
	<!--<script src="views/vendors/datatables.net/jquery.dataTables.js"></script>-->
	<!-- <script src="views/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="views/vendors/datatables.net-bs5/dataTables.bootstrap5.js"></script> -->
	<script src="views/js/dataTables.select.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="views/js/off-canvas.js"></script>
	<script src="views/js/template.js"></script>
	<script src="views/js/settings.js"></script>
	<script src="views/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="views/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="views/js/dashboard.js"></script>

	<!-- End custom js for this page-->
</body>

</html>