-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2015 a las 08:16:16
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `saetis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_AD` varchar(45) NOT NULL,
  `APELLIDOS_AD` varchar(45) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`NOMBRE_U`, `NOMBRES_AD`, `APELLIDOS_AD`) VALUES
('Admin1', 'Ivan', 'Morales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE IF NOT EXISTS `aplicacion` (
  `APLICACION_A` varchar(50) NOT NULL,
  PRIMARY KEY (`APLICACION_A`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE IF NOT EXISTS `asesor` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_A` varchar(50) NOT NULL,
  `APELLIDOS_A` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;

--
-- Volcado de datos para la tabla `asesor`
--

INSERT INTO `asesor` (`NOMBRE_U`, `NOMBRES_A`, `APELLIDOS_A`) VALUES
('LeticiaB', 'Leticia', 'Blanco Coca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE IF NOT EXISTS `asignacion` (
  `ID_R` int(11) NOT NULL,
  `EMISOR_A` varchar(30) NOT NULL,
  `RECEPTOR_A` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `ID_R` int(11) NOT NULL,
  `CODIGO_SOCIO_A` int(11) NOT NULL,
  `ASISTENCIA_A` tinyint(1) NOT NULL,
  `LICENCIA_A` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_R`,`CODIGO_SOCIO_A`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_semanal`
--

CREATE TABLE IF NOT EXISTS `asistencia_semanal` (
  `ID_AS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_R` int(11) NOT NULL,
  `GRUPO_AS` varchar(25) NOT NULL,
  `CODIGO_SOCIO_AS` int(11) NOT NULL,
  `ASISTENCIA_AS` tinyint(1) NOT NULL,
  `LICENCIA_AS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_AS`) USING BTREE,
  KEY `FK_REGISTRO__ASISTENCIA_SEMANAL` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `ID_C` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `ID_N` int(11) NOT NULL,
  `COMENTARIO` text NOT NULL,
  `FECHA_C` datetime NOT NULL,
  `AUTOR_C` text NOT NULL,
  PRIMARY KEY (`ID_C`,`NOMBRE_U`,`ID_N`),
  KEY `fk_comentarios_noticias1_idx` (`ID_N`,`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criteriocalificacion`
--

CREATE TABLE IF NOT EXISTS `criteriocalificacion` (
  `ID_CRITERIO_C` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CRITERIO_C` varchar(45) NOT NULL,
  `TIPO_CRITERIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CRITERIO_C`,`NOMBRE_U`),
  KEY `fk_criterioCalificacion_asesor1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `criteriocalificacion`
--

INSERT INTO `criteriocalificacion` (`ID_CRITERIO_C`, `NOMBRE_U`, `NOMBRE_CRITERIO_C`, `TIPO_CRITERIO`) VALUES
(5, 'LeticiaB', 'PUNTAJE', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio_evaluacion`
--

CREATE TABLE IF NOT EXISTS `criterio_evaluacion` (
  `ID_CRITERIO_E` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CRITERIO_E` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_CRITERIO_E`,`NOMBRE_U`),
  KEY `fk_criterio_evaluacion_asesor1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

CREATE TABLE IF NOT EXISTS `descripcion` (
  `ID_R` int(11) NOT NULL,
  `DESCRIPCION_D` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

--
-- Volcado de datos para la tabla `descripcion`
--

INSERT INTO `descripcion` (`ID_R`, `DESCRIPCION_D`) VALUES
(55, 'Descripcion'),
(57, 'Notificacion de Conformidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `ID_D` int(11) NOT NULL AUTO_INCREMENT,
  `ID_R` int(11) NOT NULL,
  `TAMANIO_D` int(11) NOT NULL,
  `RUTA_D` varchar(100) NOT NULL,
  `VISUALIZABLE_D` tinyint(1) NOT NULL,
  `DESCARGABLE_D` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_D`) USING BTREE,
  KEY `FK_REGISTRO_DOCUMENTO` (`ID_R`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`ID_D`, `ID_R`, `TAMANIO_D`, `RUTA_D`, `VISUALIZABLE_D`, `DESCARGABLE_D`) VALUES
