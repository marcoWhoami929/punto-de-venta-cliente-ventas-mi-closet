<?php
error_reporting(E_ALL);
$code = (isset($_GET['code'])) ? $_GET['code'] : 0;

/*---------- Incluyendo configuraciones ----------*/
require_once "../config/app.php";
require_once "../controllers/notas.controller.php";
require_once "../models/notas.model.php";

/*---------- Instancia al controlador venta ----------*/


$ins_venta = new ControllerNotas();

$datos_venta = $ins_venta->ctrDetalleVenta($_GET["code"]);

if (count($datos_venta) == 1) {


    /*---------- Seleccion de datos de la empresa ----------*/
    $datos_empresa = $ins_venta->ctrDetalleEmpresa();


    require "./code128.php";

    $pdf = new PDF_Code128('P', 'mm', array(80, 258));
    $pdf->SetMargins(4, 10, 4);
    $pdf->AddPage();

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", strtoupper($datos_empresa['empresa_nombre'])), 0, 'C', false);
    $pdf->SetFont('Arial', '', 9);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", $datos_empresa['empresa_direccion']), 0, 'C', false);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Teléfono: " . $datos_empresa['empresa_telefono']), 0, 'C', false);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Email: " . $datos_empresa['empresa_email']), 0, 'C', false);

    $pdf->Ln(1);
    $pdf->Cell(0, 5, iconv("UTF-8", "ISO-8859-1", "------------------------------------------------------"), 0, 0, 'C');
    $pdf->Ln(5);

    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Fecha: " . date("d/m/Y", strtotime($datos_venta[0]['fecha_venta'])) . " " . $datos_venta[0]['hora_venta']), 0, 'C', false);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Caja Nro: " . $datos_venta[0]['numero']), 0, 'C', false);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Vendedor: " . $datos_venta[0]['nombreCajero']), 0, 'C', false);
    $pdf->SetFont('Arial', 'B', 10);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", strtoupper("Ticket Nro: " . $datos_venta[0]['id_venta'])), 0, 'C', false);
    $pdf->SetFont('Arial', '', 9);

    $pdf->Ln(1);
    $pdf->Cell(0, 5, iconv("UTF-8", "ISO-8859-1", "------------------------------------------------------"), 0, 0, 'C');
    $pdf->Ln(5);

    if ($datos_venta[0]['id_cliente'] == 1) {
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Cliente: N/A"), 0, 'C', false);
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Teléfono: N/A"), 0, 'C', false);
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Dirección: N/A"), 0, 'C', false);
    } else {
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Cliente: " . $datos_venta[0]['nombreCliente'] . " " . $datos_venta[0]['apellidos']), 0, 'C', false);
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Celular: " . $datos_venta[0]['celular']), 0, 'C', false);
        $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "Dirección: " .  $datos_venta[0]['domicilio']), 0, 'C', false);
    }

    $pdf->Ln(1);
    $pdf->Cell(0, 5, iconv("UTF-8", "ISO-8859-1", "-------------------------------------------------------------------"), 0, 0, 'C');
    $pdf->Ln(3);

    $pdf->Cell(18, 5, iconv("UTF-8", "ISO-8859-1", "Cant."), 0, 0, 'C');
    $pdf->Cell(22, 5, iconv("UTF-8", "ISO-8859-1", "Precio"), 0, 0, 'C');
    $pdf->Cell(32, 5, iconv("UTF-8", "ISO-8859-1", "Total"), 0, 0, 'C');

    $pdf->Ln(3);
    $pdf->Cell(72, 5, iconv("UTF-8", "ISO-8859-1", "-------------------------------------------------------------------"), 0, 0, 'C');
    $pdf->Ln(3);

    /*----------  Seleccionando detalles de la venta  ----------*/
    $venta_detalle = $ins_venta->ctrDetalleProductosVenta($datos_venta[0]['codigo']);
    foreach ($venta_detalle as $detalle) {
        $pdf->MultiCell(0, 4, iconv("UTF-8", "ISO-8859-1", $detalle['descripcion']), 0, 'C', false);
        $pdf->Cell(18, 4, iconv("UTF-8", "ISO-8859-1", $detalle['cantidad']), 0, 0, 'C');
        $pdf->Cell(22, 4, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($detalle['precio_venta'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR)), 0, 0, 'C');
        $pdf->Cell(32, 4, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($detalle['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR)), 0, 0, 'C');
        $pdf->Ln(4);
        $pdf->Cell(33, 4, iconv("UTF-8", "ISO-8859-1", "Color:" . $detalle['color']), 0, 0, 'C');
        $pdf->Cell(33, 4, iconv("UTF-8", "ISO-8859-1", "Talla:" . $detalle['talla']), 0, 0, 'C');
        $pdf->Ln(3);
    }

    $pdf->Cell(72, 5, iconv("UTF-8", "ISO-8859-1", "-------------------------------------------------------------------"), 0, 0, 'C');

    $pdf->Ln(5);

    $pdf->Cell(18, 5, iconv("UTF-8", "ISO-8859-1", ""), 0, 0, 'C');
    $pdf->Cell(22, 5, iconv("UTF-8", "ISO-8859-1", "TOTAL A PAGAR"), 0, 0, 'C');
    $pdf->Cell(32, 5, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_venta[0]['total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), 0, 0, 'C');

    $pdf->Ln(5);

    $pdf->Cell(18, 5, iconv("UTF-8", "ISO-8859-1", ""), 0, 0, 'C');
    $pdf->Cell(22, 5, iconv("UTF-8", "ISO-8859-1", "TOTAL PAGADO"), 0, 0, 'C');
    $pdf->Cell(32, 5, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_venta[0]['pagado'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), 0, 0, 'C');

    $pdf->Ln(5);

    $pdf->Cell(18, 5, iconv("UTF-8", "ISO-8859-1", ""), 0, 0, 'C');
    $pdf->Cell(22, 5, iconv("UTF-8", "ISO-8859-1", "TOTAL PENDIENTE"), 0, 0, 'C');
    $pdf->Cell(32, 5, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_venta[0]['pendiente'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), 0, 0, 'C');

    $pdf->Ln(10);

    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", "*** Precios de productos incluyen impuestos. Para poder realizar un reclamo o devolución debe de presentar este ticket ***"), 0, 'C', false);

    $pdf->SetFont('Arial', 'B', 9);
    $pdf->Cell(0, 7, iconv("UTF-8", "ISO-8859-1", "Gracias por su compra"), '', 0, 'C');

    $pdf->Ln(9);

    $pdf->Code128(5, $pdf->GetY(), $datos_venta[0]['codigo'], 70, 20);
    $pdf->SetXY(0, $pdf->GetY() + 21);
    $pdf->SetFont('Arial', '', 14);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", $datos_venta[0]['codigo']), 0, 'C', false);

    $pdf->Output("I", "Ticket_Nro" . $datos_venta[0]['id_venta'] . ".pdf", true);
} else {
?>
    
<?php } ?>