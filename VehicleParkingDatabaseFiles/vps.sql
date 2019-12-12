-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: VehicleParkingSystem
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `availability_status` tinyint(1) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Akshay Hake',NULL,'akshayhake4@gmail.com','12345');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_no` varchar(20) NOT NULL,
  `space_required` int(11) DEFAULT NULL,
  `rc` tinyint(1) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`car_no`),
  KEY `emp_id` (`emp_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('1234',10,1,1,NULL),('1419',20,1,NULL,10),('2345',20,1,NULL,1),('2346',20,1,NULL,2),('2347',20,1,NULL,3),('2348',20,1,NULL,4),('2349',20,1,NULL,5),('2350',20,1,NULL,6),('2351',20,1,NULL,7),('2352',20,1,NULL,8),('2353',20,1,NULL,9),('3333',10,1,2,NULL),('4444',10,1,NULL,19),('5677',10,1,NULL,1),('5678',10,1,NULL,1),('5679',10,1,NULL,1),('6666',20,1,NULL,19),('7878',10,1,NULL,18),('8888',10,0,1,NULL),('8989',10,1,1,NULL),('9090',20,1,NULL,5),('9990',10,1,NULL,20),('9999',20,1,1,NULL),('mh12bh5633',20,1,1,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mob_no` varchar(12) DEFAULT NULL,
  `o_id` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `licence` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email` (`email`),
  KEY `o_id` (`o_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `organization` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Akshay','123',1,'a@gmail.com','123',1),(2,'Akshay Hake','9075725193',1,'a1@gmail.com','1234567890',0),(3,'Akshay hake','11222',1,'abc11@gmail.com','123',1),(4,'Akshay hake','1111',1,'waaaaaaab1111111c@gmail.com','123',1),(5,'Akshay hake','123',1,'ohiopff@gmail.com','',1),(6,'Akshay hake','123',1,'ohiokkkpff@gmail.com','123',1),(7,'Akshay hake','123',1,'abc@gmail.com','123',1),(8,'Akshay hake','9989998900',1,'manxnaabc@gmail.com','123',1),(9,'Akshay hake','9989998900',1,'manxnjjjjaabc@gmail.com','123',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `entry_car_detail`
--

DROP TABLE IF EXISTS `entry_car_detail`;
/*!50001 DROP VIEW IF EXISTS `entry_car_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `entry_car_detail` AS SELECT 
 1 AS `entry_no`,
 1 AS `slot_no`,
 1 AS `purpose`,
 1 AS `arrival_time`,
 1 AS `departure_time`,
 1 AS `booking_id`,
 1 AS `layout_id`,
 1 AS `status`,
 1 AS `car_no`,
 1 AS `space_required`,
 1 AS `rc`,
 1 AS `emp_id`,
 1 AS `visitor_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entry_detail`
--

DROP TABLE IF EXISTS `entry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_detail` (
  `entry_no` int(11) NOT NULL,
  `car_no` varchar(20) DEFAULT NULL,
  `slot_no` int(11) DEFAULT NULL,
  `purpose` text,
  `arrival_time` datetime DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`entry_no`),
  KEY `car_no` (`car_no`),
  KEY `slot_no` (`slot_no`),
  KEY `booking_id` (`booking_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `entry_detail_ibfk_1` FOREIGN KEY (`car_no`) REFERENCES `car` (`car_no`),
  CONSTRAINT `entry_detail_ibfk_2` FOREIGN KEY (`slot_no`) REFERENCES `slot` (`slot_no`),
  CONSTRAINT `entry_detail_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `pre_booking` (`booking_no`),
  CONSTRAINT `entry_detail_ibfk_4` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_detail`
--

LOCK TABLES `entry_detail` WRITE;
/*!40000 ALTER TABLE `entry_detail` DISABLE KEYS */;
INSERT INTO `entry_detail` VALUES (1,'2353',30,'qwdgu','2019-10-09 10:00:00','2019-10-12 15:30:00',1,NULL,'n'),(2,'1234',30,'jbsdklnlw','2019-10-07 13:00:00','2019-10-07 15:00:00',NULL,NULL,'y'),(3,'1419',32,'for meeting with xyz','2019-10-08 02:00:00','2019-10-08 05:00:00',NULL,NULL,'y'),(4,'1234',33,'for meeting with xyz','2019-10-08 22:00:00','2019-10-09 00:00:00',2,NULL,'c'),(5,'1234',33,'for meeting with xyz','2019-10-08 10:11:00','2019-10-08 12:00:00',3,NULL,'n'),(6,'1234',33,'for meeting with xyz','2019-10-08 22:00:00','2019-10-08 23:00:00',4,NULL,'c'),(7,'1234',38,'for meeting with xyz','2019-10-08 22:00:00','2019-10-09 01:00:00',NULL,NULL,'y'),(8,'1234',38,'for meeting with xyz','2019-10-09 10:00:00','2019-10-09 11:00:00',5,NULL,'c'),(9,'1234',38,'for meeting with xyz','2019-10-09 22:00:00','2019-10-09 23:00:00',6,NULL,'c'),(10,'1234',33,'for meeting with xyz','2019-10-09 16:00:00','2019-10-09 17:00:00',7,NULL,'c'),(11,'1234',34,'for meeting with xyz','2019-10-09 13:55:00','2019-10-09 18:55:00',NULL,NULL,'y'),(12,'1234',40,'for meeting with xyz','2019-10-09 18:00:00','2019-10-09 19:00:00',NULL,NULL,'y'),(13,'1234',38,'adsfdgfghh','2019-10-09 01:30:00','2019-10-09 03:30:00',8,NULL,'n'),(14,'7878',37,'for meeting with xyz','2019-10-09 17:00:00','2019-10-09 18:00:00',NULL,NULL,'y'),(15,'6666',25,'XYZ : meeting','2019-10-09 17:30:00','2019-10-09 19:30:00',NULL,NULL,'y'),(16,'4444',41,'for meeting with xyz','2019-10-09 22:00:00','2019-10-09 23:00:00',9,NULL,'y'),(17,'4444',42,'for meeting with xyz','2019-10-09 23:30:00','2019-10-10 00:00:00',10,NULL,'y'),(18,'1234',33,'for meeting with xyz','2019-10-10 16:00:00','2019-10-10 17:00:00',11,NULL,'c'),(19,'1234',36,'null : for meeting with xyz','2019-10-10 19:00:00','2019-10-10 20:00:00',NULL,NULL,'y'),(20,'1234',40,'for meeting with xyz','2019-10-10 12:00:00','2019-10-10 15:00:00',12,NULL,'n'),(21,'1234',33,'for meeting with xyz','2019-10-10 17:00:00','2019-10-10 20:00:00',13,NULL,'n'),(22,'1234',40,'for meeting with xyz','2019-10-11 22:00:00','2019-10-11 23:00:00',14,NULL,'c'),(23,'1419',32,'XYZ : for meeting with xyz','2019-10-10 18:00:00','2019-10-10 19:00:00',NULL,NULL,'y'),(24,'9990',47,'XYZ : for meeting with xyz','2019-10-10 18:40:00','2019-10-10 19:40:00',NULL,NULL,'y');
/*!40000 ALTER TABLE `entry_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger check_slot before insert on entry_detail for each row
begin
	if ((select count(*) from entry_detail where status<>'c' and (slot_no=NEW.slot_no and ((arrival_time<=NEW.departure_time and departure_time>=NEW.departure_time)  or (arrival_time<=NEW.arrival_time and departure_time>=NEW.arrival_time) or (arrival_time>=NEW.arrival_time and departure_time<=NEW.departure_time))))>0)
	then
		signal sqlstate '45000'
			set message_text='Error';
	end if;
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guestList`
--

DROP TABLE IF EXISTS `guestList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestList` (
  `o_id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `A_date` date DEFAULT NULL,
  KEY `o_id` (`o_id`),
  CONSTRAINT `guestList_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `organization` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestList`
--

LOCK TABLES `guestList` WRITE;
/*!40000 ALTER TABLE `guestList` DISABLE KEYS */;
INSERT INTO `guestList` VALUES (1,'abc@gmail.com',1,'2019-10-10'),(1,'nmc@gmail.com',5,'2019-10-10'),(1,'j@gmail.com',6,'2019-10-08'),(1,'l@gmail.com',1,'2019-10-13'),(1,'l@gmail.com',1,'2019-10-15'),(1,'aaaaaaaaaaaab1111111c@gmail.com',1,'2019-10-11'),(1,'jkkk@gmail.com',6,'2019-10-08'),(1,'jkkk@gmail.com',2,'2019-10-16'),(1,'abc@gmail.com',1,'2019-10-12'),(1,'nmc@gmail.com',1,'2019-10-21');
/*!40000 ALTER TABLE `guestList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout` (
  `layout_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `layout_structure` blob,
  PRIMARY KEY (`layout_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `layout_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `o_id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'XYZ','Pune','type1','xyz'),(2,'ABC','Pune','type2','abc');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL,
  `method` varchar(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `entry_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `entry_no` (`entry_no`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`entry_no`) REFERENCES `entry_detail` (`entry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Debit card',10,'Akshay hake','abc@gmail.com',1),(2,'Debit card',10,'Akshay','abcd@yahoo.com',1),(3,'Debit card',10,'Akshay','abcd@yah.com',1),(4,'Debit card',10,'Akshayh','abcd@yah.com',1),(5,'Debit card',10,'Akshayhk','abcd@yah.com',1),(6,'Debit card',5,'Akshay hake','abc@gmail.com',1),(7,'Credit card',20,'Akshay hake','abc@gmail.com',1),(8,'Credit card',20,'Akshay hake','abc@gmail.com',2),(9,'Credit card',30,'Akshay','abc@gmail.com',3),(10,'Credit card',10,'Akshay','abc@gmail.com',4),(11,'Debit card',10,'Akshay','abc@gmail.com',4),(12,'Credit card',18,'Akshay','abc@gmail.com',5),(13,'Credit card',10,'Akshay','abc@gmail.com',6),(14,'Debit card',10,'Akshay','abc@gmail.com',8),(15,'Debit card',10,'Akshay','abc@gmail.com',9),(16,'Debit card',10,'Akshay','abc@gmail.com',10),(17,'Debit card',20,'asdfg','asdfghj',13),(18,'Debit card',10,'Akshay','abc@gmail.com',16),(19,'Debit card',5,'Akshay','abc@gmail.com',17),(20,'Credit card',10,'Akshay','abc@gmail.com',18),(21,'Debit card',10,'Akshay','abc@gmail.com',20),(22,'Credit card',20,'Akshay','abc@gmail.com',20),(23,'Credit card',10,'Akshay','abc@gmail.com',21),(24,'Credit card',20,'Akshay','abc@gmail.com',21),(25,'Credit card',10,'Akshay','abc@gmail.com',22),(26,'Credit card',10,'Akshay','abc@gmail.com',19);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_booking`
--

DROP TABLE IF EXISTS `pre_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_booking` (
  `booking_no` int(11) NOT NULL,
  `booking_time` datetime DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_booking`
--

LOCK TABLES `pre_booking` WRITE;
/*!40000 ALTER TABLE `pre_booking` DISABLE KEYS */;
INSERT INTO `pre_booking` VALUES (1,'2019-10-09 10:00:00','2019-10-09 11:00:00'),(2,'2019-10-08 22:00:00','2019-10-08 23:00:00'),(3,'2019-10-08 10:11:00','2019-10-08 12:00:00'),(4,'2019-10-08 22:00:00','2019-10-08 23:00:00'),(5,'2019-10-09 10:00:00','2019-10-09 11:00:00'),(6,'2019-10-09 22:00:00','2019-10-09 23:00:00'),(7,'2019-10-09 16:00:00','2019-10-09 17:00:00'),(8,'2019-10-09 01:30:00','2019-10-09 03:30:00'),(9,'2019-10-09 22:00:00','2019-10-09 23:00:00'),(10,'2019-10-09 23:30:00','2019-10-10 00:00:00'),(11,'2019-10-10 16:00:00','2019-10-10 17:00:00'),(12,'2019-10-10 12:00:00','2019-10-10 13:00:00'),(13,'2019-10-10 17:00:00','2019-10-10 18:00:00'),(14,'2019-10-11 22:00:00','2019-10-11 23:00:00');
/*!40000 ALTER TABLE `pre_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `entry_no` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  KEY `entry_no` (`entry_no`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`entry_no`) REFERENCES `entry_detail` (`entry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (4,9),(6,9),(8,9),(9,9),(10,9),(18,9),(22,9);
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `o_id` int(11) DEFAULT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  KEY `o_id` (`o_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `organization` (`o_id`),
  CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot` (
  `slot_no` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `car_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`slot_no`),
  KEY `car_no` (`car_no`),
  CONSTRAINT `slot_ibfk_1` FOREIGN KEY (`car_no`) REFERENCES `car` (`car_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
INSERT INTO `slot` VALUES (1,0,NULL),(2,0,NULL),(3,1,NULL),(4,0,NULL),(5,0,NULL),(6,1,NULL),(7,1,NULL),(8,0,NULL),(9,0,NULL),(10,1,NULL),(11,1,NULL),(12,0,NULL),(13,0,NULL),(14,0,NULL),(15,1,NULL),(16,0,NULL),(17,1,NULL),(18,0,NULL),(19,1,NULL),(20,1,NULL),(21,0,NULL),(22,1,NULL),(23,1,NULL),(24,0,NULL),(25,0,NULL),(26,1,NULL),(27,1,NULL),(28,1,NULL),(29,1,NULL),(30,0,NULL),(31,1,NULL),(32,1,NULL),(33,1,NULL),(34,1,NULL),(35,0,NULL),(36,1,NULL),(37,0,NULL),(38,1,NULL),(39,0,NULL),(40,0,NULL),(41,1,NULL),(42,1,NULL),(43,1,NULL),(44,1,NULL),(45,0,NULL),(46,1,NULL),(47,1,NULL),(48,1,NULL),(49,1,NULL);
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor` (
  `visitor_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mob_no` bigint(10) DEFAULT NULL,
  `licence` tinyint(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,'Akshay',123,1,'a@gmail.com','123'),(2,'Akshay',123,1,'a1@gmail.com','123'),(3,'kk',123,0,'dfghk','123'),(4,'ll',123,0,'fff','123'),(5,'Hake',123456789,1,'gjhj','12345'),(6,'masmxm nlkn',127,1,'aaa@gmil.com','178'),(7,'Aditya Kadam',23456789,1,'a12@gmail.com','123'),(8,'mm',123,0,'mmm','123'),(9,'ss',123,0,'ss','123'),(10,'Rishikesh Shinde',9989998900,1,'nmc@gmail.com','12345'),(11,'Akshay hake',123,1,'ab11c@gmail.com','123'),(12,'Akshay hake',123,1,'abcfgff@gmail.com','123'),(13,'Akshay hake',1111,1,'ab1111111c@gmail.com','123'),(14,'Akshay hake',123,1,'ohiopff@gmail.com','123'),(15,'Akshay hake',123,1,'ohiaaokkkpff@gmail.com','123'),(16,'Akshay hake',123,1,'oaaassshiaaokkkpff@gmail.com','123'),(17,'Akshay hake',123,1,'akkkkbyyyyc@gmail.com','123'),(18,'Akshay hake',123,1,'akshay@gmail.com','123'),(19,'Akshay hake',123,1,'j@gmail.com','123'),(20,'Akshay hake',123,1,'abc@gmail.com','123');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `entry_car_detail`
--

/*!50001 DROP VIEW IF EXISTS `entry_car_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entry_car_detail` AS select `entry_detail`.`entry_no` AS `entry_no`,`entry_detail`.`slot_no` AS `slot_no`,`entry_detail`.`purpose` AS `purpose`,`entry_detail`.`arrival_time` AS `arrival_time`,`entry_detail`.`departure_time` AS `departure_time`,`entry_detail`.`booking_id` AS `booking_id`,`entry_detail`.`layout_id` AS `layout_id`,`entry_detail`.`status` AS `status`,`car`.`car_no` AS `car_no`,`car`.`space_required` AS `space_required`,`car`.`rc` AS `rc`,`car`.`emp_id` AS `emp_id`,`car`.`visitor_id` AS `visitor_id` from (`entry_detail` join `car`) where (`entry_detail`.`car_no` = `car`.`car_no`) order by `entry_detail`.`arrival_time` desc */;
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

-- Dump completed on 2019-10-12 21:08:36
