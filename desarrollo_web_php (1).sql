-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2022 a las 02:27:53
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desarrollo_web_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depencias`
--

CREATE TABLE `depencias` (
  `ID` int(11) NOT NULL,
  `PROGRAMAS` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `depencias`
--

INSERT INTO `depencias` (`ID`, `PROGRAMAS`) VALUES
(1, 'ING DE SISTEMAS'),
(2, 'ADMI EN SALUD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `ID_TIPO_USUARIO` int(11) NOT NULL,
  `TIPO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`ID_TIPO_USUARIO`, `TIPO`) VALUES
(1, 'PROFESOR'),
(2, 'ADMINISTRATIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `NOMBRES` varchar(100) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `CORREO` varchar(150) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(535) NOT NULL,
  `TIPO_USUARIO_PK` int(11) NOT NULL,
  `DEPENDENCIA_PK` int(11) NOT NULL,
  `IDENTIFICACION` int(20) NOT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `depencias`
--
ALTER TABLE `depencias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`ID_TIPO_USUARIO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TIPO_USUARIO_PK` (`TIPO_USUARIO_PK`),
  ADD KEY `DEPENDENCIA_PK` (`DEPENDENCIA_PK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `depencias`
--
ALTER TABLE `depencias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `ID_TIPO_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`DEPENDENCIA_PK`) REFERENCES `depencias` (`ID`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`TIPO_USUARIO_PK`) REFERENCES `tipo_usuario` (`ID_TIPO_USUARIO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
