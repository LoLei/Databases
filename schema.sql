-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_client_UNIQUE` (`id`),
  KEY `fk_clients_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_clients_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `locations_country` varchar(45) NOT NULL,
  `locations_city` varchar(45) NOT NULL,
  `locations_street` varchar(45) NOT NULL,
  `locations_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_devices_UNIQUE` (`id`),
  KEY `fk_devices_locations1_idx` (`locations_country`,`locations_city`,`locations_street`,`locations_number`),
  CONSTRAINT `fk_devices_locations1` FOREIGN KEY (`locations_country`, `locations_city`, `locations_street`, `locations_number`) REFERENCES `locations` (`country`, `city`, `street`, `number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_used_vehicles`
--

DROP TABLE IF EXISTS `employee_used_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_used_vehicles` (
  `employees_id` int(11) NOT NULL,
  `vehicles_id` int(11) NOT NULL,
  `date_used` date DEFAULT NULL,
  PRIMARY KEY (`employees_id`,`vehicles_id`),
  KEY `fk_employees_has_vehicles_vehicles1_idx` (`vehicles_id`),
  KEY `fk_employees_has_vehicles_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_employees_has_vehicles_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_vehicles_vehicles1` FOREIGN KEY (`vehicles_id`) REFERENCES `vehicles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_uses_devices`
--

DROP TABLE IF EXISTS `employee_uses_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_uses_devices` (
  `devices_id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  PRIMARY KEY (`devices_id`,`employees_id`),
  KEY `fk_devices_has_employees_employees1_idx` (`employees_id`),
  KEY `fk_devices_has_employees_devices1_idx` (`devices_id`),
  CONSTRAINT `fk_devices_has_employees_devices1` FOREIGN KEY (`devices_id`) REFERENCES `devices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devices_has_employees_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_uses_software`
--

DROP TABLE IF EXISTS `employee_uses_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_uses_software` (
  `employees_id` int(11) NOT NULL,
  `software_id` int(11) NOT NULL,
  PRIMARY KEY (`employees_id`,`software_id`),
  KEY `fk_employees_has_software_software1_idx` (`software_id`),
  KEY `fk_employees_has_software_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_employees_has_software_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_software_software1` FOREIGN KEY (`software_id`) REFERENCES `software` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `position` varchar(45) DEFAULT NULL,
  `locations_country` varchar(45) NOT NULL,
  `locations_city` varchar(45) NOT NULL,
  `locations_street` varchar(45) NOT NULL,
  `locations_number` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idEmployees_UNIQUE` (`id`),
  KEY `fk_employees_locations1_idx` (`locations_country`,`locations_city`,`locations_street`,`locations_number`),
  KEY `fk_employees_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_employees_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_locations1` FOREIGN KEY (`locations_country`, `locations_city`, `locations_street`, `locations_number`) REFERENCES `locations` (`country`, `city`, `street`, `number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`country`,`city`,`street`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_products_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_has_products`
--

DROP TABLE IF EXISTS `sale_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_has_products` (
  `sales_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `number_of_product` int(11) NOT NULL,
  PRIMARY KEY (`sales_id`,`products_id`),
  KEY `fk_sales_has_products_products1_idx` (`products_id`),
  KEY `fk_sales_has_products_sales1_idx` (`sales_id`),
  CONSTRAINT `fk_sales_has_products_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_has_products_sales1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `price` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`clients_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sales_employees1_idx` (`employees_id`),
  KEY `fk_sales_clients1_idx` (`clients_id`),
  CONSTRAINT `fk_sales_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `distributor` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `license_expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_software_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sold_at`
--

DROP TABLE IF EXISTS `sold_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_at` (
  `products_id` int(11) NOT NULL,
  `locations_country` varchar(45) NOT NULL,
  `locations_city` varchar(45) NOT NULL,
  `locations_street` varchar(45) NOT NULL,
  `locations_number` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`locations_country`,`locations_city`,`locations_street`,`locations_number`),
  KEY `fk_products_has_locations_locations1_idx` (`locations_country`,`locations_city`,`locations_street`,`locations_number`),
  KEY `fk_products_has_locations_products1_idx` (`products_id`),
  CONSTRAINT `fk_products_has_locations_locations1` FOREIGN KEY (`locations_country`, `locations_city`, `locations_street`, `locations_number`) REFERENCES `locations` (`country`, `city`, `street`, `number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_locations_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `locations_country` varchar(45) NOT NULL,
  `locations_city` varchar(45) NOT NULL,
  `locations_street` varchar(45) NOT NULL,
  `locations_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_vehicles_UNIQUE` (`id`),
  KEY `fk_vehicles_locations1_idx` (`locations_country`,`locations_city`,`locations_street`,`locations_number`),
  CONSTRAINT `fk_vehicles_locations1` FOREIGN KEY (`locations_country`, `locations_city`, `locations_street`, `locations_number`) REFERENCES `locations` (`country`, `city`, `street`, `number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-09  8:08:24
