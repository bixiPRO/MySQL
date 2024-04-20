-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: HABITATGE
-- ------------------------------------------------------
-- Server version	8.0.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracteristiques_addicionals`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristiques_addicionals` (
  `id_vivenda` int NOT NULL,
  `aire_condicionat` enum('SI','NO') DEFAULT NULL,
  `ascensor` enum('SI','NO') DEFAULT NULL,
  `calefacció` varchar(255) DEFAULT NULL,
  `mobles` enum('SI','NO') DEFAULT NULL,
  `parquing` varchar(255) DEFAULT NULL,
  `piscina` enum('SI','NO') DEFAULT NULL,
  `traster` enum('SI','NO') DEFAULT NULL,
  `xemeneia` enum('SI','NO') DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`),
  CONSTRAINT `caracteristiques_addicionals_ibfk_1` FOREIGN KEY (`id_vivenda`) REFERENCES `vivenda` (`id_vivenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casa` (
  `id_vivenda` int NOT NULL,
  `tipus` enum(' Casa de pueblo',' Casa o chalet independiente',' Chalet adosado',' Finca rústica',' Torre',' Chalet pareado',' Casa o chalet','Casa rural',' Castillo',' Masía',' Casa terrera',' Caserón',' Palacio') DEFAULT NULL,
  `plantes` varchar(100) DEFAULT NULL,
  `sup_garatge` decimal(10,2) DEFAULT NULL,
  `sup_jardi` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`),
  CONSTRAINT `casa_ibfk_1` FOREIGN KEY (`id_vivenda`) REFERENCES `vivenda` (`id_vivenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comarca`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comarca` (
  `id_comarca` int NOT NULL,
  `id_provincia` int DEFAULT NULL,
  `nom_comarca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_comarca`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `comarca_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `energia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energia` (
  `id_vivenda` int NOT NULL,
  `certificat_electric` enum('A','B','C','D','E','F','G') DEFAULT NULL,
  `consum_energetic_KWh` decimal(10,2) DEFAULT NULL,
  `emissio_energetic_percentatge` int DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`),
  CONSTRAINT `energia_ibfk_1` FOREIGN KEY (`id_vivenda`) REFERENCES `vivenda` (`id_vivenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipi`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipi` (
  `id_municipi` int NOT NULL,
  `nom_municipi` varchar(48) DEFAULT NULL,
  `id_ine` int DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  `nom_provincia` varchar(48) DEFAULT NULL,
  `utmX` int DEFAULT NULL,
  `utmY` int DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_municipi`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `municipi_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pis`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pis` (
  `id_vivenda` int NOT NULL,
  `tipus` enum('Piso','Ático','Dúplex','Estudio','Loft') DEFAULT NULL,
  `plantes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`),
  CONSTRAINT `pis_ibfk_1` FOREIGN KEY (`id_vivenda`) REFERENCES `vivenda` (`id_vivenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provincia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL,
  `nom_catala` varchar(100) DEFAULT NULL,
  `nom_oficial` varchar(100) DEFAULT NULL,
  `id_comunitat_autonoma` int DEFAULT NULL,
  `nom_ccaa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vivenda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vivenda` (
  `id_vivenda` int NOT NULL,
  `num_dormitori` int DEFAULT NULL,
  `num_banys` int DEFAULT NULL,
  `sup_vivenda` int DEFAULT NULL,
  `sup_terrasa` varchar(5) DEFAULT NULL,
  `any_construccio` varchar(4) DEFAULT NULL,
  `estat` varchar(100) DEFAULT NULL,
  `preu_venda` int DEFAULT NULL,
  `disponible_llogar` enum('SI','NO') DEFAULT NULL,
  `descripcio` varchar(140) DEFAULT NULL,
  `data_actualitzada` date DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vivenda_municipi`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vivenda_municipi` (
  `id_vivenda` int NOT NULL,
  `id_municipi` int DEFAULT NULL,
  PRIMARY KEY (`id_vivenda`),
  KEY `id_municipi` (`id_municipi`),
  CONSTRAINT `vivenda_municipi_ibfk_1` FOREIGN KEY (`id_vivenda`) REFERENCES `vivenda` (`id_vivenda`),
  CONSTRAINT `vivenda_municipi_ibfk_2` FOREIGN KEY (`id_municipi`) REFERENCES `municipi` (`id_municipi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-19  0:51:24
