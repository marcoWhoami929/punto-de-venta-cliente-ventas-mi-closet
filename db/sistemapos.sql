-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 01:18:10
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemapos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `accion` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora`, `accion`, `id_usuario`, `fecha`) VALUES
(1, 'Cierre de Caja Con N° de Sesion POS-K8V6N6B2C6-1', 1, '2024-11-28 18:53:03'),
(2, 'Ingreso de Efectivo a Caja en la Sesion N° de Sesion POS-K7E3Y3O5E4-2', 1, '2024-11-28 20:23:09'),
(3, 'Salida de Efectivo de Caja en la Sesion N° de Sesion POS-K7E3Y3O5E4-2', 1, '2024-11-28 20:23:37'),
(4, 'Entrada de Inventario de 2 unidades de Pantalon Mezclilla', 1, '2024-11-29 18:47:20'),
(5, 'Entrada de Inventario de 3 unidades de Sueter Mio Mio', 1, '2024-11-29 18:48:02'),
(6, 'Salida de Inventario de 2 unidades de Vestido Largo Moda', 1, '2024-11-29 18:48:17'),
(7, 'Entrada de Inventario de 1 unidades de Sueter Mio Mio', 1, '2024-11-29 22:35:07'),
(8, 'Cierre de Caja Con N° de Sesion POS-K7E3Y3O5E4-2', 1, '2024-12-02 15:44:26'),
(9, 'Ingreso de Efectivo a Caja en la Sesion N° POS-J1Z9X3F4E5-4', 1, '2024-12-02 15:46:30'),
(10, 'Cierre de Caja Con N° de Sesion POS-J1Z9X3F4E5-4', 1, '2024-12-02 15:47:41'),
(11, 'Cierre de Caja Con N° de Sesion POS-J1Z9X3F4E5-4', 1, '2024-12-02 15:47:57'),
(12, 'Cierre de Caja Con N° de Sesion POS-C5G6S4U4Q0-5', 1, '2024-12-02 17:07:24'),
(13, 'Entrada de Inventario de 1 unidades de Sueter Mio Mio', 1, '2024-12-03 19:38:35'),
(14, 'Salida de Inventario de 8 unidades de Sueter Mio Mio', 1, '2024-12-03 22:25:55'),
(15, 'Salida de Inventario de 3 unidades de Sueter Mio Mio', 1, '2024-12-03 22:26:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `numero` int(10) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `numero`, `nombre`) VALUES
(1, 1, 'Caja Principal'),
(2, 2, 'Caja Piso 1'),
(4, 3, 'Caja Piso 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajaempleado`
--

CREATE TABLE `cajaempleado` (
  `id_caja_empleado` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ubicacion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `ubicacion`, `descripcion`, `fecha_registro`) VALUES
