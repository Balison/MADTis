-- MySQL dump 10.13  Distrib 5.6.23, for osx10.8 (x86_64)
--
-- Host: localhost    Database: saetis
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_AD` varchar(45) NOT NULL,
  `APELLIDOS_AD` varchar(45) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`),
  CONSTRAINT `fk_Administrador_usuario1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('Admin1','Ivan','Morales'),('luis','luis ','apa');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacion`
--

DROP TABLE IF EXISTS `aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplicacion` (
  `APLICACION_A` varchar(50) NOT NULL,
  PRIMARY KEY (`APLICACION_A`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacion`
--

LOCK TABLES `aplicacion` WRITE;
/*!40000 ALTER TABLE `aplicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor`
--

DROP TABLE IF EXISTS `asesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asesor` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_A` varchar(50) NOT NULL,
  `APELLIDOS_A` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_USUARIO__ASESOR` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor`
--

LOCK TABLES `asesor` WRITE;
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` VALUES ('Adriana','Adri','Fer'),('Alison','Alison','fernandez'),('Camila','Cam','Fer'),('Holaa','Hola','h'),('Holaaa','hola','J'),('LeticiaB','Leticia Maria','Blanco Coca');
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `ID_R` int(11) NOT NULL,
  `EMISOR_A` varchar(30) NOT NULL,
  `RECEPTOR_A` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__ASIGNACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `ID_R` int(11) NOT NULL,
  `CODIGO_SOCIO_A` int(11) NOT NULL,
  `ASISTENCIA_A` tinyint(1) NOT NULL,
  `LICENCIA_A` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_R`,`CODIGO_SOCIO_A`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__ASISTENCIA` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia_semanal`
--

DROP TABLE IF EXISTS `asistencia_semanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia_semanal` (
  `ID_AS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_R` int(11) NOT NULL,
  `GRUPO_AS` varchar(25) NOT NULL,
  `CODIGO_SOCIO_AS` int(11) NOT NULL,
  `ASISTENCIA_AS` tinyint(1) NOT NULL,
  `LICENCIA_AS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_AS`) USING BTREE,
  KEY `FK_REGISTRO__ASISTENCIA_SEMANAL` (`ID_R`),
  CONSTRAINT `FK_REGISTRO__ASISTENCIA_SEMANAL` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia_semanal`
--

LOCK TABLES `asistencia_semanal` WRITE;
/*!40000 ALTER TABLE `asistencia_semanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia_semanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `ID_C` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `ID_N` int(11) NOT NULL,
  `COMENTARIO` text NOT NULL,
  `FECHA_C` datetime NOT NULL,
  `AUTOR_C` text NOT NULL,
  PRIMARY KEY (`ID_C`,`NOMBRE_U`,`ID_N`),
  KEY `fk_comentarios_noticias1_idx` (`ID_N`,`NOMBRE_U`),
  CONSTRAINT `fk_comentarios_noticias1` FOREIGN KEY (`ID_N`, `NOMBRE_U`) REFERENCES `noticias` (`ID_N`, `NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterio_evaluacion`
--

DROP TABLE IF EXISTS `criterio_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterio_evaluacion` (
  `ID_CRITERIO_E` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CRITERIO_E` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_CRITERIO_E`,`NOMBRE_U`),
  KEY `fk_criterio_evaluacion_asesor1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_criterio_evaluacion_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterio_evaluacion`
--

LOCK TABLES `criterio_evaluacion` WRITE;
/*!40000 ALTER TABLE `criterio_evaluacion` DISABLE KEYS */;
INSERT INTO `criterio_evaluacion` VALUES (1,'LeticiaB','Cr1'),(2,'LeticiaB','Cr2');
/*!40000 ALTER TABLE `criterio_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteriocalificacion`
--

DROP TABLE IF EXISTS `criteriocalificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteriocalificacion` (
  `ID_CRITERIO_C` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CRITERIO_C` varchar(45) NOT NULL,
  `TIPO_CRITERIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CRITERIO_C`,`NOMBRE_U`),
  KEY `fk_criterioCalificacion_asesor1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_criterioCalificacion_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteriocalificacion`
--

LOCK TABLES `criteriocalificacion` WRITE;
/*!40000 ALTER TABLE `criteriocalificacion` DISABLE KEYS */;
INSERT INTO `criteriocalificacion` VALUES (5,'LeticiaB','PUNTAJE',4),(7,'LeticiaB','A(10)B(90)',1),(8,'LeticiaB','Si(70)No(10)',3),(10,'LeticiaB','A(20)B(30)C(25)',1),(12,'LeticiaB','Verdadero(70)Falso(10)',2),(13,'LeticiaB','Verdadero(10)Falso(20)',2),(14,'LeticiaB','Si(80)No(10)',3),(15,'Alison','PUNTAJE',4),(16,'Holaaa','PUNTAJE',4),(17,'Holaa','PUNTAJE',4),(18,'Adriana','PUNTAJE',4),(20,'Camila','PUNTAJE',4);
/*!40000 ALTER TABLE `criteriocalificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcion`
--

DROP TABLE IF EXISTS `descripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descripcion` (
  `ID_R` int(11) NOT NULL,
  `DESCRIPCION_D` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion`
--

LOCK TABLES `descripcion` WRITE;
/*!40000 ALTER TABLE `descripcion` DISABLE KEYS */;
INSERT INTO `descripcion` VALUES (55,'Descripcion'),(57,'Notificacion de Conformidad'),(83,'menb'),(84,'Orden de Cambio'),(85,'sa'),(88,'asdad');
/*!40000 ALTER TABLE `descripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `ID_D` int(11) NOT NULL AUTO_INCREMENT,
  `ID_R` int(11) NOT NULL,
  `TAMANIO_D` int(11) NOT NULL,
  `RUTA_D` varchar(100) NOT NULL,
  `VISUALIZABLE_D` tinyint(1) NOT NULL,
  `DESCARGABLE_D` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_D`) USING BTREE,
  KEY `FK_REGISTRO_DOCUMENTO` (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO_DOCUMENTO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (13,56,399400,'/Repositorio/FreeValue/InscripcionesyMatriculasPasos-TODOS_2014-08-12_10-22.pdf',1,1),(14,57,1024,'../Repositorio/FreeValue/NC/NotificacionConformidad.pdf',0,0);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_r`
--

DROP TABLE IF EXISTS `documento_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_r` (
  `ID_R` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_P` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_r`
--

LOCK TABLES `documento_r` WRITE;
/*!40000 ALTER TABLE `documento_r` DISABLE KEYS */;
INSERT INTO `documento_r` VALUES (55,3),(66,4),(67,4),(83,4),(84,5),(85,5),(88,5);
/*!40000 ALTER TABLE `documento_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega` (
  `ID_R` int(11) NOT NULL,
  `ENTREGABLE_P` varchar(30) NOT NULL,
  `ENTREGADO_P` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_R`,`ENTREGABLE_P`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__PRESENTACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (62,'Documentacion',1),(63,'Documentacion',0),(63,'Software',0),(64,'Documentacion',0),(64,'Software',0),(65,'Manuales',0),(78,'Diagramas UML',0),(79,'HU',0),(79,'Sw',0),(80,'HU',0),(80,'Manuales',0),(81,'HU',0),(81,'Sw',0),(82,'Manuales',0);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregable`
--

DROP TABLE IF EXISTS `entregable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregable` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ENTREGABLE_E` char(30) NOT NULL,
  `DESCRIPCION_E` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`,`ENTREGABLE_E`) USING BTREE,
  CONSTRAINT `FK_PLANIFICACION__ENTREGABLE` FOREIGN KEY (`NOMBRE_U`) REFERENCES `planificacion` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregable`
--

LOCK TABLES `entregable` WRITE;
/*!40000 ALTER TABLE `entregable` DISABLE KEYS */;
INSERT INTO `entregable` VALUES ('FreeValue','Documentacion','Diagramas uml'),('FreeValue','Manuales','Instalacion'),('FreeValue','Software','Sw');
/*!40000 ALTER TABLE `entregable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `ESTADO_E` varchar(50) NOT NULL,
  PRIMARY KEY (`ESTADO_E`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('asistencia registrada'),('Deshabilitado'),('en proceso'),('Habilitado'),('planificacion registrada'),('registrar costo total proyecto'),('registrar entregables'),('registrar plan pagos'),('registrar planificacion'),('seguimiento registrado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion` (
  `ID_R` int(11) NOT NULL,
  `ID_E` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NOTA_E` int(11) NOT NULL,
  `PORCENTAJE` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`,`ID_E`) USING BTREE,
  UNIQUE KEY `ID_E` (`ID_E`),
  CONSTRAINT `FK_REGISTRO__EVALUACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (58,5,15,25);
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha_realizacion`
--

DROP TABLE IF EXISTS `fecha_realizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fecha_realizacion` (
  `ID_R` int(11) NOT NULL,
  `FECHA_FR` date NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__FECHA_REALIZACION` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha_realizacion`
--

LOCK TABLES `fecha_realizacion` WRITE;
/*!40000 ALTER TABLE `fecha_realizacion` DISABLE KEYS */;
INSERT INTO `fecha_realizacion` VALUES (58,'2015-04-05'),(59,'2015-04-06'),(60,'2015-12-03'),(61,'2015-04-13'),(62,'0000-00-00'),(63,'0000-00-00'),(64,'0000-00-00'),(65,'0000-00-00');
/*!40000 ALTER TABLE `fecha_realizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_crit_e`
--

DROP TABLE IF EXISTS `form_crit_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_crit_e` (
  `ID_FORM_CRIT_E` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(11) NOT NULL,
  `ID_CRITERIO_E` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORM_CRIT_E`),
  KEY `fk_formulario_has_criterio_evaluacion_criterio_evaluacion1_idx` (`ID_CRITERIO_E`),
  KEY `fk_formulario_has_criterio_evaluacion_formulario1_idx` (`ID_FORM`),
  CONSTRAINT `fk_formulario_has_criterio_evaluacion_criterio_evaluacion1` FOREIGN KEY (`ID_CRITERIO_E`) REFERENCES `criterio_evaluacion` (`ID_CRITERIO_E`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formulario_has_criterio_evaluacion_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_crit_e`
--

LOCK TABLES `form_crit_e` WRITE;
/*!40000 ALTER TABLE `form_crit_e` DISABLE KEYS */;
INSERT INTO `form_crit_e` VALUES (5,3,1),(6,3,2),(7,3,2),(8,3,1),(9,5,1),(10,5,2);
/*!40000 ALTER TABLE `form_crit_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulario` (
  `ID_FORM` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_FORM` varchar(45) NOT NULL,
  `ESTADO_FORM` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_FORM`,`NOMBRE_U`),
  KEY `fk_formulario_asesor1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_formulario_asesor1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `asesor` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
INSERT INTO `formulario` VALUES (3,'LeticiaB','form1','Habilitado'),(5,'LeticiaB','pruebaa1','Deshabilitado');
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `from_crit_c`
--

DROP TABLE IF EXISTS `from_crit_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `from_crit_c` (
  `ID_FORM_CRIT_C` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CRITERIO_C` int(11) NOT NULL,
  `ID_FORM` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORM_CRIT_C`),
  KEY `fk_criterioCalificacion_has_formulario_formulario1_idx` (`ID_FORM`),
  KEY `fk_criterioCalificacion_has_formulario_criterioCalificacion_idx` (`ID_CRITERIO_C`),
  CONSTRAINT `fk_criterioCalificacion_has_formulario_criterioCalificacion1` FOREIGN KEY (`ID_CRITERIO_C`) REFERENCES `criteriocalificacion` (`ID_CRITERIO_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_criterioCalificacion_has_formulario_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `from_crit_c`
--

LOCK TABLES `from_crit_c` WRITE;
/*!40000 ALTER TABLE `from_crit_c` DISABLE KEYS */;
INSERT INTO `from_crit_c` VALUES (5,7,3),(6,8,3),(9,12,5),(10,8,5);
/*!40000 ALTER TABLE `from_crit_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_G` varchar(45) NOT NULL,
  `FECHA_INICIO_G` date NOT NULL,
  `FECHA_FIN_G` date NOT NULL,
  PRIMARY KEY (`ID_G`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (1,'I/2015','2015-01-01','2015-06-30'),(2,'MedioLala','2015-04-20','2015-09-10');
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_empresa`
--

DROP TABLE IF EXISTS `grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_empresa` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRE_CORTO_GE` char(50) NOT NULL,
  `NOMBRE_LARGO_GE` varchar(50) NOT NULL,
  `DIRECCION_GE` varchar(50) NOT NULL,
  `REPRESENTANTE_LEGAL_GE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_USUARIO__GRUPO_EMPRESA` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_empresa`
--

LOCK TABLES `grupo_empresa` WRITE;
/*!40000 ALTER TABLE `grupo_empresa` DISABLE KEYS */;
INSERT INTO `grupo_empresa` VALUES ('Camaleon','Cama','Camaleon','av. jp segundo',''),('FreeValue','FreeValue','FreeValue SRL','Calle Jordan','Oscar Gamboa Acho'),('Leones','Leons','Leones','Av. san martin','liz Rodriguez'),('MADSOFTWARE','MadSoft','MadSoftwareSRL','Av. Rodriguez morales','manuel castro'),('NetFix','dvdsvss','dsvsds','Av. san martin','adri fernandez'),('Oasis','Oasis','Oasis SRL','Calle Jordan','Pablo Sahonero'),('ratita','rat','rataaa','saddsfdsf','Luci Rodriguez'),('renzoteam','ren','renzo','av. jp segundo',''),('Subversion','Sub','SubVersion','saddsfdsf',''),('Wilster','Wil','Wilster','Av. san martin','');
/*!40000 ALTER TABLE `grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicador`
--

DROP TABLE IF EXISTS `indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicador` (
  `ID_INDICADOR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CRITERIO_C` int(11) NOT NULL,
  `NOMBRE_INDICADOR` varchar(45) NOT NULL,
  `PUNTAJE_INDICADOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_INDICADOR`,`ID_CRITERIO_C`),
  KEY `fk_indicador_criterioCalificacion1_idx` (`ID_CRITERIO_C`),
  CONSTRAINT `fk_indicador_criterioCalificacion1` FOREIGN KEY (`ID_CRITERIO_C`) REFERENCES `criteriocalificacion` (`ID_CRITERIO_C`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicador`
--

LOCK TABLES `indicador` WRITE;
/*!40000 ALTER TABLE `indicador` DISABLE KEYS */;
INSERT INTO `indicador` VALUES (8,7,'A',10),(9,7,'B',90),(10,8,'Si',70),(11,8,'No',10),(15,10,'A',20),(16,10,'B',30),(17,10,'C',25),(21,12,'Verdadero',70),(22,12,'Falso',10),(23,13,'Verdadero',10),(24,13,'Falso',20),(25,14,'Si',80),(26,14,'No',10);
/*!40000 ALTER TABLE `indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `NOMBRE_UA` varchar(50) NOT NULL,
  `NOMBRE_UGE` varchar(50) NOT NULL,
  `ESTADO_INSCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`NOMBRE_UA`,`NOMBRE_UGE`) USING BTREE,
  KEY `FK_ASESOR__INSCRIPCION` (`NOMBRE_UA`) USING BTREE,
  KEY `FK_GRUPO_EMPRESA__INSCRIPCION` (`NOMBRE_UGE`),
  CONSTRAINT `FK_ASESOR__INSCRIPCION` FOREIGN KEY (`NOMBRE_UA`) REFERENCES `asesor` (`NOMBRE_U`),
  CONSTRAINT `FK_GRUPO_EMPRESA__INSCRIPCION` FOREIGN KEY (`NOMBRE_UGE`) REFERENCES `grupo_empresa` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES ('Alison','NetFix','Deshabilitado'),('Camila','Leones','Deshabilitado'),('LeticiaB','FreeValue','Habilitado'),('LeticiaB','Oasis','Habilitado'),('LeticiaB','ratita','Deshabilitado');
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion_proyecto`
--

DROP TABLE IF EXISTS `inscripcion_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion_proyecto` (
  `CODIGO_P` int(11) NOT NULL,
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_CONTRATO` varchar(11) NOT NULL,
  PRIMARY KEY (`CODIGO_P`,`NOMBRE_U`),
  KEY `fk_inscripcion_proyecto_proyecto1_idx` (`CODIGO_P`),
  KEY `fk_inscripcion_proyecto_grupo_empresa1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_inscripcion_proyecto_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscripcion_proyecto_proyecto1` FOREIGN KEY (`CODIGO_P`) REFERENCES `proyecto` (`CODIGO_P`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_proyecto`
--

LOCK TABLES `inscripcion_proyecto` WRITE;
/*!40000 ALTER TABLE `inscripcion_proyecto` DISABLE KEYS */;
INSERT INTO `inscripcion_proyecto` VALUES (3,'FreeValue','Sin Firmar'),(4,'Oasis','Sin Firmar');
/*!40000 ALTER TABLE `inscripcion_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_ge`
--

DROP TABLE IF EXISTS `lista_ge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_ge` (
  `NOMBRE_CORTO` varchar(100) NOT NULL,
  `NOMBRE_LARGO` varchar(100) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `REPRESENTANTE_LEGAL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_ge`
--

LOCK TABLES `lista_ge` WRITE;
/*!40000 ALTER TABLE `lista_ge` DISABLE KEYS */;
INSERT INTO `lista_ge` VALUES ('FreeValue','FreeValue SRL','Calle Jordan',NULL),('Oasis','Oasis SRL','Calle Jordan',NULL),('FreeValue','FreeValue SRL','Calle F',NULL),('Oasis','Oasis SRL','Calle Jordan',NULL),('Power','Power Soft SRL','Calle Power',NULL),('Agile','AgileAction','Calle Agil',NULL);
/*!40000 ALTER TABLE `lista_ge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `ID_R` int(11) NOT NULL,
  `ASUNTO_M` varchar(30) NOT NULL,
  `MENSAJE_M` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__MENSAJE` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `ID_N` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(50) NOT NULL,
  `NOMBRE_U` varchar(50) NOT NULL,
  `CALIF_N` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_N`,`NOMBRE_U`),
  KEY `fk_nota_grupo_empresa1_idx` (`NOMBRE_U`),
  KEY `fk_nota_formulario_idx` (`ID_FORM`),
  CONSTRAINT `fk_nota_formulario` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_final`
--

DROP TABLE IF EXISTS `nota_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_final` (
  `ID_NF` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOTA_F` float NOT NULL,
  PRIMARY KEY (`ID_NF`,`NOMBRE_U`),
  KEY `fk_nota_final_grupo_empresa1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_nota_final_grupo_empresa1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_final`
--

LOCK TABLES `nota_final` WRITE;
/*!40000 ALTER TABLE `nota_final` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `ID_N` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `TITULO` text NOT NULL,
  `FECHA_N` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL,
  `TEXTO` text NOT NULL,
  `POSTEADO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_N`,`NOMBRE_U`),
  KEY `fk_noticias_usuario1_idx` (`NOMBRE_U`),
  CONSTRAINT `fk_noticias_usuario1` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (2,'LeticiaB','Entrega de Partes A y B','2015-03-28 20:32:40',3,'Subir los documentos hasta la fecha indicada, cualquier duda por aca....<br>','LeticiaB'),(3,'Oasis','Dudas','2015-03-28 20:37:07',10,'En la parte...<br>','Oasis');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `ID_R` int(11) NOT NULL,
  `MONTO_P` decimal(10,0) NOT NULL,
  `PORCENTAJE_DEL_TOTAL_P` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__PAGO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (62,25000,25),(63,35000,35),(64,30000,30),(65,10000,10),(78,20000,20),(79,25000,25),(80,25000,25),(81,20000,20),(82,10000,10);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `ID_R` int(11) NOT NULL,
  `fecha_p` date NOT NULL,
  `hora_p` time NOT NULL,
  PRIMARY KEY (`ID_R`),
  CONSTRAINT `fk_periodo_registro1` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (57,'2015-03-06','07:07:56'),(84,'2015-04-05','21:21:44');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `ROL_R` varchar(50) NOT NULL,
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `fk_rol_has_menu_rol1_idx` (`ROL_R`),
  KEY `fk_permisos_menu1_idx` (`menu_id_menu`),
  CONSTRAINT `fk_permisos_menu1` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_menu` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planificacion`
--

DROP TABLE IF EXISTS `planificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planificacion` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_E` varchar(50) NOT NULL,
  `FECHA_INICIO_P` date NOT NULL,
  `FECHA_FIN_P` date NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  KEY `FK_ESTADO__PLANIFICACION` (`ESTADO_E`) USING BTREE,
  CONSTRAINT `FK_ESTADO__PLANIFICACION` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`),
  CONSTRAINT `FK_GRUPO_EMPRESA__PLANIFICACION` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planificacion`
--

LOCK TABLES `planificacion` WRITE;
/*!40000 ALTER TABLE `planificacion` DISABLE KEYS */;
INSERT INTO `planificacion` VALUES ('FreeValue','planificacion registrada','2014-12-12','2020-12-12'),('Oasis','registrar planificacion','2014-12-12','2020-12-12');
/*!40000 ALTER TABLE `planificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plazo`
--

DROP TABLE IF EXISTS `plazo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plazo` (
  `ID_R` int(11) NOT NULL,
  `FECHA_INICIO_PL` date NOT NULL,
  `FECHA_FIN_PL` date NOT NULL,
  `HORA_INICIO_PL` time NOT NULL,
  `HORA_FIN_PL` time NOT NULL,
  PRIMARY KEY (`ID_R`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__PLAZO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plazo`
--

LOCK TABLES `plazo` WRITE;
/*!40000 ALTER TABLE `plazo` DISABLE KEYS */;
INSERT INTO `plazo` VALUES (55,'2015-02-12','2015-04-20','12:12:00','12:12:00'),(66,'2015-03-12','2015-04-12','12:12:00','12:12:00'),(67,'2015-03-12','2015-04-12','12:12:00','12:12:00'),(83,'2015-04-05','2015-04-18','18:00:00','18:00:00'),(84,'2015-03-22','2015-04-12','12:12:00','12:12:00'),(85,'2015-04-06','2015-04-06','21:00:00','22:00:00'),(88,'2015-04-15','2015-04-20','00:44:00','00:43:00');
/*!40000 ALTER TABLE `plazo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precio` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `PRECIO_P` decimal(10,0) NOT NULL,
  `PORCENTAJE_A` int(11) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_PLANIFICACION__PRECIO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `planificacion` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES ('FreeValue',100000,79);
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `CODIGO_P` int(11) NOT NULL AUTO_INCREMENT,
  `ID_G` int(11) NOT NULL,
  `NOMBRE_P` varchar(50) NOT NULL,
  `DESCRIPCION_P` varchar(200) NOT NULL,
  `CONVOCATORIA` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_P`,`ID_G`) USING BTREE,
  KEY `fk_proyecto_gestion1_idx` (`ID_G`),
  CONSTRAINT `fk_proyecto_gestion1` FOREIGN KEY (`ID_G`) REFERENCES `gestion` (`ID_G`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (3,1,'Proyecto 1','Sistema de apoyo a la empresa TIS','CPETIS2015'),(4,1,'PruebaAbril','Prueba sistema','TIS'),(5,1,'lal','a','si');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntaje`
--

DROP TABLE IF EXISTS `puntaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntaje` (
  `PUNTAJE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_FORM` int(11) NOT NULL,
  `PUNTAJE` int(11) NOT NULL,
  PRIMARY KEY (`PUNTAJE_ID`,`ID_FORM`),
  KEY `fk_puntaje_formulario1_idx` (`ID_FORM`),
  CONSTRAINT `fk_puntaje_formulario1` FOREIGN KEY (`ID_FORM`) REFERENCES `formulario` (`ID_FORM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntaje`
--

LOCK TABLES `puntaje` WRITE;
/*!40000 ALTER TABLE `puntaje` DISABLE KEYS */;
INSERT INTO `puntaje` VALUES (5,3,10),(6,3,90),(9,5,30),(10,5,70);
/*!40000 ALTER TABLE `puntaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntaje_ge`
--

DROP TABLE IF EXISTS `puntaje_ge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntaje_ge` (
  `ID_PGE` int(50) NOT NULL AUTO_INCREMENT,
  `ID_N` int(50) NOT NULL,
  `NUM_CE` int(50) NOT NULL,
  `CALIFICACION` int(50) NOT NULL,
  PRIMARY KEY (`ID_PGE`),
  KEY `fk_ PUNTAJE_GE_nota_idx` (`ID_N`),
  CONSTRAINT `fk_PUNTAJE_GE_nota` FOREIGN KEY (`ID_N`) REFERENCES `nota` (`ID_N`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntaje_ge`
--

LOCK TABLES `puntaje_ge` WRITE;
/*!40000 ALTER TABLE `puntaje_ge` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntaje_ge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptor`
--

DROP TABLE IF EXISTS `receptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptor` (
  `ID_R` int(11) NOT NULL,
  `RECEPTOR_R` varchar(150) NOT NULL,
  PRIMARY KEY (`ID_R`),
  CONSTRAINT `fk_receptor_registro1` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptor`
--

LOCK TABLES `receptor` WRITE;
/*!40000 ALTER TABLE `receptor` DISABLE KEYS */;
INSERT INTO `receptor` VALUES (57,'FreeValue SRL'),(84,'FreeValue SRL');
/*!40000 ALTER TABLE `receptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
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
  KEY `FK_USUARIO_REGISTRO` (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_ESTADO__REGISTRO` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`),
  CONSTRAINT `FK_TIPO__REGISTRO` FOREIGN KEY (`TIPO_T`) REFERENCES `tipo` (`TIPO_T`),
  CONSTRAINT `FK_USUARIO_REGISTRO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (55,'LeticiaB','documento requerido','Habilitado','Parte R','2015-03-06','02:53:30'),(56,'FreeValue','documento subido','habilitado','Parte R','2015-03-06','02:02:55'),(57,'LeticiaB','publicaciones','Habilitado','Notificacion de Conformidad de FreeValue','2015-03-06','07:07:56'),(58,'FreeValue','actividad planificacion','en proceso','Sprint 0','2015-03-06','02:57:17'),(59,'FreeValue','actividad planificacion','en proceso','Sprint 1','2015-03-06','02:57:17'),(60,'FreeValue','actividad planificacion','en proceso','Sprint 2','2015-03-06','02:57:17'),(61,'FreeValue','actividad planificacion','en proceso','Sprint 3','2015-03-06','02:57:17'),(62,'FreeValue','pago planificacion','en proceso','Sprint 0','2015-03-06','02:58:54'),(63,'FreeValue','pago planificacion','en proceso','Sprint 1','2015-03-06','02:58:54'),(64,'FreeValue','pago planificacion','en proceso','Sprint 2','2015-03-06','02:58:54'),(65,'FreeValue','pago planificacion','en proceso','Sprint 3','2015-03-06','02:58:55'),(66,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:42'),(67,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:42'),(68,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:42'),(69,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:43'),(70,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:43'),(71,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:44'),(72,'LeticiaB','publicaciones','Habilitado','bmbm','2015-04-05','20:20:45'),(73,'LeticiaB','publicaciones','Habilitado','kl','2015-04-05','20:20:46'),(74,'LeticiaB','publicaciones','Habilitado','gdg','2015-04-05','20:20:46'),(75,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:19'),(76,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:20'),(77,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:20'),(78,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:21'),(79,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:21'),(80,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:24'),(81,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:24'),(82,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-05','21:21:25'),(83,'LeticiaB','documento requerido','Habilitado','Membreete','2015-04-05','17:40:02'),(84,'LeticiaB','publicaciones','Habilitado','Orden de Cambio de FreeValue','2015-04-05','21:21:44'),(85,'LeticiaB','documento requerido','Habilitado','lala','2015-04-06','20:58:28'),(86,'LeticiaB','Contrato','Habilitado','ContratoFreeValue.pdf','2015-04-07','01:01:36'),(87,'LeticiaB','publicaciones','Habilitado','a','2015-04-07','04:04:47'),(88,'LeticiaB','documento requerido','Habilitado','Doc','2015-04-17','18:24:22');
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `ID_R` int(11) NOT NULL,
  `ROL_RR` varchar(50) NOT NULL,
  `ACTIVIDAD_R` varchar(100) NOT NULL,
  `HECHO_R` tinyint(1) NOT NULL,
  `RESULTADO_R` varchar(200) NOT NULL,
  `CONCLUSION_R` varchar(200) NOT NULL,
  `OBSERVACION_R` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_R`,`ROL_RR`) USING BTREE,
  KEY `FK_ROL_REPORTE__REPORTE` (`ROL_RR`) USING BTREE,
  CONSTRAINT `FK_REGISTRO__REPORTE` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`),
  CONSTRAINT `FK_ROL_REPORTE__REPORTE` FOREIGN KEY (`ROL_RR`) REFERENCES `rol_reporte` (`ROL_RR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `ROL_R` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_R`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES ('administrador'),('asesor'),('grupoEmpresa');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_aplicacion`
--

DROP TABLE IF EXISTS `rol_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_aplicacion` (
  `ROL_R` varchar(50) NOT NULL,
  `APLICACION_A` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_R`,`APLICACION_A`) USING BTREE,
  KEY `FK_APLICACION__ROL_APLICACION` (`APLICACION_A`) USING BTREE,
  CONSTRAINT `FK_APLICACION__ROL_APLICACION` FOREIGN KEY (`APLICACION_A`) REFERENCES `aplicacion` (`APLICACION_A`),
  CONSTRAINT `FK_ROL__ROL_APLICACION` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_aplicacion`
--

LOCK TABLES `rol_aplicacion` WRITE;
/*!40000 ALTER TABLE `rol_aplicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_reporte`
--

DROP TABLE IF EXISTS `rol_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_reporte` (
  `ROL_RR` varchar(50) NOT NULL,
  PRIMARY KEY (`ROL_RR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_reporte`
--

LOCK TABLES `rol_reporte` WRITE;
/*!40000 ALTER TABLE `rol_reporte` DISABLE KEYS */;
INSERT INTO `rol_reporte` VALUES ('asesor'),('cliente'),('jefe de proyecto');
/*!40000 ALTER TABLE `rol_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguimiento` (
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
  KEY `FK_REGISTRO__SEGUIMIENTO` (`ID_R`),
  CONSTRAINT `FK_REGISTRO__SEGUIMIENTO` FOREIGN KEY (`ID_R`) REFERENCES `registro` (`ID_R`),
  CONSTRAINT `FK_ROL_REPORTE__SEGUIMIENTO` FOREIGN KEY (`ROL_S`) REFERENCES `rol_reporte` (`ROL_RR`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `ID_S` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `FECHA_S` date NOT NULL,
  `HORA_S` time NOT NULL,
  `IP_S` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_S`) USING BTREE,
  KEY `FK_USUARIO_SESION` (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_USUARIO_SESION` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (39,'Admin1','2015-03-06','07:49:29','::1'),(40,'Oasis','2015-03-06','07:49:57','::1'),(41,'FreeValue','2015-03-06','07:51:11','::1'),(42,'LeticiaB','2015-03-06','07:52:39','::1'),(43,'FreeValue','2015-03-06','07:53:42','::1'),(44,'LeticiaB','2015-03-06','07:55:31','::1'),(45,'FreeValue','2015-03-06','07:56:09','::1'),(46,'Admin1','2015-03-06','08:04:00','::1'),(47,'LeticiaB','2015-04-05','08:09:41','::1'),(48,'Oasis','2015-04-05','10:55:38','::1'),(49,'LeticiaB','2015-04-05','10:57:12','::1'),(50,'Oasis','2015-04-06','10:35:29','::1'),(51,'LeticiaB','2015-04-06','10:36:59','::1'),(52,'Oasis','2015-04-07','12:59:13','::1'),(53,'LeticiaB','2015-04-07','01:00:33','::1'),(54,'Oasis','2015-04-07','04:59:06','::1'),(55,'FreeValue','2015-04-07','05:07:48','::1'),(56,'Oasis','2015-04-07','07:57:55','::1'),(57,'LeticiaB','2015-04-07','08:04:30','::1'),(58,'MADSOFTWARE','2015-04-07','11:51:30','::1'),(59,'Admin1','2015-04-17','07:59:22','::1'),(60,'Admin1','2015-04-17','08:06:32','::1'),(61,'LeticiaB','2015-04-17','08:22:48','::1'),(62,'LeticiaB','2015-04-17','08:24:09','::1'),(63,'MADSOFTWARE','2015-04-17','09:59:26','::1'),(64,'Oasis','2015-04-17','10:01:37','::1'),(65,'FreeValue','2015-04-17','10:02:28','::1'),(66,'LeticiaB','2015-04-17','10:02:51','::1'),(67,'Oasis','2015-04-17','10:04:11','::1'),(68,'Oasis','2015-04-17','10:11:59','::1'),(69,'FreeValue','2015-04-17','10:22:34','::1'),(70,'LeticiaB','2015-04-17','10:23:37','::1'),(71,'FreeValue','2015-04-17','10:24:35','::1'),(72,'LeticiaB','2015-04-17','10:25:15','::1'),(73,'FreeValue','2015-04-17','10:28:00','::1'),(74,'MADSOFTWARE','2015-04-17','10:32:06','::1'),(75,'Admin1','2015-04-17','11:08:25','::1'),(76,'Holaa','2015-04-17','11:26:55','::1'),(77,'LeticiaB','2015-04-17','11:44:05','::1'),(78,'LeticiaB','2015-04-18','02:37:21','::1'),(79,'Admin1','2015-04-18','06:11:09','::1'),(80,'MADSOFTWARE','2015-04-18','06:21:23','::1'),(81,'LeticiaB','2015-04-18','06:21:56','::1'),(82,'Oasis','2015-04-18','06:24:43','::1'),(83,'LeticiaB','2015-04-18','06:26:51','::1'),(84,'Oasis','2015-04-18','06:27:24','::1'),(85,'LeticiaB','2015-04-18','06:30:37','::1'),(86,'Oasis','2015-04-18','06:33:11','::1'),(87,'LeticiaB','2015-04-18','06:39:04','::1'),(88,'Oasis','2015-04-18','06:40:28','::1'),(89,'LeticiaB','2015-04-18','06:42:55','::1'),(92,'Oasis','2015-04-18','07:06:49','::1'),(93,'LeticiaB','2015-04-18','07:07:14','::1'),(94,'Oasis','2015-04-18','07:09:19','::1'),(95,'Admin1','2015-04-18','07:30:58','::1'),(96,'Admin1','2015-04-18','07:39:52','::1'),(97,'LeticiaB','2015-04-18','11:38:08','::1'),(98,'Oasis','2015-04-18','11:40:32','::1'),(99,'MADSOFTWARE','2015-04-19','12:13:09','::1'),(100,'FreeValue','2015-04-19','12:13:25','::1'),(101,'Oasis','2015-04-19','12:13:41','::1'),(102,'NetFix','2015-04-21','03:23:41','::1'),(103,'Admin1','2015-04-21','04:43:20','::1'),(104,'NetFix','2015-04-21','05:23:45','::1'),(105,'Leones','2015-04-21','05:30:35','::1'),(106,'ratita','2015-04-21','05:45:57','::1');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socio` (
  `CODIGO_S` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U` varchar(50) NOT NULL,
  `NOMBRES_S` varchar(50) NOT NULL,
  `APELLIDOS_S` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_S`) USING BTREE,
  KEY `FK_GRUPO_EMPRESA__SOCIO` (`NOMBRE_U`) USING BTREE,
  CONSTRAINT `FK_GRUPO_EMPRESA__SOCIO` FOREIGN KEY (`NOMBRE_U`) REFERENCES `grupo_empresa` (`NOMBRE_U`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=819;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (14,'Oasis','Pablo','Sahonero'),(15,'Oasis','Jimmy','Rojas'),(16,'Oasis','Alejandro','Guzman'),(17,'FreeValue','Oscar','Gamboa Acho'),(18,'FreeValue','Oscar','Torrez Salas'),(19,'FreeValue','Valeri','Crespo Gutierrez'),(20,'FreeValue','Ruddy','Marquina Escobar'),(21,'FreeValue','Adelio','Ayllon Machicado'),(22,'FreeValue','yeye','eryeye'),(23,'FreeValue','luis','perez'),(24,'MADSOFTWARE','alison','fernandez'),(25,'MADSOFTWARE','diego ','nunez'),(26,'MADSOFTWARE','manuel','castro'),(28,'NetFix','adri','fernandez'),(29,'NetFix','camila','fernandez'),(30,'NetFix','yasmin','fernandez'),(31,'Leones','liz','Rodriguez'),(32,'Leones','helen ','Rodriguez'),(33,'Leones','edwin','Rodriguez'),(34,'ratita','Luci','Rodriguez'),(35,'ratita','Ricardo','fernandez'),(36,'ratita','Nelson','castro');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `TIPO_T` varchar(50) NOT NULL,
  PRIMARY KEY (`TIPO_T`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('actividad planificacion'),('asistencia'),('Contrato'),('criterio evaluacion'),('documento requerido'),('documento subido'),('notificacion de conformidad'),('Orden de Cambio'),('pago planificacion'),('publicaciones'),('seguimiento');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ESTADO_E` varchar(50) NOT NULL,
  `PASSWORD_U` varchar(50) NOT NULL,
  `TELEFONO_U` varchar(8) NOT NULL,
  `CORREO_ELECTRONICO_U` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`) USING BTREE,
  KEY `FK_ESTADO__USUARIO` (`ESTADO_E`) USING BTREE,
  CONSTRAINT `FK_ESTADO__USUARIO` FOREIGN KEY (`ESTADO_E`) REFERENCES `estado` (`ESTADO_E`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2048;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Admin1','Habilitado','Admin1*123','4442336','adm.saetis@gmail.com'),('Adriana','Deshabilitado','Adri*123','4472104','adri@gmail.com'),('Alison','Habilitado','K1j2j3y4h5&','4472104','fernablanco_alita@hotmail.com'),('Camaleon','Habilitado','Camaleon*1','4456172','cama@gmail.com'),('Camila','Habilitado','Camila*123','4472104','fernablanco.alison@gmail.com'),('FreeValue','Habilitado','Freevalue*123','4329092','free@value.com'),('Holaa','Habilitado','Hola*123','4524553','rara@gmail.com'),('Holaaa','Habilitado','Hola*123','4465823','rara@gmail.com'),('Leones','Habilitado','Leones*1','4472104','leones@gmail.com'),('LeticiaB','Habilitado','Leticia*123','4444532','leticia@hotmail.com'),('luis','Habilitado','lolo','4457183','raro@gmail.com'),('MADSOFTWARE','Habilitado','K1j2j3y4h5&','4472104','mad.software.srl@gmail.com'),('NetFix','Habilitado','Netfix*123','4457177','rar@gmail.com'),('Oasis','Habilitado','Oasis*123','4331222','oasis@oasis.com'),('ratita','Habilitado','Ratita*1','4456172','rat@gmail.com'),('renzoteam','Habilitado','Renzo*123','4457177','renzo@gmail.com'),('Subversion','Habilitado','Subv*123','4535353','sub@gmail.com'),('Wilster','Habilitado','Wilster*1','4472104','wil@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `NOMBRE_U` varchar(50) NOT NULL,
  `ROL_R` varchar(50) NOT NULL,
  PRIMARY KEY (`NOMBRE_U`,`ROL_R`) USING BTREE,
  KEY `FK_ROL__USUARIO_ROL` (`ROL_R`) USING BTREE,
  CONSTRAINT `FK_ROL__USUARIO_ROL` FOREIGN KEY (`ROL_R`) REFERENCES `rol` (`ROL_R`),
  CONSTRAINT `FK_USUARIO__USUARIO_ROL` FOREIGN KEY (`NOMBRE_U`) REFERENCES `usuario` (`NOMBRE_U`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES ('Admin1','administrador'),('luis','administrador'),('Adriana','asesor'),('Alison','asesor'),('Camila','asesor'),('Holaa','asesor'),('Holaaa','asesor'),('LeticiaB','asesor'),('Camaleon','grupoEmpresa'),('FreeValue','grupoEmpresa'),('Leones','grupoEmpresa'),('MADSOFTWARE','grupoEmpresa'),('NetFix','grupoEmpresa'),('Oasis','grupoEmpresa'),('ratita','grupoEmpresa'),('renzoteam','grupoEmpresa'),('Subversion','grupoEmpresa'),('Wilster','grupoEmpresa');
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-21  9:54:28
