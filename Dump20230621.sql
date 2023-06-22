CREATE DATABASE  IF NOT EXISTS `optical` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optical`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: optical
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment_logs`
--

DROP TABLE IF EXISTS `appointment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_logs`
--

LOCK TABLES `appointment_logs` WRITE;
/*!40000 ALTER TABLE `appointment_logs` DISABLE KEYS */;
INSERT INTO `appointment_logs` VALUES (1,1,1,1,'2023-03-20'),(2,2,2,4,'2023-03-21'),(3,3,3,2,'2023-03-22'),(4,4,4,5,'2023-03-23'),(5,5,5,3,'2023-03-23'),(6,6,6,3,'2023-03-23'),(7,7,7,3,'2023-03-24'),(8,8,8,1,'2023-03-24'),(9,9,9,4,'2023-03-25'),(10,10,10,5,'2023-03-25'),(11,11,11,2,'2023-03-26'),(12,12,12,4,'2023-03-26'),(13,13,13,1,'2023-03-27'),(14,14,14,2,'2023-03-25'),(15,15,15,5,'2023-03-26');
/*!40000 ALTER TABLE `appointment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `exam_type` set('Glasses','Contacts','Office Visit') DEFAULT NULL,
  `insurance_name` varchar(50) DEFAULT NULL,
  `copay` decimal(8,2) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `appointments_fk_patients` (`patient_id`),
  KEY `appointments_fk_doctors` (`doctor_id`),
  CONSTRAINT `appointments_fk_doctors` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `appointments_fk_patients` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,'2023-03-20','12:00:00','Glasses,Contacts','Eyemed',10.00),(2,4,2,'2023-03-21','12:30:00','Office Visit','Cigna',20.00),(3,2,3,'2023-03-22','10:45:00','Contacts','Aetna',20.00),(4,5,4,'2023-03-23','16:15:00','Glasses,Contacts','VSP',80.00),(5,3,5,'2023-03-23','11:45:00','Office Visit','Humana',20.00),(6,3,6,'2023-03-23','09:30:00','Contacts','VSP',80.00),(7,3,7,'2023-03-24','11:00:00','Glasses,Contacts','Humana',20.00),(8,1,8,'2023-03-24','15:30:00','Office Visit','Cigna',25.00),(9,4,9,'2023-03-25','12:00:00','Contacts','UnitedHealthcare',30.00),(10,5,10,'2023-03-25','11:45:00','Glasses','Eyemed',10.00),(11,2,11,'2023-03-26','09:15:00','Glasses','Cigna',30.00),(12,4,12,'2023-03-26','11:30:00','Office Visit','VSP',25.00),(13,1,13,'2023-03-27','14:00:00','Contacts','Aetna',20.00),(14,2,14,'2023-03-25','10:15:00','Glasses','Humana',20.00),(15,5,15,'2023-03-26','12:15:00','Contacts','VSP',40.00);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `black_frames`
--

DROP TABLE IF EXISTS `black_frames`;
/*!50001 DROP VIEW IF EXISTS `black_frames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `black_frames` AS SELECT 
 1 AS `brand_name`,
 1 AS `upc_number`,
 1 AS `frame_color`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'John','Levy','937-538-3942','j.levy@optical.com'),(2,'Michelle','Pleiman','937-325-4353','m.pleiman@optical.com'),(3,'Jason','Jones','937-434-1200','j.jones@optical.com'),(4,'Steven','Rogers','937-434-1211','s.rogers@optical.com'),(5,'Michael','Parks','513-212-4440','m.parks@optical.com');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `frame_sizes`
--

DROP TABLE IF EXISTS `frame_sizes`;
/*!50001 DROP VIEW IF EXISTS `frame_sizes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `frame_sizes` AS SELECT 
 1 AS `frame_width`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `frames`
--

DROP TABLE IF EXISTS `frames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frames` (
  `frame_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `style_number` varchar(6) NOT NULL,
  `upc_number` varchar(12) NOT NULL,
  `frame_color` varchar(50) NOT NULL,
  `frame_width` int NOT NULL,
  `bridge_size` int NOT NULL,
  `temple_length` int NOT NULL,
  `frame_price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`frame_id`),
  UNIQUE KEY `upc_number` (`upc_number`),
  KEY `brand_index` (`brand_name`),
  CONSTRAINT `frame_price_check` CHECK ((`frame_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frames`
--

LOCK TABLES `frames` WRITE;
/*!40000 ALTER TABLE `frames` DISABLE KEYS */;
INSERT INTO `frames` VALUES (1,'Ray-Ban','RB3025','805289602057','Gold',58,14,135,169.99),(2,'Oakley','OO4011','888392105904','Matte Black',55,18,137,150.00),(3,'Gucci','GG001O','88965205824','Havana',52,18,145,355.00),(4,'Prada','PR11TV','80536725122','Gloss Black',54,19,140,260.00),(5,'Tom Ford','FT5506','664689968941','Dark Havana',49,20,145,320.00),(6,'Emporio Armani','EA1065','805367257827','Black Rubber',53,18,145,140.00),(7,'Versace','VE3285','805367261312','Black',55,16,140,210.00),(8,'Calvin Klein','CK5460','75077912531','Havana',52,19,140,160.00),(9,'Burberry','BE1289','805367292168','Dark Havana',52,19,145,220.00),(10,'Dolce & Gabbana','DG5038','805367280092','Black',53,17,140,240.00);
/*!40000 ALTER TABLE `frames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses_sales`
--

DROP TABLE IF EXISTS `glasses_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses_sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `optician_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `frame_id` int NOT NULL,
  `lens_id` int NOT NULL,
  `total_cost` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`sale_id`),
  KEY `glasses_fk_opticians` (`optician_id`),
  KEY `glasses_fk_patients` (`patient_id`),
  KEY `glasses_fk_frames` (`frame_id`),
  KEY `glasses_fk_lenses` (`lens_id`),
  CONSTRAINT `glasses_fk_frames` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`frame_id`),
  CONSTRAINT `glasses_fk_lenses` FOREIGN KEY (`lens_id`) REFERENCES `lenses` (`lens_id`),
  CONSTRAINT `glasses_fk_opticians` FOREIGN KEY (`optician_id`) REFERENCES `opticians` (`optician_id`),
  CONSTRAINT `glasses_fk_patients` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses_sales`
--

LOCK TABLES `glasses_sales` WRITE;
/*!40000 ALTER TABLE `glasses_sales` DISABLE KEYS */;
INSERT INTO `glasses_sales` VALUES (1,1,1,'2022-01-01',1,5,169.99),(2,1,2,'2022-01-02',2,8,315.99),(3,2,3,'2022-01-03',3,1,404.99),(4,2,4,'2022-01-04',4,2,399.99),(5,3,5,'2022-01-05',5,4,559.99),(6,3,6,'2022-01-06',6,3,309.99),(7,4,7,'2022-01-07',7,6,379.99),(8,4,8,'2022-01-08',8,7,489.99),(9,5,9,'2022-01-09',9,10,419.99),(10,5,10,'2022-01-10',10,9,499.99);
/*!40000 ALTER TABLE `glasses_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `highest_lens_prices`
--

DROP TABLE IF EXISTS `highest_lens_prices`;
/*!50001 DROP VIEW IF EXISTS `highest_lens_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_lens_prices` AS SELECT 
 1 AS `lens_type`,
 1 AS `lens_material`,
 1 AS `coating_choice`,
 1 AS `lens_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `large_frames`
--

DROP TABLE IF EXISTS `large_frames`;
/*!50001 DROP VIEW IF EXISTS `large_frames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `large_frames` AS SELECT 
 1 AS `frame_width`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lenses`
--

DROP TABLE IF EXISTS `lenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lenses` (
  `lens_id` int NOT NULL AUTO_INCREMENT,
  `lens_type` enum('Single Vision','Bifocal','Trifocal','Progressive','Frame Only') DEFAULT 'Frame Only',
  `lens_material` varchar(50) DEFAULT NULL,
  `coating_choice` set('Anti Reflective','Blue Light','Transitions','Polarized','Tint','Scratch Resistant','No Coatings') DEFAULT NULL,
  `lens_price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`lens_id`),
  CONSTRAINT `lens_price_check` CHECK ((`lens_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lenses`
--

LOCK TABLES `lenses` WRITE;
/*!40000 ALTER TABLE `lenses` DISABLE KEYS */;
INSERT INTO `lenses` VALUES (1,'Single Vision','Plastic','No Coatings',49.99),(2,'Single Vision','Polycarbonate','Anti Reflective',139.99),(3,'Bifocal','Polycarbonate','Anti Reflective,Scratch Resistant',169.99),(4,'Progressive','High-Index','Anti Reflective,Blue Light',239.99),(5,'Frame Only',NULL,NULL,0.00),(6,'Single Vision','Polycarbonate','Anti Reflective,Blue Light,Scratch Resistant',169.99),(7,'Progressive','High-Index','Anti Reflective,Transitions,Scratch Resistant',329.99),(8,'Trifocal','Plastic','Anti Reflective,Scratch Resistant',189.99),(9,'Bifocal','Polycarbonate','Anti Reflective,Transitions,Scratch Resistant',259.99),(10,'Single Vision','High-Index','Anti Reflective,Scratch Resistant',199.99),(11,'Single Vision','Plastic','Anti Reflective',109.99);
/*!40000 ALTER TABLE `lenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opticians`
--

DROP TABLE IF EXISTS `opticians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opticians` (
  `optician_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `licensed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`optician_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opticians`
--

LOCK TABLES `opticians` WRITE;
/*!40000 ALTER TABLE `opticians` DISABLE KEYS */;
INSERT INTO `opticians` VALUES (1,'Greg','Gosnell','Male',_binary ''),(2,'Nicole','Springer','Female',_binary ''),(3,'Sam','Matheson','Male',_binary '\0'),(4,'Joanna','Pollard','Female',_binary ''),(5,'Daylin','Osborne','Male',_binary '\0'),(6,'Abigail','Rankin','Female',_binary ''),(7,'Melanie','Crump','Female',_binary '\0'),(8,'Zach','Boster','Male',_binary ''),(9,'Michael','Phelps','Male',_binary '\0'),(10,'Sandra','Burmeister','Female',_binary '');
/*!40000 ALTER TABLE `opticians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zipcode` int NOT NULL,
  `primary_phone` varchar(12) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Karen','Smith','F','1992-06-13','1886 Brown St','Dayton',45440,'937-556-1444'),(2,'Bob','Smith','Male','1990-02-20','1886 Brown St','Dayton',45440,'937-556-1443'),(3,'Marcus','Hall','Male','1971-12-03','456 Linden Ave','Miamisburg',45342,'937-269-7993'),(4,'Angela','Sword','Female','1960-05-21','855 Pine St','Springboro',45066,'937-314-2229'),(5,'Samuel','Richards','Male','1991-11-05','1551 Washington Colony Dr','Centerville',45458,'513-614-5332'),(6,'Michael','Osborne','Male','1980-06-12','555 Cedar Trail','Dayton',45440,'513-217-3190'),(7,'Elizabeth','Hummel','Female','1992-08-16','1800 Main St','Springboro',45066,'937-286-4122'),(8,'Emily','Atkins','Female','1995-10-06','315 East Central Ave','Miamisburg',45342,'937-432-9845'),(9,'Michelle','Ray','Female','1975-06-28','864 Oakwood Ave','Oakwood',45001,'937-212-9478'),(10,'Zach','Davis','Male','1989-09-20','2700 Miamisburg Centerville Rd','Dayton',45459,'937-566-9001'),(11,'Holly','Walton','Female','1960-12-30','555 Maple Lane','West Carrolton',45459,'937-285-3985'),(12,'Foster','McClain','Male','1976-11-05','7568 Black Forest Ave','West Carrolton',45459,'937-365-9587'),(13,'Braelynn','Clark','Female','1995-08-23','844 Shady Water Ln','Miamisburg',45342,'937-875-2956'),(14,'Scarlet','Hogan','Female','1971-03-02','86 Brook Ln','Springboro',45066,'937-675-3325'),(15,'Derek','Quinn','Male','1975-02-06','93 2nd St','Dayton',45440,'937-285-3985'),(16,'Saylor','Conway','Male','1955-06-22','253 Mound Ave','Kettering',45458,'937-365-1345'),(17,'Mercy','Bates','Female','1966-07-23','101 Corona Ave','Dayton',45440,'937-764-3342'),(18,'Jacoby','York','Male','1991-10-07','85 Washington Village Dr','Centerville',45449,'513-345-4033'),(19,'Treasure','Hunter','Male','1980-12-06','55 1st St','Dayton',45440,'937-346-0281'),(20,'Elora','Rice','Female','1955-01-30','1000 Elm St','West Carrolton',45449,'937-359-1058');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `single_vision`
--

DROP TABLE IF EXISTS `single_vision`;
/*!50001 DROP VIEW IF EXISTS `single_vision`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `single_vision` AS SELECT 
 1 AS `lens_type`,
 1 AS `lens_material`,
 1 AS `coating_choice`,
 1 AS `lens_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `small_frames`
--

DROP TABLE IF EXISTS `small_frames`;
/*!50001 DROP VIEW IF EXISTS `small_frames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `small_frames` AS SELECT 
 1 AS `frame_width`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `standard_frames`
--

DROP TABLE IF EXISTS `standard_frames`;
/*!50001 DROP VIEW IF EXISTS `standard_frames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `standard_frames` AS SELECT 
 1 AS `frame_width`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `black_frames`
--

/*!50001 DROP VIEW IF EXISTS `black_frames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `black_frames` AS select `frames`.`brand_name` AS `brand_name`,`frames`.`upc_number` AS `upc_number`,`frames`.`frame_color` AS `frame_color` from `frames` where (`frames`.`frame_color` like '%Black%') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `frame_sizes`
--

/*!50001 DROP VIEW IF EXISTS `frame_sizes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `frame_sizes` AS select `p`.`frame_width` AS `frame_width` from `small_frames` `p` union select `s`.`frame_width` AS `frame_width` from `standard_frames` `s` union select `l`.`frame_width` AS `frame_width` from `large_frames` `l` order by `frame_width` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_lens_prices`
--

/*!50001 DROP VIEW IF EXISTS `highest_lens_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_lens_prices` AS select `lenses`.`lens_type` AS `lens_type`,`lenses`.`lens_material` AS `lens_material`,`lenses`.`coating_choice` AS `coating_choice`,`lenses`.`lens_price` AS `lens_price` from `lenses` order by `lenses`.`lens_price` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `large_frames`
--

/*!50001 DROP VIEW IF EXISTS `large_frames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `large_frames` AS select `frames`.`frame_width` AS `frame_width` from `frames` where (`frames`.`frame_width` > 56) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `single_vision`
--

/*!50001 DROP VIEW IF EXISTS `single_vision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `single_vision` AS select `lenses`.`lens_type` AS `lens_type`,`lenses`.`lens_material` AS `lens_material`,`lenses`.`coating_choice` AS `coating_choice`,`lenses`.`lens_price` AS `lens_price` from `lenses` where (`lenses`.`lens_type` = 'Single Vision') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `small_frames`
--

/*!50001 DROP VIEW IF EXISTS `small_frames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `small_frames` AS select `frames`.`frame_width` AS `frame_width` from `frames` where (`frames`.`frame_width` <= 53) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `standard_frames`
--

/*!50001 DROP VIEW IF EXISTS `standard_frames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `standard_frames` AS select `frames`.`frame_width` AS `frame_width` from `frames` where ((`frames`.`frame_width` >= 54) and (`frames`.`frame_width` <= 56)) */;
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

-- Dump completed on 2023-06-21 20:07:05
