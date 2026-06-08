-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: CRM
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_manager` varchar(255) NOT NULL,
  `current_plan` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `joined_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `paid_receipt_no` bigint NOT NULL,
  `phone` bigint DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKktbwejnukto3gqk4j6pwq19b5` (`employee_id`),
  CONSTRAINT `FKktbwejnukto3gqk4j6pwq19b5` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'kote','Enterprise','info@tech.com','2023-11-01','Tech Corp',5001,8000000001,'ACTIVE',1),(2,'arshu','Pro','contact@global.com','2023-11-15','Global Soft',5002,8000000002,'ACTIVE',2),(3,'kote','Basic','admin@skyline.com','2023-12-01','Skyline Inc',5003,8000000003,'PENDING',1),(4,'arshu','Enterprise','ops@blue.com','2023-12-10','Blue Whale',5004,8000000004,'ACTIVE',2),(5,'kote','Pro','sales@redrock.com','2023-12-20','Red Rock',5005,8000000005,'Inactive',1),(6,'arshu','Basic','ceo@green.com','2024-01-05','Green Leaf',5006,8000000006,'ACTIVE',2),(7,'kote','Enterprise','hr@alpha.com','2024-01-12','Alpha Bet',5007,8000000007,'ACTIVE',1),(8,'arshu','Pro','tech@beta.com','2024-01-20','Beta Max',5008,8000000008,'PENDING',2),(9,'kote','Basic','hello@gamma.com','2024-02-01','Gamma Ray',5009,8000000009,'ACTIVE',1),(10,'arshu','Enterprise','support@delta.com','2024-02-10','Delta Force',5010,8000000010,'ACTIVE',2),(11,'kote','Pro','mail@epsilon.com','2024-02-15','Epsilon Ltd',5011,8000000011,'ACTIVE',1),(12,'kote','Basic','sony@sony.com','2026-03-11','sony',12345,6547893210,'Active',NULL),(13,'kote','Basic','kaja@gmail.com','2026-03-12','Khaja Enterprice',123456,9876543210,'Active',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `size` bigint DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `file` longblob NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `type` enum('COMMUNICATIONS','CUSTOMERS','LEADS','OTHER','REPORTS','TASKS') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKda57fgy4lsl5ef159c8anyfi0` (`employee_id`),
  CONSTRAINT `FKda57fgy4lsl5ef159c8anyfi0` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`),
  CONSTRAINT `documents_chk_1` CHECK ((`type` between 0 and -(1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_info`
--

DROP TABLE IF EXISTS `employee_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `in_out` enum('OFFLINE','ONLINE') NOT NULL,
  `joined_date` date NOT NULL,
  `mobile_no` bigint NOT NULL,
  `old_password` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email_notifications` bit(1) NOT NULL,
  `lead_updates` bit(1) NOT NULL,
  `system_alerts` bit(1) NOT NULL,
  `task_reminders` bit(1) NOT NULL,
  `approval_status` varchar(255) NOT NULL,
  `invite_token` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkle9r76k9bjwa7k9ihuy6h1u8` (`invite_token`),
  KEY `FK5nfc7qiyc4q4xetuytfbiw266` (`role_id`),
  CONSTRAINT `FK5nfc7qiyc4q4xetuytfbiw266` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_info`
--

