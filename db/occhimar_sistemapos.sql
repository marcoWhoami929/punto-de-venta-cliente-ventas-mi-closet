-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-12-2024 a las 00:12:26
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `occhimar_sistemapos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `accion` text COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `fecha_asignacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_cliente`, `nombre`, `apellidos`, `usuario`, `email`, `password`, `telefono`, `celular`, `domicilio`, `calle`, `numero`, `ciudad`, `estado`, `cp`, `pais`, `facebook`, `credito`, `pagado`, `pendiente`, `fecha_registro`, `estatus`) VALUES
(1, 'General', 'Publico', 'General', 'PublicoGeneral', '', '$2y$10$L1GE2DSXHLGz5HprNIWKpeZPklQwphKRFcGL2ljziQQFPZSYtB.1W', '', '22222222', 'Dalias 6124', '', '', '', '', '', '', '', 0.000, 0.000, 0.000, '2024-10-17 05:38:01', 0),
(7, 'Facebook', 'Marco Antonio', 'Lopez Perez', 'MALP-WEOC9YBH', '', 'ZnBiTUQzL3JoS090cnoyc0pUemdOQT09', '', '2211636228', 'Dalias 6124, Bugambilias, Heroica Puebla de Zaragoza, Pue., México', 'Dalias', '6124', 'Heroica Puebla de Zaragoza', 'Puebla', '72580', 'México', 'marcWhoami', 0.000, 0.000, 0.000, '2024-10-15 05:08:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_caja`
--

CREATE TABLE `corte_caja` (
  `id_corte` int(11) NOT NULL,
  `codigo_sesion` text COLLATE utf8_spanish_ci NOT NULL,
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
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
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
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
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
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_producto`, `stock_total`, `stock_minimo`, `stock_maximo`, `fecha_actualizacion`) VALUES
(1, 1, 20.000, 1.000, 20.000, '2024-12-15 06:09:03'),
(2, 2, 20.000, 1.000, 20.000, '2024-12-15 06:09:05'),
(5, 3, 20.000, 1.000, 20.000, '2024-12-05 03:11:17'),
(10, 4, 20.000, 1.000, 20.000, '2024-12-15 06:09:08'),
(11, 5, 20.000, 1.000, 20.000, '2024-12-15 06:09:09'),
(12, 6, 20.000, 1.000, 20.000, '2024-12-15 06:09:10'),
(13, 7, 20.000, 1.000, 20.000, '2024-12-15 06:09:12'),
(14, 8, 20.000, 1.000, 20.000, '2024-12-15 06:09:13'),
(15, 9, 20.000, 1.000, 20.000, '2024-12-15 06:09:14'),
(16, 10, 20.000, 1.000, 20.000, '2024-12-15 06:09:15'),
(17, 11, 20.000, 1.000, 20.000, '2024-12-15 06:09:16'),
(18, 12, 20.000, 1.000, 20.000, '2024-12-15 06:09:33'),
(19, 13, 20.000, 1.000, 20.000, '2024-12-15 06:09:31'),
(20, 14, 20.000, 1.000, 20.000, '2024-12-15 06:09:30'),
(21, 15, 20.000, 1.000, 20.000, '2024-12-15 06:09:29'),
(22, 16, 20.000, 1.000, 20.000, '2024-12-15 06:09:28'),
(23, 17, 20.000, 1.000, 20.000, '2024-12-15 06:09:27'),
(24, 18, 20.000, 1.000, 20.000, '2024-12-15 06:09:26'),
(25, 19, 20.000, 1.000, 20.000, '2024-12-15 06:09:25'),
(26, 20, 20.000, 1.000, 20.000, '2024-12-15 06:09:24'),
(27, 21, 20.000, 1.000, 20.000, '2024-12-15 06:09:23'),
(28, 22, 20.000, 1.000, 20.000, '2024-12-15 06:09:21'),
(29, 23, 20.000, 3.000, 20.000, '2024-12-15 06:03:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `id_metodo_pago` int(11) NOT NULL,
  `metodo` text COLLATE utf8_spanish_ci NOT NULL
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
  `sesion_caja` text COLLATE utf8_spanish_ci NOT NULL,
  `id_caja` int(11) NOT NULL,
  `tipo_movimiento` enum('ingreso','egreso') COLLATE utf8_spanish_ci NOT NULL,
  `monto` decimal(10,3) NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `id_movimiento_inventario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada','salida') COLLATE utf8_spanish_ci NOT NULL,
  `documento` text COLLATE utf8_spanish_ci,
  `cantidad` decimal(10,3) NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento_inventario`
--

INSERT INTO `movimiento_inventario` (`id_movimiento_inventario`, `id_producto`, `tipo_movimiento`, `documento`, `cantidad`, `descripcion`, `fecha_movimiento`) VALUES
(1, 1, 'entrada', NULL, 20.000, 'Entrada Inicial', '2024-12-05 03:12:01'),
(2, 2, 'entrada', NULL, 20.000, 'Entrada inicial', '2024-12-05 03:12:34'),
(3, 3, 'entrada', NULL, 20.000, 'Entrada inicial', '2024-12-05 03:12:49'),
(26, 4, 'entrada', NULL, 20.000, 'Entrada Inicial', '2024-12-11 18:08:31'),
(28, 5, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(29, 6, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(30, 7, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(31, 8, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(32, 9, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(33, 10, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(34, 11, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(35, 12, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:50'),
(36, 13, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(37, 14, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(38, 15, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(39, 16, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(40, 17, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(41, 18, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(42, 19, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(43, 20, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(44, 21, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:19:51'),
(45, 22, 'entrada', NULL, 20.000, 'inventario inicial', '2024-12-11 18:45:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo_nota` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `fecha_expiracion` datetime DEFAULT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `qr` text COLLATE utf8_spanish_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `codigo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `codigo_venta` text COLLATE utf8_spanish_ci NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `total_pago` decimal(30,2) NOT NULL,
  `total_pagado` decimal(30,2) NOT NULL,
  `total_cambio` decimal(30,2) NOT NULL,
  `referencia` text COLLATE utf8_spanish_ci,
  `fecha_pago` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `fecha_ceacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `cid_producto`, `out_stock`, `id_categoria`, `id_proveedor`, `codigo`, `nombre`, `descripcion`, `tipo_unidad`, `precio_compra`, `precio_venta`, `marca`, `modelo`, `colores`, `tallas`, `estado`, `foto`, `fecha_ceacion`, `fecha_actualizacion`) VALUES
