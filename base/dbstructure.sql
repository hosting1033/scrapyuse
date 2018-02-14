CREATE DATABASE  IF NOT EXISTS `drones` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `drones`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: drones
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `drone`
--

DROP TABLE IF EXISTS `drone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drone` (
  `id` varchar(45) NOT NULL,
  `model` varchar(250) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `info_by_manufacturer` mediumtext,
  `motion_type` enum('quadcopter','plane','helycopter','car','boat') DEFAULT NULL,
  `material` enum('plastic','carbon_fiber','fiberglass','foam','metal','wood') DEFAULT NULL,
  `kit_type` enum('ready','almost_ready','to_be_bind','plug_and_play','constructor','parts') DEFAULT NULL,
  `area` enum('indoor','outdoor','both') DEFAULT NULL,
  `impl_field` enum('joy','work') DEFAULT NULL,
  `level` enum('beginners','intermediate','expert') DEFAULT NULL,
  `age` enum('kids','adult') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` varchar(45) NOT NULL,
  `rate_by_author` decimal(10,0) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `content` longtext,
  `author` varchar(45) DEFAULT NULL,
  `number_of_comments` int(11) DEFAULT NULL,
  `date_of_review` datetime DEFAULT NULL,
  `sale_id` varchar(45) DEFAULT NULL,
  `drone_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rd_idx` (`drone_id`),
  KEY `fk_rs_idx` (`sale_id`),
  CONSTRAINT `fk_rd` FOREIGN KEY (`drone_id`) REFERENCES `drone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rs` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `id` varchar(45) NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `provider_name` varchar(45) DEFAULT NULL,
  `dron_full_name` varchar(500) DEFAULT NULL,
  `descr` mediumtext,
  `spec` mediumtext,
  `shipping_info` tinytext,
  `customer_rating` decimal(10,0) DEFAULT NULL,
  `number_of_reviews` int(11) DEFAULT NULL,
  `number_of_questions` int(11) DEFAULT NULL,
  `id_by_provider` varchar(45) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `drone_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_idx` (`drone_id`),
  CONSTRAINT `fk_sd` FOREIGN KEY (`drone_id`) REFERENCES `drone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'drones'
--

--
-- Dumping routines for database 'drones'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-14  3:12:44
