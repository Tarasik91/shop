-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `lastName` varchar(80) DEFAULT NULL,
  `firstName` varchar(80) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,NULL,'2017-09-27 18:25:16',1,'jkh','we','ui','uhi',NULL),(2,NULL,'2017-09-27 18:25:32',1,'jihio','sdf','ijio','ojio',NULL),(3,NULL,'2017-09-27 20:57:28',1,'sdfs','sdf','werewr','d','dsgsv'),(4,NULL,'2017-09-27 20:58:16',1,'sdfs','sdf','werewr','d','dsgsv'),(5,NULL,'2017-09-27 20:58:27',1,'sdfs','sdf','werewr','d','dsgsv'),(6,NULL,'2017-09-27 20:59:44',1,'fwe','e','l;k','o','kjok'),(7,NULL,'2017-09-27 21:01:11',1,'jkh','df','kjh','ij','ilj'),(8,NULL,'2017-09-28 05:06:20',1,'jkh','df','kjh','ij','ilj'),(9,NULL,'2017-09-28 05:06:21',1,'jkh','df','kjh','ij','ilj'),(10,NULL,'2017-09-28 16:45:41',1,'jkh','df','kjh','ij','ilj'),(11,NULL,'2017-09-28 16:46:23',1,'oj','d','opi','67','ijop'),(12,NULL,'2017-09-30 20:32:47',1,'hil','ddsfadsf','okl[po','kj','ooi'),(13,NULL,'2017-10-01 19:44:03',1,'pk`opk','ls','okp','opk','opk');
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-04 20:39:24
