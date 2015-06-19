-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Lannister','Tyrion',28,3),(2,'Stark','Arya',12,6),(3,'Snow','Jon',20,12),(4,'Tarth','Brianne',26,8),(5,'Lannister','Cersei',34,1),(6,'NoName','Mellisandre',33,10),(7,'Tarly','Sam',22,9),(8,'Bolton','Ramsay',25,14),(9,'Baratheon','Stannis',42,12),(10,'Tyrell','Loras',26,1),(11,'abc','asdf',22,1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'Laptop','HP','2014-07-24','Austria','Graz','Inffeldgasse',16),(2,'Smartphone','HTC','2012-09-01','USA','Silicon Valley','Mountain View',3),(3,'PC','Dell','2000-10-12','Westeros','Winterfell','Main Road',1),(4,'PC','Fujitsu','2013-03-05','Germany','Berlin','Hauptstrasse',1),(5,'Smartphone','Samsung','2015-01-01','Austria','Graz','Inffeldgasse',16),(6,'Laptop','Sony','2012-02-07','Westeros','Winterfell','Main Road',1),(7,'PC','MacBook','2014-01-02','USA','Bellevue','Northeast Street',4);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employee_used_vehicles`
--

LOCK TABLES `employee_used_vehicles` WRITE;
/*!40000 ALTER TABLE `employee_used_vehicles` DISABLE KEYS */;
INSERT INTO `employee_used_vehicles` VALUES (2,2,'2012-03-04'),(2,3,'2014-02-05'),(3,1,'2011-05-23'),(5,1,'2014-06-01'),(8,2,'2013-07-19'),(9,1,'2014-10-24'),(10,2,'2012-02-16'),(14,3,'2013-09-12');
/*!40000 ALTER TABLE `employee_used_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employee_uses_devices`
--

LOCK TABLES `employee_uses_devices` WRITE;
/*!40000 ALTER TABLE `employee_uses_devices` DISABLE KEYS */;
INSERT INTO `employee_uses_devices` VALUES (4,2),(2,3),(1,5),(1,6),(2,7),(5,7),(6,8);
/*!40000 ALTER TABLE `employee_uses_devices` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employee_uses_software`
--

LOCK TABLES `employee_uses_software` WRITE;
/*!40000 ALTER TABLE `employee_uses_software` DISABLE KEYS */;
INSERT INTO `employee_uses_software` VALUES (2,1),(1,2),(3,2),(4,2),(10,2),(1,3),(2,3),(4,4);
/*!40000 ALTER TABLE `employee_uses_software` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Newell','Gabe',23,'CEO','USA','Bellevue','Northeast Street',4,1),(2,'Walker','Robin',23,'TF2 Inventor','USA','Bellevue','Northeast Street',4,1),(3,'Gates','Bill',65,'VP','USA','Bellevue','Northeast Street',4,1),(4,'Ismail','Abdul',31,'Dota Inventor','USA','Bellevue','Northeast Street',4,1),(5,'Musterman','Max',37,'Developer','USA','Bellevue','Northeast Street',4,2),(6,'Rogrammer','Peter',27,'Graphic Designer','USA','Bellevue','Northeast Street',4,2),(7,'Dude','Guy',52,'Developer','USA','Bellevue','Northeast Street',4,2),(8,'Balmer','Steve',48,'Developer','USA','Bellevue','Northeast Street',4,2),(9,'Jobs','Steve',42,'Engineer','USA','Bellevue','Northeast Street',4,2),(10,'Burns','Montgomery',122,'Manager','USA','Springfield','Fakestreet',123,1),(11,'Simpson','Homer',38,'Safety Inspector','USA','Springfield','Fakestreet',123,10),(12,'Simpson','Marge',36,'House Wife','USA','Springfield','Fakestreet',123,10),(13,'Jörg','Hans',45,'Manager','Germany','Berlin','Hauptstrasse',1,1),(14,'Musterfrau','Anita',32,'Developer','Germany','Berlin','Hauptstrasse',1,13);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Austria','Graz','Inffeldgasse',16),('Germany','Berlin','Hauptstrasse',1),('USA','Bellevue','Northeast Street',4),('USA','Silicon Valley','Mountain View',3),('USA','Springfield','Fakestreet',123),('Westeros','Winterfell','Main Road ',1);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Database Management Suite','Software',200,300),(2,'Database Control Center','Software',75,95),(3,'Database Editor','Software',65,75),(4,'Database Cloud Management','Software',50,60),(5,'Database Helpdesk','Software',25,30);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sale_has_products`
--

LOCK TABLES `sale_has_products` WRITE;
/*!40000 ALTER TABLE `sale_has_products` DISABLE KEYS */;
INSERT INTO `sale_has_products` VALUES (1,2,5),(2,4,1),(3,1,2),(4,5,4),(5,2,4),(6,1,3),(7,5,2);
/*!40000 ALTER TABLE `sale_has_products` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2002-07-20',20,2,6),(2,'2009-03-20',43500,7,1),(3,'2014-12-20',76500,5,5),(4,'2003-01-20',8034,8,6),(5,'2009-05-20',3456,1,9),(6,'2007-09-20',23678,2,10),(7,'2007-06-20',41768,3,8);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES (1,'IDE','Microsoft','Visual Studio Ultimate','2016-05-06'),(2,'Editor','Sublime','Sublime Text','2016-12-31'),(3,'Database Management','MySQL','MySQL Enterprise Edition','2016-08-31'),(4,'Image Editing','Adobe','Creative Cloud','2015-05-31');
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sold_at`
--

LOCK TABLES `sold_at` WRITE;
/*!40000 ALTER TABLE `sold_at` DISABLE KEYS */;
INSERT INTO `sold_at` VALUES (1,'Westeros','Winterfell','Main Road',1),(2,'Austria','Graz','Inffeldgasse',16),(2,'Germany','Berlin','Hauptstrasse',1),(3,'Westeros','Winterfell','Main Road',1),(4,'USA','Springfield','Fakestreet',123),(5,'Germany','Berlin','Hauptstrasse',1);
/*!40000 ALTER TABLE `sold_at` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Limousine','BMW','5 2014','2014-05-30','Germany','Berlin','Hauptstrasse',1),(2,'Truck','Dodge','Ram 2010','2011-04-12','USA','Bellevue','Northeast Street',4),(3,'Bus','VW','Multivan 2013','2013-01-14','Germany','Berlin','Hauptstrasse',1);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-09  8:54:49
