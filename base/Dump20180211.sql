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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(250) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `motion_type` enum('copter','plane','track') DEFAULT NULL,
  `manufacturer_info` mediumtext,
  `kit_type` enum('ready','constructor','parts') DEFAULT NULL,
  `area` enum('indoor','outdoor','both') DEFAULT NULL,
  `impl_field` enum('joy','work') DEFAULT NULL,
  `level` enum('beginners','intermediate','expert') DEFAULT NULL,
  `age` enum('kids','adult') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `drone_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`drone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_rate` decimal(10,0) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `author` varchar(45) DEFAULT NULL,
  `number_of_comments` int(11) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `review_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_text_sale_idx` (`review_id`),
  CONSTRAINT `fk_review_sale` FOREIGN KEY (`review_id`) REFERENCES `sale` (`sale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) DEFAULT NULL,
  `provider_name` varchar(45) DEFAULT NULL,
  `dron_full_name` varchar(500) DEFAULT NULL,
  `descr` mediumtext,
  `specification` mediumtext,
  `shipping_info` tinytext,
  `customer_rating` decimal(10,0) DEFAULT NULL,
  `number_of_reviews` int(11) DEFAULT NULL,
  `number_of_questions` int(11) DEFAULT NULL,
  `drone_article` varchar(45) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `sale_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_idx` (`sale_id`),
  CONSTRAINT `fk_sale_drone` FOREIGN KEY (`sale_id`) REFERENCES `drone` (`drone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2018-02-11  3:55:04