(1, 'Sueteres', 'Planta Alta', '', '2024-11-21 17:17:23'),
(2, 'Pantalones', 'Planta Alta', '', '2024-11-21 17:17:33'),
(3, 'Joggers', 'Planta Baja', '', '2024-11-21 17:17:44'),
(4, 'Vestidos', 'Planta Baja', '', '2024-11-21 17:51:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `tipo_cliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `domicilio` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `calle` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numero` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cp` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pais` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `facebook` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `credito` decimal(30,3) NOT NULL,
  `pagado` decimal(30,3) NOT NULL,
  `pendiente` decimal(30,3) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_cliente`, `nombre`, `apellidos`, `usuario`, `email`, `password`, `telefono`, `celular`, `domicilio`, `calle`, `numero`, `ciudad`, `estado`, `cp`, `pais`, `facebook`, `credito`, `pagado`, `pendiente`, `fecha_registro`, `estatus`) VALUES
(1, 'General', 'Publico', 'General', 'PublicoGeneral', '', '$2y$10$L1GE2DSXHLGz5HprNIWKpeZPklQwphKRFcGL2ljziQQFPZSYtB.1W', '', '22222222', 'Dalias 6124', '', '', '', '', '', '', '', '0.000', '0.000', '0.000', '2024-10-17 05:38:01', 0),
(7, 'Facebook', 'Marco Antonio', 'Lopez Perez', 'MALP-WEOC9YBH', '', 'ZnBiTUQzL3JoS090cnoyc0pUemdOQT09', '', '2211636228', 'Dalias 6124, Bugambilias, Heroica Puebla de Zaragoza, Pue., México', 'Dalias', '6124', 'Heroica Puebla de Zaragoza', 'Puebla', '72580', 'México', 'marcWhoami', '0.000', '0.000', '0.000', '2024-10-15 05:08:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_caja`
--

CREATE TABLE `corte_caja` (
  `id_corte` int(11) NOT NULL,
  `codigo_sesion` text NOT NULL,
  `id_caja` int(11) NOT NULL,
  `dn1` decimal(30,2) NOT NULL,
  `dn2` decimal(30,2) NOT NULL,
  `dn3` decimal(30,2) NOT NULL,
  `dn4` decimal(30,2) NOT NULL,
  `dn5` decimal(30,2) NOT NULL,
  `dn6` decimal(30,2) NOT NULL,
  `dn7` decimal(30,2) NOT NULL,
  `dn8` decimal(30,2) NOT NULL,
  `dn9` decimal(30,2) NOT NULL,
  `dn10` decimal(30,2) NOT NULL,
  `dn11` decimal(30,2) NOT NULL,
  `dn12` decimal(30,2) NOT NULL,
  `dn13` decimal(30,2) NOT NULL,
  `dn14` decimal(30,2) NOT NULL,
  `total_caja` decimal(30,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `corte_caja`
--

INSERT INTO `corte_caja` (`id_corte`, `codigo_sesion`, `id_caja`, `dn1`, `dn2`, `dn3`, `dn4`, `dn5`, `dn6`, `dn7`, `dn8`, `dn9`, `dn10`, `dn11`, `dn12`, `dn13`, `dn14`, `total_caja`, `fecha`) VALUES
(1, 'POS-K7E3Y3O5E4-2', 1, '0.00', '500.00', '200.00', '0.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '800.00', '2024-12-02 15:44:26'),
(2, 'POS-J1Z9X3F4E5-4', 1, '0.00', '0.00', '0.00', '800.00', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '2024-12-02 15:47:41'),
(3, 'POS-J1Z9X3F4E5-4', 1, '0.00', '0.00', '0.00', '800.00', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '2024-12-02 15:47:57'),
(4, 'POS-C5G6S4U4Q0-5', 1, '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '2024-12-02 17:07:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id_detalle_venta` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) NOT NULL,
  `empresa_telefono` varchar(20) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(1, 'Ventas Mi Closet', '2224265678', 'atencion@ventasmicloset.com.mx', 'Av. 2 de Abril 443, Tetela, 73780 Cdad. de Libres, Pue.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `stock_total` decimal(10,3) NOT NULL,
  `stock_minimo` decimal(10,3) NOT NULL,
  `stock_maximo` decimal(10,3) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_producto`, `stock_total`, `stock_minimo`, `stock_maximo`, `fecha_actualizacion`) VALUES
(1, 1, '0.000', '1.000', '20.000', '2024-12-03 22:26:41'),
(2, 2, '18.000', '1.000', '20.000', '2024-12-03 22:24:58'),
(5, 3, '20.000', '1.000', '20.000', '2024-12-03 22:25:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `id_metodo_pago` int(11) NOT NULL,
  `metodo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`id_metodo_pago`, `metodo`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia Electrónica'),
(3, 'Tarjeta de Crédito'),
(4, 'Tarjeta de Débito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_caja`
--

CREATE TABLE `movimiento_caja` (
  `id_movimiento` int(11) NOT NULL,
  `sesion_caja` text NOT NULL,
  `id_caja` int(11) NOT NULL,
  `tipo_movimiento` enum('ingreso','egreso') NOT NULL,
  `monto` decimal(10,3) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento_caja`
--

INSERT INTO `movimiento_caja` (`id_movimiento`, `sesion_caja`, `id_caja`, `tipo_movimiento`, `monto`, `descripcion`, `fecha_movimiento`) VALUES
(1, 'POS-K8V6N6B2C6-1', 1, 'ingreso', '680.000', 'PAY-U76BMA8AVLFRLIQU4HOHEG-4', '2024-11-27 17:25:36'),
(2, 'POS-K8V6N6B2C6-1', 1, 'ingreso', '400.000', 'PAY-DJCVSYXT6ZJADCQRB3F0GU-2', '2024-11-27 18:12:39'),
(3, 'POS-K8V6N6B2C6-1', 1, 'ingreso', '20.000', 'ENTRADA', '2024-11-27 18:32:30'),
(5, 'POS-K8V6N6B2C6-1', 1, 'ingreso', '250.000', 'PAY-ZZ4VAEGNFOXSSRL9IL2JTH-3', '2024-11-28 18:22:01'),
(6, 'POS-K7E3Y3O5E4-2', 1, 'ingreso', '350.000', 'PAY-1LKTZPWJKVQ37GCCUOXB9N-4', '2024-11-28 18:56:40'),
(7, 'POS-K7E3Y3O5E4-2', 1, 'ingreso', '500.000', 'ENTRADA', '2024-11-28 20:23:09'),
(8, 'POS-K7E3Y3O5E4-2', 1, 'egreso', '150.000', 'SALIDA', '2024-11-28 20:23:37'),
(9, 'POS-J1Z9X3F4E5-4', 1, 'ingreso', '350.000', 'PAY-QRMVTCBS6I9NUDZJAO2XWH-5', '2024-12-02 15:46:16'),
(10, 'POS-J1Z9X3F4E5-4', 1, 'ingreso', '500.000', 'ENTRADA', '2024-12-02 15:46:30'),
(11, 'POS-F8B2R9Z6V9-6', 1, 'ingreso', '500.000', 'PAY-LE74VBHO0WCAIKQL9W3GJX-6', '2024-12-02 17:09:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `id_movimiento_inventario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `documento` text DEFAULT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento_inventario`
--

INSERT INTO `movimiento_inventario` (`id_movimiento_inventario`, `id_producto`, `tipo_movimiento`, `documento`, `cantidad`, `descripcion`, `fecha_movimiento`) VALUES
(1, 1, 'entrada', NULL, '10.000', NULL, '2024-11-27 04:11:12'),
(2, 2, 'entrada', NULL, '5.000', NULL, '2024-11-27 04:11:12'),
(3, 3, 'entrada', NULL, '5.000', NULL, '2024-11-27 04:11:12'),
(12, 1, 'salida', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', '1.000', 'Venta de producto', '2024-11-27 17:25:36'),
(13, 2, 'salida', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', '1.000', 'Venta de producto', '2024-11-27 17:25:36'),
(14, 3, 'salida', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', '1.000', 'Venta de producto', '2024-11-27 17:25:36'),
(15, 3, 'salida', 'SALE-J8P4K3F0Z2F9T8X0B2Z4A8-2', '2.000', 'Venta de producto', '2024-11-27 18:12:39'),
(16, 2, 'salida', 'SALE-E0A5V8G8F6W2J6F4C1B5Q1-3', '1.000', 'Venta de producto', '2024-11-28 18:22:01'),
(17, 1, 'salida', 'SALE-S0P0U3V8Y2V5U3D5K4P8E3-4', '1.000', 'Venta de producto', '2024-11-28 18:56:40'),
(18, 2, 'entrada', NULL, '20.000', 'Entrada de producto', '2024-11-29 18:06:54'),
(19, 2, 'salida', NULL, '5.000', 'unidades sacadas por error de conteo', '2024-11-29 18:21:38'),
(20, 3, 'entrada', NULL, '20.000', '', '2024-11-29 18:22:55'),
(21, 1, 'salida', NULL, '1.000', 'error de conteo de inventario', '2024-11-29 18:30:07'),
(22, 2, 'entrada', NULL, '2.000', '', '2024-11-29 18:47:20'),
(23, 1, 'entrada', NULL, '3.000', '', '2024-11-29 18:48:02'),
(24, 3, 'salida', NULL, '2.000', '', '2024-11-29 18:48:17'),
(25, 1, 'entrada', NULL, '1.000', '', '2024-11-29 22:35:07'),
(26, 1, 'salida', 'SALE-P7C5N2M9O4I7A2Z8V6S5Q9-5', '1.000', 'Venta de producto', '2024-12-02 15:46:16'),
(27, 2, 'salida', 'SALE-T9V6I6V3K0E1X5O6E4U2O0-6', '2.000', 'Venta de producto', '2024-12-02 17:09:48'),
(28, 1, 'entrada', NULL, '1.000', '', '2024-12-03 19:38:35'),
(29, 1, 'salida', NULL, '8.000', 'SALIDA POR INVENTARIO', '2024-12-03 22:25:55'),
(30, 1, 'salida', NULL, '3.000', 'AJUSTE DE INVENTARIO', '2024-12-03 22:26:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `codigo` text NOT NULL,
  `titulo_nota` text NOT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `fecha_expiracion` datetime DEFAULT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `qr` text NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_nota`, `codigo`, `titulo_nota`, `fecha_publicacion`, `fecha_expiracion`, `porc_descuento`, `qr`, `estatus`, `fecha`) VALUES
(1, 'NOT-HBB0V5QR3XU6ZJD8YRAYJQ', 'Black Friday', '2024-11-28 14:00:00', '2024-11-29 12:00:00', '10.00', 'http://localhost/pos2/detalleNota/NOT-HBB0V5QR3XU6ZJD8YRAYJQ', 1, '2024-11-28 20:26:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `codigo_pago` text NOT NULL,
  `codigo_venta` text NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `total_pago` decimal(30,2) NOT NULL,
  `total_pagado` decimal(30,2) NOT NULL,
  `total_cambio` decimal(30,2) NOT NULL,
  `referencia` text DEFAULT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `codigo_pago`, `codigo_venta`, `id_metodo_pago`, `total_pago`, `total_pagado`, `total_cambio`, `referencia`, `fecha_pago`) VALUES
(4, 'PAY-U76BMA8AVLFRLIQU4HOHEG-4', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', 2, '680.00', '700.00', '20.00', 'ALDKSMDJNENCJ', '2024-11-27 17:25:36'),
(5, 'PAY-DJCVSYXT6ZJADCQRB3F0GU-2', 'SALE-J8P4K3F0Z2F9T8X0B2Z4A8-2', 2, '400.00', '400.00', '0.00', 'ALDKSMDJNENCJ', '2024-11-27 18:12:39'),
(6, 'PAY-ZZ4VAEGNFOXSSRL9IL2JTH-3', 'SALE-E0A5V8G8F6W2J6F4C1B5Q1-3', 1, '250.00', '500.00', '250.00', '', '2024-11-28 18:22:01'),
(7, 'PAY-1LKTZPWJKVQ37GCCUOXB9N-4', 'SALE-S0P0U3V8Y2V5U3D5K4P8E3-4', 1, '350.00', '500.00', '150.00', '', '2024-11-28 18:56:40'),
(8, 'PAY-QRMVTCBS6I9NUDZJAO2XWH-5', 'SALE-P7C5N2M9O4I7A2Z8V6S5Q9-5', 1, '350.00', '500.00', '150.00', '', '2024-12-02 15:46:16'),
(9, 'PAY-LE74VBHO0WCAIKQL9W3GJX-6', 'SALE-T9V6I6V3K0E1X5O6E4U2O0-6', 1, '500.00', '500.00', '0.00', '', '2024-12-02 17:09:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(20) NOT NULL,
  `cid_producto` int(20) NOT NULL,
  `out_stock` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `codigo` varchar(77) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_unidad` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `marca` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `colores` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tallas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `foto` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ceacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `cid_producto`, `out_stock`, `id_categoria`, `id_proveedor`, `codigo`, `nombre`, `descripcion`, `tipo_unidad`, `precio_compra`, `precio_venta`, `marca`, `modelo`, `colores`, `tallas`, `estado`, `foto`, `fecha_ceacion`, `fecha_actualizacion`) VALUES
(1, 1, '0', 1, 0, '00123456789', 'Sueter Mio Mio', '', 'Pieza', '250.00', '350.00', '', '', 'Azul,Gris,Verde', '32,38,40', 1, '', '2024-11-21 17:23:00', '2024-11-21 17:23:00'),
(2, 2, '0', 2, 0, '00023456789', 'Pantalon Mezclilla', '', 'Pieza', '150.00', '250.00', '', '', '', '', 1, '00023456789_61.jpg', '2024-11-21 17:24:38', '2024-12-03 19:50:56'),
(5, 3, '0', 4, 0, '100123456789', 'Vestido Largo Moda', '', 'Pieza', '150.00', '200.00', '', '', '', '', 1, '', '2024-11-21 18:35:58', '2024-12-03 19:50:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_notas`
--

CREATE TABLE `productos_notas` (
  `id_detalle_nota` int(11) NOT NULL,
  `codigo_nota` text NOT NULL,
  `id_producto` int(11) NOT NULL,
  `codigo` text NOT NULL,
  `descripcion` text NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `limite_nota` int(11) NOT NULL,
  `colores` text NOT NULL,
  `tallas` text NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos_notas`
--

INSERT INTO `productos_notas` (`id_detalle_nota`, `codigo_nota`, `id_producto`, `codigo`, `descripcion`, `precio_venta`, `limite_nota`, `colores`, `tallas`, `estatus`, `fecha`) VALUES
(1, 'NOT-HBB0V5QR3XU6ZJD8YRAYJQ', 2, '00023456789', 'Pantalon Mezclilla', '250.00', 3, '', '', 1, '2024-11-28 20:26:33'),
(2, 'NOT-HBB0V5QR3XU6ZJD8YRAYJQ', 1, '00123456789', 'Sueter Mio Mio', '350.00', 8, 'Azul,Gris,Verde', '32,38,40', 1, '2024-11-28 20:26:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(20) NOT NULL,
  `nombre` text NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` text NOT NULL,
  `direccion` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_caja`
--

CREATE TABLE `sesiones_caja` (
  `id_sesion` int(11) NOT NULL,
  `codigo_sesion` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `notas_apertura` text NOT NULL,
  `fecha_apertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `saldo_inicial` decimal(30,2) NOT NULL,
  `efectivo` decimal(30,2) NOT NULL,
  `tarjeta_debito` decimal(30,2) NOT NULL,
  `tarjeta_credito` decimal(30,2) NOT NULL,
  `transferencia` decimal(30,2) NOT NULL,
  `saldo_final` decimal(30,2) NOT NULL,
  `diferencia` decimal(30,2) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` enum('abierta','cerrada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesiones_caja`
--

INSERT INTO `sesiones_caja` (`id_sesion`, `codigo_sesion`, `id_usuario`, `id_caja`, `notas_apertura`, `fecha_apertura`, `saldo_inicial`, `efectivo`, `tarjeta_debito`, `tarjeta_credito`, `transferencia`, `saldo_final`, `diferencia`, `observaciones`, `fecha_cierre`, `estado`) VALUES
(1, 'POS-K8V6N6B2C6-1', 1, 1, 'apertura inicial', '2024-11-27 01:54:53', '0.00', '930.00', '0.00', '0.00', '400.00', '1000.00', '50.00', 'prueba de cierre', '2024-11-28 12:53:03', 'cerrada'),
(2, 'POS-K7E3Y3O5E4-2', 1, 1, 'apertura con 50 por sobrante de caja', '2024-11-28 18:56:30', '50.00', '350.00', '0.00', '0.00', '0.00', '800.00', '50.00', '', '2024-12-02 09:44:25', 'cerrada'),
(3, 'POS-H3R5U9M8W0-3', 3, 2, '', '2024-11-29 23:30:56', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 'abierta'),
(4, 'POS-J1Z9X3F4E5-4', 1, 1, '', '2024-12-02 15:45:59', '100.00', '350.00', '0.00', '0.00', '0.00', '1000.00', '50.00', '', '2024-12-02 09:47:57', 'cerrada'),
(5, 'POS-C5G6S4U4Q0-5', 1, 1, '', '2024-12-02 15:48:44', '1000.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '0.00', '', '2024-12-02 11:07:24', 'cerrada'),
(6, 'POS-F8B2R9Z6V9-6', 1, 1, 'apertura de caja', '2024-12-02 17:08:41', '500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 'abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_caja` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_sesion` text DEFAULT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `password`, `foto`, `perfil`, `id_caja`, `fecha_alta`, `codigo_sesion`, `estatus`) VALUES
(1, 'Administrador', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 'Administrador', 1, '2024-12-03 03:28:58', 'POS-F8B2R9Z6V9-6', 1),
(2, 'Cajero 2', '', 'cajero2', '$2y$10$9zt9trw18J9i8I5NDYVTPOhyLEZ95l./tnhVC/kbcR9/FarK2Poni', 'Marco_Antonio_Lopez_Perez_18.png', 'Caja', 4, '2024-12-03 03:39:36', NULL, 1),
(3, 'Cajero 1', '', 'cajero1', '$2y$10$skfgnFM/v//X9b1QiAWAxePh2Xx/AK20jJR64MiHk0afyStaT0Kwe', '', 'Caja', 2, '2024-12-03 03:39:36', 'POS-H3R5U9M8W0-3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(30) NOT NULL,
  `tipo_venta` enum('directa','nota') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_entrega` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `forma_pago` int(11) NOT NULL,
  `codigo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo_nota` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venta` date NOT NULL,
  `hora_venta` time NOT NULL,
  `subtotal` decimal(30,2) NOT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `descuento` decimal(10,3) NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `pagado` decimal(30,2) NOT NULL,
  `cambio` decimal(30,2) NOT NULL,
  `pendiente` decimal(30,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `estatus_pago` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_pago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `tipo_venta`, `tipo_entrega`, `forma_pago`, `codigo`, `codigo_nota`, `fecha_venta`, `hora_venta`, `subtotal`, `porc_descuento`, `descuento`, `total`, `pagado`, `cambio`, `pendiente`, `id_usuario`, `id_cliente`, `id_caja`, `estatus`, `estatus_pago`, `fecha_registro`, `fecha_pago`) VALUES
(1, 'directa', 'recoleccion', 1, 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', '', '2024-11-27', '11:25:00', '800.00', '15.00', '120.000', '680.00', '700.00', '20.00', '0.00', 1, 1, 1, 1, 1, '2024-11-27 17:25:36', NULL),
(2, 'directa', 'recoleccion', 2, 'SALE-J8P4K3F0Z2F9T8X0B2Z4A8-2', '', '2024-11-27', '12:12:00', '400.00', '0.00', '0.000', '400.00', '400.00', '0.00', '0.00', 1, 1, 1, 1, 1, '2024-11-27 18:12:39', NULL),
(3, 'directa', 'recoleccion', 1, 'SALE-E0A5V8G8F6W2J6F4C1B5Q1-3', '', '2024-11-28', '12:22:00', '250.00', '0.00', '0.000', '250.00', '500.00', '250.00', '0.00', 1, 1, 1, 2, 1, '2024-11-28 18:22:01', NULL),
(4, 'directa', 'recoleccion', 1, 'SALE-S0P0U3V8Y2V5U3D5K4P8E3-4', '', '2024-11-28', '12:56:00', '350.00', '0.00', '0.000', '350.00', '500.00', '150.00', '0.00', 1, 1, 1, 1, 1, '2024-11-28 18:56:40', NULL),
(5, 'directa', 'recoleccion', 1, 'SALE-P7C5N2M9O4I7A2Z8V6S5Q9-5', '', '2024-12-02', '09:46:00', '350.00', '0.00', '0.000', '350.00', '500.00', '150.00', '0.00', 1, 1, 1, 1, 1, '2024-12-02 15:46:16', NULL),
(6, 'directa', 'recoleccion', 1, 'SALE-T9V6I6V3K0E1X5O6E4U2O0-6', '', '2024-12-02', '11:09:00', '500.00', '0.00', '0.000', '500.00', '500.00', '0.00', '0.00', 1, 7, 1, 1, 1, '2024-12-02 17:09:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id_detalle` int(100) NOT NULL,
  `id_producto` int(20) NOT NULL,
  `token` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(10) NOT NULL,
  `color` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `talla` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `descuento` decimal(30,2) NOT NULL,
  `subtotal` decimal(30,2) NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id_detalle`, `id_producto`, `token`, `descripcion`, `codigo`, `cantidad`, `color`, `talla`, `precio_compra`, `precio_venta`, `porc_descuento`, `descuento`, `subtotal`, `total`, `fecha_movimiento`) VALUES
(1, 1, 'C3I9R1Y0', 'Sueter Mio Mio', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', 1, '', '', '250.00', '350.00', '0.00', '52.50', '350.00', '297.50', '2024-11-27 17:25:36'),
(2, 2, 'D6I5G0Z2', 'Pantalon Mezclilla', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', 1, '', '', '0.00', '250.00', '0.00', '37.50', '250.00', '212.50', '2024-11-27 17:25:36'),
(3, 3, 'X5K5S8B3', 'Vestido Largo Moda', 'SALE-X4X8O6O9Q9G8T5R7V3Z6K4-1', 1, '', '', '0.00', '200.00', '0.00', '30.00', '200.00', '170.00', '2024-11-27 17:25:36'),
(4, 3, 'W3T6U2Z4', 'Vestido Largo Moda', 'SALE-J8P4K3F0Z2F9T8X0B2Z4A8-2', 2, '', '', '0.00', '200.00', '0.00', '0.00', '400.00', '400.00', '2024-11-27 18:12:39'),
(5, 2, 'J8R4E3U9', 'Pantalon Mezclilla', 'SALE-E0A5V8G8F6W2J6F4C1B5Q1-3', 1, '', '', '0.00', '250.00', '0.00', '0.00', '250.00', '250.00', '2024-11-28 18:22:01'),
(6, 1, 'L3M8Q9B2', 'Sueter Mio Mio', 'SALE-S0P0U3V8Y2V5U3D5K4P8E3-4', 1, '', '', '250.00', '350.00', '0.00', '0.00', '350.00', '350.00', '2024-11-28 18:56:40'),
(7, 1, 'R0P5R2B9', 'Sueter Mio Mio', 'SALE-P7C5N2M9O4I7A2Z8V6S5Q9-5', 1, '', '', '250.00', '350.00', '0.00', '0.00', '350.00', '350.00', '2024-12-02 15:46:16'),
(8, 2, 'P0Y2F6X6', 'Pantalon Mezclilla', 'SALE-T9V6I6V3K0E1X5O6E4U2O0-6', 2, '', '', '0.00', '250.00', '0.00', '0.00', '500.00', '500.00', '2024-12-02 17:09:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `cajaempleado`
--
ALTER TABLE `cajaempleado`
  ADD PRIMARY KEY (`id_caja_empleado`),
  ADD KEY `id_caja` (`id_caja`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  ADD PRIMARY KEY (`id_corte`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD PRIMARY KEY (`id_movimiento_inventario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_id` (`id_categoria`);

--
-- Indices de la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  ADD PRIMARY KEY (`id_detalle_nota`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  ADD PRIMARY KEY (`id_sesion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_caja` (`id_caja`),
  ADD KEY `venta_ibfk_3` (`id_usuario`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id_detalle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cajaempleado`
--
ALTER TABLE `cajaempleado`
  MODIFY `id_caja_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  MODIFY `id_corte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  MODIFY `id_detalle_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id_detalle` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajaempleado`
--
ALTER TABLE `cajaempleado`
  ADD CONSTRAINT `cajaempleado_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`),
  ADD CONSTRAINT `cajaempleado_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  ADD CONSTRAINT `movimiento_caja_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodopago` (`id_metodo_pago`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  ADD CONSTRAINT `productos_notas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
