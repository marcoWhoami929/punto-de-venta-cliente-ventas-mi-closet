-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2024 a las 02:32:01
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
  `nombre` varchar(100) NOT NULL,
  `fecha_apertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `saldo_inicial` decimal(10,2) NOT NULL,
  `efectivo` decimal(30,2) NOT NULL,
  `tarjeta_debito` decimal(30,2) NOT NULL,
  `tarjeta_credito` decimal(30,2) NOT NULL,
  `saldo_final` decimal(10,2) NOT NULL,
  `fecha_cierre` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('abierta','cerrada') DEFAULT 'abierta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `numero`, `nombre`, `fecha_apertura`, `saldo_inicial`, `efectivo`, `tarjeta_debito`, `tarjeta_credito`, `saldo_final`, `fecha_cierre`, `estado`) VALUES
(1, 1, 'Caja Principal', '2024-10-04 20:04:59', '100.00', '2440.00', '0.00', '0.00', '0.00', '2024-10-04 20:04:59', 'abierta'),
(2, 2, 'Caja Piso 1', '2024-10-05 17:17:24', '100.00', '0.00', '0.00', '0.00', '0.00', '2024-10-05 17:17:24', 'abierta');

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
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `ubicacion`, `descripcion`, `fecha_registro`) VALUES
(1, 'Sueteres', 'Pb', '', '2024-10-08 16:43:16'),
(3, 'Pantalones', 'Pb', '', '2024-10-15 22:55:44'),
(4, 'Joggers', 'Pa', '', '2024-10-15 22:55:59');

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
  `calle` text NOT NULL,
  `numero` text NOT NULL,
  `ciudad` text NOT NULL,
  `estado` text NOT NULL,
  `cp` text NOT NULL,
  `pais` text NOT NULL,
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
  `stock_actual` decimal(10,3) NOT NULL,
  `stock_minimo` decimal(10,3) NOT NULL,
  `stock_maximo` decimal(10,3) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `id_metodo_pago` int(11) NOT NULL,
  `metodo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moviimientocaja`
--

CREATE TABLE `moviimientocaja` (
  `id_movimiento` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `tipo_movimiento` enum('ingreso','egreso') NOT NULL,
  `monto` decimal(10,3) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoinventario`
--

CREATE TABLE `movimientoinventario` (
  `id_movimiento_inventario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(1, 'NOT-CHSKUFP7DZIOX9ZBLPWRYC', 'Mio Mio 2', '2024-10-24 10:00:00', '2024-10-25 10:00:00', '10.00', 'http://localhost/pos2/notas/NOT-CHSKUFP7DZIOX9ZBLPWRYC', 1, '2024-10-22 16:33:08'),
(2, 'NOT-U7MKR1JIAWRE2HPSWMKXOT', 'Prueba 2', '2024-10-25 09:00:00', '2024-10-26 10:00:00', '10.00', 'http://localhost/pos2/notas/NOT-U7MKR1JIAWRE2HPSWMKXOT', 1, '2024-10-24 19:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `monto_pagado` decimal(10,3) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(20) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `codigo` varchar(77) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `stock_total` decimal(10,3) NOT NULL,
  `tipo_unidad` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` decimal(30,2) NOT NULL,
  `precio_venta` decimal(30,2) NOT NULL,
  `marca` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `colores` text NOT NULL,
  `tallas` text NOT NULL,
  `estado` int(11) NOT NULL,
  `foto` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ceacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `id_proveedor`, `codigo`, `nombre`, `descripcion`, `stock_total`, `tipo_unidad`, `precio_compra`, `precio_venta`, `marca`, `modelo`, `colores`, `tallas`, `estado`, `foto`, `fecha_ceacion`, `fecha_actualizacion`) VALUES
