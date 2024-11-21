-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 01:14:00
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
(1, 'Sueteres', 'Pb', '', '2024-10-08 16:43:16'),
(3, 'Pantalones', 'Pb', '', '2024-10-15 22:55:44'),
(4, 'Joggers', 'Pa', '', '2024-10-15 22:55:59'),
(5, 'Perfumes', 'Pa', '', '2024-11-07 18:14:13');

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
(1, 'General', 'Publico', 'General', 'PublicoGeneral', '', '$2y$10$L1GE2DSXHLGz5HprNIWKpeZPklQwphKRFcGL2ljziQQFPZSYtB.1W', '', '22222222', 'Dalias 6124', '', '', '', '', '', '', '', '0.000', '0.000', '0.000', '2024-10-16 23:38:01', 0),
(7, 'Facebook', 'Marco Antonio', 'Lopez Perez', 'MALP-WEOC9YBH', '', 'ZnBiTUQzL3JoS090cnoyc0pUemdOQT09', '', '2211636228', 'Dalias 6124, Bugambilias, Heroica Puebla de Zaragoza, Pue., México', 'Dalias', '6124', 'Heroica Puebla de Zaragoza', 'Puebla', '72580', 'México', 'marcWhoami', '0.000', '0.000', '0.000', '2024-10-14 23:08:44', 1);

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
(1, 4, '10.000', '2.000', '20.000', '2024-11-20 19:35:49'),
(2, 5, '10.000', '2.000', '20.000', '2024-11-20 19:36:32'),
(3, 6, '10.000', '2.000', '20.000', '2024-11-20 19:36:32'),
(4, 7, '10.000', '2.000', '20.000', '2024-11-20 19:36:46');

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
  `id_caja` int(11) NOT NULL,
  `tipo_movimiento` enum('ingreso','egreso') NOT NULL,
  `monto` decimal(10,3) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `id_movimiento_inventario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `documento` text NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento_inventario`
--

