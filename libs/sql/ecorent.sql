-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2019 a las 01:32:43
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
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `uuid_alquiler` varchar(26) NOT NULL,
  `uuid_usuario` varchar(26) NOT NULL,
  `uuid_vehiculo` varchar(26) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `punto_inicio` varchar(30) NOT NULL,
  `punto_fin` varchar(30) DEFAULT NULL,
  `modo` varchar(6) NOT NULL,
  `cod_vehiculo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `fecha_proxima` date NOT NULL,
  `respuesta` text DEFAULT NULL,
  `respuesta_bool` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `uuid_marca` varchar(26) NOT NULL,
  `nombre_fabri` varchar(100) NOT NULL,
  `dir_fabricante` varchar(100) DEFAULT NULL,
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
  `uuid_usuario` varchar(26) NOT NULL,
  `token` varchar(32) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `fecha_uso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `uuid_usuario` varchar(26) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_1` varchar(100) NOT NULL,
  `apellido_2` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `tipo_usuario` int(1) DEFAULT 0,
  `API_code` varchar(32) DEFAULT NULL
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
  `en_venta` tinyint(1) NOT NULL DEFAULT 0,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_observacion`
--

CREATE TABLE `vehiculo_observacion` (
  `uuid_obs` varchar(26) NOT NULL,
  `uuid_vehiculo` varchar(26) NOT NULL,
  `fecha_observacion` date NOT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`uuid_alquiler`),
  ADD KEY `FK_alquiler_usuario` (`uuid_usuario`),
  ADD KEY `FK_alquiler_vehiculo` (`uuid_vehiculo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`uuid_categoria`);

--
-- Indices de la tabla `itv`
--
ALTER TABLE `itv`
  ADD PRIMARY KEY (`uuid_vehiculo`,`fecha_actual`);

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
  ADD PRIMARY KEY (`uuid_seguro`),
  ADD KEY `FK_seguro_vehiculo` (`uuid_vehiculo`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`uuid_token`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `FK_token_usuario` (`uuid_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`uuid_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `API_code` (`API_code`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`uuid_vehiculo`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `n_chasis` (`n_chasis`),
  ADD KEY `FK_marca_vehiculo` (`uuid_marca`),
  ADD KEY `FK_modelo_vehiculo` (`uuid_modelo`),
  ADD KEY `FK_categoria_vehiculo` (`uuid_categoria`);

--
-- Indices de la tabla `vehiculo_observacion`
--
ALTER TABLE `vehiculo_observacion`
  ADD PRIMARY KEY (`uuid_obs`),
  ADD KEY `FK_vehiculo_observacion` (`uuid_vehiculo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `FK_alquiler_usuario` FOREIGN KEY (`uuid_usuario`) REFERENCES `usuario` (`uuid_usuario`),
  ADD CONSTRAINT `FK_alquiler_vehiculo` FOREIGN KEY (`uuid_vehiculo`) REFERENCES `vehiculo` (`uuid_vehiculo`);

--
-- Filtros para la tabla `itv`
--
ALTER TABLE `itv`
  ADD CONSTRAINT `FK_itv_vehiculo` FOREIGN KEY (`uuid_vehiculo`) REFERENCES `vehiculo` (`uuid_vehiculo`);

--
-- Filtros para la tabla `seguro_vehiculo`
--
ALTER TABLE `seguro_vehiculo`
  ADD CONSTRAINT `FK_seguro_vehiculo` FOREIGN KEY (`uuid_vehiculo`) REFERENCES `vehiculo` (`uuid_vehiculo`);

--
-- Filtros para la tabla `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FK_token_usuario` FOREIGN KEY (`uuid_usuario`) REFERENCES `usuario` (`uuid_usuario`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK_categoria_vehiculo` FOREIGN KEY (`uuid_categoria`) REFERENCES `categoria` (`uuid_categoria`),
  ADD CONSTRAINT `FK_marca_vehiculo` FOREIGN KEY (`uuid_marca`) REFERENCES `marca` (`uuid_marca`),
  ADD CONSTRAINT `FK_modelo_vehiculo` FOREIGN KEY (`uuid_modelo`) REFERENCES `modelo` (`uuid_modelo`);

--
-- Filtros para la tabla `vehiculo_observacion`
--
ALTER TABLE `vehiculo_observacion`
  ADD CONSTRAINT `FK_vehiculo_observacion` FOREIGN KEY (`uuid_vehiculo`) REFERENCES `vehiculo` (`uuid_vehiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
