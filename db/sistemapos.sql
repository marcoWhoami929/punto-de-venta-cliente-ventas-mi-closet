-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2024 a las 20:33:13
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
(15, 'Salida de Inventario de 3 unidades de Sueter Mio Mio', 1, '2024-12-03 22:26:41'),
(16, 'Salida de Inventario de 5 unidades de Sueter Mio Mio', 1, '2024-12-04 17:43:41'),
(17, 'Entrada de Inventario de 10 unidades de Sueter Mio Mio', 1, '2024-12-04 17:50:39'),
(18, 'Cierre de Caja Con N° de Sesion POS-F8B2R9Z6V9-6', 1, '2024-12-05 03:10:34'),
(19, 'Salida de Inventario de 2 unidades de Pantalon Mezclilla', 1, '2024-12-05 03:34:47'),
(20, 'COD12134', 1, '2024-12-11 17:24:40'),
(21, 'COD12135', 1, '2024-12-11 17:24:40'),
(22, 'COD12136', 1, '2024-12-11 17:24:40'),
(23, 'COD12137', 1, '2024-12-11 17:24:40'),
(24, 'COD12138', 1, '2024-12-11 17:24:40'),
(25, 'COD12139', 1, '2024-12-11 17:24:40'),
(26, 'COD12140', 1, '2024-12-11 17:24:40'),
(27, 'COD12141', 1, '2024-12-11 17:24:40'),
(28, 'COD12142', 1, '2024-12-11 17:24:40'),
(29, 'COD12143', 1, '2024-12-11 17:24:40'),
(30, 'COD12144', 1, '2024-12-11 17:24:41'),
(31, 'COD12145', 1, '2024-12-11 17:24:41'),
(32, 'COD12146', 1, '2024-12-11 17:24:41'),
(33, 'COD12147', 1, '2024-12-11 17:24:41'),
(34, 'COD12148', 1, '2024-12-11 17:24:41'),
(35, 'COD12149', 1, '2024-12-11 17:24:41'),
(36, 'COD12150', 1, '2024-12-11 17:24:41'),
(37, 'COD12151', 1, '2024-12-11 17:24:41'),
(38, 'Entrada de Inventario de 4 unidades de Adaptador HDMI HD 1080P a VGA', 1, '2024-12-11 18:45:36'),
(39, 'Entrada de Inventario de 4.000 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:27:29'),
(40, 'Entrada de Inventario de 4.000 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:28:11'),
(41, 'Entrada de Inventario de 10 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:35:51'),
(42, 'Entrada de Inventario de 10 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:39:41'),
(43, 'Salida de Inventario de 1 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:40:42'),
(44, 'Entrada de Inventario de 10 unidades de Adaptador HDMI HD 1080P a VGA Con Audio', 1, '2024-12-11 19:41:53'),
(45, 'Entrada de Inventario de 10 unidades de Convertidor HDMI a VGA', 1, '2024-12-11 19:41:53'),
(46, 'Entrada de Inventario de 10 unidades de Extension Electrica 20 Metros', 1, '2024-12-11 19:41:54'),
(47, 'Salida de Inventario de 1 unidades de Extension Electrica 25 Metros', 1, '2024-12-11 19:41:54');

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
(4, 'Vestidos', 'Planta Baja', '', '2024-11-21 17:51:56'),
(5, 'Accesorios', 'Planta Alta', '', '2024-12-11 00:16:43');

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
(1, 1, '17.000', '1.000', '20.000', '2024-12-10 23:28:30'),
(2, 2, '7.000', '1.000', '20.000', '2024-12-10 23:29:45'),
(5, 3, '20.000', '1.000', '20.000', '2024-12-05 03:11:17'),
(10, 4, '22.000', '1.000', '20.000', '2024-12-11 23:06:34'),
(11, 5, '14.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(12, 6, '15.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(13, 7, '7.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(14, 8, '7.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(15, 9, '5.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(16, 10, '3.000', '1.000', '20.000', '2024-12-11 23:06:35'),
(17, 11, '5.000', '1.000', '20.000', '2024-12-11 18:19:50'),
(18, 12, '4.000', '1.000', '20.000', '2024-12-11 18:19:50'),
(19, 13, '9.000', '1.000', '20.000', '2024-12-11 18:19:50'),
(20, 14, '5.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(21, 15, '4.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(22, 16, '5.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(23, 17, '4.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(24, 18, '4.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(25, 19, '4.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(26, 20, '5.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(27, 21, '4.000', '1.000', '20.000', '2024-12-11 18:19:51'),
(28, 22, '3.000', '1.000', '20.000', '2024-12-11 23:06:34');

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
(4, 'Tarjeta de Débito'),
(5, 'Credito');

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
(1, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '250.000', 'PAY-JQ9GIAIJDKNCRYHCQFTN4M-1', '2024-12-05 03:18:29'),
(2, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '100.000', 'PAY-DUMWM5YXDYRLRKFHBNISAC-2', '2024-12-05 03:22:24'),
(3, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '50.000', 'PAY-ZMSWTPZTOK7NN3F9RXOJC6-3', '2024-12-05 04:27:48'),
(4, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '100.000', 'PAY-SAUANS5I8WBYEXKHKPITFZ-4', '2024-12-05 04:54:47'),
(5, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '100.000', 'PAY-NLXLPUEOFO8531Q4EAS9CH-5', '2024-12-09 19:33:37'),
(7, 'POS-N0G3D1T4M3-1', 1, 'ingreso', '250.000', 'PAY-G1H4Z8T7B1M2D2S6C4Z4J5-6', '2024-12-10 20:11:46');

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
(1, 1, 'entrada', NULL, '20.000', 'Entrada Inicial', '2024-12-05 03:12:01'),
(2, 2, 'entrada', NULL, '20.000', 'Entrada inicial', '2024-12-05 03:12:34'),
(3, 3, 'entrada', NULL, '20.000', 'Entrada inicial', '2024-12-05 03:12:49'),
(4, 2, 'salida', 'SALE-T0W8G7A9G6V9O8J6D0R3B0-1', '1.000', 'Venta de producto', '2024-12-05 03:18:29'),
(5, 2, 'salida', 'SALE-C7Y2X3J3P2B0B5H3B7V6H7-2', '1.000', 'Venta de producto', '2024-12-05 03:22:24'),
(6, 2, 'salida', 'SALE-U7Y1B7U7W6Q7K8R0T4C3A5-3', '1.000', 'Venta de producto', '2024-12-05 03:24:14'),
(7, 2, 'salida', 'SALE-A3A3F0M9X6B7Z4W9Z5R2K1-4', '1.000', 'Venta de producto', '2024-12-05 03:25:30'),
(8, 2, 'salida', NULL, '2.000', 'ajuste de inventario', '2024-12-05 03:34:47'),
(9, 1, 'salida', 'SALE-U3P1N3R6H5S1K9I6N8M5W5-5', '1.000', 'Venta de producto', '2024-12-05 05:34:43'),
(10, 1, 'entrada', 'SALE-U3P1N3R6H5S1K9I6N8M5W5-5', '1.000', 'Devolucion Producto', '2024-12-05 05:40:41'),
(11, 1, 'salida', 'SALE-V9R9W6U5T1J8F4O9M5C0B8-6', '1.000', 'Venta de producto', '2024-12-09 19:33:38'),
(18, 2, 'salida', 'SALE-G9O1P0Z8F1G6N0C7G6L5T4-7', '1.000', 'Venta de producto apartir de nota NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10 19:54:57'),
(19, 1, 'salida', 'SALE-G9O1P0Z8F1G6N0C7G6L5T4-7', '1.000', 'Venta de producto apartir de nota NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10 19:54:57'),
(20, 2, 'salida', 'SALE-N3Y8Q9R0H9S0O3O2L0N9R5-10', '1.000', 'Venta de producto apartir de nota NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10 20:11:46'),
(21, 1, 'salida', 'SALE-G5J0L1S1U7N4T9D7P3Z8R6-11', '1.000', 'Venta de producto apartir de nota NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10 23:28:30'),
(22, 2, 'salida', 'SALE-G5J0L1S1U7N4T9D7P3Z8R6-11', '5.000', 'Venta de producto apartir de nota NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10 23:28:30'),
(26, 4, 'entrada', NULL, '4.000', 'Entrada Inicial', '2024-12-11 18:08:31'),
(28, 5, 'entrada', NULL, '5.000', 'inventario inicial', '2024-12-11 18:19:50'),
(29, 6, 'entrada', NULL, '6.000', 'inventario inicial', '2024-12-11 18:19:50'),
(30, 7, 'entrada', NULL, '9.000', 'inventario inicial', '2024-12-11 18:19:50'),
(31, 8, 'entrada', NULL, '8.000', 'inventario inicial', '2024-12-11 18:19:50'),
(32, 9, 'entrada', NULL, '6.000', 'inventario inicial', '2024-12-11 18:19:50'),
(33, 10, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:50'),
(34, 11, 'entrada', NULL, '5.000', 'inventario inicial', '2024-12-11 18:19:50'),
(35, 12, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:50'),
(36, 13, 'entrada', NULL, '9.000', 'inventario inicial', '2024-12-11 18:19:51'),
(37, 14, 'entrada', NULL, '5.000', 'inventario inicial', '2024-12-11 18:19:51'),
(38, 15, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:51'),
(39, 16, 'entrada', NULL, '5.000', 'inventario inicial', '2024-12-11 18:19:51'),
(40, 17, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:51'),
(41, 18, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:51'),
(42, 19, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:51'),
(43, 20, 'entrada', NULL, '5.000', 'inventario inicial', '2024-12-11 18:19:51'),
(44, 21, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:19:51'),
(45, 22, 'entrada', NULL, '4.000', 'inventario inicial', '2024-12-11 18:45:36'),
(46, 4, 'entrada', NULL, '10.000', 'Entrada de inventario', '2024-12-11 19:39:40'),
(47, 4, 'salida', NULL, '1.000', 'Salida de inventario', '2024-12-11 19:40:42'),
(48, 4, 'entrada', NULL, '10.000', 'Entrada de inventario', '2024-12-11 19:41:53'),
(49, 5, 'entrada', NULL, '10.000', 'Entrada de inventario', '2024-12-11 19:41:53'),
(50, 6, 'entrada', NULL, '10.000', 'Entrada de inventario', '2024-12-11 19:41:54'),
(51, 7, 'salida', NULL, '1.000', 'Salida de inventario', '2024-12-11 19:41:54'),
(52, 22, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:34'),
(53, 4, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:34'),
(54, 5, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35'),
(55, 6, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35'),
(56, 7, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35'),
(57, 8, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35'),
(58, 9, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35'),
(59, 10, 'salida', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', '1.000', 'Venta de producto apartir de nota NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11 23:06:35');

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
(1, 'NOT-HBXZSNIUGDEQXCYSUW67WJ', 'Prueba', '2024-12-05 18:00:00', '2024-12-10 18:00:00', '0.00', 'http://localhost/pos2/detalleNota/NOT-HBXZSNIUGDEQXCYSUW67WJ', 1, '2024-12-06 00:12:18'),
(2, 'NOT-8OLR2WDXQYKCBNJTVXZNES', 'Muestra', '2024-12-11 13:00:00', '2024-12-12 12:00:00', '0.00', 'http://localhost/pos2/detalleNota/NOT-8OLR2WDXQYKCBNJTVXZNES', 1, '2024-12-11 22:50:05'),
(3, 'NOT-C1PFHRFDEIU8MCSLN39KYW', 'Prueba', '2024-12-11 12:00:00', '2024-12-12 13:00:00', '0.00', 'http://localhost/pos2/detalleNota/NOT-C1PFHRFDEIU8MCSLN39KYW', 1, '2024-12-11 22:52:00'),
(4, 'NOT-YZ9D3IHWC06MOGCVZJNILK', 'sdfdf', '2024-12-11 12:00:00', '2024-12-13 12:00:00', '0.00', 'http://localhost/pos2/detalleNota/NOT-YZ9D3IHWC06MOGCVZJNILK', 1, '2024-12-11 23:03:59'),
(5, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 'asdas', '2024-12-11 12:00:00', '2024-12-13 14:00:00', '0.00', 'http://localhost/pos2/detalleNota/NOT-RQLKXH6UN5GPODTUP9NQ1Y', 1, '2024-12-11 23:05:18');

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
(1, 'PAY-JQ9GIAIJDKNCRYHCQFTN4M-1', 'SALE-T0W8G7A9G6V9O8J6D0R3B0-1', 1, '250.00', '500.00', '250.00', '', '2024-12-05 03:18:29'),
(2, 'PAY-DUMWM5YXDYRLRKFHBNISAC-2', 'SALE-C7Y2X3J3P2B0B5H3B7V6H7-2', 1, '250.00', '100.00', '-150.00', '', '2024-12-05 03:22:24'),
(3, 'PAY-ZMSWTPZTOK7NN3F9RXOJC6-3', 'SALE-A3A3F0M9X6B7Z4W9Z5R2K1-4', 1, '250.00', '50.00', '-200.00', '', '2024-12-05 04:27:48'),
(4, 'PAY-SAUANS5I8WBYEXKHKPITFZ-4', 'SALE-A3A3F0M9X6B7Z4W9Z5R2K1-4', 1, '200.00', '100.00', '-150.00', '', '2024-12-05 04:54:47'),
(5, 'PAY-NLXLPUEOFO8531Q4EAS9CH-5', 'SALE-V9R9W6U5T1J8F4O9M5C0B8-6', 1, '350.00', '100.00', '-250.00', '', '2024-12-09 19:33:37'),
(7, 'PAY-G1H4Z8T7B1M2D2S6C4Z4J5-6', 'SALE-N3Y8Q9R0H9S0O3O2L0N9R5-10', 2, '250.00', '250.00', '0.00', '', '2024-12-10 20:11:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(20) NOT NULL,
  `cid_producto` int(20) NOT NULL,
  `out_stock` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `codigo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
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
(5, 3, '0', 4, 0, '100123456789', 'Vestido Largo Moda', '', 'Pieza', '150.00', '200.00', '', '', '', '', 1, '', '2024-11-21 18:35:58', '2024-12-03 19:50:54'),
(10, 4, '0', 5, 0, 'COD12134', 'Adaptador HDMI HD 1080P a VGA Con Audio', '', 'Pieza', '45.31', '130.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(11, 5, '0', 5, 0, 'COD12135', 'Convertidor HDMI a VGA', '', 'Pieza', '30.00', '120.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(12, 6, '0', 5, 0, 'COD12136', 'Extension Electrica 20 Metros', '', 'Pieza', '72.00', '150.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(13, 7, '0', 5, 0, 'COD12137', 'Extension Electrica 25 Metros', '', 'Pieza', '80.01', '190.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(14, 8, '0', 5, 0, 'COD12138', 'Juego de Luces para Bicicleta Recargable', '', 'Pieza', '32.46', '100.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(15, 9, '0', 5, 0, 'COD12139', 'Kit Lancetas y Tiras Reactivas', '', 'Pieza', '71.53', '130.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(16, 10, '0', 5, 0, 'COD12140', 'Lampara de Emergencia 2 Modos', '', 'Pieza', '72.00', '160.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(17, 11, '0', 5, 0, 'COD12141', 'Medidor de Glucosa', '', 'Pieza', '108.00', '200.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(18, 12, '0', 5, 0, 'COD12142', 'Medidor de Presion Arterial Brazo', '', 'Pieza', '56.05', '180.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(19, 13, '0', 5, 0, 'COD12143', 'Medidor de Presion Arterial Muñeca', '', 'Pieza', '92.96', '200.00', '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(20, 14, '0', 5, 0, 'COD12144', 'Mini Báscula Electrónica', '', 'Pieza', '37.53', '100.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(21, 15, '0', 5, 0, 'COD12145', 'Mini Camara Wifi A9', '', 'Pieza', '42.31', '120.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(22, 16, '0', 5, 0, 'COD12146', 'Pistola de Temperatura', '', 'Pieza', '52.07', '120.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(23, 17, '0', 5, 0, 'COD12147', 'Rasuradora Inalámbrica Recargable', '', 'Pieza', '34.08', '100.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(24, 18, '0', 5, 0, 'COD12148', 'Soporte Giratorio Para Celular Color Blanco', '', 'Pieza', '15.00', '80.01', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(25, 19, '0', 5, 0, 'COD12149', 'Soporte Giratorio Para Celular Color Negro', '', 'Pieza', '15.00', '80.01', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(26, 20, '0', 5, 0, 'COD12150', 'Soporte Plegable Para Celular Blanco', '', 'Pieza', '20.00', '50.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(27, 21, '0', 5, 0, 'COD12151', 'Termómetro Digital Axilar', '', 'Pieza', '23.72', '50.00', '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(28, 22, '0', 5, 0, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '', 'Pieza', '45.31', '130.00', '', '', '', '', 1, '', '2024-12-11 18:45:36', '2024-12-11 18:45:36');

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
(1, 'NOT-HBXZSNIUGDEQXCYSUW67WJ', 2, '00023456789', 'Pantalon Mezclilla', '250.00', 14, '', '', 1, '2024-12-06 00:12:18'),
(2, 'NOT-HBXZSNIUGDEQXCYSUW67WJ', 1, '00123456789', 'Sueter Mio Mio', '350.00', 20, 'Azul,Gris,Verde', '32,38,40', 1, '2024-12-06 00:12:18'),
(4, 'NOT-8OLR2WDXQYKCBNJTVXZNES', 22, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '130.00', 4, '', '', 1, '2024-12-11 22:50:05'),
(6, 'NOT-8OLR2WDXQYKCBNJTVXZNES', 5, 'COD12135', 'Convertidor HDMI a VGA', '120.00', 15, '', '', 1, '2024-12-11 22:50:05'),
(11, 'NOT-8OLR2WDXQYKCBNJTVXZNES', 10, 'COD12140', 'Lampara de Emergencia 2 Modos', '160.00', 4, '', '', 1, '2024-12-11 22:50:05'),
(12, 'NOT-C1PFHRFDEIU8MCSLN39KYW', 22, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '130.00', 4, '', '', 1, '2024-12-11 22:52:00'),
(14, 'NOT-C1PFHRFDEIU8MCSLN39KYW', 5, 'COD12135', 'Convertidor HDMI a VGA', '120.00', 15, '', '', 1, '2024-12-11 22:52:00'),
(19, 'NOT-C1PFHRFDEIU8MCSLN39KYW', 10, 'COD12140', 'Lampara de Emergencia 2 Modos', '160.00', 4, '', '', 1, '2024-12-11 22:52:00'),
(20, 'NOT-YZ9D3IHWC06MOGCVZJNILK', 22, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '130.00', 4, '', '', 1, '2024-12-11 23:03:59'),
(22, 'NOT-YZ9D3IHWC06MOGCVZJNILK', 5, 'COD12135', 'Convertidor HDMI a VGA', '120.00', 15, '', '', 1, '2024-12-11 23:03:59'),
(27, 'NOT-YZ9D3IHWC06MOGCVZJNILK', 10, 'COD12140', 'Lampara de Emergencia 2 Modos', '160.00', 4, '', '', 1, '2024-12-11 23:03:59'),
(28, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 22, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '130.00', 4, '', '', 1, '2024-12-11 23:05:18'),
(29, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 4, 'COD12134', 'Adaptador HDMI HD 1080P a VGA Con Audio', '130.00', 23, '', '', 1, '2024-12-11 23:05:18'),
(30, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 5, 'COD12135', 'Convertidor HDMI a VGA', '120.00', 15, '', '', 1, '2024-12-11 23:05:18'),
(31, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 6, 'COD12136', 'Extension Electrica 20 Metros', '150.00', 16, '', '', 1, '2024-12-11 23:05:18'),
(32, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 7, 'COD12137', 'Extension Electrica 25 Metros', '190.00', 8, '', '', 1, '2024-12-11 23:05:18'),
(33, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 8, 'COD12138', 'Juego de Luces para Bicicleta Recargable', '100.00', 8, '', '', 1, '2024-12-11 23:05:18'),
(34, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 9, 'COD12139', 'Kit Lancetas y Tiras Reactivas', '130.00', 6, '', '', 1, '2024-12-11 23:05:18'),
(35, 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', 10, 'COD12140', 'Lampara de Emergencia 2 Modos', '160.00', 4, '', '', 1, '2024-12-11 23:05:18');

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
(1, 'POS-N0G3D1T4M3-1', 1, 1, 'apertura de caja', '2024-12-05 03:15:29', '100.00', '600.00', '0.00', '0.00', '250.00', '0.00', '0.00', NULL, NULL, 'abierta'),
(2, 'POS-R2L1P3H6G1-2', 3, 2, 'apertura inicial', '2024-12-14 18:39:22', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 'abierta');

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
(1, 'Administrador', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 'Administrador', 1, '2024-12-03 03:28:58', 'POS-N0G3D1T4M3-1', 1),
(2, 'Cajero 2', '', 'cajero2', '$2y$10$9zt9trw18J9i8I5NDYVTPOhyLEZ95l./tnhVC/kbcR9/FarK2Poni', 'Marco_Antonio_Lopez_Perez_18.png', 'Caja', 4, '2024-12-03 03:39:36', NULL, 1),
(3, 'Cajero 1', '', 'cajero1', '$2y$10$skfgnFM/v//X9b1QiAWAxePh2Xx/AK20jJR64MiHk0afyStaT0Kwe', '', 'Caja', 2, '2024-12-03 03:39:36', 'POS-R2L1P3H6G1-2', 1);

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
  `pendiente` decimal(30,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `estatus_pago` int(11) NOT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `tipo_venta`, `tipo_entrega`, `forma_pago`, `codigo`, `codigo_nota`, `fecha_venta`, `hora_venta`, `subtotal`, `porc_descuento`, `descuento`, `total`, `pagado`, `pendiente`, `id_usuario`, `id_cliente`, `id_caja`, `estatus`, `estatus_pago`, `fecha_pago`, `fecha_registro`) VALUES
(1, 'directa', 'recoleccion', 1, 'SALE-T0W8G7A9G6V9O8J6D0R3B0-1', '', '2024-12-04', '09:18:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 1, 1, 3, 1, NULL, '2024-12-05 03:18:29'),
(2, 'directa', 'recoleccion', 1, 'SALE-C7Y2X3J3P2B0B5H3B7V6H7-2', '', '2024-12-04', '09:22:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 1, 1, 1, 1, NULL, '2024-12-05 03:22:24'),
(3, 'directa', 'recoleccion', 5, 'SALE-U7Y1B7U7W6Q7K8R0T4C3A5-3', '', '2024-12-04', '09:24:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 1, 1, 1, 0, NULL, '2024-12-05 03:24:14'),
(4, 'directa', 'recoleccion', 1, 'SALE-A3A3F0M9X6B7Z4W9Z5R2K1-4', '', '2024-12-04', '09:25:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 1, 1, 1, 1, NULL, '2024-12-05 03:25:30'),
(5, 'directa', 'recoleccion', 5, 'SALE-U3P1N3R6H5S1K9I6N8M5W5-5', '', '2024-12-04', '11:34:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 1, 1, 0, 0, NULL, '2024-12-05 05:34:43'),
(6, 'directa', 'recoleccion', 1, 'SALE-V9R9W6U5T1J8F4O9M5C0B8-6', '', '2024-12-09', '01:33:00', '600.00', '0.00', '0.000', '600.00', '0.00', '0.00', 1, 7, 1, 1, 1, NULL, '2024-12-09 19:33:37'),
(9, 'nota', 'recoleccion', 1, 'SALE-G9O1P0Z8F1G6N0C7G6L5T4-7', 'NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10', '13:54:56', '600.00', '0.00', '0.000', '600.00', '0.00', '600.00', 1, 7, 1, 1, 0, '2024-12-17 13:54:56', '2024-12-10 19:54:56'),
(10, 'nota', 'envio', 2, 'SALE-N3Y8Q9R0H9S0O3O2L0N9R5-10', 'NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10', '14:11:46', '250.00', '0.00', '0.000', '250.00', '250.00', '0.00', 1, 7, 1, 2, 1, '2024-12-10 14:11:46', '2024-12-10 20:11:46'),
(11, 'nota', 'recoleccion', 1, 'SALE-G5J0L1S1U7N4T9D7P3Z8R6-11', 'NOT-HBXZSNIUGDEQXCYSUW67WJ', '2024-12-10', '17:28:30', '1600.00', '0.00', '0.000', '1600.00', '0.00', '1600.00', 1, 7, 1, 1, 0, '2024-12-17 17:28:30', '2024-12-10 23:28:30'),
(12, 'nota', 'recoleccion', 1, 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 'NOT-RQLKXH6UN5GPODTUP9NQ1Y', '2024-12-11', '17:06:34', '1110.00', '0.00', '0.000', '1110.00', '0.00', '1110.00', 1, 7, 1, 1, 0, '2024-12-18 17:06:34', '2024-12-11 23:06:34');

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
  `cantidad_old` int(11) NOT NULL,
  `color` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `talla` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `descuento` decimal(30,2) NOT NULL,
  `subtotal` decimal(30,2) NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `error` text NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id_detalle`, `id_producto`, `token`, `descripcion`, `codigo`, `cantidad`, `cantidad_old`, `color`, `talla`, `precio_compra`, `precio_venta`, `porc_descuento`, `descuento`, `subtotal`, `total`, `error`, `fecha_movimiento`) VALUES
(1, 2, 'E7U4R4D8', 'Pantalon Mezclilla', 'SALE-T0W8G7A9G6V9O8J6D0R3B0-1', 1, 0, '', '', '150.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-05 03:18:29'),
(2, 2, 'A0J2S2S2', 'Pantalon Mezclilla', 'SALE-C7Y2X3J3P2B0B5H3B7V6H7-2', 1, 0, '', '', '150.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-05 03:22:24'),
(3, 2, 'A8E7N3H5', 'Pantalon Mezclilla', 'SALE-U7Y1B7U7W6Q7K8R0T4C3A5-3', 1, 0, '', '', '150.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-05 03:24:14'),
(4, 2, 'M3O9G4Z3', 'Pantalon Mezclilla', 'SALE-A3A3F0M9X6B7Z4W9Z5R2K1-4', 1, 0, '', '', '150.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-05 03:25:30'),
(5, 1, 'J3K1A9E5', 'Sueter Mio Mio', 'SALE-U3P1N3R6H5S1K9I6N8M5W5-5', 0, 0, '', '', '250.00', '350.00', '0.00', '0.00', '0.00', '0.00', '', '2024-12-05 05:34:43'),
(6, 1, 'G4C0W3P7', 'Sueter Mio Mio', 'SALE-V9R9W6U5T1J8F4O9M5C0B8-6', 1, 0, '', '', '250.00', '350.00', '0.00', '0.00', '350.00', '350.00', '', '2024-12-09 19:33:37'),
(11, 2, 'G7S4N6T5', 'Pantalon Mezclilla', 'SALE-G9O1P0Z8F1G6N0C7G6L5T4-7', 1, 0, '', '', '0.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-10 19:54:56'),
(12, 1, 'Y6T4W4X3', 'Sueter Mio Mio', 'SALE-G9O1P0Z8F1G6N0C7G6L5T4-7', 1, 0, 'Azul', '32', '0.00', '350.00', '0.00', '0.00', '350.00', '350.00', '', '2024-12-10 19:54:57'),
(13, 2, 'P6O8J7E5', 'Pantalon Mezclilla', 'SALE-N3Y8Q9R0H9S0O3O2L0N9R5-10', 1, 0, '', '', '0.00', '250.00', '0.00', '0.00', '250.00', '250.00', '', '2024-12-10 20:11:46'),
(14, 1, 'F0L0G9C8', 'Sueter Mio Mio', 'SALE-G5J0L1S1U7N4T9D7P3Z8R6-11', 1, 0, 'Azul', '32', '0.00', '350.00', '0.00', '0.00', '350.00', '350.00', '', '2024-12-10 23:28:30'),
(15, 2, 'W9Y9P0W3', 'Pantalon Mezclilla', 'SALE-G5J0L1S1U7N4T9D7P3Z8R6-11', 5, 12, '', '', '0.00', '250.00', '0.00', '0.00', '1250.00', '1250.00', 'stock', '2024-12-10 23:28:30'),
(16, 22, 'B8A1H4Q2', 'Adaptador HDMI HD 1080P a VGA', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '130.00', '0.00', '0.00', '130.00', '130.00', '', '2024-12-11 23:06:34'),
(17, 4, 'T9H5F3M4', 'Adaptador HDMI HD 1080P a VGA Con Audio', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '130.00', '0.00', '0.00', '130.00', '130.00', '', '2024-12-11 23:06:34'),
(18, 5, 'P6D4M8Z1', 'Convertidor HDMI a VGA', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '120.00', '0.00', '0.00', '120.00', '120.00', '', '2024-12-11 23:06:34'),
(19, 6, 'R4F3G2R5', 'Extension Electrica 20 Metros', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '150.00', '0.00', '0.00', '150.00', '150.00', '', '2024-12-11 23:06:35'),
(20, 7, 'V9N7W1N0', 'Extension Electrica 25 Metros', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '190.00', '0.00', '0.00', '190.00', '190.00', '', '2024-12-11 23:06:35'),
(21, 8, 'B9K1T5Y4', 'Juego de Luces para Bicicleta Recargable', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '100.00', '0.00', '0.00', '100.00', '100.00', '', '2024-12-11 23:06:35'),
(22, 9, 'L7D3X3B9', 'Kit Lancetas y Tiras Reactivas', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '130.00', '0.00', '0.00', '130.00', '130.00', '', '2024-12-11 23:06:35'),
(23, 10, 'Y6Z3V0V9', 'Lampara de Emergencia 2 Modos', 'SALE-L3P7Q6N7X5G4N4M3I3M8Z6-12', 1, 0, '', '', '0.00', '160.00', '0.00', '0.00', '160.00', '160.00', '', '2024-12-11 23:06:35');

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
  ADD PRIMARY KEY (`id_detalle_nota`);

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
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  MODIFY `id_corte` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  MODIFY `id_detalle_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id_detalle` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