(4, 1, 0, '1010110101', 'Sueter Mio Mio', '', '7.000', 'Pieza', '0.00', '300.00', '', '', 'azul,gris', '20,22,24,30,32,38', 1, '1010110101_54.jpg', '2024-10-15 22:36:23', '2024-10-22 23:23:56'),
(5, 3, 0, '123456789', 'Pantalon Mezclilla', '', '7.000', 'Pieza', '0.00', '250.00', '', '', 'Gris,azul', '14,16,18,20,22', 1, '', '2024-10-15 22:56:47', '2024-10-18 19:26:39');

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
(1, 'NOT-CHSKUFP7DZIOX9ZBLPWRYC', 5, '123456789', 'Pantalon Mezclilla', '250.00', 7, 'Gris,azul', '14,16,18,20,22', 1, '2024-10-22 16:33:08'),
(2, 'NOT-CHSKUFP7DZIOX9ZBLPWRYC', 4, '1010110101', 'Sueter Mio Mio', '300.00', 7, 'azul,gris', '20,22,24,30,32,38', 1, '2024-10-22 16:33:08'),
(3, 'NOT-U7MKR1JIAWRE2HPSWMKXOT', 4, '1010110101', 'Sueter Mio Mio', '300.00', 7, 'azul,gris', '20,22,24,30,32,38', 1, '2024-10-24 19:53:10');

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `usuario` text NOT NULL,
  `password` text NOT NULL,
  `foto` varchar(200) NOT NULL,
  `perfil` text NOT NULL,
  `id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `password`, `foto`, `perfil`, `id_caja`) VALUES
(1, 'Administrador', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 'Administrador', 1),
(2, 'Marco Antonio Lopez Perez', 'mm_marco_mar@hotmail.com', 'Marco', '$2y$10$wxXEdDCZk7B8KghwfWOoM.lj8C7N6ecUdcsNjnCN//SXytM/JY0WW', 'Marco_Antonio_Lopez_Perez_18.png', 'Administrador', 1),
(3, 'Usuario Caja', '', 'user1', '$2y$10$e.mMd9YAYWA1xDHFoVUQd.7yXgsuv/nu8r8/El64d6SveRQs4vfDm', '', 'Caja', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(30) NOT NULL,
  `tipo_venta` enum('directa','nota') NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `codigo_nota` text NOT NULL,
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
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `tipo_venta`, `codigo`, `codigo_nota`, `fecha_venta`, `hora_venta`, `subtotal`, `porc_descuento`, `descuento`, `total`, `pagado`, `cambio`, `id_usuario`, `id_cliente`, `id_caja`, `estatus`, `fecha_registro`) VALUES
(4, 'directa', 'S6L2K3T9Y0-1', '', '2024-10-16', '06:39:00', '850.00', '10.00', '85.000', '765.00', '800.00', '35.00', 1, 1, 1, 0, '2024-10-16 23:39:32'),
(5, 'directa', 'Q7X8H3C3G1-2', '', '2024-10-16', '06:51:00', '300.00', '10.00', '30.000', '270.00', '500.00', '230.00', 1, 1, 1, 1, '2024-10-16 23:51:58'),
(6, 'directa', 'N0N0B4L3P0-3', '', '2024-10-16', '06:53:00', '250.00', '0.00', '0.000', '250.00', '300.00', '50.00', 1, 1, 1, 2, '2024-10-16 23:53:18'),
(7, 'directa', 'F6Z0D1E5R1-4', '', '2024-10-18', '02:26:00', '250.00', '10.00', '25.000', '225.00', '300.00', '75.00', 1, 1, 1, 2, '2024-10-18 19:26:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id_detalle` int(100) NOT NULL,
  `id_producto` int(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `cantidad` int(10) NOT NULL,
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

INSERT INTO `venta_detalle` (`id_detalle`, `id_producto`, `descripcion`, `codigo`, `cantidad`, `precio_compra`, `precio_venta`, `porc_descuento`, `descuento`, `subtotal`, `total`, `fecha_movimiento`) VALUES
(6, 4, 'Sueter Mio Mio', 'S6L2K3T9Y0-1', 2, '0.00', '300.00', '0.00', '0.00', '0.00', '540.00', '2024-10-16 23:39:32'),
(7, 5, 'Pantalon Mezclilla', 'S6L2K3T9Y0-1', 1, '0.00', '250.00', '0.00', '0.00', '0.00', '225.00', '2024-10-16 23:39:32'),
(8, 4, 'Sueter Mio Mio', 'Q7X8H3C3G1-2', 1, '0.00', '300.00', '10.00', '30.00', '300.00', '270.00', '2024-10-16 23:51:58'),
(9, 5, 'Pantalon Mezclilla', 'N0N0B4L3P0-3', 1, '0.00', '250.00', '0.00', '0.00', '250.00', '250.00', '2024-10-16 23:53:18'),
(10, 5, 'Pantalon Mezclilla', 'F6Z0D1E5R1-4', 1, '0.00', '250.00', '10.00', '25.00', '250.00', '225.00', '2024-10-18 19:26:39');

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
-- Indices de la tabla `moviimientocaja`
--
ALTER TABLE `moviimientocaja`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
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
  ADD KEY `id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `id_venta` (`id_venta`);

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
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moviimientocaja`
--
ALTER TABLE `moviimientocaja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
  MODIFY `id_movimiento_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id_detalle` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Filtros para la tabla `moviimientocaja`
--
ALTER TABLE `moviimientocaja`
  ADD CONSTRAINT `moviimientocaja_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`);

--
-- Filtros para la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
  ADD CONSTRAINT `movimientoinventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodopago` (`id_metodo_pago`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

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
