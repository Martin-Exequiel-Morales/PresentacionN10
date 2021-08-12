-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-08-2021 a las 19:03:42
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_encuestasv1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `carrera` int(11) NOT NULL,
  `usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anio` date NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `dni`, `carrera`, `usuario`, `anio`, `idTipoUsuario`) VALUES
(2, 'fulano', '11111111', 1, 'fulano', '2021-06-23', 2),
(3, 'Maria la del Barrio', '22222222', 2, 'barrio', '2021-07-06', 2),
(4, 'pepe', '33333333', 3, 'pepe', '2021-07-07', 2),
(5, 'Carlos Gardel', '44444444', 1, 'Carlos', '2021-07-08', 2),
(6, 'Mengano', '12345678', 1, 'Mengano', '2021-07-08', 2),
(7, 'Simon', '78965412', 1, 'Simon', '2021-08-10', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`) VALUES
(1, 'Analista de Sistemas'),
(2, 'Tecnico Administrativo Contable'),
(3, 'Preceptoría'),
(4, 'Magisterio'),
(5, 'Magister Kake');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
CREATE TABLE IF NOT EXISTS `encuestas` (
  `id_encuesta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT '1970-01-01 03:00:00',
  `fecha_final` timestamp NOT NULL DEFAULT '1970-01-01 03:00:00',
  PRIMARY KEY (`id_encuesta`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id_encuesta`, `id_usuario`, `titulo`, `id_carrera`, `id_materia`, `descripcion`, `estado`, `fecha_inicio`, `fecha_final`) VALUES
(17, 1, 'Sistema Procesamiento de Datos', 1, 1, 'Danos tu opinion sobre el docente', 1, '2021-07-08 19:19:48', '2021-07-08 19:19:21'),
(18, 1, 'Matematica', 1, 2, 'Responder', 1, '2021-08-10 19:43:17', '2021-08-10 19:40:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filtro_encuesta`
--

DROP TABLE IF EXISTS `filtro_encuesta`;
CREATE TABLE IF NOT EXISTS `filtro_encuesta` (
  `id_encuesta_filtro` int(11) NOT NULL,
  `carrera` int(11) NOT NULL,
  `materia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `filtro_encuesta`
--

INSERT INTO `filtro_encuesta` (`id_encuesta_filtro`, `carrera`, `materia`) VALUES
(0, 5, 5),
(1, 6, 6),
(33, 8, 8),
(35, 6, 6),
(37, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCarrera` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `idCarrera`, `idMateria`, `idAlumno`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 2),
(3, 1, 4, 2),
(4, 1, 2, 2),
(5, 2, 3, 3),
(6, 1, 1, 5),
(7, 1, 1, 6),
(8, 1, 1, 7),
(9, 1, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `idCarrera`, `idProfesor`) VALUES
(1, 'Sistema de Procesamiento de Datos', 1, 1),
(2, 'Matematica', 1, 1),
(3, 'Filosofia', 2, 1),
(4, 'Programacion 1', 1, 1),
(5, 'MiniComputadoras', 1, 1),
(7, 'Etica Profesional', 1, 1),
(8, 'Etica 1 ', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) NOT NULL,
  `valor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_pregunta`, `valor`) VALUES
(25, 10, 'Si'),
(26, 10, 'No'),
(27, 10, 'A veces'),
(28, 11, 'Si'),
(29, 11, 'Faltaron pocos temas'),
(30, 11, 'Faltaron muchos temas'),
(31, 12, 'Si'),
(32, 12, 'No'),
(33, 12, 'A veces'),
(34, 13, 'Si'),
(35, 13, 'No'),
(36, 13, 'A veces'),
(37, 14, 'Si'),
(38, 14, 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_pregunta` int(11) NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_encuesta` (`id_encuesta`),
  KEY `id_tipo_pregunta` (`id_tipo_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `id_encuesta`, `titulo`, `id_tipo_pregunta`) VALUES
(10, 17, 'El profesor llega a horario?', 1),
(11, 17, 'Se dieron todos los temas del programa anual?', 1),
(12, 18, 'El profesor explica detalladamente los temas?', 1),
(13, 18, 'Sus clases comienzan y finalizan en tiempo y forma?', 1),
(14, 18, 'hfsjdgfefdsjfhdsfh?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `legajo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`, `legajo`, `correo`, `telefono`) VALUES
(1, 'Helmut Heinz Dehner', '123', 'hhd@gmail.com', '55555'),
(2, 'Magister Kake', '123', 'hhd@gmail.com', '55555'),
(3, 'Maria la del Barrio', '1234', 'hhd@gmail.com', '111212121');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

DROP TABLE IF EXISTS `resultados`;
CREATE TABLE IF NOT EXISTS `resultados` (
  `id_resultado` int(11) NOT NULL AUTO_INCREMENT,
  `id_opcion` int(11) NOT NULL,
  PRIMARY KEY (`id_resultado`),
  KEY `id_opcion` (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `resultados`
--

INSERT INTO `resultados` (`id_resultado`, `id_opcion`) VALUES
(10, 25),
(14, 25),
(25, 25),
(12, 27),
(26, 28),
(11, 29),
(13, 29),
(15, 29),
(27, 31),
(19, 32),
(16, 33),
(22, 33),
(20, 34),
(28, 34),
(17, 35),
(23, 35),
(18, 37),
(24, 37),
(21, 38),
(29, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

DROP TABLE IF EXISTS `tipo_pregunta`;
CREATE TABLE IF NOT EXISTS `tipo_pregunta` (
  `id_tipo_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_tipo_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_pregunta`
--

INSERT INTO `tipo_pregunta` (`id_tipo_pregunta`, `nombre`, `descripcion`) VALUES
(1, 'Selección múltiple', 'Se podrá escoger solo una opción\r\nelemento input type radio'),
(2, 'Desplegable', 'Se podrá escoger una opción\r\nElemento select y option'),
(3, 'Casilla de verificación', 'Se podrá escoger más de una opción\r\ninput type checkbox'),
(4, 'Texto', 'Se almacenara la respuesta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(15) NOT NULL,
  `clave` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `clave`, `nombres`, `apellidos`, `email`, `id_tipo_usuario`) VALUES
(1, 'admin', 'Normal 10', 'escuela', 'normal10@gmail.com', 1),
(2, 'alumno', 'fulano', 'fulanes', 'lalala@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_encuestas`
--

DROP TABLE IF EXISTS `usuarios_encuestas`;
CREATE TABLE IF NOT EXISTS `usuarios_encuestas` (
  `id_usuario` int(15) NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_encuesta` (`id_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_encuestas`
--

INSERT INTO `usuarios_encuestas` (`id_usuario`, `id_encuesta`) VALUES
(2, 17);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_tipo_pregunta`) REFERENCES `tipo_pregunta` (`id_tipo_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preguntas_ibfk_2` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id_encuesta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_encuestas`
--
ALTER TABLE `usuarios_encuestas`
  ADD CONSTRAINT `usuarios_encuestas_ibfk_2` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id_encuesta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_encuestas_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
