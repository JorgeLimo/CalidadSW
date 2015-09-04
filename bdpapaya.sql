CREATE DATABASE  IF NOT EXISTS `cb_cinepapaya` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cb_cinepapaya`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cb_cinepapaya
-- ------------------------------------------------------
-- Server version	5.5.42-log

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
-- Table structure for table `cine`
--

DROP TABLE IF EXISTS `cine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cine` (
  `id_cine` int(11) NOT NULL AUTO_INCREMENT,
  `id_cine_padre` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cine`),
  KEY `fk_cine_cine_idx` (`id_cine_padre`),
  CONSTRAINT `fk_cine_cine` FOREIGN KEY (`id_cine_padre`) REFERENCES `cine` (`id_cine`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cine`
--

LOCK TABLES `cine` WRITE;
/*!40000 ALTER TABLE `cine` DISABLE KEYS */;
INSERT INTO `cine` VALUES (1,NULL,'Cinemark','Real Plaza'),(11,NULL,'UVK','Centro Civico'),(12,NULL,'Cinepolis','Jockey');
/*!40000 ALTER TABLE `cine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'sebastian','burgos ','sebastian@papaya.pe','1234','2014-10-19 21:05:21','2','burgos'),(41,'Bryan','Laynes','laynesbryan@gmail.com','123','2014-11-07 15:43:02','2','laynes'),(51,'James','Gomes','james.gomez@gmail.com','123','2014-11-08 01:40:20','2','james'),(311,'Brayan','Gallardo','brayan.20.bgv@gmail.com','gallardo','2014-11-08 14:47:22','2','gallardo'),(331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','123','2015-01-27 17:59:41','2','limo'),(332,'Jose ','Romero Quiroz','jose.rq93@gmail.com','jose123','2015-01-28 01:04:03','2','jose');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcion` (
  `id_funcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelicula` int(11) NOT NULL,
  `id_cine` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_funcion`),
  KEY `fk_pelicula_cine_cine1_idx` (`id_cine`),
  KEY `fk_pelicula_cine_pelicula1_idx` (`id_pelicula`),
  CONSTRAINT `fk_pelicula_cine_cine1` FOREIGN KEY (`id_cine`) REFERENCES `cine` (`id_cine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_cine_pelicula1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (2,1,1,'2014-10-10 20:00:00','Digital Idioma Original'),(3,11,11,'2015-03-10 18:30:00','Accion'),(4,91,12,'2015-03-10 18:30:00','Dibujo Animado');
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `sinopsis` text,
  `poster` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Secreto Matusita','lalala','http://cde.3.elcomercio.pe/ima/0/0/9/2/7/927210.jpg'),(11,'dragon ball','test','http://img29.xooimage.com/files/7/6/c/843377dragon-ball-1-1724d24.jpg'),(91,'Pokemon','pokemon 1234','http://img3.wikia.nocookie.net/__cb20120919181030/es.pokemon/images/a/ab/Mewtwo_vs._Mew.png'),(101,'La Mentira','el chino miente','www.mentira.com'),(111,'Dioses','aaaaaa','www.dioses.com'),(121,'ChichaTuMadre','ChichaTuamdre blablabal','');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_desc`
--

DROP TABLE IF EXISTS `pelicula_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_desc` (
  `idpelicula_desc` int(11) NOT NULL AUTO_INCREMENT,
  `idpelicula` int(11) NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `trailer` varchar(45) NOT NULL,
  PRIMARY KEY (`idpelicula_desc`),
  KEY `fk_pelicula_id_idx` (`idpelicula`),
  CONSTRAINT `fk_funcion` FOREIGN KEY (`idpelicula`) REFERENCES `funcion` (`id_funcion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_desc`
--

LOCK TABLES `pelicula_desc` WRITE;
/*!40000 ALTER TABLE `pelicula_desc` DISABLE KEYS */;
INSERT INTO `pelicula_desc` VALUES (1,4,'Se estrenó el 18 de julio de 1998 en los cines japoneses. Su duración es de 75 minutos sin contar el corto animado que la precede denominado Las vacaciones de Pikachu y que dura aproximadamente 20 minutos. Sin embargo, la versión japonesa de esta película incluía un pequeño corto de 10 minutos cuyo nombre es El origen de Mewtwo, el cual fue eliminado fuera de Japón.','https://www.youtube.com/embed/iJjaJjJLfXE'),(2,3,'Esta es una lista de películas basadas en Dragon Ball. Se crearon 18 películas animadas, de las cuales 4 son basadas en la primera serie, las primeras son una trilogía que cuenta una historia alternativa a la original y la cuarta película fue creada para el décimo aniversario del anime. Las 14 películas basadas en Dragon Ball Z tienen tramas completamente distintas a las de la serie, y a excepción de La Batalla de los Dioses y La Resurrección de F , ninguna de ellas se realiza en la línea temporal en la que se desarrolla la serie original.','https://www.youtube.com/embed/qxJm8LEQ3a8'),(3,2,'“Secreto Matusita” no genera tensión a partir de los espacios en los que se mueven los personajes, ni nos hace sentir que el miedo que viven sus personajes es genuino: lo que hace es repetir una fórmula hasta el cansancio, sin jamás tomarse un respiro como para relajar la situación y crear el ambiente necesario para generar un clima inquietante. ','https://www.youtube.com/embed/lYTSLj9UQwA');
/*!40000 ALTER TABLE `pelicula_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sincronizar`
--

DROP TABLE IF EXISTS `sincronizar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sincronizar` (
  `id_sincronizar` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelicula` int(11) NOT NULL,
  `id_cine` int(11) NOT NULL,
  `id_proveedor_pelicula` varchar(45) DEFAULT NULL,
  `nombre_proveedor_pelicula` varchar(45) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sincronizar`),
  KEY `fk_sincronizar_pelicula1_idx` (`id_pelicula`),
  KEY `fk_sincronizar_cine1_idx` (`id_cine`),
  CONSTRAINT `fk_sincronizar_cine1` FOREIGN KEY (`id_cine`) REFERENCES `cine` (`id_cine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sincronizar_pelicula1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sincronizar`
--

LOCK TABLES `sincronizar` WRITE;
/*!40000 ALTER TABLE `sincronizar` DISABLE KEYS */;
INSERT INTO `sincronizar` VALUES (1,11,1,'10','Dragon Ball Doblada','2014-11-04 04:48:00'),(11,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:48:06'),(21,11,1,'10','Dragon Ball Doblada','2014-11-04 04:48:49'),(31,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:48:54'),(41,11,1,'10','Dragon Ball Doblada','2014-11-04 04:49:35'),(51,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:49:40'),(61,1,1,'10','Dragon Ball Doblada','2014-11-04 04:50:05'),(71,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:50:11'),(81,1,1,'10','Dragon Ball Doblada','2014-11-04 04:51:15'),(91,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:51:21'),(101,1,1,'10','Dragon Ball Doblada','2014-11-04 04:51:49'),(111,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:51:55'),(121,1,1,'10','Dragon Ball Doblada','2014-11-04 04:52:12'),(131,1,1,'10','Dragon Ball Doblada','2014-11-04 04:52:29'),(141,1,1,'10','Dragon Ball Doblada','2014-11-04 04:58:02'),(151,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:58:13'),(161,11,1,'10','Dragon Ball Doblada','2014-11-04 05:01:12'),(171,11,1,'10','Dragon Ball Doblada','2014-11-04 05:01:50'),(181,11,1,'10','Dragon Ball Doblada','2014-11-04 05:07:36'),(191,11,1,'10','Dragon Ball Doblada','2014-11-04 05:16:58'),(201,11,1,'10','Dragon Ball Doblada','2014-11-05 23:41:42'),(211,11,1,'10','Dragon Ball Doblada','2014-11-08 05:21:05'),(221,11,1,'10','Dragon Ball Doblada','2014-11-08 00:23:44'),(231,11,1,'20','Harry Potter Subtitulada','2014-11-08 00:23:49'),(241,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:08'),(251,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:26'),(261,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:39');
/*!40000 ALTER TABLE `sincronizar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcion` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `cliente_nombre` varchar(45) DEFAULT NULL,
  `cliente_apellido` varchar(45) DEFAULT NULL,
  `cliente_correo` varchar(45) DEFAULT NULL,
  `estado` enum('pagado','cancelado','reservado') DEFAULT NULL,
  `total` float(6,2) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `fk_ticket_funcion1_idx` (`id_funcion`),
  KEY `fk_ticket_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_ticket_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_funcion1` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id_funcion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-19 23:51:27'),(2,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:51:30'),(3,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:00'),(4,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:21'),(5,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:38'),(6,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:05:58'),(7,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:06:34'),(8,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:14:14'),(9,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:15:41'),(10,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:04:56'),(11,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:06:25'),(12,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:07:11'),(13,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:07:11'),(14,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:29:08'),(15,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:45:27'),(16,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:54:27'),(21,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-26 22:48:50'),(31,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-26 23:26:01'),(41,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:08:22'),(51,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:18:22'),(61,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:23:55'),(71,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:26:34'),(81,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 01:10:29'),(91,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 20:57:00'),(101,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 21:07:21'),(111,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 21:19:28'),(121,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:02:27'),(131,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:08:04'),(141,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:08:24'),(151,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:17:41'),(161,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:18:05'),(171,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:26:48'),(181,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:43:49'),(191,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 02:09:31'),(201,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 02:38:14'),(211,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 03:27:21'),(221,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 16:34:05'),(231,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-07 15:41:12'),(241,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-07 15:43:36'),(251,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:36:25'),(261,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:38:59'),(271,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:50:12'),(281,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:36:19'),(291,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:41:24'),(301,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:44:46'),(311,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 18:41:03'),(321,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 19:02:53'),(331,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 19:12:17'),(341,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2015-01-26 23:55:02'),(342,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2015-01-27 18:02:20'),(343,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2015-01-27 18:29:50'),(344,2,331,'Luis','Limo Limon','limolimon@gmail.com','reservado',10.00,'2015-01-27 18:49:43'),(345,2,331,'Luis','Limo Limon','limolimon@gmail.com','reservado',10.00,'2015-03-12 18:50:10'),(346,2,331,'Luis','Limo Limon','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-12 19:12:57'),(347,4,332,'jose','jose','jose.rq93@gmail.com','reservado',10.00,'2015-03-20 10:31:05'),(348,2,331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-20 11:01:06'),(349,3,311,'Brayan','Gallardo','brayan.20.bgv@gmail.com','reservado',10.00,'2015-03-20 11:02:08'),(350,3,331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-20 11:23:02'),(351,3,331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-20 11:25:40'),(352,4,331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-20 14:59:11'),(353,4,331,'Jorge Luis','Limo Arispe','jorge.limo@ourlimm.com','reservado',10.00,'2015-03-28 00:27:16');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_extra`
--

DROP TABLE IF EXISTS `ticket_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_extra` (
  `id_ticket_extra` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio_unitario` float(6,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `moneda` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_ticket_extra`),
  KEY `fk_ticket_extra_ticket1_idx` (`id_ticket`),
  CONSTRAINT `fk_ticket_extra_ticket1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_extra`
--

LOCK TABLES `ticket_extra` WRITE;
/*!40000 ALTER TABLE `ticket_extra` DISABLE KEYS */;
INSERT INTO `ticket_extra` VALUES (1,1,'Adulto',20.50,2,'PEN'),(2,1,'Niño',15.50,1,'PEN'),(3,1,'Adulto',20.50,2,'PEN'),(4,1,'Adulto',20.50,2,'PEN'),(5,1,'Adulto',20.50,1,'PEN'),(6,1,'Niño',15.50,2,'PEN'),(7,1,'Adulto',20.50,2,'PEN'),(8,1,'Adulto',20.50,4,'PEN'),(9,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(10,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(11,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(12,1,'Adulto',20.50,2,'PEN'),(13,1,'Niño',15.50,2,'PEN'),(14,1,'Adulto',20.50,2,'PEN'),(21,1,'Adulto',20.50,2,'PEN'),(31,1,'Adulto',20.50,2,'PEN'),(41,1,'Niño',15.50,1,'PEN'),(51,1,'Adulto',20.50,2,'PEN'),(61,1,'Niño',15.50,1,'PEN'),(71,1,'Adulto',20.50,2,'PEN'),(81,1,'Niño',15.50,1,'PEN'),(91,1,'Adulto',20.50,2,'PEN'),(101,1,'Niño',15.50,1,'PEN'),(111,1,'Adulto',20.50,2,'PEN'),(121,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(131,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(141,1,'Adulto',20.50,1,'PEN'),(151,1,'Niño',15.50,1,'PEN'),(161,1,'Tercera Edad',17.50,1,'PEN'),(171,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(181,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(191,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(201,1,'Cancha chica y gaseosa',15.50,2,'PEN'),(211,1,'Adulto',20.50,1,'PEN'),(221,1,'Niño',15.50,1,'PEN'),(231,1,'Tercera Edad',17.50,1,'PEN'),(241,1,'Adulto',20.50,1,'PEN'),(251,1,'Niño',15.50,1,'PEN'),(261,1,'Tercera Edad',17.50,1,'PEN'),(271,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(281,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(291,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(301,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(311,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(321,1,'Adulto',20.50,1,'PEN'),(331,1,'Adulto',20.50,1,'PEN'),(341,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(351,1,'Adulto',20.50,2,'PEN'),(361,1,'Ni?o',15.50,1,'PEN'),(371,1,'Tercera Edad',17.50,1,'PEN'),(381,1,'Adulto',20.50,2,'PEN'),(391,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(401,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(411,1,'Adulto',20.50,2,'PEN'),(421,1,'Niño',15.50,1,'PEN'),(431,1,'Tercera Edad',17.50,1,'PEN'),(441,1,'Adulto',20.50,2,'PEN'),(451,1,'Niño',15.50,1,'PEN'),(461,1,'Tercera Edad',17.50,1,'PEN'),(471,1,'Cancha Grande y 2 Gaseosas grandes',20.50,3,'PEN'),(481,1,'Cancha chica y gaseosa',15.50,7,'PEN'),(491,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(501,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(511,1,'Adulto',20.50,2,'PEN'),(521,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(531,1,'Adulto',20.50,2,'PEN'),(541,1,'Niño',15.50,1,'PEN'),(551,1,'Adulto',20.50,2,'PEN'),(561,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(571,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(581,1,'Adulto',20.50,1,'PEN'),(582,1,'NiÃ±o',15.50,1,'PEN'),(583,1,'Tercera Edad',17.50,1,'PEN'),(584,1,'Adulto',20.50,1,'PEN'),(585,1,'NiÃ±o',15.50,1,'PEN'),(586,1,'Tercera Edad',17.50,1,'PEN'),(587,1,'Adulto',20.50,1,'PEN'),(588,1,'NiÃ±o',15.50,1,'PEN'),(589,1,'Tercera Edad',17.50,1,'PEN'),(590,1,'Adulto',20.50,1,'PEN'),(591,1,'NiÃ±o',15.50,1,'PEN'),(592,1,'Tercera Edad',17.50,1,'PEN'),(593,1,'Adulto',20.50,2,'PEN'),(594,1,'NiÃ±o',15.50,2,'PEN'),(595,1,'Tercera Edad',17.50,2,'PEN'),(596,1,'NiÃ±o',15.50,1,'PEN'),(597,1,'Adulto',20.50,1,'PEN'),(598,1,'NiÃ±o',15.50,1,'PEN'),(599,1,'Tercera Edad',17.50,1,'PEN'),(600,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(601,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(602,1,'Adulto',20.50,1,'PEN'),(603,1,'NiÃ±o',15.50,1,'PEN'),(604,1,'Tercera Edad',17.50,1,'PEN'),(605,1,'Adulto',20.50,1,'PEN'),(606,1,'Adulto',20.50,1,'PEN'),(607,1,'NiÃ±o',15.50,1,'PEN'),(608,1,'Tercera Edad',17.50,1,'PEN'),(609,1,'Adulto',20.50,1,'PEN'),(610,1,'NiÃ±o',15.50,1,'PEN'),(611,1,'Tercera Edad',17.50,1,'PEN'),(612,1,'Adulto',20.50,1,'PEN');
/*!40000 ALTER TABLE `ticket_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cb_cinepapaya'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-18  1:07:21
