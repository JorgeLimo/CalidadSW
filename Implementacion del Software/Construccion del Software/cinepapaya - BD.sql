/*
SQLyog Community v11.31 (64 bit)
MySQL - 5.5.40-log : Database - cb_cinepapaya
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cb_cinepapaya` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cb_cinepapaya`;

/*Table structure for table `cine` */

DROP TABLE IF EXISTS `cine`;

CREATE TABLE `cine` (
  `id_cine` int(11) NOT NULL AUTO_INCREMENT,
  `id_cine_padre` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cine`),
  KEY `fk_cine_cine_idx` (`id_cine_padre`),
  CONSTRAINT `fk_cine_cine` FOREIGN KEY (`id_cine_padre`) REFERENCES `cine` (`id_cine`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `cine` */

insert  into `cine`(`id_cine`,`id_cine_padre`,`nombre`,`direccion`) values (1,NULL,'Cinemark',NULL),(11,NULL,'probaaando','test');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

/*Data for the table `cliente` */

insert  into `cliente`(`id_cliente`,`nombre`,`apellido`,`correo`,`clave`,`creado`) values (1,'sebastian','burgos ','sebastian@papaya.pe','1234','2014-10-19 21:05:21'),(41,'Armando','De Mejia','chinito@gmail.com','123','2014-11-07 15:43:02'),(51,'Angela','Calderon','angelita@gmail.com','123','2014-11-08 01:40:20'),(311,'Luis Esteban','Palacios Quichiz','luis@gmail.com','1234567','2014-11-08 14:47:22'),(321,'Luis','Hirano Dulanto','luisitomasna@gmail.com','123456','2014-11-12 19:22:38');

/*Table structure for table `funcion` */

DROP TABLE IF EXISTS `funcion`;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `funcion` */

insert  into `funcion`(`id_funcion`,`id_pelicula`,`id_cine`,`fecha_hora`,`tipo`) values (2,1,1,'2014-10-10 20:00:00','Digital Idioma Original');

/*Table structure for table `pelicula` */

DROP TABLE IF EXISTS `pelicula`;

CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `sinopsis` text,
  `poster` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

/*Data for the table `pelicula` */

insert  into `pelicula`(`id_pelicula`,`nombre`,`sinopsis`,`poster`) values (1,'Secreto Matusita','lalala','http://cde.3.elcomercio.pe/ima/0/0/9/2/7/927210.jpg'),(11,'dragon ball','test','aa'),(91,'Pokemon','pokemon 1234','http://cde.3.elcomercio.pe/ima/0/0/9/2/7/927210.jpg'),(101,'La Mentira','el chino miente','www.mentira.com'),(111,'Dioses','aaaaaa','www.dioses.com');

/*Table structure for table `sincronizar` */

DROP TABLE IF EXISTS `sincronizar`;

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
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

/*Data for the table `sincronizar` */

insert  into `sincronizar`(`id_sincronizar`,`id_pelicula`,`id_cine`,`id_proveedor_pelicula`,`nombre_proveedor_pelicula`,`creado`) values (1,11,1,'10','Dragon Ball Doblada','2014-11-04 04:48:00'),(11,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:48:06'),(21,11,1,'10','Dragon Ball Doblada','2014-11-04 04:48:49'),(31,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:48:54'),(41,11,1,'10','Dragon Ball Doblada','2014-11-04 04:49:35'),(51,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:49:40'),(61,1,1,'10','Dragon Ball Doblada','2014-11-04 04:50:05'),(71,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:50:11'),(81,1,1,'10','Dragon Ball Doblada','2014-11-04 04:51:15'),(91,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:51:21'),(101,1,1,'10','Dragon Ball Doblada','2014-11-04 04:51:49'),(111,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:51:55'),(121,1,1,'10','Dragon Ball Doblada','2014-11-04 04:52:12'),(131,1,1,'10','Dragon Ball Doblada','2014-11-04 04:52:29'),(141,1,1,'10','Dragon Ball Doblada','2014-11-04 04:58:02'),(151,1,1,'20','Harry Potter Subtitulada','2014-11-04 04:58:13'),(161,11,1,'10','Dragon Ball Doblada','2014-11-04 05:01:12'),(171,11,1,'10','Dragon Ball Doblada','2014-11-04 05:01:50'),(181,11,1,'10','Dragon Ball Doblada','2014-11-04 05:07:36'),(191,11,1,'10','Dragon Ball Doblada','2014-11-04 05:16:58'),(201,11,1,'10','Dragon Ball Doblada','2014-11-05 23:41:42'),(211,11,1,'10','Dragon Ball Doblada','2014-11-08 05:21:05'),(221,11,1,'10','Dragon Ball Doblada','2014-11-08 00:23:44'),(231,11,1,'20','Harry Potter Subtitulada','2014-11-08 00:23:49'),(241,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:08'),(251,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:26'),(261,1,1,'10','Dragon Ball Doblada','2014-11-12 19:07:39');

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

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
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8;

/*Data for the table `ticket` */

insert  into `ticket`(`id_ticket`,`id_funcion`,`id_cliente`,`cliente_nombre`,`cliente_apellido`,`cliente_correo`,`estado`,`total`,`creado`) values (1,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:51:27'),(2,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:51:30'),(3,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:00'),(4,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:21'),(5,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-19 23:53:38'),(6,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:05:58'),(7,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:06:34'),(8,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:14:14'),(9,2,1,'sebastian','burgos','sebastian@papaya.pe','pagado',10.00,'2014-10-20 00:15:41'),(10,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:04:56'),(11,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:06:25'),(12,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:07:11'),(13,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 19:07:11'),(14,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:29:08'),(15,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:45:27'),(16,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-24 20:54:27'),(21,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-26 22:48:50'),(31,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-26 23:26:01'),(41,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:08:22'),(51,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:18:22'),(61,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:23:55'),(71,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 00:26:34'),(81,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-10-27 01:10:29'),(91,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 20:57:00'),(101,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 21:07:21'),(111,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-02 21:19:28'),(121,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:02:27'),(131,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:08:04'),(141,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:08:24'),(151,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:17:41'),(161,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:18:05'),(171,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:26:48'),(181,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 01:43:49'),(191,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-03 02:09:31'),(201,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 02:38:14'),(211,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 03:27:21'),(221,2,1,'sebastian','burgos','sebastian@papaya.pe','reservado',10.00,'2014-11-04 16:34:05'),(231,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-07 15:41:12'),(241,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-07 15:43:36'),(251,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:36:25'),(261,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:38:59'),(271,2,41,'Armando','De Mejia','chinito@gmail.com','reservado',10.00,'2014-11-08 01:50:12'),(281,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:36:19'),(291,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:41:24'),(301,2,1,'sebastian','burgos ','sebastian@papaya.pe','reservado',10.00,'2014-11-08 14:44:46'),(311,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 18:41:03'),(321,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 19:02:53'),(331,2,51,'Angela','Calderon','angelita@gmail.com','reservado',10.00,'2014-11-12 19:12:17');

/*Table structure for table `ticket_extra` */

DROP TABLE IF EXISTS `ticket_extra`;

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
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;

/*Data for the table `ticket_extra` */

insert  into `ticket_extra`(`id_ticket_extra`,`id_ticket`,`nombre`,`precio_unitario`,`cantidad`,`moneda`) values (1,1,'Adulto',20.50,2,'PEN'),(2,1,'Niño',15.50,1,'PEN'),(3,1,'Adulto',20.50,2,'PEN'),(4,1,'Adulto',20.50,2,'PEN'),(5,1,'Adulto',20.50,1,'PEN'),(6,1,'Niño',15.50,2,'PEN'),(7,1,'Adulto',20.50,2,'PEN'),(8,1,'Adulto',20.50,4,'PEN'),(9,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(10,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(11,1,'Cancha Grande + 2 Gaseosas grandes',20.50,2,'PEN'),(12,1,'Adulto',20.50,2,'PEN'),(13,1,'Niño',15.50,2,'PEN'),(14,1,'Adulto',20.50,2,'PEN'),(21,1,'Adulto',20.50,2,'PEN'),(31,1,'Adulto',20.50,2,'PEN'),(41,1,'Niño',15.50,1,'PEN'),(51,1,'Adulto',20.50,2,'PEN'),(61,1,'Niño',15.50,1,'PEN'),(71,1,'Adulto',20.50,2,'PEN'),(81,1,'Niño',15.50,1,'PEN'),(91,1,'Adulto',20.50,2,'PEN'),(101,1,'Niño',15.50,1,'PEN'),(111,1,'Adulto',20.50,2,'PEN'),(121,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(131,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(141,1,'Adulto',20.50,1,'PEN'),(151,1,'Niño',15.50,1,'PEN'),(161,1,'Tercera Edad',17.50,1,'PEN'),(171,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(181,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(191,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(201,1,'Cancha chica y gaseosa',15.50,2,'PEN'),(211,1,'Adulto',20.50,1,'PEN'),(221,1,'Niño',15.50,1,'PEN'),(231,1,'Tercera Edad',17.50,1,'PEN'),(241,1,'Adulto',20.50,1,'PEN'),(251,1,'Niño',15.50,1,'PEN'),(261,1,'Tercera Edad',17.50,1,'PEN'),(271,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(281,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(291,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(301,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(311,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(321,1,'Adulto',20.50,1,'PEN'),(331,1,'Adulto',20.50,1,'PEN'),(341,1,'Cancha Grande y 2 Gaseosas grandes',20.50,1,'PEN'),(351,1,'Adulto',20.50,2,'PEN'),(361,1,'Ni?o',15.50,1,'PEN'),(371,1,'Tercera Edad',17.50,1,'PEN'),(381,1,'Adulto',20.50,2,'PEN'),(391,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(401,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(411,1,'Adulto',20.50,2,'PEN'),(421,1,'Niño',15.50,1,'PEN'),(431,1,'Tercera Edad',17.50,1,'PEN'),(441,1,'Adulto',20.50,2,'PEN'),(451,1,'Niño',15.50,1,'PEN'),(461,1,'Tercera Edad',17.50,1,'PEN'),(471,1,'Cancha Grande y 2 Gaseosas grandes',20.50,3,'PEN'),(481,1,'Cancha chica y gaseosa',15.50,7,'PEN'),(491,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(501,1,'Cancha chica y gaseosa',15.50,1,'PEN'),(511,1,'Adulto',20.50,2,'PEN'),(521,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(531,1,'Adulto',20.50,2,'PEN'),(541,1,'Niño',15.50,1,'PEN'),(551,1,'Adulto',20.50,2,'PEN'),(561,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN'),(571,1,'Cancha Grande y 2 Gaseosas grandes',20.50,2,'PEN');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
