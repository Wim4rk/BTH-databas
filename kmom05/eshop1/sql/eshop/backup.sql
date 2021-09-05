-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	10.3.29-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `webshop`
--

/*!40000 DROP DATABASE IF EXISTS `webshop`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci */;

USE `webshop`;

--
-- Table structure for table `bild`
--

DROP TABLE IF EXISTS `bild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bild` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt` int(11) DEFAULT NULL,
  `lank` varchar(25) COLLATE utf8_swedish_ci DEFAULT NULL,
  `bildtext` tinytext COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt` (`produkt`),
  CONSTRAINT `bild_ibfk_1` FOREIGN KEY (`produkt`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bild`
--

LOCK TABLES `bild` WRITE;
/*!40000 ALTER TABLE `bild` DISABLE KEYS */;
/*!40000 ALTER TABLE `bild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund` int(11) DEFAULT NULL,
  `fakturanummer` int(11) DEFAULT NULL,
  `fakturastatus` varchar(12) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kund` (`kund`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`kund`) REFERENCES `kund` (`kundnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakturarad`
--

DROP TABLE IF EXISTS `fakturarad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fakturarad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faktura` int(11) DEFAULT NULL,
  `orderrad` int(11) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faktura` (`faktura`),
  KEY `orderrad` (`orderrad`),
  CONSTRAINT `fakturarad_ibfk_1` FOREIGN KEY (`faktura`) REFERENCES `faktura` (`id`),
  CONSTRAINT `fakturarad_ibfk_2` FOREIGN KEY (`orderrad`) REFERENCES `orderrad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakturarad`
--

LOCK TABLES `fakturarad` WRITE;
/*!40000 ALTER TABLE `fakturarad` DISABLE KEYS */;
/*!40000 ALTER TABLE `fakturarad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylla`
--

DROP TABLE IF EXISTS `hylla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hylla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lokal` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `hylla` varchar(8) COLLATE utf8_swedish_ci DEFAULT NULL,
  `hyllplan` char(4) COLLATE utf8_swedish_ci DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylla`
--

LOCK TABLES `hylla` WRITE;
/*!40000 ALTER TABLE `hylla` DISABLE KEYS */;
INSERT INTO `hylla` VALUES (1,'butik','1','a',NULL),(2,'butik','1','b',NULL),(3,'butik','1','c',NULL),(4,'butik','2','a',NULL),(5,'butik','2','b',NULL),(6,'butik','2','c',NULL),(7,'Vällinge','1','a',NULL),(8,'Vällinge','1','b',NULL),(9,'Vällinge','1','c',NULL),(10,'Vällinge','1','d',NULL),(11,'Vällinge','2','a',NULL),(12,'Vällinge','2','b',NULL),(13,'Vällinge','2','c',NULL),(14,'Vällinge','2','d',NULL),(15,'Vällinge','3','a',NULL),(16,'Vällinge','3','b',NULL),(17,'Vällinge','3','c',NULL),(18,'Vällinge','6','d',NULL);
/*!40000 ALTER TABLE `hylla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(12) COLLATE utf8_swedish_ci DEFAULT NULL,
  `super` varchar(12) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'switch',''),(2,'chassi',''),(3,'tangenter',''),(4,'storlek','tangenter'),(5,'material','tangenter'),(6,'taktil','switch'),(7,'linjär','switch'),(8,'clicky','switch'),(9,'87 tangenter','chassi'),(10,'Komplett','storlek'),(11,'65 tangenter','storlek'),(12,'ABS','material'),(13,'PBT','material'),(14,'Ingen','');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund` (
  `kundnummer` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `postaddress` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `epost` varchar(30) COLLATE utf8_swedish_ci DEFAULT NULL,
  `telefon` char(14) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kod` char(32) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kundnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Elis Bengstsson','Honnörsgatan 3','170 69 Solna','elis_b@lost.se','08-406 75 67','abc123'),(2,'Einar Elfberg','Fridensborgsv. 26','170 69 Solna','einar_e@lost.se','08-406 92 94','qwert1234'),(3,'Jonas Fredriksson','Sockenvägen 21','826 61 Söderala','jonas_f@lost.se','0270-15108','muffin86'),(4,'Lennart Wimark','Annebergsvägen 14','826 61 Söderala','lennart_w@lost.se','0270-28 79 76','chongenmilla'),(5,'Peter Paranoid','Hammarvägen 5','169 21 Ekensberg','peter_p@lost.se','081-507 06 06','44rdvArk!b*¤tt3rY');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kundorder`
--

DROP TABLE IF EXISTS `kundorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kundorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund` int(11) DEFAULT NULL,
  `orderstatus` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kund` (`kund`),
  CONSTRAINT `kundorder_ibfk_1` FOREIGN KEY (`kund`) REFERENCES `kund` (`kundnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundorder`
--

LOCK TABLES `kundorder` WRITE;
/*!40000 ALTER TABLE `kundorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `kundorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hylla` int(11) DEFAULT NULL,
  `produkt` int(11) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hylla` (`hylla`),
  KEY `produkt` (`produkt`),
  CONSTRAINT `lager_ibfk_1` FOREIGN KEY (`hylla`) REFERENCES `hylla` (`id`),
  CONSTRAINT `lager_ibfk_2` FOREIGN KEY (`produkt`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (1,6,5,120),(2,6,4,23),(3,7,3,1240),(4,2,2,1200),(5,1,1,8);
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderrad`
--

DROP TABLE IF EXISTS `orderrad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderrad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kundorder` int(11) DEFAULT NULL,
  `produkt` int(11) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `radstatus` varchar(12) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kundorder` (`kundorder`),
  KEY `produkt` (`produkt`),
  CONSTRAINT `orderrad_ibfk_1` FOREIGN KEY (`kundorder`) REFERENCES `kundorder` (`id`),
  CONSTRAINT `orderrad_ibfk_2` FOREIGN KEY (`produkt`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderrad`
--

LOCK TABLES `orderrad` WRITE;
/*!40000 ALTER TABLE `orderrad` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderrad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plocklista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderrad` int(11) DEFAULT NULL,
  `hylla` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderrad` (`orderrad`),
  KEY `hylla` (`hylla`),
  CONSTRAINT `plocklista_ibfk_1` FOREIGN KEY (`orderrad`) REFERENCES `orderrad` (`id`),
  CONSTRAINT `plocklista_ibfk_2` FOREIGN KEY (`hylla`) REFERENCES `hylla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benamning` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `beskrivning` text COLLATE utf8_swedish_ci DEFAULT NULL,
  `pris` double(6,2) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `inkopskostnad` double(6,2) DEFAULT NULL,
  `leverantor` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lev_prod_nr` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'87 BDL Chassi','Chassi för tangentbord med 87 tangenter',799.00,8,399.00,'Wim4rk milling','Azerty'),(2,'Tactile Switch','Zealios 65g, den bästa moderna switch vi hittat.',12.00,20000,6.00,'Zealios MD','Zeal_65'),(3,'Silentz','Tyst, vadderad switch. Underbar på jobbet, men en smula svampig i bottentrycket.',9.00,13000,4.00,'Cherry MX','red_silent'),(4,'Clicky switch','Otrolig feedback, otroligt störande',13.00,12000,6.00,'Box ltd','white_bar'),(5,'Standard linear','Lätt, intetsägande och lite skrapig.',9.00,12000,4.00,'Cherry MX','red_linear');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER plog_insert
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('tillagg', NEW.id)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER prod_kat
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO produktkategori (produkt, kategori)
        VALUES(NEW.id, 14) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER plog_update
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('uppdatering', NEW.id)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER plog_delete
BEFORE DELETE
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('radering', OLD.id)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt_log`
--

DROP TABLE IF EXISTS `produkt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tidpunkt` timestamp NOT NULL DEFAULT current_timestamp(),
  `handelse` tinytext COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt_log`
--

LOCK TABLES `produkt_log` WRITE;
/*!40000 ALTER TABLE `produkt_log` DISABLE KEYS */;
INSERT INTO `produkt_log` VALUES (1,'2021-09-05 13:28:41','Ny produkt lades till med produktid 1'),(2,'2021-09-05 13:28:41','Ny produkt lades till med produktid 2'),(3,'2021-09-05 13:28:41','Ny produkt lades till med produktid 3'),(4,'2021-09-05 13:28:41','Ny produkt lades till med produktid 4'),(5,'2021-09-05 13:28:41','Ny produkt lades till med produktid 5');
/*!40000 ALTER TABLE `produkt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktkategori`
--

DROP TABLE IF EXISTS `produktkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produktkategori` (
  `produkt` int(11) NOT NULL,
  `kategori` int(11) NOT NULL,
  PRIMARY KEY (`produkt`,`kategori`),
  KEY `kategori` (`kategori`),
  CONSTRAINT `produktkategori_ibfk_1` FOREIGN KEY (`produkt`) REFERENCES `produkt` (`id`),
  CONSTRAINT `produktkategori_ibfk_2` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktkategori`
--

LOCK TABLES `produktkategori` WRITE;
/*!40000 ALTER TABLE `produktkategori` DISABLE KEYS */;
INSERT INTO `produktkategori` VALUES (1,9),(1,14),(2,4),(2,7),(2,14),(3,4),(3,5),(3,6),(3,14),(4,3),(4,14),(5,3),(5,5),(5,14);
/*!40000 ALTER TABLE `produktkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recension`
--

DROP TABLE IF EXISTS `recension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt` int(11) DEFAULT NULL,
  `recensent` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `betyg` tinyint(4) DEFAULT NULL,
  `fritext` text COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt` (`produkt`),
  CONSTRAINT `recension_ibfk_1` FOREIGN KEY (`produkt`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recension`
--

LOCK TABLES `recension` WRITE;
/*!40000 ALTER TABLE `recension` DISABLE KEYS */;
/*!40000 ALTER TABLE `recension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_lagerstatus`
--

DROP TABLE IF EXISTS `v_lagerstatus`;
/*!50001 DROP VIEW IF EXISTS `v_lagerstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_lagerstatus` (
  `id` tinyint NOT NULL,
  `namn` tinyint NOT NULL,
  `hylla` tinyint NOT NULL,
  `antal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'webshop'
--
/*!50003 DROP FUNCTION IF EXISTS `verbose` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verbose`(
    action VARCHAR(12),
    id INT(4)
) RETURNS tinytext CHARSET utf8 COLLATE utf8_swedish_ci
    DETERMINISTIC
BEGIN
    DECLARE log_string TINYTEXT;

    IF action = "uppdatering" THEN
        SET log_string = CONCAT("Produkt med produktid ", id, " uppdaterades");
    ELSEIF action = "tillagg" THEN
        SET log_string = CONCAT("Ny produkt lades till med produktid ", id);
    ELSEIF action = "radering" THEN
        SET log_string = CONCAT("Produkt med produktid ", id, " raderades");
    END IF;

    RETURN log_string;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_inventory`(
    prod INT,
    shelf INT,
    num INT
)
BEGIN
    INSERT INTO lager
        (hylla, produkt, antal)
    VALUES (shelf, prod, num);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_product`(
    a_benamning VARCHAR(20),
    a_beskrivning TEXT,
    a_pris DOUBLE(6, 2),
    a_antal INT
)
BEGIN
    INSERT INTO produkt (benamning, beskrivning, pris,  antal)
        VALUES (a_benamning, a_beskrivning, a_pris, a_antal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_product`(
    a_id INT
)
BEGIN
    DELETE FROM produktkategori
        WHERE
        `produkt` = a_id;
    DELETE FROM produkt
        WHERE
        `id` = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_inventory`(
    prod INT,
    shelf INT,
    num INT
)
BEGIN
    UPDATE `lager`
        SET `antal` = `antal` - num
    WHERE `antal` > 0 AND `produkt` = prod AND `hylla` = shelf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_categories`()
BEGIN
    SELECT namn, super FROM kategori ORDER BY super, namn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product`(
    a_id INT
)
BEGIN
    SELECT
        p.*,
        p.benamning AS 'link',
        GROUP_CONCAT(k.namn) AS 'kategori'
    FROM produkt AS p
        JOIN produktkategori AS pk
            ON p.id = pk.produkt
        LEFT OUTER JOIN kategori AS k
            ON k.id = pk.kategori
    WHERE p.id = a_id
    GROUP BY
        p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_products`()
BEGIN
    SELECT
        p.*,
        CONCAT('<a href="product/', p.id, '">', p.benamning, '</a>') AS 'link',
        GROUP_CONCAT(k.namn) AS 'kategori'
    FROM produkt AS p
        JOIN produktkategori AS pk
            ON p.id = pk.produkt
        LEFT OUTER JOIN kategori AS k
            ON k.id = pk.kategori
    GROUP BY
        p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory`()
BEGIN
    SELECT * FROM v_lagerstatus;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inventory_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory_search`(
    s_term VARCHAR(20)
)
BEGIN
    SELECT * FROM v_lagerstatus
        WHERE id LIKE CONCAT("%", s_term, "%")
        OR namn LIKE CONCAT("%", s_term, "%")
        OR hylla LIKE CONCAT("%", s_term, "%")
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_log`(
    v_rows INT
)
BEGIN
    SELECT * FROM produkt_log
        ORDER BY `tidpunkt` DESC
        LIMIT v_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_shelves`()
BEGIN
    SELECT DISTINCT lokal, hylla, hyllplan FROM hylla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product`(
    a_id INT,
    a_benamning VARCHAR(20),
    a_beskrivning TEXT,
    a_pris DOUBLE(6, 2),
    a_antal INT
)
BEGIN
    UPDATE produkt SET
        benamning = a_benamning,
        beskrivning = a_beskrivning,
        pris = a_pris,
        antal = a_antal
    WHERE
        id = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `webshop`
--

USE `webshop`;

--
-- Final view structure for view `v_lagerstatus`
--

/*!50001 DROP TABLE IF EXISTS `v_lagerstatus`*/;
/*!50001 DROP VIEW IF EXISTS `v_lagerstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lagerstatus` AS select `p`.`id` AS `id`,`p`.`benamning` AS `namn`,concat(`h`.`hylla`,' ',`h`.`hyllplan`) AS `hylla`,`l`.`antal` AS `antal` from ((`produkt` `p` join `lager` `l` on(`p`.`id` = `l`.`produkt`)) left join `hylla` `h` on(`l`.`hylla` = `h`.`id`)) group by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-05 15:29:01
