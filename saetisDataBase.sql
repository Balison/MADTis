-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: saetis
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
INSERT INTO `administrador` VALUES ('Admin','Alison','Fernandez Blanco');
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
INSERT INTO `asesor` VALUES ('LeticiaBlanco','Maria Leticia','Blanco Coca');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterio_evaluacion`
--

LOCK TABLES `criterio_evaluacion` WRITE;
/*!40000 ALTER TABLE `criterio_evaluacion` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteriocalificacion`
--

LOCK TABLES `criteriocalificacion` WRITE;
/*!40000 ALTER TABLE `criteriocalificacion` DISABLE KEYS */;
INSERT INTO `criteriocalificacion` VALUES (21,'LeticiaBlanco','PUNTAJE',4);
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
INSERT INTO `descripcion` VALUES (92,'Convocatoria Publica&nbsp;'),(93,'ParteA de acuerdo a CPETIS'),(94,'ParteB de acuerdo a CPETIS'),(95,'Pliego de especificaciones'),(106,'Orden de Cambio'),(109,'Orden de Cambio'),(110,'Orden de Cambio'),(111,'Orden de Cambio'),(112,'Orden de Cambio'),(113,'Orden de Cambio'),(114,'Correccion ParteA'),(115,'Correccion ParteB'),(145,'Contrato'),(180,'Contrato'),(181,'Contrato'),(182,'Contrato'),(216,'Contrato'),(217,'Contrato');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (18,92,1024,'http://104.131.136.183/Repositorio/asesor/CPTIS-2705.pdf',1,1),(19,95,1024,'http://104.131.136.183/Repositorio/asesor/PETIS-2705.pdf',1,1),(20,96,93676,'/Repositorio/MadSoftware/ParteA.pdf',1,1),(21,97,607194,'/Repositorio/DevsGroup/DevsGroup_ParteA.pdf',1,1),(22,98,1584338,'/Repositorio/DevsGroup/DevsGroup_parteB.pdf',1,1),(23,99,1447698,'/Repositorio/InnovaTe/ParteA_Innovate.pdf',1,1),(24,100,1327903,'/Repositorio/InnovaTe/ParteB_InnovaTe.pdf',1,1),(25,101,684387,'/Repositorio/NetSky/ParteA_NetSky.pdf',1,1),(26,102,804432,'/Repositorio/NetSky/ParteB_NetSky.pdf',1,1),(27,103,964992,'/Repositorio/SlowCode/ParteA_SLOWCODE.pdf',1,1),(28,104,925210,'/Repositorio/SlowCode/ParteB_SLOWCODE.pdf',1,1),(29,105,720426,'/Repositorio/MadSoftware/PropuestaTecnica.pdf',1,1),(30,106,1024,'../Repositorio/DevsGroup/OC/OrdenCambio.pdf',0,0),(31,107,82079,'/Repositorio/Saads/ParteA.zip',1,1),(32,108,265360,'/Repositorio/Saads/PropuestaTecnica.docx',1,1),(33,109,1024,'../Repositorio/InnovaTe/OC/OrdenCambio.pdf',0,0),(34,110,1024,'../Repositorio/MadSoftware/OC/OrdenCambio.pdf',0,0),(35,111,1024,'../Repositorio/SlowCode/OC/OrdenCambio.pdf',0,0),(36,112,1024,'../Repositorio/NetSky/OC/OrdenCambio.pdf',0,0),(37,113,1024,'../Repositorio/Saads/OC/OrdenCambio.pdf',0,0),(38,116,672257,'/Repositorio/DevsGroup/ParteA_DevsGroup.pdf',1,1),(39,117,1507645,'/Repositorio/DevsGroup/ParteB_DevsGroup.pdf',1,1),(40,118,1371425,'/Repositorio/InnovaTe/ParteA_InnovaTe.pdf',1,1),(41,119,1198944,'/Repositorio/InnovaTe/ParteB_InnovaTe.pdf',1,1),(42,120,713228,'/Repositorio/NetSky/ParteA_NetSky.pdf',1,1),(43,121,965115,'/Repositorio/SlowCode/ParteA_SLOWCODE.pdf',1,1),(44,122,928703,'/Repositorio/SlowCode/ParteB_SLOWCODE.pdf',1,1),(45,123,791795,'/Repositorio/MadSoftware/PROPUESTA TEÃŒÂCNICA FINAL.pdf',1,1),(46,132,82079,'/Repositorio/Saads/ParteA.zip',1,1),(47,133,265360,'/Repositorio/Saads/PropuestaTecnica.docx',1,1),(48,139,579136,'/Repositorio/MadSoftware/ParteA-corregida.pdf.rar',1,1),(49,145,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoMAD.pdf',1,1),(50,180,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoDevsGroup.pdf',1,1),(51,181,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoInnovaTe.pdf',1,1),(52,182,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoNetSky.pdf',1,1),(53,216,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoSAADS.pdf',1,1),(54,217,1024,'../Repositorio/LeticiaBlanco/Contratos/ContratoSLOWCODE.pdf',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_r`
--

LOCK TABLES `documento_r` WRITE;
/*!40000 ALTER TABLE `documento_r` DISABLE KEYS */;
INSERT INTO `documento_r` VALUES (93,6),(94,6),(114,6),(115,6);
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
INSERT INTO `entrega` VALUES (140,'Documento pruebas',0),(141,'Incremento',0),(141,'Informe QC',0),(142,'Incremento',0),(142,'Informe QC',0),(143,'Incremento',0),(143,'Informe QC',0),(144,'Informe QC',0),(144,'Manuales',0),(154,'Por definir',0),(155,'Por definir',0),(156,'Por definir',0),(157,'Por definir',0),(158,'Por definir',0),(159,'Por definir',0),(160,'Por definir',0),(161,'Por definir',0),(167,'Protocolos y HU',0),(168,'Protocolos y HU',0),(169,'Protocolos y HU',0),(170,'Manules',0),(171,'Doc y Material',0),(172,'Documento',0),(173,'Informe',0),(174,'Sol. a defectos',0),(175,'Mejora sistema',0),(176,'Implantacion req',0),(177,'Implantacion req',0),(178,'Ejecutable y c/f',0),(178,'Manual inst.',0),(178,'Manual tecnico',0),(178,'Manual usuario',0),(179,'Capacitacion',0),(191,'Ninguno',0),(192,'Definicion de HHUU',0),(192,'Storyboards',0),(193,'Implantacion',0),(193,'Puesta en marcha',0),(194,'Correcciones',0),(194,'Entregable basico',0),(195,'Correcciones',0),(195,'Entregable basico',0),(196,'Correcciones',0),(196,'Entregable basico',0),(197,'Correcciones',0),(197,'Entregable basico',0),(198,'Capacitacion',0),(198,'Correcciones',0),(198,'Implantacion',0),(198,'Manuales',0),(208,'Ninguno',0),(209,'Informe',0),(210,'Version',0),(211,'Version',0),(212,'Version',0),(213,'Sistema en servidor',0),(214,'Documentacion',0),(214,'Sistema implantado',0),(215,'Capacitacion',0);
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
INSERT INTO `entregable` VALUES ('DevsGroup','Capacitacion','Capacitacion'),('DevsGroup','Documento','Documento'),('DevsGroup','Ejecutable y c/f','Ejecutable y codigo fuente'),('DevsGroup','Implantacion req','Implantacion de Requerimientos'),('DevsGroup','Informe','Informe'),('DevsGroup','Manual inst.','Manual de instalacion'),('DevsGroup','Manual tecnico','Manual tecnico'),('DevsGroup','Manual usuario','Manual de usuario'),('DevsGroup','Mejora sistema','Mejora del sistema'),('DevsGroup','Sol. a defectos','Solucion a defectos'),('InnovaTe','Por definir','Entregable no definido'),('MadSoftware','Documento pruebas','Documento de pruebas sistema'),('MadSoftware','Incremento','Incremento terminado'),('MadSoftware','Informe QC','informe'),('MadSoftware','Manuales','Manuales del sistema'),('NetSky','Doc y Material',' usuario e instalacion'),('NetSky','Manules','Manuales tecnico'),('NetSky','Protocolos y HU','Prot. de validacion de sprint e interfaz'),('Saads','Capacitacion','Capasitacion'),('Saads','Correcciones','Correcciones sugeridas anterior sprint'),('Saads','Definicion de HHUU','Definicion de historias de usuario'),('Saads','Entregable basico','Entregable basico'),('Saads','Implantacion','Implantacion de SW'),('Saads','Manuales','Manuales del SW'),('Saads','Ninguno','Ninguno'),('Saads','Puesta en marcha','Puesta en marcha de SW'),('Saads','Storyboards','Storyboards'),('SlowCode','Capacitacion','Personal capacitado'),('SlowCode','Documentacion','Documentacion Solicitada en PETIS'),('SlowCode','Informe','Informe del sistema actual'),('SlowCode','Ninguno','Ninguno'),('SlowCode','Sistema en servidor','Sistema en servidor'),('SlowCode','Sistema implantado','Sistema implantado en su totalidad'),('SlowCode','Version','Version');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
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
INSERT INTO `fecha_realizacion` VALUES (124,'2015-03-26'),(125,'2015-04-01'),(126,'2015-04-15'),(127,'2015-04-29'),(128,'2015-05-13'),(129,'2015-05-26'),(130,'2015-06-09'),(131,'2015-06-12'),(134,'2015-04-01'),(135,'2015-05-06'),(136,'2015-05-20'),(137,'2015-06-03'),(138,'2015-06-17'),(140,'0000-00-00'),(141,'0000-00-00'),(142,'0000-00-00'),(143,'0000-00-00'),(144,'0000-00-00'),(146,'2015-04-02'),(147,'2015-04-16'),(148,'2015-04-30'),(149,'2015-05-14'),(150,'2015-05-28'),(151,'2015-06-11'),(152,'2015-06-18'),(153,'2015-07-02'),(154,'0000-00-00'),(155,'0000-00-00'),(156,'0000-00-00'),(157,'0000-00-00'),(158,'0000-00-00'),(159,'0000-00-00'),(160,'0000-00-00'),(161,'0000-00-00'),(162,'2015-04-15'),(163,'2015-05-13'),(164,'2015-06-17'),(165,'2015-06-17'),(166,'2015-06-17'),(167,'0000-00-00'),(168,'0000-00-00'),(169,'0000-00-00'),(170,'0000-00-00'),(171,'0000-00-00'),(172,'0000-00-00'),(173,'0000-00-00'),(174,'0000-00-00'),(175,'0000-00-00'),(176,'0000-00-00'),(177,'0000-00-00'),(178,'0000-00-00'),(179,'0000-00-00'),(183,'2015-03-27'),(184,'2015-04-02'),(185,'2015-04-16'),(186,'2015-04-30'),(187,'2015-05-14'),(188,'2015-05-28'),(189,'2015-06-11'),(190,'2015-06-19'),(191,'0000-00-00'),(192,'0000-00-00'),(193,'0000-00-00'),(194,'0000-00-00'),(195,'0000-00-00'),(196,'0000-00-00'),(197,'0000-00-00'),(198,'0000-00-00'),(199,'2015-04-02'),(200,'2015-04-09'),(201,'2015-04-23'),(202,'2015-05-07'),(203,'2015-05-21'),(204,'2015-06-03'),(205,'2015-06-11'),(206,'2015-06-18'),(207,'2015-06-19'),(208,'0000-00-00'),(209,'0000-00-00'),(210,'0000-00-00'),(211,'0000-00-00'),(212,'0000-00-00'),(213,'0000-00-00'),(214,'0000-00-00'),(215,'0000-00-00');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_crit_e`
--

LOCK TABLES `form_crit_e` WRITE;
/*!40000 ALTER TABLE `form_crit_e` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `from_crit_c`
--

LOCK TABLES `from_crit_c` WRITE;
/*!40000 ALTER TABLE `from_crit_c` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (3,'1-2015','2015-03-01','2015-06-30');
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
INSERT INTO `grupo_empresa` VALUES ('DevsGroup','DevsGroup','DevsGroup SRL','Ladislao Cabrera No567, Cercado Cochabamba','Vania Marisela Catorceno Carballo'),('InnovaTe','InnovaTe','Innovando Tecnologia SRL','C. Tarija #1520','Antonio Alurralde SaÌnchez'),('MadSoftware','MAD','MAD SOFTWARE S.R.L.','Av. RodriÌguez Morales #550','Juan Manuel Castro Arnez'),('NetSky','NetSky','NetSky System SRL','Sipe sipe Calle Gualberto Villarroel Nro. 0616','Ruben Villca Fernandez'),('Saads','SAADS','SAADS S.R.L','Av. Melchor Perez #1312','Kenji Gabriel Lozano Rosales'),('SlowCode','SLOW CODE','SLOW CODE S.R.L.','C/ Dario MontanÌƒo #895','Rodrigo David Rivera Ortega');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicador`
--

LOCK TABLES `indicador` WRITE;
/*!40000 ALTER TABLE `indicador` DISABLE KEYS */;
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
INSERT INTO `inscripcion` VALUES ('LeticiaBlanco','DevsGroup','Habilitado'),('LeticiaBlanco','InnovaTe','Habilitado'),('LeticiaBlanco','MadSoftware','Habilitado'),('LeticiaBlanco','NetSky','Habilitado'),('LeticiaBlanco','Saads','Habilitado'),('LeticiaBlanco','SlowCode','Habilitado');
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
INSERT INTO `inscripcion_proyecto` VALUES (6,'DevsGroup','Firmado'),(6,'InnovaTe','Firmado'),(6,'MadSoftware','Firmado'),(6,'NetSky','Firmado'),(6,'Saads','Firmado'),(6,'SlowCode','Firmado');
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
INSERT INTO `lista_ge` VALUES ('MAD','MAD SOFTWARE S.R.L.','Av. RodriÌguez Morales #550',NULL),('DevsGroup','DevsGroup SRL','Ladislao Cabrera No567, Cercado Cochabamba',NULL),('SLOW CODE','SLOW CODE S.R.L.','C/ Dario MontanÌƒo #895',NULL),('SAADS','SAADS S.R.L','Av. Melchor Perez #1312',NULL),('NetSky','NetSky System SRL','Sipe sipe Calle Gualberto Villarroel Nro. 0616',NULL),('InnovaTe','Innovando TecnologiÌa SRL','C. Tarija #1520',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
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
INSERT INTO `pago` VALUES (140,24415,20),(141,24415,20),(142,24415,20),(143,24415,20),(144,24415,20),(154,8211,30),(155,2737,10),(156,2737,10),(157,2737,10),(158,2737,10),(159,2737,10),(160,2737,10),(161,2737,10),(167,11455,15),(168,22910,30),(169,26729,35),(170,11455,15),(171,3818,5),(172,13600,20),(173,6800,10),(174,6800,10),(175,8160,12),(176,8160,12),(177,8160,12),(178,9520,14),(179,6800,10),(191,11078,17),(192,0,0),(193,0,0),(194,11091,17),(195,11091,17),(196,11091,17),(197,11091,17),(198,11090,17),(208,9930,25),(209,3972,10),(210,3972,10),(211,5958,15),(212,3972,10),(213,3972,10),(214,3972,10),(215,3972,10);
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
INSERT INTO `periodo` VALUES (92,'2015-03-16','10:00:00'),(95,'2015-03-20','10:00:00'),(106,'2015-05-20','14:14:07'),(109,'2015-05-20','14:14:12'),(110,'2015-05-20','14:14:16'),(111,'2015-05-20','14:14:16'),(112,'2015-05-20','14:14:18'),(113,'2015-05-20','14:14:20');
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
INSERT INTO `planificacion` VALUES ('DevsGroup','planificacion registrada','2014-12-12','2020-12-12'),('InnovaTe','planificacion registrada','2014-12-12','2020-12-12'),('MadSoftware','planificacion registrada','2014-12-12','2020-12-12'),('NetSky','planificacion registrada','2014-12-12','2020-12-12'),('Saads','planificacion registrada','2014-12-12','2020-12-12'),('SlowCode','planificacion registrada','2014-12-12','2020-12-12');
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
INSERT INTO `plazo` VALUES (93,'2015-03-16','2015-05-25','10:00:00','11:48:00'),(94,'2015-03-16','2015-05-25','10:00:00','17:00:00'),(114,'2015-03-27','2015-05-21','10:00:00','10:00:00'),(115,'2015-03-27','2015-05-21','10:00:00','10:00:00');
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
INSERT INTO `precio` VALUES ('DevsGroup',68000,100),('InnovaTe',27370,70),('MadSoftware',122075,70),('NetSky',76368,75),('Saads',66532,100),('SlowCode',39718,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (6,3,'Implantacion SAETIS','Implantancion del sistema SAETIS','CPETIS2015');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntaje`
--

LOCK TABLES `puntaje` WRITE;
/*!40000 ALTER TABLE `puntaje` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `receptor` VALUES (92,'Implantacion SAETIS'),(95,'Implantacion SAETIS'),(106,'DevsGroup SRL'),(109,'Innovando TecnologiÌa SRL'),(110,'MAD SOFTWARE S.R.L.'),(111,'SLOW CODE S.R.L.'),(112,'NetSky System SRL'),(113,'SAADS S.R.L'),(145,'MAD SOFTWARE S.R.L.'),(180,'DevsGroup SRL'),(181,'Innovando TecnologiÌa SRL'),(182,'NetSky System SRL'),(216,'SAADS S.R.L'),(217,'SLOW CODE S.R.L.');
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
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (92,'LeticiaBlanco','publicaciones','Habilitado','CPETIS2705','2015-05-20','11:11:37'),(93,'LeticiaBlanco','documento requerido','Habilitado','ParteA','2015-05-20','11:47:56'),(94,'LeticiaBlanco','documento requerido','Habilitado','ParteB','2015-05-20','11:48:44'),(95,'LeticiaBlanco','publicaciones','Habilitado','PETIS2015','2015-05-20','11:11:52'),(96,'MadSoftware','documento subido','habilitado','ParteA','2015-05-20','13:13:47'),(97,'DevsGroup','documento subido','habilitado','ParteA','2015-05-20','13:13:50'),(98,'DevsGroup','documento subido','habilitado','ParteB','2015-05-20','13:13:53'),(99,'InnovaTe','documento subido','habilitado','ParteA','2015-05-20','13:13:54'),(100,'InnovaTe','documento subido','habilitado','ParteB','2015-05-20','13:13:55'),(101,'NetSky','documento subido','habilitado','ParteA','2015-05-20','13:13:56'),(102,'NetSky','documento subido','habilitado','ParteB','2015-05-20','13:13:56'),(103,'SlowCode','documento subido','habilitado','ParteA','2015-05-20','13:13:58'),(104,'SlowCode','documento subido','habilitado','ParteB','2015-05-20','13:13:59'),(105,'MadSoftware','documento subido','habilitado','ParteB','2015-05-20','14:14:07'),(106,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de DevsGroup','2015-05-20','14:14:07'),(107,'Saads','documento subido','habilitado','ParteA','2015-05-20','14:14:10'),(108,'Saads','documento subido','habilitado','ParteB','2015-05-20','14:14:11'),(109,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de InnovaTe','2015-05-20','14:14:12'),(110,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de MAD','2015-05-20','14:14:16'),(111,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de SLOW CODE','2015-05-20','14:14:16'),(112,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de NetSky','2015-05-20','14:14:18'),(113,'LeticiaBlanco','publicaciones','Habilitado','Orden de Cambio de SAADS','2015-05-20','14:14:20'),(114,'LeticiaBlanco','documento requerido','Habilitado','Correccion ParteA','2015-05-20','14:26:03'),(115,'LeticiaBlanco','documento requerido','Habilitado','Correccion ParteB','2015-05-20','14:26:40'),(116,'DevsGroup','documento subido','habilitado','Correccion ParteA','2015-05-20','14:14:28'),(117,'DevsGroup','documento subido','habilitado','Correccion ParteB','2015-05-20','14:14:29'),(118,'InnovaTe','documento subido','habilitado','Correccion ParteA','2015-05-20','14:14:54'),(119,'InnovaTe','documento subido','habilitado','Correccion ParteB','2015-05-20','14:14:55'),(120,'NetSky','documento subido','habilitado','Correccion ParteA','2015-05-20','15:15:08'),(121,'SlowCode','documento subido','habilitado','Correccion ParteA','2015-05-20','15:15:10'),(122,'SlowCode','documento subido','habilitado','Correccion ParteB','2015-05-20','15:15:11'),(123,'MadSoftware','documento subido','habilitado','Correccion ParteB','2015-05-20','15:15:21'),(124,'DevsGroup','actividad planificacion','en proceso','Firma contrato','2015-05-20','15:22:30'),(125,'DevsGroup','actividad planificacion','en proceso','Sprint 0','2015-05-20','15:22:30'),(126,'DevsGroup','actividad planificacion','en proceso','Sprint1','2015-05-20','15:22:30'),(127,'DevsGroup','actividad planificacion','en proceso','Sprint 2','2015-05-20','15:22:30'),(128,'DevsGroup','actividad planificacion','en proceso','Sprint 3','2015-05-20','15:22:30'),(129,'DevsGroup','actividad planificacion','en proceso','Sprint 4','2015-05-20','15:22:30'),(130,'DevsGroup','actividad planificacion','en proceso','Transferencia','2015-05-20','15:22:30'),(131,'DevsGroup','actividad planificacion','en proceso','Capacitacion','2015-05-20','15:22:30'),(132,'Saads','documento subido','habilitado','Correccion ParteB','2015-05-20','15:15:27'),(133,'Saads','documento subido','habilitado','Correccion ParteA','2015-05-20','15:15:29'),(134,'MadSoftware','actividad planificacion','en proceso','Firma Contrato','2015-05-20','15:34:07'),(135,'MadSoftware','actividad planificacion','en proceso','Sprint 3','2015-05-20','15:34:07'),(136,'MadSoftware','actividad planificacion','en proceso','Sprint 4','2015-05-20','15:34:07'),(137,'MadSoftware','actividad planificacion','en proceso','Sprint 5','2015-05-20','15:34:07'),(138,'MadSoftware','actividad planificacion','en proceso','Fin proyecto','2015-05-20','15:34:07'),(139,'MadSoftware','documento subido','habilitado','Correccion ParteA','2015-05-20','15:15:36'),(140,'MadSoftware','pago planificacion','en proceso','Firma Contrato','2015-05-20','15:37:14'),(141,'MadSoftware','pago planificacion','en proceso','Sprint 3','2015-05-20','15:37:14'),(142,'MadSoftware','pago planificacion','en proceso','Sprint 4','2015-05-20','15:37:14'),(143,'MadSoftware','pago planificacion','en proceso','Sprint 5','2015-05-20','15:37:14'),(144,'MadSoftware','pago planificacion','en proceso','Fin proyecto','2015-05-20','15:37:14'),(145,'LeticiaBlanco','Contrato','Habilitado','ContratoMAD.pdf','2015-05-20','15:15:38'),(146,'InnovaTe','actividad planificacion','en proceso','Iteracion 1','2015-05-24','18:24:40'),(147,'InnovaTe','actividad planificacion','en proceso','Iteracion 2','2015-05-24','18:24:40'),(148,'InnovaTe','actividad planificacion','en proceso','Iteracion 3','2015-05-24','18:24:40'),(149,'InnovaTe','actividad planificacion','en proceso','Iteracion 4','2015-05-24','18:24:40'),(150,'InnovaTe','actividad planificacion','en proceso','Iteracion 5','2015-05-24','18:24:40'),(151,'InnovaTe','actividad planificacion','en proceso','Iteracion 6','2015-05-24','18:24:40'),(152,'InnovaTe','actividad planificacion','en proceso','Entrega','2015-05-24','18:24:40'),(153,'InnovaTe','actividad planificacion','en proceso','Evaluacion','2015-05-24','18:24:40'),(154,'InnovaTe','pago planificacion','en proceso','Iteracion 1','2015-05-24','19:04:52'),(155,'InnovaTe','pago planificacion','en proceso','Iteracion 2','2015-05-24','19:04:52'),(156,'InnovaTe','pago planificacion','en proceso','Iteracion 3','2015-05-24','19:04:52'),(157,'InnovaTe','pago planificacion','en proceso','Iteracion 4','2015-05-24','19:04:52'),(158,'InnovaTe','pago planificacion','en proceso','Iteracion 5','2015-05-24','19:04:52'),(159,'InnovaTe','pago planificacion','en proceso','Iteracion 6','2015-05-24','19:04:52'),(160,'InnovaTe','pago planificacion','en proceso','Entrega','2015-05-24','19:04:52'),(161,'InnovaTe','pago planificacion','en proceso','Evaluacion','2015-05-24','19:04:52'),(162,'NetSky','actividad planificacion','en proceso','Sprint 1','2015-05-24','19:10:29'),(163,'NetSky','actividad planificacion','en proceso','Sprint 2','2015-05-24','19:10:29'),(164,'NetSky','actividad planificacion','en proceso','Sprint 3','2015-05-24','19:10:29'),(165,'NetSky','actividad planificacion','en proceso','Transf de Tecnologia','2015-05-24','19:10:29'),(166,'NetSky','actividad planificacion','en proceso','Capacitacion','2015-05-24','19:10:29'),(167,'NetSky','pago planificacion','en proceso','Sprint 1','2015-05-24','19:21:06'),(168,'NetSky','pago planificacion','en proceso','Sprint 2','2015-05-24','19:21:06'),(169,'NetSky','pago planificacion','en proceso','Sprint 3','2015-05-24','19:21:06'),(170,'NetSky','pago planificacion','en proceso','Transf de Tecnologia','2015-05-24','19:21:06'),(171,'NetSky','pago planificacion','en proceso','Capacitacion','2015-05-24','19:21:06'),(172,'DevsGroup','pago planificacion','en proceso','Firma contrato','2015-05-24','21:55:02'),(173,'DevsGroup','pago planificacion','en proceso','Sprint 0','2015-05-24','21:55:02'),(174,'DevsGroup','pago planificacion','en proceso','Sprint1','2015-05-24','21:55:02'),(175,'DevsGroup','pago planificacion','en proceso','Sprint 2','2015-05-24','21:55:02'),(176,'DevsGroup','pago planificacion','en proceso','Sprint 3','2015-05-24','21:55:02'),(177,'DevsGroup','pago planificacion','en proceso','Sprint 4','2015-05-24','21:55:02'),(178,'DevsGroup','pago planificacion','en proceso','Transferencia','2015-05-24','21:55:02'),(179,'DevsGroup','pago planificacion','en proceso','Capacitacion','2015-05-24','21:55:02'),(180,'LeticiaBlanco','Contrato','Habilitado','ContratoDevsGroup.pdf','2015-05-24','23:23:26'),(181,'LeticiaBlanco','Contrato','Habilitado','ContratoInnovaTe.pdf','2015-05-24','23:23:26'),(182,'LeticiaBlanco','Contrato','Habilitado','ContratoNetSky.pdf','2015-05-24','23:23:26'),(183,'Saads','actividad planificacion','en proceso','Firma contrato','2015-05-25','21:45:28'),(184,'Saads','actividad planificacion','en proceso','Sprint 0','2015-05-25','21:45:28'),(185,'Saads','actividad planificacion','en proceso','Sprint 1','2015-05-25','21:45:28'),(186,'Saads','actividad planificacion','en proceso','Sprint 2','2015-05-25','21:45:28'),(187,'Saads','actividad planificacion','en proceso','Sprin 3','2015-05-25','21:45:28'),(188,'Saads','actividad planificacion','en proceso','Sprint 4','2015-05-25','21:45:28'),(189,'Saads','actividad planificacion','en proceso','Sprint 5','2015-05-25','21:45:28'),(190,'Saads','actividad planificacion','en proceso','Sprint 6','2015-05-25','21:45:28'),(191,'Saads','pago planificacion','en proceso','Firma contrato','2015-05-26','12:25:19'),(192,'Saads','pago planificacion','en proceso','Sprint 0','2015-05-26','12:25:19'),(193,'Saads','pago planificacion','en proceso','Sprint 1','2015-05-26','12:25:19'),(194,'Saads','pago planificacion','en proceso','Sprint 2','2015-05-26','12:25:19'),(195,'Saads','pago planificacion','en proceso','Sprin 3','2015-05-26','12:25:19'),(196,'Saads','pago planificacion','en proceso','Sprint 4','2015-05-26','12:25:19'),(197,'Saads','pago planificacion','en proceso','Sprint 5','2015-05-26','12:25:19'),(198,'Saads','pago planificacion','en proceso','Sprint 6','2015-05-26','12:25:19'),(199,'SlowCode','actividad planificacion','en proceso','Firma contrato','2015-05-26','12:30:29'),(200,'SlowCode','actividad planificacion','en proceso','Evaluacion','2015-05-26','12:30:29'),(201,'SlowCode','actividad planificacion','en proceso','Sprint 1','2015-05-26','12:30:29'),(202,'SlowCode','actividad planificacion','en proceso','Sprint 2','2015-05-26','12:30:29'),(203,'SlowCode','actividad planificacion','en proceso','Sprint 3','2015-05-26','12:30:29'),(204,'SlowCode','actividad planificacion','en proceso','Sprint 4','2015-05-26','12:30:29'),(205,'SlowCode','actividad planificacion','en proceso','Fin y entrega','2015-05-26','12:30:29'),(206,'SlowCode','actividad planificacion','en proceso','Capacitacion','2015-05-26','12:30:29'),(207,'SlowCode','actividad planificacion','en proceso','Conclusion ','2015-05-26','12:30:29'),(208,'SlowCode','pago planificacion','en proceso','Firma contrato','2015-05-26','14:32:37'),(209,'SlowCode','pago planificacion','en proceso','Evaluacion','2015-05-26','14:32:37'),(210,'SlowCode','pago planificacion','en proceso','Sprint 1','2015-05-26','14:32:37'),(211,'SlowCode','pago planificacion','en proceso','Sprint 2','2015-05-26','14:32:37'),(212,'SlowCode','pago planificacion','en proceso','Sprint 3','2015-05-26','14:32:37'),(213,'SlowCode','pago planificacion','en proceso','Sprint 4','2015-05-26','14:32:37'),(214,'SlowCode','pago planificacion','en proceso','Fin y entrega','2015-05-26','14:32:37'),(215,'SlowCode','pago planificacion','en proceso','Capacitacion','2015-05-26','14:32:37'),(216,'LeticiaBlanco','Contrato','Habilitado','ContratoSAADS.pdf','2015-05-27','12:12:12'),(217,'LeticiaBlanco','Contrato','Habilitado','ContratoSLOWCODE.pdf','2015-05-28','00:00:11');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (119,'Admin','2015-05-20','01:22:25','186.27.121.159'),(120,'Admin','2015-05-20','01:22:56','181.177.189.117'),(121,'DevsGroup','2015-05-20','10:03:14','181.177.189.117'),(122,'InnovaTe','2015-05-20','10:06:25','181.177.189.117'),(123,'MadSoftware','2015-05-20','10:08:01','181.177.189.117'),(124,'NetSky','2015-05-20','10:10:53','181.177.189.117'),(125,'Saads','2015-05-20','10:14:02','181.177.189.117'),(126,'SlowCode','2015-05-20','10:15:50','181.177.189.117'),(127,'Admin','2015-05-20','11:08:41','181.177.189.117'),(128,'LeticiaBlanco','2015-05-20','11:13:43','181.177.189.117'),(129,'MadSoftware','2015-05-20','11:20:12','181.177.189.117'),(130,'DevsGroup','2015-05-20','11:29:49','181.177.189.117'),(131,'SlowCode','2015-05-20','11:30:51','181.177.189.117'),(132,'Saads','2015-05-20','11:31:27','181.177.189.117'),(133,'NetSky','2015-05-20','11:32:06','181.177.189.117'),(134,'InnovaTe','2015-05-20','11:32:51','181.177.189.117'),(135,'LeticiaBlanco','2015-05-20','11:34:13','181.177.189.117'),(136,'LeticiaBlanco','2015-05-20','11:46:13','181.177.189.117'),(137,'MadSoftware','2015-05-20','11:59:06','181.177.189.117'),(138,'LeticiaBlanco','2015-05-20','12:33:47','181.177.189.117'),(139,'DevsGroup','2015-05-20','12:34:42','181.177.189.117'),(140,'MadSoftware','2015-05-20','01:25:38','181.177.189.117'),(141,'DevsGroup','2015-05-20','01:48:20','181.177.189.117'),(142,'LeticiaBlanco','2015-05-20','01:50:51','181.177.189.117'),(143,'InnovaTe','2015-05-20','01:53:48','181.177.189.117'),(144,'NetSky','2015-05-20','01:55:49','181.177.189.117'),(145,'SlowCode','2015-05-20','01:57:25','181.177.189.117'),(146,'LeticiaBlanco','2015-05-20','02:01:02','181.177.189.117'),(147,'Saads','2015-05-20','02:08:17','181.177.189.117'),(148,'DevsGroup','2015-05-20','02:18:32','181.177.189.117'),(149,'LeticiaBlanco','2015-05-20','02:22:52','181.177.189.117'),(150,'DevsGroup','2015-05-20','02:26:56','181.177.189.117'),(151,'InnovaTe','2015-05-20','02:53:15','181.177.189.117'),(152,'MadSoftware','2015-05-20','02:55:49','181.177.189.117'),(153,'NetSky','2015-05-20','03:07:57','181.177.189.117'),(154,'SlowCode','2015-05-20','03:09:54','181.177.189.117'),(155,'MadSoftware','2015-05-20','03:12:30','181.177.189.117'),(156,'LeticiaBlanco','2015-05-20','03:16:40','181.177.189.117'),(157,'MadSoftware','2015-05-20','03:17:03','181.177.189.117'),(158,'DevsGroup','2015-05-20','03:18:20','181.177.189.117'),(159,'Saads','2015-05-20','03:26:33','181.177.189.117'),(160,'MadSoftware','2015-05-20','03:29:59','181.177.189.117'),(161,'MadSoftware','2015-05-20','03:31:39','181.177.189.117'),(162,'LeticiaBlanco','2015-05-20','03:37:55','181.177.189.117'),(163,'LeticiaBlanco','2015-05-23','04:49:57','161.22.137.183'),(164,'MadSoftware','2015-05-23','05:13:58','161.22.137.183'),(165,'DevsGroup','2015-05-24','06:08:59','161.22.138.70'),(166,'MadSoftware','2015-05-24','06:15:31','161.22.138.70'),(167,'InnovaTe','2015-05-24','06:16:44','161.22.138.70'),(168,'NetSky','2015-05-24','07:06:08','161.22.138.70'),(169,'DevsGroup','2015-05-24','09:36:45','186.27.44.247'),(170,'LeticiaBlanco','2015-05-24','11:26:22','132.251.250.113'),(171,'LeticiaBlanco','2015-05-24','11:31:19','132.251.250.113'),(172,'Saads','2015-05-25','09:37:28','161.22.138.105'),(173,'Saads','2015-05-26','11:30:53','161.22.138.251'),(174,'SlowCode','2015-05-26','12:27:03','186.2.1.107'),(175,'SlowCode','2015-05-26','02:25:33','161.22.139.78'),(176,'MadSoftware','2015-05-26','02:33:28','161.22.139.78'),(177,'LeticiaBlanco','2015-05-26','02:34:03','161.22.139.78'),(178,'LeticiaBlanco','2015-05-26','03:47:44','161.22.139.78'),(179,'LeticiaBlanco','2015-05-26','08:34:21','132.251.250.113'),(180,'LeticiaBlanco','2015-05-26','08:47:52','161.22.137.197'),(181,'LeticiaBlanco','2015-05-26','11:07:29','161.22.138.250'),(182,'LeticiaBlanco','2015-05-27','09:49:31','132.251.250.113'),(183,'Admin','2015-05-27','09:50:03','132.251.250.113'),(184,'MadSoftware','2015-05-27','09:50:19','132.251.250.113'),(185,'LeticiaBlanco','2015-05-27','10:28:36','132.251.250.113'),(186,'Admin','2015-05-27','11:23:09','132.251.250.113'),(187,'LeticiaBlanco','2015-05-27','11:28:01','190.106.246.244'),(188,'Admin','2015-05-27','12:09:40','190.106.246.244'),(189,'LeticiaBlanco','2015-05-27','11:40:43','161.22.138.76'),(190,'LeticiaBlanco','2015-05-28','12:45:44','190.106.253.146'),(191,'MadSoftware','2015-05-28','12:46:45','190.106.253.146'),(192,'MadSoftware','2015-05-28','11:00:37','186.27.46.116'),(193,'MadSoftware','2015-05-31','10:50:55','161.22.139.58'),(194,'LeticiaBlanco','2015-05-31','10:58:59','190.106.253.146'),(195,'MadSoftware','2015-05-31','10:59:38','190.106.253.146'),(196,'Admin','2015-06-01','10:29:00','190.129.230.236'),(197,'LeticiaBlanco','2015-06-01','08:33:38','190.106.253.146'),(198,'LeticiaBlanco','2015-06-02','04:34:57','190.106.253.146'),(199,'LeticiaBlanco','2015-06-02','09:54:16','161.22.139.116'),(200,'LeticiaBlanco','2015-06-03','11:17:16','190.106.253.146');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=819;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (37,'DevsGroup','Vania Marisela','Catorceno Carballo'),(38,'DevsGroup','Dan Joel','Canqui Aviles'),(39,'DevsGroup','Daniel','Rocha Perez'),(40,'DevsGroup','Denis','Vasquez Flores'),(41,'DevsGroup','Diego Armando','Zambrana Arze'),(42,'InnovaTe','Antonio','Alurralde SaÌnchez'),(43,'InnovaTe','Andreina','Cota'),(44,'InnovaTe','Fernando','Gutierrez'),(45,'InnovaTe','Marcelo','Torrico'),(46,'InnovaTe','Winder','Chiri'),(47,'MadSoftware','Juan Manuel','Castro Arnez'),(48,'MadSoftware','Alison','Fernandez Blanco'),(49,'MadSoftware','Diego Gabriel','NuÃ±ez Duran'),(50,'NetSky','Ruben','Villca Fernandez'),(51,'NetSky','Norman','Antezana Pinto'),(52,'NetSky','Dario Edson','Chacon Paichucama'),(53,'NetSky','Erlinda','Chambi Manzano'),(54,'NetSky','Claudia Dolinda','Torrico'),(55,'Saads','Kenji Gabriel','Lozano Rosales'),(56,'Saads','Enrique Daniel','Antezana Vargas'),(57,'Saads','Beimar E.','Huarachi Mamani'),(58,'Saads','Jorge','Avila Baldiviezo'),(59,'SlowCode','Rodrigo David','Rivera Ortega'),(60,'SlowCode','Santiago','Quiroga Turdera'),(61,'SlowCode','Melisa Stefani','Carballo Valencia'),(62,'SlowCode','Cristhian','Lima Saravia');
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
INSERT INTO `usuario` VALUES ('Admin','Habilitado','Saetis*Admin1','70725669','fernablanco.alison@gmail.com'),('DevsGroup','Habilitado','Dev*2015','67451583','DevsGroup@outlook.com'),('InnovaTe','Habilitado','Innova*2015','70751815','contacto@innovate.dev.bo'),('LeticiaBlanco','Habilitado','Mlbc*1205','4470438','leticia.blanco@gmail.com'),('MadSoftware','Habilitado','Mad*2015','69438193','mad.software.srl@gmail.com'),('NetSky','Habilitado','Net*2015','79735925','netskysystemsrl@outlook.com'),('Saads','Habilitado','Saads*2015','79967675','saadssoft@gmail.com'),('SlowCode','Habilitado','Slow*2015','4251675','slow.code.srl.tis@gmail.com');
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
INSERT INTO `usuario_rol` VALUES ('Admin','administrador'),('LeticiaBlanco','asesor'),('DevsGroup','grupoEmpresa'),('InnovaTe','grupoEmpresa'),('MadSoftware','grupoEmpresa'),('NetSky','grupoEmpresa'),('Saads','grupoEmpresa'),('SlowCode','grupoEmpresa');
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

-- Dump completed on 2015-06-03 11:21:51
-- CORRECCION_R stores data about corrections that eg's must complete

DROP TABLE IF EXISTS correccion_r;

create table correccion_r (ID_R INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, GRUPO_EMPRESA VARCHAR(50) NOT NULL);

DROP TABLE IF EXISTS correcciones;

CREATE TABLE correcciones (
  ID_R INT NOT NULL,
  NOMBRE_CORRECCION VARCHAR(50) NOT NULL,
  ID INT AUTO_INCREMENT,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_R) REFERENCES registro(ID_R)
);  

DROP TABLE IF EXISTS evaluacionElemento;

CREATE TABLE evaluacionElemento (
  ID_PAGO INT NOT NULL,
  NOMBRE_E VARCHAR(110) NOT NULL,
  NOTA INT NOT NULL,
  ID INT AUTO_INCREMENT,
  ACEPTADA INT(1) NOT NULL, 
  TIPO VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
); 

DROP TABLE IF EXISTS detalle;

CREATE TABLE detalle (
  ID_PAGO INT NOT NULL,
  NOMBRE VARCHAR(110) NOT NULL,
  ID INT AUTO_INCREMENT,
  ENTREGABLE VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_PAGO) REFERENCES entrega(ID_R)
);
