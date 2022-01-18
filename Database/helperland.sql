CREATE DATABASE  IF NOT EXISTS `helperland` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `helperland`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: helperland
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `city_fk0` (`state_id`),
  CONSTRAINT `city_fk0` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `contact_us_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `subject_type` varchar(100) NOT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `message` varchar(0) NOT NULL,
  `upload_file_name` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `assigned_to_user` int DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`contact_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us_attachment`
--

DROP TABLE IF EXISTS `contact_us_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us_attachment` (
  `contact_us_attachment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `file_name` varbinary(100) NOT NULL,
  PRIMARY KEY (`contact_us_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us_attachment`
--

LOCK TABLES `contact_us_attachment` WRITE;
/*!40000 ALTER TABLE `contact_us_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_blocked`
--

DROP TABLE IF EXISTS `favourite_blocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_blocked` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `target_user_id` int NOT NULL,
  `is_favourite` bit(1) NOT NULL,
  `is_blocked` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favourite_blocked_fk0` (`user_id`),
  KEY `favourite_blocked_fk1` (`target_user_id`),
  CONSTRAINT `favourite_blocked_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `favourite_blocked_fk1` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_blocked`
--

LOCK TABLES `favourite_blocked` WRITE;
/*!40000 ALTER TABLE `favourite_blocked` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_blocked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `service_request_id` int NOT NULL,
  `rating_from` int NOT NULL,
  `rating_to` int NOT NULL,
  `ratings` decimal(5,0) NOT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `rating_date` datetime NOT NULL,
  `is_approved` bit(1) DEFAULT NULL,
  `visible_on_homescreen` bit(1) NOT NULL,
  `on_time_arrival` decimal(5,0) NOT NULL,
  `friendly` decimal(5,0) NOT NULL,
  `quality_of_service` decimal(5,0) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `rating_fk0` (`service_request_id`),
  KEY `rating_fk1` (`rating_from`),
  KEY `rating_fk2` (`rating_to`),
  CONSTRAINT `rating_fk0` FOREIGN KEY (`service_request_id`) REFERENCES `service_request` (`service_req_id`),
  CONSTRAINT `rating_fk1` FOREIGN KEY (`rating_from`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rating_fk2` FOREIGN KEY (`rating_to`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_req_extra`
--

DROP TABLE IF EXISTS `service_req_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_req_extra` (
  `service_req_extra_id` int NOT NULL AUTO_INCREMENT,
  `service_req_id` int NOT NULL,
  `service_extra_id` int NOT NULL,
  PRIMARY KEY (`service_req_extra_id`),
  KEY `service_req_extra_fk0` (`service_req_id`),
  CONSTRAINT `service_req_extra_fk0` FOREIGN KEY (`service_req_id`) REFERENCES `service_request` (`service_req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_req_extra`
--

LOCK TABLES `service_req_extra` WRITE;
/*!40000 ALTER TABLE `service_req_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_req_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request` (
  `service_req_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_start_date` datetime NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `service_frequency` tinyint DEFAULT NULL,
  `service_hourly_rate` decimal(5,0) DEFAULT NULL,
  `service_hours` float NOT NULL,
  `extra_hours` float DEFAULT NULL,
  `sub_total` decimal(5,0) NOT NULL,
  `discount` decimal(5,0) DEFAULT NULL,
  `total_cost` decimal(5,0) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `payment_transaction_ref_no` varchar(50) DEFAULT NULL,
  `payment_due` bit(1) NOT NULL,
  `job_status` tinyint DEFAULT NULL,
  `service_provider_id` int DEFAULT NULL,
  `sp_accepted_date` datetime DEFAULT NULL,
  `has_pets` bit(1) NOT NULL,
  `status` int DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `refunded_amount` decimal(5,0) DEFAULT NULL,
  `distance` decimal(9,0) NOT NULL,
  `has_issue` bit(1) DEFAULT NULL,
  `payment_done` bit(1) DEFAULT NULL,
  `record_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_req_id`),
  UNIQUE KEY `record_version` (`record_version`),
  KEY `service_request_fk0` (`user_id`),
  KEY `service_request_fk1` (`service_provider_id`),
  CONSTRAINT `service_request_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `service_request_fk1` FOREIGN KEY (`service_provider_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request_address`
--

DROP TABLE IF EXISTS `service_request_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_req_id` int DEFAULT NULL,
  `address_line1` varchar(200) DEFAULT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_request_address_fk0` (`service_req_id`),
  CONSTRAINT `service_request_address_fk0` FOREIGN KEY (`service_req_id`) REFERENCES `service_request` (`service_req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request_address`
--

LOCK TABLES `service_request_address` WRITE;
/*!40000 ALTER TABLE `service_request_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_request_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_setting`
--

DROP TABLE IF EXISTS `service_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_type` int NOT NULL,
  `interval` int NOT NULL,
  `schedule_time` time NOT NULL,
  `last_poll` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_setting`
--

LOCK TABLES `service_setting` WRITE;
/*!40000 ALTER TABLE `service_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT NULL,
  `definition` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`diagram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_type_id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `website` varchar(1000) DEFAULT NULL,
  `user_profile_picture` varchar(200) DEFAULT NULL,
  `is_registered_user` bit(1) NOT NULL,
  `payment_gateway_user_ref` varchar(200) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `works_with_pet` bit(1) NOT NULL,
  `language_id` int DEFAULT NULL,
  `nationality_id` int DEFAULT NULL,
  `reset_key` varchar(200) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `is_approved` bit(1) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `status` int DEFAULT NULL,
  `is_online` bit(1) NOT NULL,
  `bank_token_id` varchar(100) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address_line1` varchar(200) NOT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_address_fk0` (`user_id`),
  CONSTRAINT `user_address_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipcode`
--

DROP TABLE IF EXISTS `zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `zip_code_value` varchar(50) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zipcode_fk0` (`city_id`),
  CONSTRAINT `zipcode_fk0` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcode`
--

LOCK TABLES `zipcode` WRITE;
/*!40000 ALTER TABLE `zipcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `zipcode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-13 17:17:57
