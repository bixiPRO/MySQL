-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	8.0.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `actor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id_actor`),
  UNIQUE KEY `actor` (`actor`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `director` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_director`),
  UNIQUE KEY `director` (`director`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estudis`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudis` (
  `id_estudis` int NOT NULL AUTO_INCREMENT,
  `estudis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estudis`),
  UNIQUE KEY `estudis` (`estudis`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generes` (
  `id_genere` int NOT NULL AUTO_INCREMENT,
  `genere` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_genere`),
  UNIQUE KEY `genere` (`genere`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paisos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paisos` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `pais` (`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules` (
  `id_movie` int NOT NULL,
  `titol` varchar(36) DEFAULT NULL,
  `any` int DEFAULT NULL,
  `vots` int DEFAULT NULL,
  `id_estudis` int DEFAULT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `id_estudis` (`id_estudis`),
  CONSTRAINT `pelicules_ibfk_1` FOREIGN KEY (`id_estudis`) REFERENCES `estudis` (`id_estudis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_directors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_directors` (
  `id_movie` int NOT NULL,
  `id_director` int NOT NULL,
  PRIMARY KEY (`id_movie`,`id_director`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `pelicules_directors_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `pelicules` (`id_movie`),
  CONSTRAINT `pelicules_directors_ibfk_2` FOREIGN KEY (`id_director`) REFERENCES `directors` (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_generes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_generes` (
  `id_movie` int NOT NULL,
  `id_genere` int NOT NULL,
  PRIMARY KEY (`id_movie`,`id_genere`),
  KEY `id_genere` (`id_genere`),
  CONSTRAINT `pelicules_generes_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `pelicules` (`id_movie`),
  CONSTRAINT `pelicules_generes_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `generes` (`id_genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_paisos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_paisos` (
  `id_movie` int NOT NULL,
  `id_pais` int NOT NULL,
  PRIMARY KEY (`id_movie`,`id_pais`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `pelicules_paisos_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `pelicules` (`id_movie`),
  CONSTRAINT `pelicules_paisos_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `paisos` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rols`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rols` (
  `id_movie` int DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  KEY `id_movie` (`id_movie`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `rols_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `pelicules` (`id_movie`),
  CONSTRAINT `rols_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28  0:45:52