LOCK TABLES `employee_info` WRITE;
/*!40000 ALTER TABLE `employee_info` DISABLE KEYS */;
INSERT INTO `employee_info` VALUES (1,'ADMIN','IT','kote@gmail.com','OFFLINE','2026-03-12',6304038319,'$2a$12$KnfC0CNy2daYHeNmTgrEVO9nrQtltG2z3PP1eCB./SXlfTSnfTQny','$2a$12$v2Ba2LOrsxtpoz4iPH4tLeTrK3PI1InJQsleWqFlKciLcgXA./W5a','ADMIN','Active','kote','Kotesh Cheruku',_binary '',_binary '',_binary '',_binary '','',NULL,1),(2,'MANAGER','HR','arshu@gmail.com','OFFLINE','2026-03-11',6304038319,'$2a$12$z.biVDmbMGZlXy0oZBGkWu1Z7rRo9YrgKJj6rpzkHUwJKT/pLHgn2','$2a$12$irIvsiPj6xCE1y5c014szujOmJn84m9K/335pfNCWU4Nb5FaQ0yPW','MANAGER','Active','arshu','Arsiya Kouser Khan',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',NULL,2),(6,NULL,'','khaja@gmail.com','OFFLINE','2026-03-13',9876543210,NULL,'$2a$12$QbIutt5l8k6c261Df1eQyO06Ae/txR3GzOciYl.OvD1m4xKQQxxtG','USER','Active','khaja','khaja',_binary '',_binary '',_binary '',_binary '','',NULL,3),(9,NULL,NULL,'mirza@gmail.com','OFFLINE','2026-03-26',0,NULL,'$2a$12$Du2PfdoNC/Fse/3MZAaESOb9d/I5oil1enzNEHfmVlE75XG6SVp.m','USER','Active','mirza','mirza',_binary '',_binary '',_binary '',_binary '','APPROVED',NULL,3);
/*!40000 ALTER TABLE `employee_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `follow_up` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  `source` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7aqovq0gl3ga1mf58nw2rxmp7` (`employee_id`),
  CONSTRAINT `FK7aqovq0gl3ga1mf58nw2rxmp7` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Call back','kote','2024-04-01','Alice Johnson',9000000001,'Google','OPEN',1),(2,'Email sent','arshu','2024-04-02','Bob Smith',9000000002,'Facebook','CONTACTED',2),(3,'Meeting set','kote','2024-04-03','Charlie Brown',9000000003,'Referral','QUALIFIED',1),(4,'No action','arshu','2024-04-04','Diana Prince',9000000004,'LinkedIn','OPEN',2),(5,'Nurture later','kote','2024-04-05','Edward Norton',9000000005,'Website','LOST',1),(6,'Left VM','arshu','2024-04-06','Fiona Gallagher',9000000006,'Cold Call','OPEN',2),(7,'Demo done','kote','2024-04-07','George Miller',9000000007,'Google','CONTACTED',1),(8,'Proposal sent','arshu','2024-04-08','Hannah Abbott',9000000008,'Referral','QUALIFIED',2),(9,'Awaiting reply','kote','2024-04-09','Ian Wright',9000000009,'LinkedIn','OPEN',1),(10,'Follow up','arshu','2024-04-10','Julia Roberts',9000000010,'Website','CONTACTED',2),(11,'Send brochure','kote','2024-04-11','Kevin Hart',9000000011,'Facebook','OPEN',1),(12,'Close deal','arshu','2024-04-12','Laura Palmer',9000000012,'Google','QUALIFIED',2),(13,'Initial contact','Sales team B','2026-03-11','mohan',789456123,'Website','New',1),(16,'Initial contact','arshu','2026-03-27','Khaja',9876543210,'Website','New',1),(17,'Initial contact','Kiran','2026-03-28','Rahul Sharma',9876543210,'Website','NEW',1),(18,'Follow-up call','Anjali','2026-03-30','Priya Reddy',9123456780,'Facebook Ads','CONTACTED',2),(19,'Send proposal','Rajesh','2026-03-27','Arjun Kumar',9012345678,'Referral','QUALIFIED',NULL),(20,'Closed deal','Meena','','Sneha Patel',9988776655,'Instagram','LOST',NULL),(21,'Converted to customer','Kiran','','Vikram Singh',9090909090,'Website','UNKNOWN',1),(22,'Reminder email','Anjali','2026-03-29','Kavya Nair',9345678901,'LinkedIn','UNKNOWN',2),(23,'Second call','Rajesh','2026-03-31','Rohit Verma',9765432109,'Google Ads','CONTACTED',NULL);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `in_out` enum('OFFLINE','ONLINE') DEFAULT NULL,
  `logged_in_date_time` datetime(6) DEFAULT NULL,
  `logged_out_date_time` datetime(6) DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8369o9pqvfbuysalmiu8o8043` (`employee_id`),
  CONSTRAINT `FK8369o9pqvfbuysalmiu8o8043` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'ONLINE','2026-03-17 07:54:25.740464','2026-03-17 07:54:25.740464',NULL),(2,'ONLINE','2026-03-17 07:58:23.019504','2026-03-17 07:58:23.019504',NULL),(3,'ONLINE','2026-03-17 08:56:21.581902',NULL,NULL),(4,'ONLINE','2026-03-17 08:56:48.395032',NULL,NULL),(5,'ONLINE','2026-03-17 09:04:46.007754',NULL,NULL),(6,'ONLINE','2026-03-17 11:01:04.061014',NULL,NULL),(7,'ONLINE','2026-03-17 11:01:31.326220',NULL,NULL),(8,'ONLINE','2026-03-17 11:08:00.402416',NULL,NULL),(9,'ONLINE','2026-03-17 12:25:25.304610',NULL,NULL),(10,'ONLINE','2026-03-17 12:25:25.354747',NULL,NULL),(11,'ONLINE','2026-03-17 12:25:46.511339',NULL,NULL),(12,'ONLINE','2026-03-17 12:25:46.557511',NULL,NULL),(13,'ONLINE','2026-03-17 12:26:21.054230',NULL,NULL),(14,'ONLINE','2026-03-17 12:26:21.099280',NULL,NULL),(15,'ONLINE','2026-03-17 12:27:27.195045',NULL,NULL),(16,'ONLINE','2026-03-17 12:27:27.205976',NULL,NULL),(17,'ONLINE','2026-03-17 12:27:40.284642',NULL,NULL),(18,'ONLINE','2026-03-17 12:27:40.315944',NULL,NULL),(19,'ONLINE','2026-03-17 12:27:41.388079',NULL,NULL),(20,'ONLINE','2026-03-17 12:27:41.433820',NULL,NULL),(21,'ONLINE','2026-03-17 12:28:25.966026',NULL,NULL),(22,'ONLINE','2026-03-17 12:28:26.011285',NULL,NULL),(23,'ONLINE','2026-03-17 12:28:30.201842',NULL,NULL),(24,'ONLINE','2026-03-17 12:28:30.247497',NULL,NULL),(25,'ONLINE','2026-03-17 12:28:47.814177',NULL,NULL),(26,'ONLINE','2026-03-17 12:28:47.859162',NULL,NULL),(27,'ONLINE','2026-03-17 12:32:18.664786',NULL,NULL),(28,'ONLINE','2026-03-17 12:32:18.747818',NULL,NULL),(29,'ONLINE','2026-03-17 12:32:28.657707',NULL,NULL),(30,'ONLINE','2026-03-17 12:32:28.704465',NULL,NULL),(31,'ONLINE','2026-03-17 12:32:30.757636',NULL,NULL),(32,'ONLINE','2026-03-17 12:32:30.792985',NULL,NULL),(33,'ONLINE','2026-03-17 12:32:35.329532',NULL,NULL),(34,'ONLINE','2026-03-17 12:32:35.384817',NULL,NULL),(35,'ONLINE','2026-03-17 12:32:39.643134',NULL,NULL),(36,'ONLINE','2026-03-17 12:32:39.690415',NULL,NULL),(37,'ONLINE','2026-03-17 12:32:46.397223',NULL,NULL),(38,'ONLINE','2026-03-17 12:32:46.448826',NULL,NULL),(39,'ONLINE','2026-03-17 12:32:58.027079',NULL,NULL),(40,'ONLINE','2026-03-17 12:32:58.075798',NULL,NULL),(41,'ONLINE','2026-03-18 11:06:20.385709',NULL,NULL),(42,'ONLINE','2026-03-18 11:06:20.449287',NULL,NULL),(43,'ONLINE','2026-03-18 11:06:24.533633',NULL,NULL),(44,'ONLINE','2026-03-18 11:06:24.584739',NULL,NULL),(45,'ONLINE','2026-03-18 11:10:23.994937',NULL,NULL),(46,'ONLINE','2026-03-18 11:10:24.109279',NULL,NULL),(47,'ONLINE','2026-03-18 11:11:06.845955',NULL,NULL),(48,'ONLINE','2026-03-18 11:11:06.902595',NULL,NULL),(49,'ONLINE','2026-03-18 11:17:11.265010',NULL,NULL),(50,'ONLINE','2026-03-18 11:17:11.317763',NULL,NULL),(51,'ONLINE','2026-03-22 10:00:45.679665',NULL,NULL),(52,'ONLINE','2026-03-22 10:00:45.761169',NULL,NULL),(53,'ONLINE','2026-03-23 07:06:42.855289',NULL,NULL),(54,'ONLINE','2026-03-23 07:06:42.899544',NULL,NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `status` enum('DELIVERED','READ','SENT') DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlu30y2v8vy0fi7gaeke3250np` (`employee_id`),
  CONSTRAINT `FKlu30y2v8vy0fi7gaeke3250np` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'kote','arshu','kote','READ','2026-03-17 07:57:52.819331',1),(2,'arshu','kote','arshu','READ','2026-03-17 08:57:17.879827',2),(3,'bhai bolthe','khaja','kote','SENT','2026-03-17 11:02:07.339777',1),(4,'12345678','arshu','kote','READ','2026-03-17 12:26:06.202161',1),(5,'asdfghjkl','kote','arshu','READ','2026-03-17 12:27:23.265415',2),(6,'hiii','arshu','kote','READ','2026-03-17 12:32:44.297098',1),(7,'hiiii','khaja','arshu','SENT','2026-03-23 11:56:08.074686',2);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `message` varchar(500) NOT NULL,
  `recipient_username` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `role_id` bigint NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  KEY `FKn5fotdgk8d1xvo8nav9uv3muc` (`role_id`),
  CONSTRAINT `FKn5fotdgk8d1xvo8nav9uv3muc` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,'ALL_ACCESS'),(1,'CREATE_ROLES'),(2,'VIEW_DASHBOARD'),(2,'MANAGE_USERS'),(3,'VIEW_DASHBOARD'),(4,'VIEW_LEADS'),(4,'EDIT_LEADS'),(5,'VIEW_CUSTOMERS');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'from-red-500 to-rose-400','ADMIN'),(2,'from-purple-500 to-indigo-400','MANAGER'),(3,'from-blue-500 to-cyan-400','USER'),(4,'from-emerald-500 to-teal-400','SALES'),(5,'from-orange-500 to-amber-400','SUPPORT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_to` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `priority` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `task` varchar(255) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2nsdjkn2wsmf9mhf0jsdkdqv8` (`employee_id`),
  CONSTRAINT `FK2nsdjkn2wsmf9mhf0jsdkdqv8` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (12,'kote','2024-05-01','HIGH','PENDING','Client Meeting',1),(13,'arshu','2024-05-02','MEDIUM','IN_PROGRESS','Server Maintenance',2),(14,'kote','2024-05-03','HIGH','COMPLETED','Quarterly Report',1),(15,'arshu','2024-05-04','LOW','PENDING','Onboard New User',2),(16,'kote','2024-05-05','MEDIUM','IN_PROGRESS','Marketing Sync',1),(17,'arshu','2024-05-06','HIGH','PENDING','Bug Squashing',2),(18,'kote','2024-05-07','LOW','COMPLETED','Invoice Review',1),(19,'arshu','2024-05-08','HIGH','IN_PROGRESS','Product Demo',2),(20,'kote','2024-05-09','MEDIUM','PENDING','Team Training',1),(21,'arshu','2024-05-10','HIGH','PENDING','Security Audit',2),(22,'kote','2024-05-11','LOW','IN_PROGRESS','Lead Cleanup',1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_members` (
  `team_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  KEY `FKw0dqjtxgos68dcaybnjrpilw` (`user_id`),
  KEY `FKtgca08el3ofisywcf11f0f76t` (`team_id`),
  CONSTRAINT `FKtgca08el3ofisywcf11f0f76t` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `FKw0dqjtxgos68dcaybnjrpilw` FOREIGN KEY (`user_id`) REFERENCES `employee_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27 14:23:23