INSERT INTO `movimiento_inventario` (`id_movimiento_inventario`, `id_producto`, `tipo_movimiento`, `documento`, `cantidad`, `descripcion`, `fecha_movimiento`) VALUES
(1, 4, 'entrada', '2147483647', '10.000', 'inventario inicial', '2024-11-20 19:55:51'),
(2, 5, 'entrada', '0', '10.000', 'inventario inicial', '2024-11-20 19:56:09'),
(3, 6, 'entrada', '0', '10.000', 'inventario inicial', '2024-11-20 19:56:25'),
(4, 7, 'entrada', '0', '10.000', 'inventario inicial', '2024-11-20 19:56:37');

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
(2, 'NOT-W3N6IORVWLJTMEZDKNVQZC', 'Prueba', '2024-11-14 12:01:00', '2024-11-16 12:00:00', '10.00', 'http://localhost/pos2/detalleNota/NOT-W3N6IORVWLJTMEZDKNVQZC', 1, '2024-11-14 18:03:19'),
(3, 'NOT-YYSFXTEM8LDBQ0FKZE4X1G', 'Prueba 1', '2024-11-20 13:00:00', '2024-11-22 12:00:00', '5.00', 'http://localhost/pos2/detalleNota/NOT-YYSFXTEM8LDBQ0FKZE4X1G', 1, '2024-11-20 18:44:43');

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
(1, 'PAY-1EOVTMYBBQIPIHGSAJN0FE-1', 'SALE-C3C2C4E3Q0-1', 1, '1080.00', '1100.00', '20.00', '', '2024-11-15 17:51:52');

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
(4, 4, '0', 1, 0, '1010110101', 'Sueter Mio Mio', '', 'Pieza', '0.00', '300.00', '', '', 'azul,gris', '20,22,24,30,32,38', 1, '1010110101_54.jpg', '2024-10-15 22:36:23', '2024-11-20 23:52:32'),
(5, 5, '0', 3, 0, '123456789', 'Pantalon Mezclilla', '', 'Pieza', '0.00', '250.00', '', '', 'Gris,azul', '14,16,18,20,22', 1, '', '2024-10-15 22:56:47', '2024-11-20 23:52:34'),
(6, 6, '0', 1, 0, '6957303503681', 'Sueter', '', 'Pieza', '0.00', '300.00', '', '', 'AZUL,VERDE,MORADO,LILA', '30,32,34,38,40', 1, '', '2024-11-07 18:12:04', '2024-11-20 23:52:36'),
(7, 7, '0', 5, 0, '845973085452', 'Perfume', '', 'Pieza', '0.00', '350.00', '', '', '', '', 1, '', '2024-11-07 18:12:55', '2024-11-20 23:52:38'),
(8, 8, '0', 1, 0, '12548752411', 'asdasd', '', 'Pieza', '0.00', '100.00', '', '', '', '', 1, '', '2024-11-20 20:49:18', '2024-11-20 23:52:40'),
(9, 9, '0', 1, 0, '5458245244', 'sdas', '', 'Pieza', '0.00', '100.00', '', '', '', '', 1, '', '2024-11-20 20:50:49', '2024-11-20 23:52:42');

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
(3, 'NOT-W3N6IORVWLJTMEZDKNVQZC', 6, '6957303503681', 'Sueter', '300.00', 10, 'AZUL,VERDE,MORADO,LILA', '30,32,34,38,40', 1, '2024-11-14 18:03:19'),
(4, 'NOT-W3N6IORVWLJTMEZDKNVQZC', 4, '1010110101', 'Sueter Mio Mio', '300.00', 10, 'azul,gris', '20,22,24,30,32,38', 1, '2024-11-14 18:03:19'),
(5, 'NOT-W3N6IORVWLJTMEZDKNVQZC', 7, '845973085452', 'Perfume', '350.00', 10, '', '', 1, '2024-11-14 18:03:19'),
(6, 'NOT-W3N6IORVWLJTMEZDKNVQZC', 5, '123456789', 'Pantalon Mezclilla', '250.00', 10, 'Gris,azul', '14,16,18,20,22', 1, '2024-11-14 18:03:19'),
(7, 'NOT-YYSFXTEM8LDBQ0FKZE4X1G', 5, '123456789', 'Pantalon Mezclilla', '250.00', 10, 'Gris,azul', '14,16,18,20,22', 1, '2024-11-20 18:44:43'),
(8, 'NOT-YYSFXTEM8LDBQ0FKZE4X1G', 7, '845973085452', 'Perfume', '350.00', 10, '', '', 1, '2024-11-20 18:44:43');

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
  `fecha_cierre` timestamp NULL DEFAULT NULL,
  `estado` enum('abierta','cerrada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesiones_caja`
--

INSERT INTO `sesiones_caja` (`id_sesion`, `codigo_sesion`, `id_usuario`, `id_caja`, `notas_apertura`, `fecha_apertura`, `saldo_inicial`, `efectivo`, `tarjeta_debito`, `tarjeta_credito`, `transferencia`, `saldo_final`, `fecha_cierre`, `estado`) VALUES
(1, 'POS-L5Z9K9Q6M5-1', 3, 2, 'apertura inicial', '2024-11-14 23:55:55', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, 'abierta'),
(3, 'POS-V1Y9L1L1F8-2', 1, 1, 'apertura inicial', '2024-11-20 18:17:12', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, 'abierta');

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
  `id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `password`, `foto`, `perfil`, `id_caja`) VALUES
(1, 'Administrador', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 'Administrador', 1),
(2, 'Cajero 2', '', 'cajero2', '$2y$10$9zt9trw18J9i8I5NDYVTPOhyLEZ95l./tnhVC/kbcR9/FarK2Poni', 'Marco_Antonio_Lopez_Perez_18.png', 'Caja', 4),
(3, 'Cajero 1', '', 'cajero1', '$2y$10$skfgnFM/v//X9b1QiAWAxePh2Xx/AK20jJR64MiHk0afyStaT0Kwe', '', 'Caja', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(30) NOT NULL,
  `tipo_venta` enum('directa','nota') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_entrega` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `forma_pago` int(11) NOT NULL,
  `codigo` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo_nota` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venta` date NOT NULL,
  `hora_venta` time NOT NULL,
  `subtotal` decimal(30,2) NOT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `descuento` decimal(10,3) NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `pagado` decimal(30,2) NOT NULL,
  `cambio` decimal(30,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `estatus_pago` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_pago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_producto` (`id_producto`);

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
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  MODIFY `id_detalle_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id_detalle` int(100) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  ADD CONSTRAINT `movimiento_caja_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`);

--
-- Filtros para la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD CONSTRAINT `movimiento_inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

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

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