(13, 56, 399400, '/Repositorio/FreeValue/InscripcionesyMatriculasPasos-TODOS_2014-08-12_10-22.pdf', 1, 1),
(14, 57, 1024, '../Repositorio/FreeValue/NC/NotificacionConformidad.pdf', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_r`
--

CREATE TABLE IF NOT EXISTS `documento_r` (
  `ID_R` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_P` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Volcado de datos para la tabla `documento_r`
--

INSERT INTO `documento_r` (`ID_R`, `CODIGO_P`) VALUES
(55, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE IF NOT EXISTS `entrega` (
  `ID_R` int(11) NOT NULL,
  `ENTREGABLE_P` varchar(30) NOT NULL,
  `ENTREGADO_P` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_R`,`ENTREGABLE_P`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrega`
--

INSERT INTO `entrega` (`ID_R`, `ENTREGABLE_P`, `ENTREGADO_P`) VALUES
(62, 'Documentacion', 0),
(63, 'Documentacion', 0),
(63, 'Software', 0),
(64, 'Documentacion', 0),
(64, 'Software', 0),
(65, 'Manuales', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregable`
--

CREATE TABLE IF NOT EXISTS `entregable` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ENTREGABLE_E` char(30) NOT NULL,
  `DESCRIPCION_E` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`,`ENTREGABLE_E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entregable`
--

INSERT INTO `entregable` (`NOMBRE_U`, `ENTREGABLE_E`, `DESCRIPCION_E`) VALUES
('FreeValue', 'Documentacion', 'Diagramas uml'),
('FreeValue', 'Manuales', 'Instalacion'),
('FreeValue', 'Software', 'Sw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `ESTADO_E` varchar(50) NOT NULL,
  PRIMARY KEY (`ESTADO_E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ESTADO_E`) VALUES
('asistencia registrada'),
('Deshabilitado'),
('en proceso'),
('Habilitado'),
('planificacion registrada'),
('registrar costo total proyecto'),
('registrar entregables'),
('registrar plan pagos'),
('registrar planificacion'),
('seguimiento registrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `ID_R` int(11) NOT NULL,
  `ID_E` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NOTA_E` int(11) NOT NULL,
  `PORCENTAJE` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`,`ID_E`) USING BTREE,
  UNIQUE KEY `ID_E` (`ID_E`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_realizacion`
--

CREATE TABLE IF NOT EXISTS `fecha_realizacion` (
  `ID_R` int(11) NOT NULL,
  `FECHA_FR` date NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fecha_realizacion`
--

INSERT INTO `fecha_realizacion` (`ID_R`, `FECHA_FR`) VALUES
(58, '2015-02-12'),
(59, '2015-02-26'),
(60, '2015-03-11'),
(61, '2015-03-21'),
(62, '0000-00-00'),
(63, '0000-00-00'),
(64, '0000-00-00'),
(65, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE IF NOT EXISTS `formulario` (
  `ID_FORM` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_FORM` varchar(45) NOT NULL,
  `ESTADO_FORM` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_FORM`,`NOMBRE_U`),
  KEY `fk_formulario_asesor1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_crit_e`
--

CREATE TABLE IF NOT EXISTS `form_crit_e` (
  `ID_FORM_CRIT_E` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(11) NOT NULL,
  `ID_CRITERIO_E` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORM_CRIT_E`),
  KEY `fk_formulario_has_criterio_evaluacion_criterio_evaluacion1_idx` (`ID_CRITERIO_E`),
  KEY `fk_formulario_has_criterio_evaluacion_formulario1_idx` (`ID_FORM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `from_crit_c`
--

CREATE TABLE IF NOT EXISTS `from_crit_c` (
  `ID_FORM_CRIT_C` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CRITERIO_C` int(11) NOT NULL,
  `ID_FORM` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORM_CRIT_C`),
  KEY `fk_criterioCalificacion_has_formulario_formulario1_idx` (`ID_FORM`),
  KEY `fk_criterioCalificacion_has_formulario_criterioCalificacion_idx` (`ID_CRITERIO_C`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE IF NOT EXISTS `gestion` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_G` varchar(45) NOT NULL,
  `FECHA_INICIO_G` date NOT NULL,
  `FECHA_FIN_G` date NOT NULL,
  PRIMARY KEY (`ID_G`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `gestion`
--

INSERT INTO `gestion` (`ID_G`, `NOM_G`, `FECHA_INICIO_G`, `FECHA_FIN_G`) VALUES
(1, 'I/2015', '2015-01-01', '2015-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_empresa`
--

CREATE TABLE IF NOT EXISTS `grupo_empresa` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CORTO_GE` char(50) NOT NULL,
  `NOMBRE_LARGO_GE` varchar(50) NOT NULL,
  `DIRECCION_GE` varchar(50) NOT NULL,
  `REPRESENTANTE_LEGAL_GE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;

--
-- Volcado de datos para la tabla `grupo_empresa`
--

INSERT INTO `grupo_empresa` (`NOMBRE_U`, `NOMBRE_CORTO_GE`, `NOMBRE_LARGO_GE`, `DIRECCION_GE`, `REPRESENTANTE_LEGAL_GE`) VALUES
('FreeValue', 'FreeValue', 'FreeValue SRL', 'Calle Jordan', 'Oscar Gamboa Acho'),
('Oasis', 'Oasis', 'Oasis SRL', 'Calle Jordan', 'Pablo Sahonero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador`
--

CREATE TABLE IF NOT EXISTS `indicador` (
  `ID_INDICADOR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CRITERIO_C` int(11) NOT NULL,
  `NOMBRE_INDICADOR` varchar(45) NOT NULL,
  `PUNTAJE_INDICADOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_INDICADOR`,`ID_CRITERIO_C`),
  KEY `fk_indicador_criterioCalificacion1_idx` (`ID_CRITERIO_C`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
  `NOMBRE_UA` varchar(50) NOT NULL,
  `NOMBRE_UGE` varchar(50) NOT NULL,
  `ESTADO_INSCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`NOMBRE_UA`,`NOMBRE_UGE`) USING BTREE,
  KEY `FK_ASESOR__INSCRIPCION` (`NOMBRE_UA`) USING BTREE,
  KEY `FK_GRUPO_EMPRESA__INSCRIPCION` (`NOMBRE_UGE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`NOMBRE_UA`, `NOMBRE_UGE`, `ESTADO_INSCRIPCION`) VALUES
('LeticiaB', 'FreeValue', 'Habilitado'),
('LeticiaB', 'Oasis', 'Deshabilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_proyecto`
--

CREATE TABLE IF NOT EXISTS `inscripcion_proyecto` (
  `CODIGO_P` int(11) NOT NULL,
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_CONTRATO` varchar(11) NOT NULL,
  PRIMARY KEY (`CODIGO_P`,`NOMBRE_U`),
  KEY `fk_inscripcion_proyecto_proyecto1_idx` (`CODIGO_P`),
  KEY `fk_inscripcion_proyecto_grupo_empresa1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion_proyecto`
--

INSERT INTO `inscripcion_proyecto` (`CODIGO_P`, `NOMBRE_U`, `ESTADO_CONTRATO`) VALUES
(3, 'FreeValue', 'Sin Firmar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_ge`
--

CREATE TABLE IF NOT EXISTS `lista_ge` (
  `NOMBRE_CORTO` varchar(100) NOT NULL,
  `NOMBRE_LARGO` varchar(100) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `REPRESENTANTE_LEGAL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_ge`
--

INSERT INTO `lista_ge` (`NOMBRE_CORTO`, `NOMBRE_LARGO`, `DIRECCION`, `REPRESENTANTE_LEGAL`) VALUES
('FreeValue', 'FreeValue SRL', 'Calle Jordan', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `ID_R` int(11) NOT NULL,
  `ASUNTO_M` varchar(30) NOT NULL,
  `MENSAJE_M` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `ID_N` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(50) NOT NULL,
  `NOMBRE_U` varchar(50) NOT NULL,
  `CALIF_N` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_N`,`NOMBRE_U`),
  KEY `fk_nota_grupo_empresa1_idx` (`NOMBRE_U`),
  KEY `fk_nota_formulario_idx` (`ID_FORM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_final`
--

CREATE TABLE IF NOT EXISTS `nota_final` (
  `ID_NF` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOTA_F` float NOT NULL,
  PRIMARY KEY (`ID_NF`,`NOMBRE_U`),
  KEY `fk_nota_final_grupo_empresa1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `ID_N` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `TITULO` text NOT NULL,
  `FECHA_N` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL,
  `TEXTO` text NOT NULL,
  `POSTEADO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_N`,`NOMBRE_U`),
  KEY `fk_noticias_usuario1_idx` (`NOMBRE_U`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `ID_R` int(11) NOT NULL,
  `MONTO_P` decimal(10,0) NOT NULL,
  `PORCENTAJE_DEL_TOTAL_P` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_R`, `MONTO_P`, `PORCENTAJE_DEL_TOTAL_P`) VALUES
(62, '25000', 25),
(63, '35000', 35),
(64, '30000', 30),
(65, '10000', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE IF NOT EXISTS `periodo` (
  `ID_R` int(11) NOT NULL,
  `fecha_p` date NOT NULL,
  `hora_p` time NOT NULL,
  PRIMARY KEY (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`ID_R`, `fecha_p`, `hora_p`) VALUES
(57, '2015-03-06', '07:07:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `ROL_R` varchar(50) NOT NULL,
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `fk_rol_has_menu_rol1_idx` (`ROL_R`),
  KEY `fk_permisos_menu1_idx` (`menu_id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacion`
--

CREATE TABLE IF NOT EXISTS `planificacion` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_E` varchar(50) NOT NULL,
  `FECHA_INICIO_P` date NOT NULL,
  `FECHA_FIN_P` date NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  KEY `FK_ESTADO__PLANIFICACION` (`ESTADO_E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `planificacion`
--

INSERT INTO `planificacion` (`NOMBRE_U`, `ESTADO_E`, `FECHA_INICIO_P`, `FECHA_FIN_P`) VALUES
('FreeValue', 'planificacion registrada', '2014-12-12', '2020-12-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazo`
--

CREATE TABLE IF NOT EXISTS `plazo` (
  `ID_R` int(11) NOT NULL,
  `FECHA_INICIO_PL` date NOT NULL,
  `FECHA_FIN_PL` date NOT NULL,
  `HORA_INICIO_PL` time NOT NULL,
  `HORA_FIN_PL` time NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

--
-- Volcado de datos para la tabla `plazo`
--

INSERT INTO `plazo` (`ID_R`, `FECHA_INICIO_PL`, `FECHA_FIN_PL`, `HORA_INICIO_PL`, `HORA_FIN_PL`) VALUES
(55, '2015-02-12', '2015-03-20', '12:12:00', '12:12:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE IF NOT EXISTS `precio` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `PRECIO_P` decimal(10,0) NOT NULL,
  `PORCENTAJE_A` int(11) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `precio`
--

INSERT INTO `precio` (`NOMBRE_U`, `PRECIO_P`, `PORCENTAJE_A`) VALUES
('FreeValue', '100000', 79);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `CODIGO_P` int(11) NOT NULL AUTO_INCREMENT,
  `ID_G` int(11) NOT NULL,
  `NOMBRE_P` varchar(50) NOT NULL,
  `DESCRIPCION_P` varchar(200) NOT NULL,
  `CONVOCATORIA` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_P`,`ID_G`) USING BTREE,
  KEY `fk_proyecto_gestion1_idx` (`ID_G`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`CODIGO_P`, `ID_G`, `NOMBRE_P`, `DESCRIPCION_P`, `CONVOCATORIA`) VALUES
(3, 1, 'Proyecto 1', 'Sistema de apoyo a la empresa TIS', 'CPETIS2015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje`
--

CREATE TABLE IF NOT EXISTS `puntaje` (
  `PUNTAJE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(11) NOT NULL,
  `PUNTAJE` int(11) NOT NULL,
  PRIMARY KEY (`PUNTAJE_ID`,`ID_FORM`),
  KEY `fk_puntaje_formulario1_idx` (`ID_FORM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje_ge`
--

CREATE TABLE IF NOT EXISTS `puntaje_ge` (
  `ID_PGE` int(50) NOT NULL AUTO_INCREMENT,
  `ID_N` int(50) NOT NULL,
  `NUM_CE` int(50) NOT NULL,
  `CALIFICACION` int(50) NOT NULL,
  PRIMARY KEY (`ID_PGE`),
  KEY `fk_ PUNTAJE_GE_nota_idx` (`ID_N`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptor`
--

CREATE TABLE IF NOT EXISTS `receptor` (
  `ID_R` int(11) NOT NULL,
  `RECEPTOR_R` varchar(150) NOT NULL,
  PRIMARY KEY (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `receptor`
--

INSERT INTO `receptor` (`ID_R`, `RECEPTOR_R`) VALUES
(57, 'FreeValue SRL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `ID_R` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `TIPO_T` varchar(50) NOT NULL,
  `ESTADO_E` varchar(50) NOT NULL,
  `NOMBRE_R` varchar(50) NOT NULL,
  `FECHA_R` date NOT NULL,
  `HORA_R` time NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  KEY `FK_ESTADO__REGISTRO` (`ESTADO_E`) USING BTREE,
  KEY `FK_TIPO__REGISTRO` (`TIPO_T`) USING BTREE,
  KEY `FK_USUARIO_REGISTRO` (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`ID_R`, `NOMBRE_U`, `TIPO_T`, `ESTADO_E`, `NOMBRE_R`, `FECHA_R`, `HORA_R`) VALUES
(55, 'LeticiaB', 'documento requerido', 'Habilitado', 'Parte R', '2015-03-06', '02:53:30'),
(56, 'FreeValue', 'documento subido', 'habilitado', 'Parte R', '2015-03-06', '02:02:55'),
(57, 'LeticiaB', 'publicaciones', 'Habilitado', 'Notificacion de Conformidad de FreeValue', '2015-03-06', '07:07:56'),
(58, 'FreeValue', 'actividad planificacion', 'en proceso', 'Sprint 0', '2015-03-06', '02:57:17'),
(59, 'FreeValue', 'actividad planificacion', 'en proceso', 'Sprint 1', '2015-03-06', '02:57:17'),
(60, 'FreeValue', 'actividad planificacion', 'en proceso', 'Sprint 2', '2015-03-06', '02:57:17'),
(61, 'FreeValue', 'actividad planificacion', 'en proceso', 'Sprint 3', '2015-03-06', '02:57:17'),
(62, 'FreeValue', 'pago planificacion', 'en proceso', 'Sprint 0', '2015-03-06', '02:58:54'),
(63, 'FreeValue', 'pago planificacion', 'en proceso', 'Sprint 1', '2015-03-06', '02:58:54'),
(64, 'FreeValue', 'pago planificacion', 'en proceso', 'Sprint 2', '2015-03-06', '02:58:54'),
(65, 'FreeValue', 'pago planificacion', 'en proceso', 'Sprint 3', '2015-03-06', '02:58:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE IF NOT EXISTS `reporte` (
  `ID_R` int(11) NOT NULL,
  `ROL_RR` varchar(50) NOT NULL,
  `ACTIVIDAD_R` varchar(100) NOT NULL,
  `HECHO_R` tinyint(1) NOT NULL,
  `RESULTADO_R` varchar(200) NOT NULL,
  `CONCLUSION_R` varchar(200) NOT NULL,
  `OBSERVACION_R` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_R`,`ROL_RR`) USING BTREE,
  KEY `FK_ROL_REPORTE__REPORTE` (`ROL_RR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `ROL_R` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ROL_R`) VALUES
('administrador'),
('asesor'),
('grupoEmpresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_aplicacion`
--

CREATE TABLE IF NOT EXISTS `rol_aplicacion` (
  `ROL_R` varchar(50) NOT NULL,
  `APLICACION_A` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_R`,`APLICACION_A`) USING BTREE,
  KEY `FK_APLICACION__ROL_APLICACION` (`APLICACION_A`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_reporte`
--

CREATE TABLE IF NOT EXISTS `rol_reporte` (
  `ROL_RR` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_RR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_reporte`
--

INSERT INTO `rol_reporte` (`ROL_RR`) VALUES
('asesor'),
('cliente'),
('jefe de proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE IF NOT EXISTS `seguimiento` (
  `ID_S` int(5) NOT NULL AUTO_INCREMENT,
  `ID_R` int(11) NOT NULL,
  `ROL_S` varchar(50) NOT NULL,
  `GRUPO_S` varchar(20) NOT NULL,
  `ACTIVIDAD_S` varchar(100) NOT NULL,
  `HECHO_S` tinyint(1) NOT NULL,
  `RESULTADO_S` varchar(200) NOT NULL,
  `CONCLUSION_S` varchar(200) NOT NULL,
  `OBSERVACION_S` varchar(200) NOT NULL,
  `FECHA_S` date NOT NULL,
  PRIMARY KEY (`ID_S`) USING BTREE,
  KEY `FK_ROL_REPORTE__REPORTE` (`ROL_S`) USING BTREE,
  KEY `FK_REGISTRO__SEGUIMIENTO` (`ID_R`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE IF NOT EXISTS `sesion` (
  `ID_S` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `FECHA_S` date NOT NULL,
  `HORA_S` time NOT NULL,
  `IP_S` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_S`) USING BTREE,
  KEY `FK_USUARIO_SESION` (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`ID_S`, `NOMBRE_U`, `FECHA_S`, `HORA_S`, `IP_S`) VALUES
(39, 'Admin1', '2015-03-06', '07:49:29', '::1'),
(40, 'Oasis', '2015-03-06', '07:49:57', '::1'),
(41, 'FreeValue', '2015-03-06', '07:51:11', '::1'),
(42, 'LeticiaB', '2015-03-06', '07:52:39', '::1'),
(43, 'FreeValue', '2015-03-06', '07:53:42', '::1'),
(44, 'LeticiaB', '2015-03-06', '07:55:31', '::1'),
(45, 'FreeValue', '2015-03-06', '07:56:09', '::1'),
(46, 'Admin1', '2015-03-06', '08:04:00', '::1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE IF NOT EXISTS `socio` (
  `CODIGO_S` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_S` varchar(50) NOT NULL,
  `APELLIDOS_S` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_S`) USING BTREE,
  KEY `FK_GRUPO_EMPRESA__SOCIO` (`NOMBRE_U`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=819 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`CODIGO_S`, `NOMBRE_U`, `NOMBRES_S`, `APELLIDOS_S`) VALUES
(14, 'Oasis', 'Pablo', 'Sahonero'),
(15, 'Oasis', 'Jimmy', 'Rojas'),
(16, 'Oasis', 'Alejandro', 'Guzman'),
(17, 'FreeValue', 'Oscar', 'Gamboa Acho'),
(18, 'FreeValue', 'Oscar', 'Torrez Salas'),
(19, 'FreeValue', 'Valeri', 'Crespo Gutierrez'),
(20, 'FreeValue', 'Ruddy', 'Marquina Escobar'),
(21, 'FreeValue', 'Adelio', 'Ayllon Machicado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `TIPO_T` varchar(50) NOT NULL,
  PRIMARY KEY (`TIPO_T`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`TIPO_T`) VALUES
('actividad planificacion'),
('asistencia'),
('Contrato'),
('criterio evaluacion'),
('documento requerido'),
('documento subido'),
('notificacion de conformidad'),
('Orden de Cambio'),
('pago planificacion'),
('publicaciones'),
('seguimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_E` varchar(50) NOT NULL,
  `PASSWORD_U` varchar(50) NOT NULL,
  `TELEFONO_U` varchar(8) NOT NULL,
  `CORREO_ELECTRONICO_U` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  KEY `FK_ESTADO__USUARIO` (`ESTADO_E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2048;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`NOMBRE_U`, `ESTADO_E`, `PASSWORD_U`, `TELEFONO_U`, `CORREO_ELECTRONICO_U`) VALUES
('Admin1', 'Habilitado', 'Admin1*123', '4442336', 'adm.saetis@gmail.com'),
('FreeValue', 'Habilitado', 'Freevalue*123', '4329092', 'free@value.com'),
('LeticiaB', 'Habilitado', 'Leticia*123', '4444532', 'leticia@hotmail.com'),
('Oasis', 'Habilitado', 'Oasis*123', '4331222', 'oasis@oasis.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ROL_R` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`,`ROL_R`) USING BTREE,
  KEY `FK_ROL__USUARIO_ROL` (`ROL_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`NOMBRE_U`, `ROL_R`) VALUES
('Admin1', 'administrador'),
('LeticiaB', 'asesor'),
('FreeValue', 'grupoEmpresa'),
('Oasis', 'grupoEmpresa');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_Administrador_usuario1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `FK_USUARIO__ASESOR` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`);

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `FK_REGISTRO__ASIGNACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `FK_REGISTRO__ASISTENCIA` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `asistencia_semanal`
--
ALTER TABLE `asistencia_semanal`
  ADD CONSTRAINT `FK_REGISTRO__ASISTENCIA_SEMANAL` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_noticias1` FOREIGN KEY (`ID_N`, `NOMBRE_U`) REFERENCES `noticias` (`ID_N`, `NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `criteriocalificacion`
--
ALTER TABLE `criteriocalificacion`
  ADD CONSTRAINT `fk_criterioCalificacion_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `criterio_evaluacion`
--
ALTER TABLE `criterio_evaluacion`
  ADD CONSTRAINT `fk_criterio_evaluacion_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `FK_REGISTRO_DOCUMENTO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `FK_REGISTRO__PRESENTACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `entregable`
--
ALTER TABLE `entregable`
  ADD CONSTRAINT `FK_PLANIFICACION__ENTREGABLE` FOREIGN KEY (`NOMBRE_U`) REFERENCES `planificacion` (`NOMBRE_U`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `FK_REGISTRO__EVALUACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `fecha_realizacion`
--
ALTER TABLE `fecha_realizacion`
  ADD CONSTRAINT `FK_REGISTRO__FECHA_REALIZACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `fk_formulario_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `form_crit_e`
--
ALTER TABLE `form_crit_e`
  ADD CONSTRAINT `fk_formulario_has_criterio_evaluacion_criterio_evaluacion1` FOREIGN KEY (`ID_CRITERIO_E`) REFERENCES `criterio_evaluacion` (`ID_CRITERIO_E`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formulario_has_criterio_evaluacion_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `from_crit_c`
--
ALTER TABLE `from_crit_c`
  ADD CONSTRAINT `fk_criterioCalificacion_has_formulario_criterioCalificacion1` FOREIGN KEY (`ID_CRITERIO_C`) REFERENCES `criteriocalificacion` (`ID_CRITERIO_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_criterioCalificacion_has_formulario_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo_empresa`
--
ALTER TABLE `grupo_empresa`
  ADD CONSTRAINT `FK_USUARIO__GRUPO_EMPRESA` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`);

--
-- Filtros para la tabla `indicador`
--
ALTER TABLE `indicador`
  ADD CONSTRAINT `fk_indicador_criterioCalificacion1` FOREIGN KEY (`ID_CRITERIO_C`) REFERENCES `criteriocalificacion` (`ID_CRITERIO_C`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `FK_ASESOR__INSCRIPCION` FOREIGN KEY (`NOMBRE_UA`) REFERENCES `asesor` (`NOMBRE_U`),
  ADD CONSTRAINT `FK_GRUPO_EMPRESA__INSCRIPCION` FOREIGN KEY (`NOMBRE_UGE`) REFERENCES `grupo_empresa` (`NOMBRE_U`);

--
-- Filtros para la tabla `inscripcion_proyecto`
--
ALTER TABLE `inscripcion_proyecto`
  ADD CONSTRAINT `fk_inscripcion_proyecto_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_proyecto_proyecto1` FOREIGN KEY (`CODIGO_P`) REFERENCES `proyecto` (`CODIGO_P`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `FK_REGISTRO__MENSAJE` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_formulario` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nota_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota_final`
--
ALTER TABLE `nota_final`
  ADD CONSTRAINT `fk_nota_final_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_usuario1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `FK_REGISTRO__PAGO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD CONSTRAINT `fk_periodo_registro1` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_permisos_menu1` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_menu` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planificacion`
--
ALTER TABLE `planificacion`
  ADD CONSTRAINT `FK_ESTADO__PLANIFICACION` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`),
  ADD CONSTRAINT `FK_GRUPO_EMPRESA__PLANIFICACION` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`);

--
-- Filtros para la tabla `plazo`
--
ALTER TABLE `plazo`
  ADD CONSTRAINT `FK_REGISTRO__PLAZO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`);

--
-- Filtros para la tabla `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `FK_PLANIFICACION__PRECIO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `planificacion` (`NOMBRE_U`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_gestion1` FOREIGN KEY (`ID_G`) REFERENCES `gestion` (`ID_G`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD CONSTRAINT `fk_puntaje_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `puntaje_ge`
--
ALTER TABLE `puntaje_ge`
  ADD CONSTRAINT `fk_PUNTAJE_GE_nota` FOREIGN KEY (`ID_N`) REFERENCES `nota` (`ID_N`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receptor`
--
ALTER TABLE `receptor`
  ADD CONSTRAINT `fk_receptor_registro1` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `FK_ESTADO__REGISTRO` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`),
  ADD CONSTRAINT `FK_TIPO__REGISTRO` FOREIGN KEY (`TIPO_T`) REFERENCES `tipo` (`TIPO_T`),
  ADD CONSTRAINT `FK_USUARIO_REGISTRO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`);

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `FK_REGISTRO__REPORTE` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`),
  ADD CONSTRAINT `FK_ROL_REPORTE__REPORTE` FOREIGN KEY (`ROL_RR`) REFERENCES `rol_reporte` (`ROL_RR`);

--
-- Filtros para la tabla `rol_aplicacion`
--
ALTER TABLE `rol_aplicacion`
  ADD CONSTRAINT `FK_APLICACION__ROL_APLICACION` FOREIGN KEY (`APLICACION_A`) REFERENCES `aplicacion` (`APLICACION_A`),
  ADD CONSTRAINT `FK_ROL__ROL_APLICACION` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`);

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `FK_REGISTRO__SEGUIMIENTO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`),
  ADD CONSTRAINT `FK_ROL_REPORTE__SEGUIMIENTO` FOREIGN KEY (`ROL_S`) REFERENCES `rol_reporte` (`ROL_RR`);

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `FK_USUARIO_SESION` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`);

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `FK_GRUPO_EMPRESA__SOCIO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_ESTADO__USUARIO` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK_ROL__USUARIO_ROL` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`),
  ADD CONSTRAINT `FK_USUARIO__USUARIO_ROL` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
