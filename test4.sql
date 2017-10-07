-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: test4
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `fname` varchar(40) NOT NULL COMMENT 'имя',
  `sname` varchar(40) NOT NULL COMMENT 'фамилия',
  `phone` varchar(20) NOT NULL COMMENT 'телефон',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='агент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Имя','Фамилия','123456789');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appart`
--

DROP TABLE IF EXISTS `appart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appart` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `real_estate_id` bigint(22) unsigned NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_appart_real_estate_id_real_estate_idx` (`real_estate_id`),
  CONSTRAINT `fk_appart_real_estate_id_real_estate` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='квартира';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appart`
--

LOCK TABLES `appart` WRITE;
/*!40000 ALTER TABLE `appart` DISABLE KEYS */;
INSERT INTO `appart` VALUES (2,1,1),(3,1,1);
/*!40000 ALTER TABLE `appart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cottage`
--

DROP TABLE IF EXISTS `cottage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cottage` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `real_estate_id` bigint(22) unsigned NOT NULL,
  `area_real` decimal(10,2) unsigned NOT NULL COMMENT 'площадь участка',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cottage_real_estate_id_real_estate_idx` (`real_estate_id`),
  CONSTRAINT `fk_cottage_real_estate_id_real_estate` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='коттэдж';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cottage`
--

LOCK TABLES `cottage` WRITE;
/*!40000 ALTER TABLE `cottage` DISABLE KEYS */;
INSERT INTO `cottage` VALUES (1,1,333.00,1),(2,1,12.00,1);
/*!40000 ALTER TABLE `cottage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `real_estate`
--

DROP TABLE IF EXISTS `real_estate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `real_estate` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `agent_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор агента',
  `street_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор улицы',
  `building` varchar(30) NOT NULL COMMENT 'номер дома',
  `room_count` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT 'кол-во комнат',
  `area_live` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'площадь жилая',
  `stage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cottage_agent_id_agent_idx` (`agent_id`),
  KEY `fk_cottage_street_id_street_idx` (`street_id`),
  CONSTRAINT `fk_real_estate_agent_id_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_real_estate_street_id_street` FOREIGN KEY (`street_id`) REFERENCES `street` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='квартира';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_estate`
--

LOCK TABLES `real_estate` WRITE;
/*!40000 ALTER TABLE `real_estate` DISABLE KEYS */;
INSERT INTO `real_estate` VALUES (1,1,1,'123',255,231.00,255);
/*!40000 ALTER TABLE `real_estate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `street` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `title` varchar(60) NOT NULL COMMENT 'название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='улица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
INSERT INTO `street` VALUES (1,'Название улицы');
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_appart`
--

DROP TABLE IF EXISTS `v_appart`;
/*!50001 DROP VIEW IF EXISTS `v_appart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_appart` AS SELECT 
 1 AS `id`,
 1 AS `appart_id`,
 1 AS `real_estate_id`,
 1 AS `agent_id`,
 1 AS `street_id`,
 1 AS `building`,
 1 AS `room_count`,
 1 AS `area_live`,
 1 AS `stage`,
 1 AS `agent_fname`,
 1 AS `agent_sname`,
 1 AS `agent_phone`,
 1 AS `street_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cottage`
--

DROP TABLE IF EXISTS `v_cottage`;
/*!50001 DROP VIEW IF EXISTS `v_cottage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_cottage` AS SELECT 
 1 AS `id`,
 1 AS `cottage_id`,
 1 AS `area_real`,
 1 AS `real_estate_id`,
 1 AS `agent_id`,
 1 AS `street_id`,
 1 AS `building`,
 1 AS `room_count`,
 1 AS `area_live`,
 1 AS `stage`,
 1 AS `agent_fname`,
 1 AS `agent_sname`,
 1 AS `agent_phone`,
 1 AS `street_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_real_estate`
--

DROP TABLE IF EXISTS `v_real_estate`;
/*!50001 DROP VIEW IF EXISTS `v_real_estate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_real_estate` AS SELECT 
 1 AS `real_estate_id`,
 1 AS `agent_id`,
 1 AS `street_id`,
 1 AS `building`,
 1 AS `room_count`,
 1 AS `area_live`,
 1 AS `stage`,
 1 AS `agent_fname`,
 1 AS `agent_sname`,
 1 AS `agent_phone`,
 1 AS `street_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_appart`
--

/*!50001 DROP VIEW IF EXISTS `v_appart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_appart` AS select `a1`.`id` AS `id`,`a1`.`id` AS `appart_id`,`vre1`.`real_estate_id` AS `real_estate_id`,`vre1`.`agent_id` AS `agent_id`,`vre1`.`street_id` AS `street_id`,`vre1`.`building` AS `building`,`vre1`.`room_count` AS `room_count`,`vre1`.`area_live` AS `area_live`,`vre1`.`stage` AS `stage`,`vre1`.`agent_fname` AS `agent_fname`,`vre1`.`agent_sname` AS `agent_sname`,`vre1`.`agent_phone` AS `agent_phone`,`vre1`.`street_title` AS `street_title` from (`appart` `a1` join `v_real_estate` `vre1` on((`a1`.`real_estate_id` = `vre1`.`real_estate_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cottage`
--

/*!50001 DROP VIEW IF EXISTS `v_cottage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cottage` AS select `c1`.`id` AS `id`,`c1`.`id` AS `cottage_id`,`c1`.`area_real` AS `area_real`,`vre1`.`real_estate_id` AS `real_estate_id`,`vre1`.`agent_id` AS `agent_id`,`vre1`.`street_id` AS `street_id`,`vre1`.`building` AS `building`,`vre1`.`room_count` AS `room_count`,`vre1`.`area_live` AS `area_live`,`vre1`.`stage` AS `stage`,`vre1`.`agent_fname` AS `agent_fname`,`vre1`.`agent_sname` AS `agent_sname`,`vre1`.`agent_phone` AS `agent_phone`,`vre1`.`street_title` AS `street_title` from (`cottage` `c1` join `v_real_estate` `vre1` on((`c1`.`real_estate_id` = `vre1`.`real_estate_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_real_estate`
--

/*!50001 DROP VIEW IF EXISTS `v_real_estate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_real_estate` AS select `re1`.`id` AS `real_estate_id`,`re1`.`agent_id` AS `agent_id`,`re1`.`street_id` AS `street_id`,`re1`.`building` AS `building`,`re1`.`room_count` AS `room_count`,`re1`.`area_live` AS `area_live`,`re1`.`stage` AS `stage`,`a2`.`fname` AS `agent_fname`,`a2`.`sname` AS `agent_sname`,`a2`.`phone` AS `agent_phone`,`s1`.`title` AS `street_title` from ((`real_estate` `re1` join `agent` `a2` on((`re1`.`agent_id` = `a2`.`id`))) join `street` `s1` on((`re1`.`street_id` = `s1`.`id`))) */;
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

-- Dump completed on 2017-10-07  5:40:53
