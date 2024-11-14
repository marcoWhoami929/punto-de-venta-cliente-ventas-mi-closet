<?php
require_once "config/app.php";
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Ventas Mi Closet | Notas</title>
	<!-- plugins:css -->
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/feather/feather.css">
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/css/vendor.bundle.base.css">
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/font-awesome/css/all.min.css">
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/mdi/css/materialdesignicons.min.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<!--<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/datatables.net-bs4/dataTables.bootstrap4.css">-->
	<!--<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/datatables.net-bs5/dataTables.bootstrap5.css">-->
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="<?php echo APP_URL_CLIENT; ?>views/js/select.dataTables.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="<?php echo APP_URL_CLIENT; ?>views/css/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="<?php echo APP_URL_CLIENT; ?>views/images/logo.png" />



	<!-- Required Jquery -->
	<script type="text/javascript" src="<?php echo APP_URL_CLIENT; ?>views/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<?php echo APP_URL_CLIENT; ?>views/js/jquery-ui/jquery-ui.min.js"></script>
	<!-- Sweet Alert -->
	<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/sweet-alert/sweetalert.js"></script>
	<script type="text/javascript" src="<?php echo APP_URL_CLIENT; ?>views/js/plantilla.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="<?php echo APP_URL_CLIENT; ?>views/vendors/font-awesome/js/all.min.js"></script>


</head>

<body>
	<?php
	session_start();
	if (isset($_SESSION["validarSesionBackend"]) && $_SESSION["validarSesionBackend"] === "ok") {
		echo '<div class="container-scroller">';
		include "moduls/header.php";
		echo '<div class="container-fluid page-body-wrapper">';
		include "moduls/sidebar.php";

		if (isset($_GET["ruta"])) {


			$carpeta = "views/moduls/";
			$class = $carpeta . $_GET["ruta"] . '.php';

			if (!file_exists($class)) {
				$url2 = explode('/', $_GET["ruta"]);
				$url2 = $url2[0];

				if (isset($url2)) {

					if ($url2 == "detalleNota") {
						include "moduls/detalleNota.php";
					} else if ($url2 == "visualizarNota") {
						include "moduls/visualizarNota.php";
					}
				} else {

					include "moduls/404.php";
				}
			} else {

				include $class;
			}
		}
		echo '</div>';
	} else {

		if (isset($_GET["ruta"])) {

			if ($_GET["ruta"] == "registro") {
				include "moduls/registro.php";
			} else if ($_GET["ruta"] == "acceso") {
				include "moduls/acceso.php";
			} else {
				include "moduls/acceso.php";
			}
		} else {
			include "moduls/acceso.php";
		}
	}
	echo '</div>';



	?>
	<!-- plugins:js -->

	<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/js/vendor.bundle.base.js"></script>
	<!--Maps-->

	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCaZc8iFkQW_BPnkGUOt9M6ja_Zfkl427M"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/chart.js/chart.umd.js"></script>
	<!--<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>-->
	<!--<script src="<?php echo APP_URL_CLIENT; ?>views/vendors/datatables.net-bs5/dataTables.bootstrap5.js"></script>-->
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/dataTables.select.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/off-canvas.js"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/template.js"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/settings.js"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/dashboard.js"></script>
	<script src="<?php echo APP_URL_CLIENT; ?>views/js/maps.js"></script>

	<!-- End custom js for this page-->
</body>

</html>