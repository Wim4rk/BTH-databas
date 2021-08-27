-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: exam
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
-- Current Database: `exam`
--

/*!40000 DROP DATABASE IF EXISTS `exam`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `exam`;

--
-- Table structure for table `anledning`
--

DROP TABLE IF EXISTS `anledning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anledning` (
  `typ` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `anledning` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anledning`
--

LOCK TABLES `anledning` WRITE;
/*!40000 ALTER TABLE `anledning` DISABLE KEYS */;
INSERT INTO `anledning` VALUES ('brott','Uppmanar till brott och busigheter'),('gdpr','Uppenbara brott mot GDPR'),('myt','Sprider myter och hemligheter');
/*!40000 ALTER TABLE `anledning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bok`
--

DROP TABLE IF EXISTS `bok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bok` (
  `id` int(4) NOT NULL,
  `titel` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `forfattare` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bok`
--

LOCK TABLES `bok` WRITE;
/*!40000 ALTER TABLE `bok` DISABLE KEYS */;
INSERT INTO `bok` VALUES (1111,'Dåfinkar och Dönickar','Ulf Stark'),(2222,'Bankeryd  1976 - 1977','Bilgruppen Femman'),(3333,'Bilbo - En Hobbits Äventyr','JRR Tolkien'),(4444,'Så länge vi båda andas','Stephenie Meyer');
/*!40000 ALTER TABLE `bok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylla`
--

DROP TABLE IF EXISTS `hylla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hylla` (
  `id` char(2) COLLATE utf8_swedish_ci NOT NULL,
  `bok_id` int(4) DEFAULT NULL,
  `utlanad` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bok_id` (`bok_id`),
  CONSTRAINT `hylla_ibfk_1` FOREIGN KEY (`bok_id`) REFERENCES `bok` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylla`
--

LOCK TABLES `hylla` WRITE;
/*!40000 ALTER TABLE `hylla` DISABLE KEYS */;
INSERT INTO `hylla` VALUES ('A',4444,''),('B',3333,''),('C',2222,'2019-08-30'),('D',1111,'2019-06-25');
/*!40000 ALTER TABLE `hylla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `bok_id` int(4) NOT NULL,
  `kategori_typ` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`bok_id`,`kategori_typ`),
  CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`bok_id`) REFERENCES `bok` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1111,'brott'),(2222,'gdpr'),(3333,'brott'),(4444,'myt');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_bok`
--

DROP TABLE IF EXISTS `v_bok`;
/*!50001 DROP VIEW IF EXISTS `v_bok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_bok` (
  `bok` tinyint NOT NULL,
  `forfattare` tinyint NOT NULL,
  `titel` tinyint NOT NULL,
  `kategori` tinyint NOT NULL,
  `hylla` tinyint NOT NULL,
  `utlanad` tinyint NOT NULL,
  `forbjuden` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'exam'
--
/*!50003 DROP PROCEDURE IF EXISTS `all_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `all_books`()
BEGIN
    SELECT
        bok,
        forfattare,
        titel,
        kategori,
        hylla,
        IFNULL(utlanad, "---") AS utlanad,
        forbjuden
    FROM v_bok
    ORDER BY bok
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `the_dogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `the_dogs`()
BEGIN
    SELECT
        husse,
        fornamn,
        efternamn,
        ort,
        hund,
        url,
        ras,
        godkand
    FROM v_hund
    ORDER BY efternamn, fornamn
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `exam`
--

USE `exam`;

--
-- Final view structure for view `v_bok`
--

/*!50001 DROP TABLE IF EXISTS `v_bok`*/;
/*!50001 DROP VIEW IF EXISTS `v_bok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bok` AS select `b`.`id` AS `bok`,`b`.`forfattare` AS `forfattare`,`b`.`titel` AS `titel`,`k`.`kategori_typ` AS `kategori`,`h`.`id` AS `hylla`,`h`.`utlanad` AS `utlanad`,`a`.`anledning` AS `forbjuden` from (((`bok` `b` join `hylla` `h` on(`b`.`id` = `h`.`bok_id`)) left join `kategori` `k` on(`b`.`id` = `k`.`bok_id`)) left join `anledning` `a` on(`a`.`typ` = `k`.`kategori_typ`)) */;
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

-- Dump completed on 2021-08-27 14:20:26
