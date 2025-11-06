-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: healthcare_platform
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APPOINTMENTS`
--

DROP TABLE IF EXISTS `APPOINTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPOINTMENTS` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` enum('scheduled','completed','canceled') NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `APPOINTMENTS_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `USERS` (`user_id`),
  CONSTRAINT `APPOINTMENTS_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `USERS` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPOINTMENTS`
--

LOCK TABLES `APPOINTMENTS` WRITE;
/*!40000 ALTER TABLE `APPOINTMENTS` DISABLE KEYS */;
INSERT INTO `APPOINTMENTS` VALUES (1,1,2,'2025-11-08 10:00:00','scheduled'),(2,1,3,'2025-11-12 15:00:00','scheduled'),(3,1,4,'2025-11-15 09:30:00','scheduled'),(4,1,5,'2025-11-20 11:00:00','scheduled'),(5,1,2,'2025-10-15 10:00:00','completed');
/*!40000 ALTER TABLE `APPOINTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICAL_STORES`
--

DROP TABLE IF EXISTS `MEDICAL_STORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDICAL_STORES` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAL_STORES`
--

LOCK TABLES `MEDICAL_STORES` WRITE;
/*!40000 ALTER TABLE `MEDICAL_STORES` DISABLE KEYS */;
INSERT INTO `MEDICAL_STORES` VALUES (1,'HealthFirst Pharmacy','9123456781','contact@healthfirst.com','1 Wellness Blvd, NY'),(2,'CityMed Store','9123456782','info@citymed.com','22 Central Ave, NY'),(3,'CarePlus Pharmacy','9123456783','support@careplus.com','78 Green Rd, NY'),(4,'Wellness Drugs','9123456784','sales@wellnessdrugs.com','56 Hill St, NY'),(5,'MedLink Pharmacy','9123456785','help@medlink.com','90 Ocean Ave, NY');
/*!40000 ALTER TABLE `MEDICAL_STORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDERS` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `store_id` int NOT NULL,
  `order_date` date NOT NULL,
  `status` enum('pending','delivered','canceled') NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `patient_id` (`patient_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `USERS` (`user_id`),
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `MEDICAL_STORES` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (1,1,1,'2025-11-05','pending'),(2,1,2,'2025-10-30','delivered'),(3,1,3,'2025-10-28','delivered'),(4,1,4,'2025-11-01','pending'),(5,1,5,'2025-09-25','canceled');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESCRIPTIONS`
--

DROP TABLE IF EXISTS `PRESCRIPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRESCRIPTIONS` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `medication` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `issued_date` date NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `PRESCRIPTIONS_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `USERS` (`user_id`),
  CONSTRAINT `PRESCRIPTIONS_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `USERS` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIPTIONS`
--

LOCK TABLES `PRESCRIPTIONS` WRITE;
/*!40000 ALTER TABLE `PRESCRIPTIONS` DISABLE KEYS */;
INSERT INTO `PRESCRIPTIONS` VALUES (1,1,2,'Atorvastatin','10mg once daily','2025-10-15'),(2,1,3,'Hydrocortisone Cream','Apply twice daily','2025-10-18'),(3,1,2,'Lisinopril','5mg once daily','2025-09-30'),(4,1,3,'Amoxicillin','500mg three times daily','2025-09-28'),(5,1,2,'Metformin','500mg twice daily','2025-10-05');
/*!40000 ALTER TABLE `PRESCRIPTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text,
  `role` enum('patient','doctor','therapist','lab_staff') NOT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'John Smith','john.doe@gmail.com','9876543210','123 Main St, NY','patient',NULL,'1990-05-15','male'),(2,'Dr. Emily Carter','emily.carter@med.com','9876543211','45 Clinic Rd, NY','doctor','Cardiology','1980-03-22','female'),(3,'Dr. Adam Patel','adam.patel@med.com','9876543212','78 Health Ave, NY','doctor','Dermatology','1978-11-02','male'),(4,'Sarah Lee','sarah.lee@therapy.com','9876543213','12 Calm St, NY','therapist','Physical Therapy','1985-07-10','female'),(5,'David Kim','david.kim@labtech.com','9876543214','23 Lab Lane, NY','lab_staff','Blood Analysis','1992-02-14','male');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 12:46:22
