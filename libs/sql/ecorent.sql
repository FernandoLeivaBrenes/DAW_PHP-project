-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2019 a las 12:28:32
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecorent`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `uuid_categoria` varchar(26) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itv`
--

CREATE TABLE `itv` (
  `uuid_vehiculo` varchar(26) NOT NULL,
  `fecha_actual` date NOT NULL,
  `fecha_proxima` date DEFAULT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `uuid_marca` varchar(26) NOT NULL,
  `nombre_fabri` varchar(100) NOT NULL,
  `dir_marca` varchar(100) DEFAULT NULL,
  `nombre_marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `uuid_modelo` varchar(26) NOT NULL,
  `d.3-nombre_modelo` varchar(100) NOT NULL,
  `g-masa_orden_marcha` decimal(5,3) NOT NULL,
  `f.4-altura` int(5) NOT NULL,
  `f.5-anchura` int(5) NOT NULL,
  `f.6-longitud` int(5) NOT NULL,
  `l.2-neumáticos` varchar(100) NOT NULL,
  `p.2-potenciaKW` decimal(3,3) NOT NULL,
  `p.2.1-potenciaFiscal` decimal(3,3) NOT NULL,
  `s.1-numero_plazas` int(2) NOT NULL,
  `autonomia` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro_vehiculo`
--

CREATE TABLE `seguro_vehiculo` (
  `uuid_seguro` varchar(26) NOT NULL,
  `uuid_vehiculo` varchar(26) NOT NULL,
  `n_poliza` varchar(100) NOT NULL,
  `fecha_vence` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `uuid_token` varchar(26) NOT NULL,
  `uuid_usu` varchar(26) NOT NULL,
  `token` varchar(32) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `fecha_uso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `uuid_usu` varchar(26) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_1` varchar(100) NOT NULL,
  `apellido_2` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `fecha_init` date DEFAULT NULL,
  `tipo_usu` int(1) DEFAULT 0,
  `img_carnet` varchar(255) DEFAULT NULL,
  `img_cerfil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `uuid_vehiculo` varchar(26) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `n_chasis` varchar(18) NOT NULL,
  `uuid_marca` varchar(26) NOT NULL,
  `uuid_modelo` varchar(26) NOT NULL,
  `uuid_categoria` varchar(26) NOT NULL,
  `uuid_seguro` varchar(26) NOT NULL,
  `uuid_itv` varchar(26) NOT NULL,
  `en_venta` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_observacion`
--

CREATE TABLE `vehiculo_observacion` (
  `uuid_vehiculo` varchar(26) NOT NULL,
  `fecha_observacion` date NOT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`uuid_categoria`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`uuid_marca`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`uuid_modelo`);

--
-- Indices de la tabla `seguro_vehiculo`
--
ALTER TABLE `seguro_vehiculo`
  ADD PRIMARY KEY (`uuid_seguro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`uuid_usu`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`uuid_vehiculo`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `n_chasis` (`n_chasis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
