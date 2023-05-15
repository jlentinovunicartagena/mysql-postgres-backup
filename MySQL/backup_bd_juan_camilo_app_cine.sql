-- MySQL dump 10.13  Distrib 5.6.43, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_juan_camilo_app_cine
-- ------------------------------------------------------
-- Server version	5.6.43-log

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
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actores` (
  `nombre` varchar(255) NOT NULL,
  `nacionalidad` varchar(255) NOT NULL,
  `esDirector` tinyint(1) NOT NULL,
  `cantidadPeliculasDirigidas` int(11) NOT NULL DEFAULT '0',
  `esActor` tinyint(1) NOT NULL,
  `cantidadPeliculasActuadas` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cines`
--

DROP TABLE IF EXISTS `cines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cines` (
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
  `hora` time NOT NULL,
  `pelicula_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pel_id` (`pelicula_id`),
  KEY `fk_sala_id` (`sala_id`),
  KEY `fk_promocion_id` (`promocion_id`),
  CONSTRAINT `fk_pel_id` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_promocion_id` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `salas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`sala_id`) REFERENCES `salas` (`id`),
  CONSTRAINT `funciones_ibfk_3` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opiniones`
--

DROP TABLE IF EXISTS `opiniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opiniones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `calificacion` enum('Obra Maestra','Muy Buena','Buena','Regular','Mala') NOT NULL,
  `comentario` text NOT NULL,
  `pelicula_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_peli_id` (`pelicula_id`),
  CONSTRAINT `fk_peli_id` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `opiniones_ibfk_1` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tituloOriginal` varchar(255) NOT NULL,
  `tituloDistribucion` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `subtitulos` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `duracion` time NOT NULL,
  `resumen` text NOT NULL,
  `clasificacion` enum('Apta todo público','+9 años','+15 años','+18 años') NOT NULL,
  `añoProduccion` int(11) NOT NULL,
  `paisesOrigen` varchar(255) NOT NULL,
  `fechaEstrenoSantiago` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peliculas_actores`
--

DROP TABLE IF EXISTS `peliculas_actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas_actores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelicula_id` int(11) NOT NULL,
  `actor_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelicula_id` (`pelicula_id`),
  KEY `fk_actor_id` (`actor_id`),
  CONSTRAINT `fk_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`nombre`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `peliculas_actores_ibfk_1` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `peliculas_actores_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promociones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cantidadButacas` int(11) NOT NULL,
  `cine_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cine_id` (`cine_id`),
  CONSTRAINT `fk_cine_id` FOREIGN KEY (`cine_id`) REFERENCES `cines` (`nombre`) ON UPDATE CASCADE,
  CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`cine_id`) REFERENCES `cines` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 15:39:20
