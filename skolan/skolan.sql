-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: skolan
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB-1:10.4.11+maria~bionic-log

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `code` char(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `nick` char(10) NOT NULL,
  `points` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurs` (
  `kod` char(6) COLLATE utf8_swedish_ci NOT NULL,
  `namn` varchar(15) COLLATE utf8_swedish_ci DEFAULT NULL,
  `poang` float DEFAULT NULL,
  `niva` char(3) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES ('AST101','Astronomi',5,'G1N'),('DJU101','Skötsel och vår',4,'G1F'),('DRY101','Trolldryckslära',6,'G1N'),('DRY102','Trolldryckslära',6,'G1F'),('KVA101','Kvastflygning',4,'G1N'),('MUG101','Mugglarstudier',6,'G1F'),('SVT101','Försvar mot sva',8,'G1N'),('SVT201','Försvar mot sva',6,'G1F'),('SVT202','Försvar mot sva',6,'G1F'),('SVT401','Försvar mot sva',6,'G2F'),('VAN101','Förvandlingskon',5,'G1F');
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurstillfalle`
--

DROP TABLE IF EXISTS `kurstillfalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurstillfalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kurskod` char(6) COLLATE utf8_swedish_ci NOT NULL,
  `kursansvarig` char(3) COLLATE utf8_swedish_ci NOT NULL,
  `lasperiod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kurskod` (`kurskod`),
  KEY `kursansvarig` (`kursansvarig`),
  CONSTRAINT `kurstillfalle_ibfk_1` FOREIGN KEY (`kurskod`) REFERENCES `kurs` (`kod`),
  CONSTRAINT `kurstillfalle_ibfk_2` FOREIGN KEY (`kursansvarig`) REFERENCES `larare` (`akronym`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurstillfalle`
--

LOCK TABLES `kurstillfalle` WRITE;
/*!40000 ALTER TABLE `kurstillfalle` DISABLE KEYS */;
INSERT INTO `kurstillfalle` VALUES (1,'SVT101','gyl',1),(2,'SVT101','gyl',3),(3,'SVT201','ala',1),(4,'SVT202','ala',2),(5,'SVT401','sna',1),(6,'KVA101','hoc',1),(7,'DJU101','hag',3),(8,'DRY101','sna',2),(9,'DRY102','sna',3),(10,'MUG101','min',4);
/*!40000 ALTER TABLE `kurstillfalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare`
--

DROP TABLE IF EXISTS `larare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare` (
  `akronym` char(3) COLLATE utf8_swedish_ci NOT NULL,
  `avdelning` char(4) COLLATE utf8_swedish_ci DEFAULT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `efternamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kon` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) DEFAULT 1,
  `ny_lon` int(11) DEFAULT NULL,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare`
--

LOCK TABLES `larare` WRITE;
/*!40000 ALTER TABLE `larare` DISABLE KEYS */;
INSERT INTO `larare` VALUES ('ala','DIPT','Alastor','Moody','M',30000,'1943-04-03',1,27594),('dum','ADM','Albus','Dumbledore','M',80000,'1941-04-01',7,85000),('fil','ADM','Argus','Filch','M',25000,'1946-04-06',3,27594),('gyl','DIPT','Gyllenroy','Lockman','M',30000,'1952-05-02',1,27594),('hag','ADM','Hagrid','Rubeus','M',25000,'1956-05-06',2,30000),('hoc','DIDD','Madam','Hooch','K',35000,'1948-04-08',1,37580),('min','DIDD','Minerva','McGonagall','K',40000,'1955-05-05',2,49880),('sna','DIPT','Severus','Snape','M',40000,'1951-05-01',2,45000);
/*!40000 ALTER TABLE `larare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare_pre`
--

DROP TABLE IF EXISTS `larare_pre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare_pre` (
  `akronym` char(3) COLLATE utf8_swedish_ci NOT NULL,
  `avdelning` char(4) COLLATE utf8_swedish_ci DEFAULT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `efternamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kon` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) DEFAULT 1,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare_pre`
--

LOCK TABLES `larare_pre` WRITE;
/*!40000 ALTER TABLE `larare_pre` DISABLE KEYS */;
INSERT INTO `larare_pre` VALUES ('ala','DIPT','Alastor','Moody','M',30000,'1943-04-03',1),('dum','ADM','Albus','Dumbledore','M',80000,'1941-04-01',1),('fil','ADM','Argus','Filch','M',25000,'1946-04-06',1),('gyl','DIPT','Gyllenroy','Lockman','M',30000,'1952-05-02',1),('hag','ADM','Hagrid','Rubeus','M',25000,'1956-05-06',1),('hoc','DIDD','Madam','Hooch','K',35000,'1948-04-08',1),('min','DIDD','Minerva','McGonagall','K',40000,'1955-05-05',1),('sna','DIPT','Severus','Snape','M',40000,'1951-05-01',1);
/*!40000 ALTER TABLE `larare_pre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `fornamn` varchar(10) COLLATE utf8_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('Örjan'),('Börje'),('Bo'),('Øjvind'),('Åke'),('Åkesson'),('Arne'),('Ängla'),('Ægir');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `acronym` char(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`acronym`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student2course`
--

DROP TABLE IF EXISTS `student2course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student2course` (
  `acronym` char(6) NOT NULL,
  `code` char(6) NOT NULL,
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`acronym`,`code`),
  KEY `code` (`code`),
  CONSTRAINT `student2course_ibfk_1` FOREIGN KEY (`acronym`) REFERENCES `student` (`acronym`),
  CONSTRAINT `student2course_ibfk_2` FOREIGN KEY (`code`) REFERENCES `course` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student2course`
--

LOCK TABLES `student2course` WRITE;
/*!40000 ALTER TABLE `student2course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student2course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `i` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t2`
--

DROP TABLE IF EXISTS `t2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2` (
  `i` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t2`
--

LOCK TABLES `t2` WRITE;
/*!40000 ALTER TABLE `t2` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_larare`
--

DROP TABLE IF EXISTS `v_larare`;
/*!50001 DROP VIEW IF EXISTS `v_larare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_larare` (
  `akronym` tinyint NOT NULL,
  `avdelning` tinyint NOT NULL,
  `fornamn` tinyint NOT NULL,
  `efternamn` tinyint NOT NULL,
  `kon` tinyint NOT NULL,
  `lon` tinyint NOT NULL,
  `fodd` tinyint NOT NULL,
  `kompetens` tinyint NOT NULL,
  `Ålder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_lonerevision`
--

DROP TABLE IF EXISTS `v_lonerevision`;
/*!50001 DROP VIEW IF EXISTS `v_lonerevision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_lonerevision` (
  `akronym` tinyint NOT NULL,
  `namn` tinyint NOT NULL,
  `pre` tinyint NOT NULL,
  `nu` tinyint NOT NULL,
  `diff` tinyint NOT NULL,
  `proc` tinyint NOT NULL,
  `mini` tinyint NOT NULL,
  `prekomp` tinyint NOT NULL,
  `nukomp` tinyint NOT NULL,
  `diffkomp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_name_alder`
--

DROP TABLE IF EXISTS `v_name_alder`;
/*!50001 DROP VIEW IF EXISTS `v_name_alder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_name_alder` (
  `Akronym` tinyint NOT NULL,
  `Namn` tinyint NOT NULL,
  `Ålder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_planering`
--

DROP TABLE IF EXISTS `v_planering`;
/*!50001 DROP VIEW IF EXISTS `v_planering`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_planering` (
  `kod` tinyint NOT NULL,
  `namn` tinyint NOT NULL,
  `poang` tinyint NOT NULL,
  `niva` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `kurskod` tinyint NOT NULL,
  `kursansvarig` tinyint NOT NULL,
  `lasperiod` tinyint NOT NULL,
  `akronym` tinyint NOT NULL,
  `avdelning` tinyint NOT NULL,
  `fornamn` tinyint NOT NULL,
  `efternamn` tinyint NOT NULL,
  `kon` tinyint NOT NULL,
  `lon` tinyint NOT NULL,
  `fodd` tinyint NOT NULL,
  `kompetens` tinyint NOT NULL,
  `ny_lon` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_larare`
--

/*!50001 DROP TABLE IF EXISTS `v_larare`*/;
/*!50001 DROP VIEW IF EXISTS `v_larare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_larare` AS select `larare`.`akronym` AS `akronym`,`larare`.`avdelning` AS `avdelning`,`larare`.`fornamn` AS `fornamn`,`larare`.`efternamn` AS `efternamn`,`larare`.`kon` AS `kon`,`larare`.`lon` AS `lon`,`larare`.`fodd` AS `fodd`,`larare`.`kompetens` AS `kompetens`,timestampdiff(YEAR,`larare`.`fodd`,curdate()) AS `Ålder` from `larare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lonerevision`
--

/*!50001 DROP TABLE IF EXISTS `v_lonerevision`*/;
/*!50001 DROP VIEW IF EXISTS `v_lonerevision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lonerevision` AS select `l`.`akronym` AS `akronym`,concat(`l`.`fornamn`,' ',`l`.`efternamn`) AS `namn`,`p`.`lon` AS `pre`,`l`.`lon` AS `nu`,`l`.`lon` - `p`.`lon` AS `diff`,round((`l`.`lon` - `p`.`lon`) / `p`.`lon` * 100,2) AS `proc`,if(round((`l`.`lon` - `p`.`lon`) / `p`.`lon` * 100,2) > 3,'ok','nok') AS `mini`,`p`.`kompetens` AS `prekomp`,`l`.`kompetens` AS `nukomp`,`l`.`kompetens` - `p`.`kompetens` AS `diffkomp` from (`larare` `l` join `larare_pre` `p` on(`l`.`akronym` = `p`.`akronym`)) order by `l`.`akronym` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_name_alder`
--

/*!50001 DROP TABLE IF EXISTS `v_name_alder`*/;
/*!50001 DROP VIEW IF EXISTS `v_name_alder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_name_alder` AS select `larare`.`akronym` AS `Akronym`,concat(`larare`.`fornamn`,' ',`larare`.`efternamn`,' (',lcase(`larare`.`avdelning`),')') AS `Namn`,timestampdiff(YEAR,`larare`.`fodd`,curdate()) AS `Ålder` from `larare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_planering`
--

/*!50001 DROP TABLE IF EXISTS `v_planering`*/;
/*!50001 DROP VIEW IF EXISTS `v_planering`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_planering` AS select `k`.`kod` AS `kod`,`k`.`namn` AS `namn`,`k`.`poang` AS `poang`,`k`.`niva` AS `niva`,`kt`.`id` AS `id`,`kt`.`kurskod` AS `kurskod`,`kt`.`kursansvarig` AS `kursansvarig`,`kt`.`lasperiod` AS `lasperiod`,`l`.`akronym` AS `akronym`,`l`.`avdelning` AS `avdelning`,`l`.`fornamn` AS `fornamn`,`l`.`efternamn` AS `efternamn`,`l`.`kon` AS `kon`,`l`.`lon` AS `lon`,`l`.`fodd` AS `fodd`,`l`.`kompetens` AS `kompetens`,`l`.`ny_lon` AS `ny_lon` from ((`kurs` `k` join `kurstillfalle` `kt` on(`k`.`kod` = `kt`.`kurskod`)) join `larare` `l` on(`l`.`akronym` = `kt`.`kursansvarig`)) */;
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

-- Dump completed on 2021-02-23 21:06:46