(1, 1, '0', 1, 0, '00123456789', 'Sueter Mio Mio', '', 'Pieza', 250.00, 350.00, '', '', 'Azul,Gris,Verde', '32,38,40', 1, '', '2024-11-21 17:23:00', '2024-11-21 17:23:00'),
(2, 2, '0', 2, 0, '00023456789', 'Pantalon Mezclilla', '', 'Pieza', 150.00, 250.00, '', '', '', '', 1, '00023456789_61.jpg', '2024-11-21 17:24:38', '2024-12-03 19:50:56'),
(5, 3, '0', 4, 0, '100123456789', 'Vestido Largo Moda', '', 'Pieza', 150.00, 200.00, '', '', '', '', 1, '', '2024-11-21 18:35:58', '2024-12-03 19:50:54'),
(10, 4, '0', 5, 0, 'COD12134', 'Adaptador HDMI HD 1080P a VGA Con Audio', '', 'Pieza', 45.31, 130.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(11, 5, '0', 5, 0, 'COD12135', 'Convertidor HDMI a VGA', '', 'Pieza', 30.00, 120.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(12, 6, '0', 5, 0, 'COD12136', 'Extension Electrica 20 Metros', '', 'Pieza', 72.00, 150.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(13, 7, '0', 5, 0, 'COD12137', 'Extension Electrica 25 Metros', '', 'Pieza', 80.01, 190.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(14, 8, '0', 5, 0, 'COD12138', 'Juego de Luces para Bicicleta Recargable', '', 'Pieza', 32.46, 100.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(15, 9, '0', 5, 0, 'COD12139', 'Kit Lancetas y Tiras Reactivas', '', 'Pieza', 71.53, 130.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(16, 10, '0', 5, 0, 'COD12140', 'Lampara de Emergencia 2 Modos', '', 'Pieza', 72.00, 160.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(17, 11, '0', 5, 0, 'COD12141', 'Medidor de Glucosa', '', 'Pieza', 108.00, 200.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(18, 12, '0', 5, 0, 'COD12142', 'Medidor de Presion Arterial Brazo', '', 'Pieza', 56.05, 180.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(19, 13, '0', 5, 0, 'COD12143', 'Medidor de Presion Arterial Muñeca', '', 'Pieza', 92.96, 200.00, '', '', '', '', 1, '', '2024-12-11 18:19:50', '2024-12-11 18:19:50'),
(20, 14, '0', 5, 0, 'COD12144', 'Mini Báscula Electrónica', '', 'Pieza', 37.53, 100.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(21, 15, '0', 5, 0, 'COD12145', 'Mini Camara Wifi A9', '', 'Pieza', 42.31, 120.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(22, 16, '0', 5, 0, 'COD12146', 'Pistola de Temperatura', '', 'Pieza', 52.07, 120.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(23, 17, '0', 5, 0, 'COD12147', 'Rasuradora Inalámbrica Recargable', '', 'Pieza', 34.08, 100.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(24, 18, '0', 5, 0, 'COD12148', 'Soporte Giratorio Para Celular Color Blanco', '', 'Pieza', 15.00, 80.01, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(25, 19, '0', 5, 0, 'COD12149', 'Soporte Giratorio Para Celular Color Negro', '', 'Pieza', 15.00, 80.01, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(26, 20, '0', 5, 0, 'COD12150', 'Soporte Plegable Para Celular Blanco', '', 'Pieza', 20.00, 50.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(27, 21, '0', 5, 0, 'COD12151', 'Termómetro Digital Axilar', '', 'Pieza', 23.72, 50.00, '', '', '', '', 1, '', '2024-12-11 18:19:51', '2024-12-11 18:19:51'),
(28, 22, '0', 5, 0, 'COD1213415', 'Adaptador HDMI HD 1080P a VGA', '', 'Pieza', 45.31, 130.00, '', '', '', '', 1, '', '2024-12-11 18:45:36', '2024-12-11 18:45:36'),
(29, 23, '0', 5, 0, '01325656554', 'Producto prueba', '', 'Pieza', 100.00, 120.00, '', '', '', '', 1, '', '2024-12-15 06:03:40', '2024-12-15 06:03:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_notas`
--

CREATE TABLE `productos_notas` (
  `id_detalle_nota` int(11) NOT NULL,
  `codigo_nota` text COLLATE utf8_spanish_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `limite_nota` int(11) NOT NULL,
  `colores` text COLLATE utf8_spanish_ci NOT NULL,
  `tallas` text COLLATE utf8_spanish_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(20) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_caja`
--

CREATE TABLE `sesiones_caja` (
  `id_sesion` int(11) NOT NULL,
  `codigo_sesion` text COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `notas_apertura` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_apertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `saldo_inicial` decimal(30,2) NOT NULL,
  `efectivo` decimal(30,2) NOT NULL,
  `tarjeta_debito` decimal(30,2) NOT NULL,
  `tarjeta_credito` decimal(30,2) NOT NULL,
  `transferencia` decimal(30,2) NOT NULL,
  `saldo_final` decimal(30,2) NOT NULL,
  `diferencia` decimal(30,2) NOT NULL,
  `observaciones` text COLLATE utf8_spanish_ci,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` enum('abierta','cerrada') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codigo_sesion` text COLLATE utf8_spanish2_ci,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `password`, `foto`, `perfil`, `id_caja`, `fecha_alta`, `codigo_sesion`, `estatus`) VALUES
(1, 'Administrador', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 'Administrador', 1, '2024-12-03 03:28:58', NULL, 1),
(2, 'Cajero 2', '', 'cajero2', '$2y$10$9zt9trw18J9i8I5NDYVTPOhyLEZ95l./tnhVC/kbcR9/FarK2Poni', 'Marco_Antonio_Lopez_Perez_18.png', 'Caja', 4, '2024-12-03 03:39:36', NULL, 1),
(3, 'Cajero 1', '', 'cajero1', '$2y$10$skfgnFM/v//X9b1QiAWAxePh2Xx/AK20jJR64MiHk0afyStaT0Kwe', '', 'Caja', 2, '2024-12-03 03:39:36', NULL, 1);

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
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `cantidad_old` int(11) NOT NULL,
  `color` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `talla` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `porc_descuento` decimal(30,2) NOT NULL,
  `descuento` decimal(30,2) NOT NULL,
  `subtotal` decimal(30,2) NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `error` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `productos_notas`
--
ALTER TABLE `productos_notas`
  MODIFY `id_detalle_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;

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
