-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2020 a las 01:20:24
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `imagen` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Mujeres', 'Ropar para dama', 'women.jpg'),
(2, 'Hombres', 'Ropa para hombre', 'men.jpg'),
(3, 'Niños', 'Ropa para niños', 'children.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id`, `color`, `codigo`) VALUES
(1, 'blue', '#00F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_vencimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`id`, `codigo`, `status`, `tipo`, `valor`, `fecha_vencimiento`) VALUES
(1, '34274', 'activo', 'moneda', '100', ''),
(2, '28584', 'activo', 'moneda', '100', ''),
(3, '54749', 'utilizado', 'moneda', '120', '2020-12-03'),
(4, '67549', 'activo', 'moneda', '200', '2020-12-03'),
(5, '22745', 'utilizado', 'porcentaje', '10', '2020-12-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `pais`, `company`, `direccion`, `estado`, `cp`, `id_venta`) VALUES
(2, '5', 'andshfbdh', 'dg', '564', '146', 4),
(3, '8', 'andshfbdh', 'esre', '7989', '1616', 5),
(6, '3', 'andshfbdh', 'dsf', '47', '45645', 55),
(7, '4', 'andshfbdh', 'dsf', '48328', '42746', 56),
(12, '2', 'waet', 'yjuyk', '789', '466', 61),
(13, '2', 'waet', 'yjuyk', '789', '466', 62),
(42, '4', 'universidAD', 'mayo', '73', '75256', 91),
(43, '3', 'utxj', 'marzo', '123', '456', 92),
(44, '3', 'utxj', 'marzo', '123', '456', 93),
(45, '3', 'sdegtre', 'gdfgh', '45', '5756', 94),
(46, '3', 'volumen', 'junio', '131', '5345', 95),
(47, '1', '', '', '', '', 96),
(48, '3', 'rou', 'rty', 'mex', '56', 97),
(49, '2', 'asd', 'asd', 'mhhg', '64', 98),
(50, '3', 'hjkl', 'czsd', 'fsdf', '4324', 99),
(51, '1', '', '', '', '', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `metodo`, `id_venta`) VALUES
(1, 'mercado_pago', 97),
(2, 'paypal', 97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `inventario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `talla` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `inventario`, `id_categoria`, `talla`, `color`) VALUES
(2, 'Corater', 'Finding perfect products', 20, 'shoe_1.jpg', 3, 2, '25.5', 'blue'),
(3, 'Playera', 'Descripcion', 40, 'cloth_2.jpg', 2, 1, '27', 'blue'),
(4, 'Producto 0', 'esta es la descripcion', 588, 'cloth_1.jpg', 93, 1, 'XL', 'Blue'),
(5, 'Producto 1', 'esta es la descripcion', 621, 'cloth_1.jpg', 17, 1, 'XL', 'Blue'),
(6, 'Producto 2', 'esta es la descripcion', 500, 'cloth_1.jpg', 60, 1, 'XL', 'Blue'),
(7, 'Producto 3', 'esta es la descripcion', 849, 'cloth_1.jpg', 37, 1, 'XL', 'Blue'),
(8, 'Producto 4', 'esta es la descripcion', 172, 'cloth_1.jpg', 74, 1, 'XL', 'Blue'),
(9, 'Producto 5', 'esta es la descripcion', 302, 'cloth_1.jpg', 13, 1, 'XL', 'Blue'),
(10, 'Producto 6', 'esta es la descripcion', 393, 'cloth_1.jpg', 82, 1, 'XL', 'Blue'),
(11, 'Producto 7', 'esta es la descripcion', 240, 'cloth_1.jpg', 26, 1, 'XL', 'Blue'),
(12, 'Producto 8', 'esta es la descripcion', 79, 'cloth_1.jpg', 23, 1, 'XL', 'Blue'),
(13, 'Producto 9', 'esta es la descripcion', 203, 'cloth_1.jpg', 23, 1, 'XL', 'Blue'),
(14, 'Producto 10', 'esta es la descripcion', 178, 'cloth_1.jpg', 43, 1, 'XL', 'Blue'),
(15, 'Producto 11', 'esta es la descripcion', 203, 'cloth_1.jpg', 9, 1, 'XL', 'Blue'),
(16, 'Producto 12', 'esta es la descripcion', 16, 'cloth_1.jpg', 39, 1, 'XL', 'Blue'),
(17, 'Producto 13', 'esta es la descripcion', 230, 'cloth_1.jpg', 77, 1, 'XL', 'Blue'),
(18, 'Producto 14', 'esta es la descripcion', 916, 'cloth_1.jpg', 25, 1, 'XL', 'Blue'),
(19, 'Producto 15', 'esta es la descripcion', 197, 'cloth_1.jpg', 93, 1, 'XL', 'Blue'),
(20, 'Producto 16', 'esta es la descripcion', 362, 'cloth_1.jpg', 30, 1, 'XL', 'Blue'),
(21, 'Producto 17', 'esta es la descripcion', 379, 'cloth_1.jpg', 38, 1, 'XL', 'Blue'),
(22, 'Producto 18', 'esta es la descripcion', 513, 'cloth_1.jpg', 36, 1, 'XL', 'Blue'),
(23, 'Producto 19', 'esta es la descripcion', 397, 'cloth_1.jpg', 80, 1, 'XL', 'Blue'),
(24, 'Producto 20', 'esta es la descripcion', 523, 'cloth_1.jpg', 77, 1, 'XL', 'Blue'),
(25, 'Producto 21', 'esta es la descripcion', 55, 'cloth_1.jpg', 54, 1, 'XL', 'Blue'),
(26, 'Producto 22', 'esta es la descripcion', 318, 'cloth_1.jpg', 1, 1, 'XL', 'Blue'),
(27, 'Producto 23', 'esta es la descripcion', 135, 'cloth_1.jpg', 95, 1, 'XL', 'Blue'),
(28, 'Producto 24', 'esta es la descripcion', 625, 'cloth_1.jpg', 91, 1, 'XL', 'Blue'),
(29, 'Producto 25', 'esta es la descripcion', 75, 'cloth_1.jpg', 47, 1, 'XL', 'Blue'),
(30, 'Producto 26', 'esta es la descripcion', 962, 'cloth_1.jpg', 16, 1, 'XL', 'Blue'),
(31, 'Producto 27', 'esta es la descripcion', 221, 'cloth_1.jpg', 55, 1, 'XL', 'Blue'),
(32, 'Producto 28', 'esta es la descripcion', 432, 'cloth_1.jpg', 46, 1, 'XL', 'Blue'),
(33, 'Producto 29', 'esta es la descripcion', 337, 'cloth_1.jpg', 55, 1, 'XL', 'Blue'),
(34, 'Producto 30', 'esta es la descripcion', 80, 'cloth_1.jpg', 17, 1, 'XL', 'Blue'),
(35, 'Producto 31', 'esta es la descripcion', 572, 'cloth_1.jpg', 49, 1, 'XL', 'Blue'),
(36, 'Producto 32', 'esta es la descripcion', 311, 'cloth_1.jpg', 32, 1, 'XL', 'Blue'),
(37, 'Producto 33', 'esta es la descripcion', 580, 'cloth_1.jpg', 20, 1, 'XL', 'Blue'),
(38, 'Producto 34', 'esta es la descripcion', 106, 'cloth_1.jpg', 27, 1, 'XL', 'Blue'),
(39, 'Producto 35', 'esta es la descripcion', 303, 'cloth_1.jpg', 30, 1, 'XL', 'Blue'),
(40, 'Producto 36', 'esta es la descripcion', 884, 'cloth_1.jpg', 94, 1, 'XL', 'Blue'),
(41, 'Producto 37', 'esta es la descripcion', 607, 'cloth_1.jpg', 17, 1, 'XL', 'Blue'),
(42, 'Producto 38', 'esta es la descripcion', 183, 'cloth_1.jpg', 97, 1, 'XL', 'Blue'),
(43, 'Producto 39', 'esta es la descripcion', 142, 'cloth_1.jpg', 22, 1, 'XL', 'Blue'),
(44, 'Producto 40', 'esta es la descripcion', 533, 'cloth_1.jpg', 77, 1, 'XL', 'Blue'),
(45, 'Producto 41', 'esta es la descripcion', 373, 'cloth_1.jpg', 33, 1, 'XL', 'Blue'),
(46, 'Producto 42', 'esta es la descripcion', 532, 'cloth_1.jpg', 37, 1, 'XL', 'Blue'),
(47, 'Producto 43', 'esta es la descripcion', 122, 'cloth_1.jpg', 27, 1, 'XL', 'Blue'),
(48, 'Producto 44', 'esta es la descripcion', 80, 'cloth_1.jpg', 14, 1, 'XL', 'Blue'),
(49, 'Producto 45', 'esta es la descripcion', 632, 'cloth_1.jpg', 71, 1, 'XL', 'Blue'),
(50, 'Producto 46', 'esta es la descripcion', 68, 'cloth_1.jpg', 54, 1, 'XL', 'Blue'),
(51, 'Producto 47', 'esta es la descripcion', 200, 'cloth_1.jpg', 80, 1, 'XL', 'Blue'),
(52, 'Producto 48', 'esta es la descripcion', 103, 'cloth_1.jpg', 24, 1, 'XL', 'Blue'),
(53, 'Producto 499', 'esta es la descripcion', 245, '1606520066.jpg', 22, 1, 'XL', 'Blue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta`
--

CREATE TABLE `productos_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_venta`
--

INSERT INTO `productos_venta` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 1, 3, 1, 40, 40),
(2, 1, 1, 1, 60, 60),
(3, 2, 3, 2, 40, 80),
(4, 3, 3, 2, 40, 80),
(5, 4, 3, 1, 40, 40),
(6, 5, 2, 3, 20, 60),
(7, 6, 1, 3, 60, 180),
(8, 7, 1, 3, 60, 180),
(9, 8, 3, 3, 40, 120),
(10, 9, 3, 3, 40, 120),
(11, 10, 3, 3, 40, 120),
(12, 11, 3, 3, 40, 120),
(13, 12, 3, 3, 40, 120),
(14, 13, 3, 3, 40, 120),
(15, 14, 3, 3, 40, 120),
(16, 15, 3, 3, 40, 120),
(17, 16, 3, 3, 40, 120),
(18, 17, 3, 3, 40, 120),
(19, 18, 3, 3, 40, 120),
(20, 19, 3, 3, 40, 120),
(21, 20, 3, 3, 40, 120),
(22, 21, 3, 3, 40, 120),
(23, 22, 3, 3, 40, 120),
(24, 23, 3, 3, 40, 120),
(25, 24, 3, 3, 40, 120),
(26, 25, 3, 3, 40, 120),
(27, 26, 3, 3, 40, 120),
(28, 27, 3, 3, 40, 120),
(29, 28, 3, 3, 40, 120),
(30, 29, 3, 3, 40, 120),
(31, 30, 3, 4, 40, 160),
(32, 31, 3, 4, 40, 160),
(33, 32, 3, 4, 40, 160),
(34, 33, 3, 4, 40, 160),
(35, 34, 3, 4, 40, 160),
(36, 35, 3, 4, 40, 160),
(37, 36, 3, 5, 40, 200),
(38, 37, 3, 5, 40, 200),
(39, 38, 3, 5, 40, 200),
(40, 39, 3, 5, 40, 200),
(41, 40, 3, 5, 40, 200),
(42, 41, 3, 5, 40, 200),
(43, 42, 3, 5, 40, 200),
(44, 43, 3, 5, 40, 200),
(45, 44, 3, 5, 40, 200),
(46, 45, 3, 5, 40, 200),
(47, 46, 3, 5, 40, 200),
(48, 47, 3, 5, 40, 200),
(49, 48, 3, 5, 40, 200),
(50, 49, 3, 5, 40, 200),
(51, 50, 3, 5, 40, 200),
(52, 51, 3, 5, 40, 200),
(53, 52, 3, 5, 40, 200),
(54, 53, 3, 5, 40, 200),
(55, 55, 1, 5, 60, 300),
(56, 56, 3, 1, 40, 40),
(57, 58, 53, 6, 244, 1464),
(58, 58, 5, 3, 621, 1863),
(59, 59, 53, 2, 244, 488),
(60, 60, 53, 2, 244, 488),
(61, 61, 53, 1, 244, 244),
(62, 63, 53, 1, 244, 244),
(63, 65, 53, 1, 244, 244),
(64, 66, 53, 1, 244, 244),
(65, 67, 53, 1, 244, 244),
(66, 69, 52, 1, 103, 103),
(67, 71, 53, 1, 244, 244),
(68, 73, 53, 1, 244, 244),
(69, 75, 52, 1, 103, 103),
(70, 77, 50, 1, 68, 68),
(71, 79, 53, 1, 244, 244),
(72, 81, 51, 1, 200, 200),
(73, 83, 48, 1, 80, 80),
(74, 85, 49, 1, 632, 632),
(75, 87, 48, 1, 80, 80),
(76, 88, 53, 1, 244, 244),
(77, 90, 49, 1, 632, 632),
(78, 91, 46, 4, 532, 2128),
(79, 91, 8, 3, 172, 516),
(80, 92, 53, 1, 244, 244),
(81, 94, 48, 1, 80, 80),
(82, 95, 52, 1, 103, 103),
(83, 96, 52, 1, 103, 103),
(84, 97, 51, 1, 200, 200),
(85, 98, 52, 1, 103, 103),
(86, 98, 51, 1, 200, 200),
(87, 99, 53, 1, 245, 245),
(88, 100, 48, 1, 80, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_perfil` varchar(300) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `telefono`, `email`, `password`, `img_perfil`, `nivel`) VALUES
(91, 'jose hernandez', '567', 'jose@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'default.jpg', 'admin'),
(94, 'luis perezj', '5654', 'luis@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78', 'default.jpg', 'cliente'),
(96, 'kike perezt', '123', 'kike@gmail.com', '707d14912bb250caf67dfe0ea4035681fbfc4f56', 'default.jpg', 'cliente'),
(97, 'asd asd', '1125', 'asd@gmail.com', 'fc1200c7a7aa52109d762a9f005b149abef01479', 'default.jpg', 'cliente'),
(98, 'julian rodrigo', '463', 'julian@gmail.com', '4816dabf8db1bc6cac35b3a24cab2ff844b5b0c7', 'default.jpg', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_cupon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_usuario`, `total`, `fecha`, `status`, `id_pago`, `id_cupon`) VALUES
(1, 1, 100, '2020-11-24 14:11:13', 'presentacion', 0, 0),
(2, 1, 80, '2020-11-24 16:11:24', 'presentacion', 0, 0),
(3, 2, 80, '2020-11-24 16:11:31', 'presentacion', 0, 0),
(4, 3, 40, '2020-11-24 16:11:38', 'presentacion', 0, 0),
(5, 4, 60, '2020-11-24 16:11:04', 'presentacion', 0, 0),
(6, 5, 180, '2020-11-24 16:11:57', 'presentacion', 0, 0),
(7, 6, 180, '2020-11-24 16:11:44', 'presentacion', 0, 0),
(8, 7, 120, '2020-11-24 16:11:11', 'presentacion', 0, 0),
(9, 8, 120, '2020-11-24 16:11:16', 'presentacion', 0, 0),
(10, 9, 120, '2020-11-24 17:11:32', 'presentacion', 0, 0),
(11, 10, 120, '2020-11-24 17:11:57', 'presentacion', 0, 0),
(12, 11, 120, '2020-11-24 17:11:54', 'presentacion', 0, 0),
(13, 12, 120, '2020-11-24 17:11:30', 'presentacion', 0, 0),
(14, 13, 120, '2020-11-24 17:11:31', 'presentacion', 0, 0),
(15, 14, 120, '2020-11-24 17:11:34', 'presentacion', 0, 0),
(16, 15, 120, '2020-11-24 17:11:36', 'presentacion', 0, 0),
(17, 16, 120, '2020-11-24 17:11:36', 'presentacion', 0, 0),
(18, 17, 120, '2020-11-24 17:11:36', 'presentacion', 0, 0),
(19, 18, 120, '2020-11-24 17:11:36', 'presentacion', 0, 0),
(20, 19, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(21, 20, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(22, 21, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(23, 22, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(24, 23, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(25, 24, 120, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(26, 25, 120, '2020-11-24 17:11:38', 'presentacion', 0, 0),
(27, 26, 120, '2020-11-24 17:11:38', 'presentacion', 0, 0),
(28, 27, 120, '2020-11-24 17:11:38', 'presentacion', 0, 0),
(29, 28, 120, '2020-11-24 17:11:18', 'presentacion', 0, 0),
(30, 29, 160, '2020-11-24 17:11:24', 'presentacion', 0, 0),
(31, 30, 160, '2020-11-24 17:11:28', 'presentacion', 0, 0),
(32, 31, 160, '2020-11-24 17:11:16', 'presentacion', 0, 0),
(33, 32, 160, '2020-11-24 17:11:21', 'presentacion', 0, 0),
(34, 33, 160, '2020-11-24 17:11:54', 'presentacion', 0, 0),
(35, 34, 160, '2020-11-24 17:11:56', 'presentacion', 0, 0),
(36, 35, 200, '2020-11-24 17:11:02', 'presentacion', 0, 0),
(37, 36, 200, '2020-11-24 17:11:25', 'presentacion', 0, 0),
(38, 37, 200, '2020-11-24 17:11:28', 'presentacion', 0, 0),
(39, 38, 200, '2020-11-24 17:11:41', 'presentacion', 0, 0),
(40, 39, 200, '2020-11-24 17:11:43', 'presentacion', 0, 0),
(41, 40, 200, '2020-11-24 17:11:43', 'presentacion', 0, 0),
(42, 41, 200, '2020-11-24 17:11:43', 'presentacion', 0, 0),
(43, 42, 200, '2020-11-24 17:11:43', 'presentacion', 0, 0),
(44, 43, 200, '2020-11-24 17:11:44', 'presentacion', 0, 0),
(45, 44, 200, '2020-11-24 17:11:46', 'presentacion', 0, 0),
(46, 45, 200, '2020-11-24 17:11:47', 'presentacion', 0, 0),
(47, 46, 200, '2020-11-24 17:11:53', 'presentacion', 0, 0),
(48, 47, 200, '2020-11-24 17:11:54', 'presentacion', 0, 0),
(49, 48, 200, '2020-11-24 17:11:55', 'presentacion', 0, 0),
(50, 49, 200, '2020-11-24 17:11:58', 'presentacion', 0, 0),
(51, 50, 200, '2020-11-24 17:11:37', 'presentacion', 0, 0),
(52, 51, 200, '2020-11-24 17:11:55', 'presentacion', 0, 0),
(53, 52, 200, '2020-11-24 17:11:49', 'presentacion', 0, 0),
(54, 53, 0, '2020-11-24 17:11:12', 'presentacion', 0, 0),
(55, 54, 300, '2020-11-24 17:11:39', 'presentacion', 0, 0),
(56, 55, 40, '2020-11-24 17:11:00', 'presentacion', 0, 0),
(57, 56, 0, '2020-11-25 15:11:18', 'presentacion', 0, 0),
(58, 57, 3327, '2020-11-25 17:11:46', 'presentacion', 0, 0),
(59, 58, 488, '2020-11-25 17:11:48', 'presentacion', 0, 0),
(60, 59, 488, '2020-11-25 17:11:27', 'presentacion', 0, 0),
(61, 60, 244, '2020-11-26 11:11:03', 'presentacion', 0, 0),
(62, 61, 0, '2020-11-26 11:11:02', 'presentacion', 0, 0),
(63, 62, 244, '2020-11-26 11:11:10', 'presentacion', 0, 0),
(64, 63, 0, '2020-11-26 11:11:02', 'presentacion', 0, 0),
(65, 64, 244, '2020-11-26 11:11:08', 'presentacion', 0, 0),
(66, 65, 244, '2020-11-26 11:11:49', 'presentacion', 0, 0),
(67, 66, 244, '2020-11-26 11:11:13', 'presentacion', 0, 0),
(68, 67, 0, '2020-11-26 11:11:38', 'presentacion', 0, 0),
(69, 68, 103, '2020-11-26 11:11:44', 'presentacion', 0, 0),
(70, 69, 0, '2020-11-26 11:11:00', 'presentacion', 0, 0),
(71, 70, 244, '2020-11-26 11:11:07', 'presentacion', 0, 0),
(72, 71, 0, '2020-11-26 11:11:24', 'presentacion', 0, 0),
(73, 72, 244, '2020-11-26 11:11:31', 'presentacion', 0, 0),
(74, 73, 0, '2020-11-26 11:11:24', 'presentacion', 0, 0),
(75, 74, 103, '2020-11-26 11:11:31', 'presentacion', 0, 0),
(76, 75, 0, '2020-11-26 12:11:03', 'presentacion', 0, 0),
(77, 76, 68, '2020-11-26 12:11:40', 'presentacion', 0, 0),
(78, 77, 0, '2020-11-26 12:11:55', 'presentacion', 0, 0),
(79, 78, 244, '2020-11-26 12:11:13', 'presentacion', 0, 0),
(80, 79, 0, '2020-11-26 12:11:40', 'presentacion', 0, 0),
(81, 80, 200, '2020-11-26 12:11:46', 'presentacion', 0, 0),
(82, 81, 0, '2020-11-26 12:11:38', 'presentacion', 0, 0),
(83, 82, 80, '2020-11-26 12:11:44', 'presentacion', 0, 0),
(84, 83, 0, '2020-11-26 12:11:55', 'presentacion', 0, 0),
(85, 84, 632, '2020-11-26 12:11:00', 'presentacion', 0, 0),
(86, 85, 0, '2020-11-26 12:11:50', 'presentacion', 0, 0),
(87, 86, 80, '2020-11-26 12:11:00', 'presentacion', 0, 0),
(88, 87, 244, '2020-11-26 13:11:57', 'presentacion', 0, 0),
(89, 88, 0, '2020-11-26 13:11:12', 'presentacion', 0, 0),
(90, 89, 632, '2020-11-26 13:11:18', 'presentacion', 0, 0),
(91, 90, 2644, '2020-11-26 15:11:25', 'presentacion', 0, 0),
(92, 91, 244, '2020-11-27 18:11:42', 'presentacion', 0, 0),
(93, 92, 0, '2020-11-27 18:11:29', 'presentacion', 0, 0),
(94, 93, 80, '2020-11-27 18:11:02', 'presentacion', 0, 0),
(95, 94, 103, '2020-11-27 07:11:06', 'presentacion', 0, 0),
(96, 95, 103, '2020-12-01 11:12:26', '', 0, 0),
(97, 96, 200, '2020-12-01 11:12:20', '', 0, 0),
(98, 97, 303, '2020-12-01 16:12:41', '', 0, 0),
(99, 98, 245, '2020-12-01 17:12:10', '', 0, 5),
(100, 99, 80, '2020-12-01 17:12:41', '', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
