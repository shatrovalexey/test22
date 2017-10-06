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
  `agent_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор агента',
  `street_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор улицы',
  `building` varchar(30) NOT NULL COMMENT 'номер дома',
  `room_count` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT 'кол-во комнат',
  `z_plos` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'площадь жилая',
  `stage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cottage_agent_id_agent_idx` (`agent_id`),
  KEY `fk_cottage_street_id_street_idx` (`street_id`),
  CONSTRAINT `fk_appart_agent_id_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_appart_street_id_street` FOREIGN KEY (`street_id`) REFERENCES `street` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='квартира';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appart`
--

LOCK TABLES `appart` WRITE;
/*!40000 ALTER TABLE `appart` DISABLE KEYS */;
INSERT INTO `appart` VALUES (1,1,1,'23',34,46.00,0);
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
  `agent_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор агента',
  `street_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор улицы',
  `building` varchar(30) NOT NULL COMMENT 'номер дома',
  `room_count` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT 'кол-во комнат',
  `z_plos` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'площадь жилая',
  `u_plos` decimal(10,2) unsigned NOT NULL COMMENT 'площадь участка',
  PRIMARY KEY (`id`),
  KEY `fk_cottage_agent_id_agent_idx` (`agent_id`),
  KEY `fk_cottage_street_id_street_idx` (`street_id`),
  CONSTRAINT `fk_cottage_agent_id_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cottage_street_id_street` FOREIGN KEY (`street_id`) REFERENCES `street` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='коттэдж';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cottage`
--

LOCK TABLES `cottage` WRITE;
/*!40000 ALTER TABLE `cottage` DISABLE KEYS */;
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
  KEY `fk_cottage_street_id_street_idx` (`street_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='квартира';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_estate`
--

LOCK TABLES `real_estate` WRITE;
/*!40000 ALTER TABLE `real_estate` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 17:42:25
