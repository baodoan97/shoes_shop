-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: shoes
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` int(11) NOT NULL,
  `blob_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (1,'images','Product',1,1,'2019-04-04 15:38:06'),(2,'avatar','User',1,3,'2019-04-04 15:39:28'),(3,'images','Product',1,4,'2019-04-05 14:41:03'),(4,'images','Product',1,5,'2019-04-05 14:41:03'),(5,'images','Product',1,6,'2019-04-05 14:41:03'),(6,'images','Product',1,7,'2019-04-05 14:41:04'),(7,'images','Product',1,8,'2019-04-05 14:41:04'),(8,'images','Product',1,9,'2019-04-05 14:41:04'),(9,'images','Product',1,10,'2019-04-05 14:41:04'),(10,'images','Product',2,11,'2019-04-09 16:45:13'),(11,'images','Product',2,12,'2019-04-09 16:45:13'),(12,'images','Product',2,13,'2019-04-09 16:45:13'),(13,'images','Product',2,14,'2019-04-09 16:45:13'),(14,'avatar','User',2,15,'2019-05-15 11:17:32');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (1,'7YVtuqgDkFiESH48rJdtaUca','Screenshot from 2019-01-30 14-22-25.png','image/png','{\"identified\":true,\"analyzed\":true}',538820,'BdIhKAY9Argiry3sJxOvtw==','2019-04-04 15:38:06'),(2,'v3rMhyjU97jajawgQNn4unye','Screenshot from 2019-04-04 08-42-42.png','image/png','{\"identified\":true}',138908,'IW6Lz/fvyKln2ShLbr891A==','2019-04-04 15:39:01'),(3,'MMKiSqsCN61UGYpc7XdJq8hD','Screenshot from 2019-04-04 08-42-42.png','image/png','{\"identified\":true,\"analyzed\":true}',138908,'IW6Lz/fvyKln2ShLbr891A==','2019-04-04 15:39:28'),(4,'HQtwvcaW47h6Hzo4n3eeFNwB','Screenshot from 2019-01-30 14-25-33.png','image/png','{\"identified\":true,\"analyzed\":true}',583056,'9D7dk3RDvnKnHmmSEXxzDA==','2019-04-05 14:41:03'),(5,'LpVaYXunrrv2P8MZR9SD33sZ','Screenshot from 2019-01-30 14-50-51.png','image/png','{\"identified\":true,\"analyzed\":true}',219203,'2AWB1LRTxuBx+gluB5CQXQ==','2019-04-05 14:41:03'),(6,'ZSpmq2T8amj9YNQpR9vcKAbx','Screenshot from 2019-01-30 17-28-11.png','image/png','{\"identified\":true,\"analyzed\":true}',381783,'AWdTqi23HAlRj14P5pGD0g==','2019-04-05 14:41:03'),(7,'2obg3RceXDqK7nB8kLvp2aZA','Screenshot from 2019-02-08 11-52-35.png','image/png','{\"identified\":true,\"analyzed\":true}',509998,'KSMysIomYVpH/FplH91FIA==','2019-04-05 14:41:04'),(8,'xuY799BMMbmbCCgfyCmUK97e','Screenshot from 2019-02-08 11-53-10.png','image/png','{\"identified\":true,\"analyzed\":true}',246250,'U9yBEpq9obJyxG0/Tmjjsw==','2019-04-05 14:41:04'),(9,'vLPoxcaWMTeMC7bU1cAbx7vH','Screenshot from 2019-02-08 17-32-01.png','image/png','{\"identified\":true,\"analyzed\":true}',156309,'NeAtgjv4xAG0WEYPkC34aw==','2019-04-05 14:41:04'),(10,'MnNofdj7QfgMmynFVBnHDTvE','Screenshot from 2019-02-08 23-20-23.png','image/png','{\"identified\":true,\"analyzed\":true}',208518,'7/E4HJj3/XAR3DOi+RG0ZQ==','2019-04-05 14:41:04'),(11,'hZJdmScSXiJXLvL6kgoRPpkR','Screenshot from 2019-01-30 12-21-54.png','image/png','{\"identified\":true,\"analyzed\":true}',259155,'SpFUXoRiG4Xl/2Uk+Stoog==','2019-04-09 16:45:13'),(12,'5kRKcMKRJHkh42odnv4z4cUL','Screenshot from 2019-01-30 14-17-51.png','image/png','{\"identified\":true,\"analyzed\":true}',243069,'slxWtD9UItNiUksOAvKxKQ==','2019-04-09 16:45:13'),(13,'8FK1NGGFDMa7cLpKtcYokURb','Screenshot from 2019-01-30 14-22-25.png','image/png','{\"identified\":true,\"analyzed\":true}',538820,'BdIhKAY9Argiry3sJxOvtw==','2019-04-09 16:45:13'),(14,'fWZMUa8r6cQ4DR4tmJN4NWU1','Screenshot from 2019-01-30 14-25-33.png','image/png','{\"identified\":true,\"analyzed\":true}',583056,'9D7dk3RDvnKnHmmSEXxzDA==','2019-04-09 16:45:13'),(15,'CNYzuhkrSo3HF3q6ZrDiqFCk','Screenshot from 2019-01-30 12-21-54.png','image/png','{\"identified\":true,\"analyzed\":true}',259155,'SpFUXoRiG4Xl/2Uk+Stoog==','2019-05-15 11:17:32');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (7,'quoctienphamm@gmail.com','$2a$11$rKk708P0Xe.81PZfvDwbB.ViVdOLnvEB.TEGc6S9onllQMrtV9CZK',NULL,NULL,NULL,'2019-04-04 15:35:57','2019-04-04 15:35:57',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-04-04 15:20:26','2019-04-04 15:20:26');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
INSERT INTO `cart_products` VALUES (1,1,123,35,1,1,1),(2,1,123,43,1,3,NULL),(3,1,123,35,2,4,NULL),(4,2,12,35,1,4,NULL),(5,2,12,35,2,5,NULL),(6,1,123,35,1,5,NULL),(7,1,123,35,1,6,NULL),(8,2,12,35,1,6,NULL),(9,1,123,35,1,7,NULL),(10,2,12,35,1,7,NULL),(11,1,123,35,1,8,NULL),(12,1,123,35,1,9,NULL),(13,1,123,35,1,10,NULL),(14,1,123,35,1,12,NULL),(15,1,123,35,1,15,NULL),(16,2,NULL,35,1,29,NULL),(17,2,NULL,35,1,30,NULL),(18,1,NULL,35,1,31,NULL),(19,1,NULL,35,1,32,NULL),(20,1,NULL,35,1,33,NULL),(21,1,NULL,35,1,34,NULL),(22,1,NULL,35,1,43,NULL),(23,1,NULL,35,1,44,NULL),(24,1,NULL,35,2,45,NULL),(25,2,NULL,35,2,45,NULL),(26,2,NULL,35,1,45,NULL),(27,2,NULL,35,4,46,NULL),(28,2,NULL,35,2,47,NULL),(29,1,123,35,1,47,NULL),(30,1,NULL,35,1,49,NULL),(31,2,12,35,NULL,49,NULL),(32,2,12,35,NULL,49,NULL),(33,1,NULL,35,3,51,NULL);
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2019-04-05 16:05:24','2019-04-05 16:05:24',NULL,NULL,NULL,NULL,NULL),(2,'2019-04-07 14:43:13','2019-04-07 14:43:13',NULL,NULL,NULL,NULL,NULL),(3,'2019-04-08 12:34:10','2019-04-08 12:34:10',NULL,NULL,NULL,NULL,NULL),(4,'2019-04-09 16:26:53','2019-04-09 16:26:53',NULL,NULL,NULL,NULL,NULL),(5,'2019-04-09 16:47:08','2019-04-09 16:47:08',NULL,NULL,NULL,NULL,NULL),(6,'2019-04-09 16:48:06','2019-04-09 16:48:06',NULL,NULL,NULL,NULL,NULL),(7,'2019-04-10 15:17:53','2019-04-10 15:17:53',NULL,NULL,NULL,NULL,NULL),(8,'2019-04-11 15:36:43','2019-04-11 15:36:43',NULL,NULL,NULL,NULL,NULL),(9,'2019-04-11 15:48:51','2019-04-11 15:48:51',NULL,NULL,NULL,NULL,NULL),(10,'2019-04-13 13:13:33','2019-04-13 13:13:33',NULL,NULL,NULL,NULL,NULL),(11,'2019-04-13 13:24:50','2019-04-13 13:24:50',NULL,NULL,NULL,NULL,NULL),(12,'2019-04-13 13:24:54','2019-04-13 13:24:54',NULL,NULL,NULL,NULL,NULL),(13,'2019-04-21 13:44:09','2019-04-21 13:44:09',NULL,NULL,NULL,NULL,NULL),(14,'2019-04-22 14:51:47','2019-04-22 14:51:47',NULL,NULL,NULL,NULL,NULL),(15,'2019-05-07 15:54:58','2019-05-07 15:54:58',NULL,NULL,NULL,NULL,NULL),(16,'2019-05-13 02:39:16','2019-05-13 02:39:16',NULL,NULL,NULL,NULL,NULL),(17,'2019-05-13 03:57:03','2019-05-13 03:57:03',NULL,NULL,NULL,NULL,NULL),(18,'2019-05-13 04:35:18','2019-05-13 04:35:18',NULL,NULL,NULL,NULL,NULL),(19,'2019-05-13 04:36:15','2019-05-13 04:36:15',NULL,NULL,NULL,NULL,NULL),(20,'2019-05-13 05:09:45','2019-05-13 05:09:45',NULL,NULL,NULL,NULL,NULL),(21,'2019-05-13 05:12:05','2019-05-13 05:12:05',NULL,NULL,NULL,NULL,NULL),(22,'2019-05-13 05:15:28','2019-05-13 05:15:28',NULL,NULL,NULL,NULL,NULL),(23,'2019-05-13 05:16:14','2019-05-13 05:16:14',NULL,NULL,NULL,NULL,NULL),(24,'2019-05-13 05:16:20','2019-05-13 05:16:20',NULL,NULL,NULL,NULL,NULL),(25,'2019-05-13 05:16:48','2019-05-13 05:16:48',NULL,NULL,NULL,NULL,NULL),(26,'2019-05-13 05:17:22','2019-05-13 05:17:22',NULL,NULL,NULL,NULL,NULL),(27,'2019-05-13 05:18:23','2019-05-13 05:18:23',NULL,NULL,NULL,NULL,NULL),(28,'2019-05-13 05:25:56','2019-05-13 05:25:56',NULL,NULL,NULL,NULL,NULL),(29,'2019-05-13 05:26:44','2019-05-13 05:26:44',NULL,NULL,NULL,NULL,NULL),(30,'2019-05-13 05:42:20','2019-05-13 05:42:20',NULL,NULL,NULL,NULL,NULL),(31,'2019-05-13 06:09:27','2019-05-13 06:09:27',NULL,NULL,NULL,NULL,NULL),(32,'2019-05-13 06:10:54','2019-05-13 06:10:54',NULL,NULL,NULL,NULL,NULL),(33,'2019-05-13 06:13:08','2019-05-13 06:13:08',NULL,NULL,NULL,NULL,NULL),(34,'2019-05-13 06:15:27','2019-05-13 06:15:27',NULL,NULL,NULL,NULL,NULL),(35,'2019-05-13 06:16:25','2019-05-13 06:16:25',NULL,NULL,NULL,NULL,NULL),(36,'2019-05-13 06:18:50','2019-05-13 06:18:50',NULL,NULL,NULL,NULL,NULL),(37,'2019-05-13 06:19:51','2019-05-13 06:19:51',NULL,NULL,NULL,NULL,NULL),(38,'2019-05-13 06:21:41','2019-05-13 06:21:41',NULL,NULL,NULL,NULL,NULL),(39,'2019-05-13 06:21:43','2019-05-13 06:21:43',NULL,NULL,NULL,NULL,NULL),(40,'2019-05-13 06:21:43','2019-05-13 06:21:43',NULL,NULL,NULL,NULL,NULL),(41,'2019-05-13 06:21:43','2019-05-13 06:21:43',NULL,NULL,NULL,NULL,NULL),(42,'2019-05-13 06:22:03','2019-05-13 06:22:03',NULL,NULL,NULL,NULL,NULL),(43,'2019-05-13 06:22:59','2019-05-13 06:22:59',NULL,NULL,NULL,NULL,NULL),(44,'2019-05-13 06:33:17','2019-05-13 06:33:17',NULL,NULL,NULL,NULL,NULL),(45,'2019-05-13 06:33:22','2019-05-13 06:33:22',NULL,NULL,NULL,NULL,NULL),(46,'2019-05-13 06:54:45','2019-05-13 06:54:45',NULL,NULL,NULL,NULL,NULL),(47,'2019-05-13 06:59:27','2019-05-13 06:59:27',NULL,NULL,NULL,NULL,NULL),(48,'2019-05-13 07:01:29','2019-05-13 07:01:29',NULL,NULL,NULL,NULL,NULL),(49,'2019-05-13 11:11:26','2019-05-13 11:11:26',NULL,NULL,NULL,NULL,NULL),(50,'2019-05-13 11:11:30','2019-05-13 11:11:30',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `display_in_navbar` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'abc','123456asdas',1,'2019-04-04 15:37:36','2019-04-04 15:37:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `display` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,1,1,'sdasd','2019-05-16 02:16:40','2019-05-16 07:00:20',1),(4,1,1,'sadasd','2019-05-16 02:29:17','2019-05-16 07:00:30',1),(5,1,1,'123123','2019-05-16 02:29:37','2019-05-16 07:00:30',1),(6,1,1,'asd','2019-05-16 02:30:06','2019-05-16 07:00:30',1),(8,1,1,'asd','2019-05-16 02:32:21','2019-05-16 13:48:44',1),(10,1,1,'sad','2019-05-16 02:36:21','2019-05-16 12:57:31',1),(11,1,1,'sadaaaaaa','2019-05-16 02:36:24','2019-05-16 13:51:36',1),(12,1,1,'sadaaaaaaasdasd','2019-05-16 02:36:27','2019-05-16 13:52:09',1),(13,1,1,'asd','2019-05-16 02:37:03','2019-05-16 13:52:54',1),(14,1,1,'asdasd','2019-05-16 02:37:06','2019-05-16 13:55:45',1),(15,1,1,'asd','2019-05-16 02:37:21','2019-05-16 13:57:31',1),(16,1,1,'asd','2019-05-16 02:38:45','2019-05-16 14:48:56',1),(17,1,1,'asd','2019-05-16 02:38:46','2019-05-16 14:48:58',1),(18,1,1,'asd','2019-05-16 02:38:46','2019-05-16 14:48:59',1),(19,1,1,'asd','2019-05-16 02:40:19','2019-05-16 14:49:00',1),(20,1,1,'asd','2019-05-16 02:40:20','2019-05-16 14:49:03',1),(21,1,1,'asd','2019-05-16 02:40:20','2019-05-16 14:49:04',1),(22,1,1,'asd','2019-05-16 02:41:11','2019-05-16 14:49:05',1),(23,1,1,'asd','2019-05-16 02:41:28','2019-05-16 14:49:07',1),(24,1,1,'asd','2019-05-16 02:41:46','2019-05-16 14:49:08',1),(25,1,1,'asd','2019-05-16 02:42:16','2019-05-16 14:49:09',1),(26,1,1,'asd','2019-05-16 02:42:36','2019-05-16 14:49:10',1),(27,1,1,'asd','2019-05-16 02:43:46','2019-05-16 14:49:11',1),(28,1,1,'asd','2019-05-16 02:43:47','2019-05-16 14:49:12',1),(29,1,1,'asdasd','2019-05-16 02:43:49','2019-05-16 14:49:13',1),(30,1,1,'asdasd','2019-05-16 02:43:49','2019-05-16 14:49:14',1),(31,1,1,'asdasd','2019-05-16 02:43:50','2019-05-16 14:49:15',1),(32,1,1,'asdasd','2019-05-16 02:43:50','2019-05-16 14:49:17',1),(33,1,1,'asdasd','2019-05-16 02:43:50','2019-05-16 15:20:17',1),(34,1,1,'asdasd','2019-05-16 02:43:50','2019-05-16 15:21:33',1),(35,1,1,'asdasd','2019-05-16 02:43:51','2019-05-16 15:19:30',1),(36,1,1,'asdasd','2019-05-16 02:43:51','2019-05-16 15:21:36',1),(37,1,1,'asd','2019-05-16 02:44:22','2019-05-16 15:34:49',1),(38,1,1,'df','2019-05-16 02:44:57','2019-05-16 15:36:06',1),(39,1,1,'asd','2019-05-16 02:45:19','2019-05-16 12:59:03',1),(40,1,1,'asd','2019-05-16 02:45:36','2019-05-16 12:58:56',1),(41,1,1,'asdasd','2019-05-16 02:45:39','2019-05-16 12:59:04',1),(42,1,1,'asd','2019-05-16 02:45:48','2019-05-16 15:37:19',1),(43,1,1,'asd','2019-05-16 02:47:01','2019-05-16 15:38:18',1),(44,1,1,'asda','2019-05-16 02:53:23','2019-05-16 15:39:19',1),(45,1,1,'asdas','2019-05-16 02:53:47','2019-05-16 15:40:09',1),(46,1,1,'asdasasd','2019-05-16 02:57:39','2019-05-16 15:40:43',1),(47,1,1,'asdsd','2019-05-16 02:58:24','2019-05-16 15:42:17',1),(48,1,1,'asdsdasd','2019-05-16 02:58:29','2019-05-16 15:46:48',1),(49,1,1,'asdasd','2019-05-16 02:59:20','2019-05-16 15:47:56',1),(50,1,1,'asd','2019-05-16 03:01:25','2019-05-16 15:48:06',1),(51,1,1,'asd','2019-05-16 03:01:48','2019-05-16 15:48:15',1),(52,1,1,'asd','2019-05-16 03:03:31','2019-05-16 15:48:21',1),(53,1,1,'sad','2019-05-16 03:03:59','2019-05-16 03:03:59',0),(54,1,1,'asd','2019-05-16 03:05:30','2019-05-16 03:05:30',0),(55,1,1,'aasd','2019-05-16 03:05:47','2019-05-16 03:05:47',0),(56,1,1,'asd','2019-05-16 03:06:00','2019-05-16 03:06:00',0),(57,1,1,'asdasd','2019-05-16 03:06:03','2019-05-16 03:06:03',0),(58,1,1,'asd','2019-05-16 03:10:16','2019-05-16 03:10:16',0),(59,1,1,'asdasd','2019-05-16 03:10:45','2019-05-16 03:10:45',0),(60,1,1,'asdasd','2019-05-16 03:14:55','2019-05-16 03:14:55',0),(61,1,1,'asdasd','2019-05-16 03:15:22','2019-05-16 03:15:22',0),(62,1,1,'asdasd','2019-05-16 03:36:04','2019-05-16 03:36:04',0),(63,1,1,'hello','2019-05-16 03:37:11','2019-05-16 03:37:11',0),(64,1,1,'c','2019-05-16 03:40:30','2019-05-16 03:40:30',0),(65,1,1,'asdas','2019-05-16 04:54:37','2019-05-16 04:54:37',0),(66,1,1,'hello','2019-05-16 05:11:51','2019-05-16 05:11:51',0),(67,1,1,'helloasd','2019-05-16 05:12:45','2019-05-16 05:12:45',0),(68,1,1,'helloasd','2019-05-16 05:13:56','2019-05-16 12:56:44',1),(69,1,1,'helloasdasd','2019-05-16 05:15:39','2019-05-16 12:56:37',1),(70,1,1,'id','2019-05-16 05:30:34','2019-05-16 05:30:34',0),(71,1,1,'abc','2019-05-16 06:39:05','2019-05-16 12:56:03',1),(72,1,1,'abcee','2019-05-16 06:40:40','2019-05-16 06:40:40',0),(73,1,1,'absdasdasd','2019-05-16 06:42:06','2019-05-16 06:42:06',0),(74,1,1,'abc','2019-05-16 06:45:17','2019-05-16 06:45:17',0),(75,1,1,'abc','2019-05-16 06:47:22','2019-05-16 12:54:39',1),(76,1,1,'abc','2019-05-16 06:47:29','2019-05-16 06:47:29',0),(77,1,1,'abc','2019-05-16 06:47:31','2019-05-16 12:56:48',1),(78,1,1,'abc','2019-05-16 06:50:04','2019-05-16 12:56:48',1),(79,1,1,'how are you','2019-05-16 06:50:21','2019-05-16 06:50:21',0),(80,1,1,'asd','2019-05-16 06:58:33','2019-05-16 06:58:33',0),(81,1,1,'abc','2019-05-16 06:58:47','2019-05-16 12:54:35',1),(82,1,1,'hello','2019-05-16 12:53:04','2019-05-16 12:53:04',0),(83,1,1,'hello ','2019-05-16 12:53:56','2019-05-16 12:53:56',0),(84,1,1,'abc','2019-05-16 12:55:53','2019-05-16 12:55:53',0),(85,1,1,'abc','2019-05-16 12:56:33','2019-05-16 12:56:33',0),(86,1,1,'abc','2019-05-16 13:00:37','2019-05-16 13:00:37',0),(87,1,1,'hello','2019-05-16 13:06:24','2019-05-16 13:06:24',0),(88,1,1,'abcabc','2019-05-16 13:08:13','2019-05-16 13:08:13',0),(89,1,1,'abcabca','2019-05-16 13:09:05','2019-05-16 13:09:05',0),(90,1,1,'abc','2019-05-16 13:10:20','2019-05-16 13:10:20',0),(91,1,1,'abc','2019-05-16 13:11:35','2019-05-16 13:12:09',1),(92,1,1,'abc','2019-05-16 13:11:52','2019-05-16 13:11:52',0),(93,1,1,'123','2019-05-16 13:14:11','2019-05-16 13:15:08',1),(94,1,1,'abc','2019-05-16 13:14:54','2019-05-16 13:14:54',0),(95,1,1,'abc','2019-05-16 13:17:00','2019-05-16 13:17:31',1),(96,1,1,'abc','2019-05-16 13:17:27','2019-05-16 13:28:09',1),(97,1,1,'abc','2019-05-16 14:09:52','2019-05-16 14:10:07',1),(98,1,1,'hello','2019-05-16 15:00:24','2019-05-16 15:00:24',0),(99,1,1,'hello','2019-05-16 15:00:40','2019-05-16 15:00:40',0),(100,1,1,'hello','2019-05-16 15:00:45','2019-05-16 15:00:45',0),(101,1,1,'hello','2019-05-16 15:01:14','2019-05-16 15:01:14',0),(102,1,1,'hello admin','2019-05-16 15:01:32','2019-05-16 15:01:32',0),(103,1,1,'h','2019-05-16 15:02:10','2019-05-16 15:02:10',0),(104,1,1,'habc','2019-05-16 15:02:16','2019-05-16 15:02:16',0),(105,1,1,'habca','2019-05-16 15:02:33','2019-05-16 15:02:33',0),(106,1,1,'123','2019-05-16 15:02:48','2019-05-16 15:02:48',0),(107,1,1,'abc','2019-05-16 15:09:10','2019-05-16 15:09:10',0),(108,1,1,'abc','2019-05-16 15:09:33','2019-05-16 15:09:33',0),(109,1,1,'abc','2019-05-16 15:10:54','2019-05-16 15:10:54',0),(110,1,1,'abc','2019-05-16 15:11:37','2019-05-16 15:11:37',0),(111,1,1,'browse comment this','2019-05-16 15:12:11','2019-05-16 15:15:11',1),(112,1,1,'hello','2019-05-16 15:14:51','2019-05-16 15:16:45',1),(113,1,1,'i want buy shoes','2019-05-16 15:47:49','2019-05-16 15:47:49',0),(114,1,1,'i want buy shoes','2019-05-16 15:54:30','2019-05-16 15:54:30',0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text NOT NULL,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (1,0,0,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/class \'SendEmailJob\'\nmethod_name: :perform_later\nargs:\n- !ruby/object:User\n  concise_attributes:\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: encrypted_password\n    value_before_type_cast: \"$2a$11$zWeu5YQuEm3kQA.stsh/euZBrg2TdFLDbW3lHkHZ.tje1e2jMsF9G\"\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: id\n    value_before_type_cast: 1\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: firstname\n    value_before_type_cast: \'123456\'\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: lastname\n    value_before_type_cast: \'123456\'\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: email\n    value_before_type_cast: quoctienphamm@gmail.com\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: phone\n    value_before_type_cast: \'1234567890\'\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: address\n    value_before_type_cast: \'123456\'\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: gender\n    value_before_type_cast: 0\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: reset_password_token\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: reset_password_sent_at\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: remember_created_at\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: created_at\n    value_before_type_cast: 2019-04-04 15:39:28.000000000 Z\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: updated_at\n    value_before_type_cast: 2019-04-04 15:39:28.000000000 Z\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: admin\n    value_before_type_cast: 0\n  new_record: false\n  active_record_yaml_version: 2\n',NULL,'2019-04-04 15:41:22',NULL,NULL,NULL,'default','2019-04-04 15:40:32','2019-04-04 15:40:32');
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `content` text,
  `usersend` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,7,'asdasd',1,'2019-04-07 14:43:18','2019-04-07 14:43:18'),(2,1,7,' asdasd',1,'2019-04-07 14:43:22','2019-04-07 14:43:22'),(3,1,7,' asdasdasdasd',1,'2019-04-07 14:43:25','2019-04-07 14:43:25'),(4,1,7,' asdasd',1,'2019-04-07 14:43:27','2019-04-07 14:43:27'),(5,1,7,' ',1,'2019-04-07 14:43:27','2019-04-07 14:43:27'),(6,1,7,' ',1,'2019-04-07 14:43:28','2019-04-07 14:43:28'),(7,1,7,' asdasd',1,'2019-04-07 14:43:30','2019-04-07 14:43:30'),(8,1,7,' asdasd',1,'2019-04-07 14:43:32','2019-04-07 14:43:32'),(9,1,7,'asdas',1,'2019-04-07 14:43:33','2019-04-07 14:43:33'),(10,1,7,'sfsdf',1,'2019-04-08 15:27:52','2019-04-08 15:27:52'),(11,1,7,'asdasd',0,'2019-05-15 11:04:20','2019-05-15 11:04:20'),(12,1,7,'aaaaaaaaaaaaa',0,'2019-05-15 11:04:32','2019-05-15 11:04:32'),(13,1,7,'',1,'2019-05-15 11:06:20','2019-05-15 11:06:20'),(14,1,7,'asdwadsd',1,'2019-05-15 11:09:25','2019-05-15 11:09:25'),(15,1,7,'asdwadsd',1,'2019-05-15 11:09:26','2019-05-15 11:09:26'),(16,1,7,'123',1,'2019-05-15 11:09:35','2019-05-15 11:09:35'),(17,1,7,'asdasd',1,'2019-05-15 11:11:35','2019-05-15 11:11:35'),(18,1,7,'sadasd',0,'2019-05-15 11:12:03','2019-05-15 11:12:03'),(19,1,7,' asd',1,'2019-05-15 11:12:09','2019-05-15 11:12:09'),(20,1,7,' sadsd',1,'2019-05-15 11:12:33','2019-05-15 11:12:33'),(21,1,7,'asdasd',1,'2019-05-15 11:15:48','2019-05-15 11:15:48'),(22,1,7,' asdasd',1,'2019-05-15 11:15:52','2019-05-15 11:15:52'),(23,1,7,' 1',1,'2019-05-15 11:15:54','2019-05-15 11:15:54'),(24,1,7,' 2',1,'2019-05-15 11:15:56','2019-05-15 11:15:56'),(25,1,7,' 3',1,'2019-05-15 11:15:57','2019-05-15 11:15:57'),(26,1,7,' 4',1,'2019-05-15 11:15:58','2019-05-15 11:15:58'),(27,1,7,' ',1,'2019-05-15 11:15:59','2019-05-15 11:15:59'),(28,1,7,' 5',1,'2019-05-15 11:16:00','2019-05-15 11:16:00'),(29,1,7,' 6',1,'2019-05-15 11:16:01','2019-05-15 11:16:01'),(30,1,7,' 7',1,'2019-05-15 11:16:02','2019-05-15 11:16:02'),(31,1,7,' 8',1,'2019-05-15 11:16:03','2019-05-15 11:16:03'),(32,1,7,' 9',1,'2019-05-15 11:16:04','2019-05-15 11:16:04'),(33,2,7,'asdas',1,'2019-05-15 11:17:38','2019-05-15 11:17:38'),(34,1,7,'asdasd',0,'2019-05-15 11:17:58','2019-05-15 11:17:58'),(35,1,7,'asdasd',1,'2019-05-15 13:31:07','2019-05-15 13:31:07'),(36,1,7,'asd',1,'2019-05-15 13:32:28','2019-05-15 13:32:28'),(37,1,7,'asdas',1,'2019-05-15 13:33:23','2019-05-15 13:33:23'),(38,1,7,'asd ',1,'2019-05-15 13:33:25','2019-05-15 13:33:25'),(39,1,7,' asd',1,'2019-05-15 13:33:27','2019-05-15 13:33:27'),(40,1,7,'asdas',0,'2019-05-15 13:34:21','2019-05-15 13:34:21'),(41,1,7,'asdasdasdasd',1,'2019-05-15 13:34:43','2019-05-15 13:34:43'),(42,1,7,'asda',1,'2019-05-15 13:35:02','2019-05-15 13:35:02'),(43,1,7,' asd',1,'2019-05-15 13:35:04','2019-05-15 13:35:04'),(44,1,7,'asdasd',1,'2019-05-15 13:35:44','2019-05-15 13:35:44'),(45,1,7,'asdasd',1,'2019-05-15 13:36:07','2019-05-15 13:36:07'),(46,1,7,' asdasdasdasd',1,'2019-05-15 13:36:25','2019-05-15 13:36:25'),(47,1,7,' asd',1,'2019-05-15 13:36:34','2019-05-15 13:36:34'),(48,1,7,'sdasd',0,'2019-05-15 13:37:12','2019-05-15 13:37:12'),(49,1,7,' ',1,'2019-05-15 13:37:17','2019-05-15 13:37:17'),(50,1,7,' 12312',1,'2019-05-15 13:37:25','2019-05-15 13:37:25'),(51,1,7,'asdas',1,'2019-05-15 13:48:18','2019-05-15 13:48:18'),(52,1,7,'asdas',0,'2019-05-15 13:48:46','2019-05-15 13:48:46'),(53,1,7,'asdasd ',1,'2019-05-15 13:48:51','2019-05-15 13:48:51'),(54,1,7,'asdas',1,'2019-05-15 13:49:47','2019-05-15 13:49:47'),(55,1,7,' asdas',1,'2019-05-15 13:50:01','2019-05-15 13:50:01'),(56,1,7,'asd',1,'2019-05-15 13:50:51','2019-05-15 13:50:51'),(57,1,7,'asd',1,'2019-05-15 13:51:20','2019-05-15 13:51:20'),(58,1,7,'asd',1,'2019-05-15 13:51:34','2019-05-15 13:51:34'),(59,1,7,'asdasd',0,'2019-05-15 13:51:50','2019-05-15 13:51:50'),(60,1,7,'asdas',1,'2019-05-15 13:52:31','2019-05-15 13:52:31'),(61,1,7,'asda',1,'2019-05-15 13:52:55','2019-05-15 13:52:55'),(62,1,7,'asda',1,'2019-05-15 13:53:17','2019-05-15 13:53:17'),(63,1,7,'asdas',0,'2019-05-15 13:55:06','2019-05-15 13:55:06'),(64,1,7,'asdasd',1,'2019-05-15 13:56:39','2019-05-15 13:56:39'),(65,1,7,'asdasd',1,'2019-05-15 13:57:47','2019-05-15 13:57:47'),(66,1,7,' sadsa',1,'2019-05-15 13:59:56','2019-05-15 13:59:56'),(67,1,7,' asdas',1,'2019-05-15 14:00:03','2019-05-15 14:00:03'),(68,1,7,'asdas',1,'2019-05-15 14:00:22','2019-05-15 14:00:22'),(69,1,7,' asdas',1,'2019-05-15 14:00:25','2019-05-15 14:00:25'),(70,1,7,'asdasd',1,'2019-05-15 14:18:59','2019-05-15 14:18:59'),(71,1,7,'asdasd',1,'2019-05-15 14:19:21','2019-05-15 14:19:21'),(72,1,7,'asdasdasdasd',1,'2019-05-15 14:22:27','2019-05-15 14:22:27'),(73,1,7,' asd',1,'2019-05-15 14:23:13','2019-05-15 14:23:13'),(74,1,7,'asdasd',1,'2019-05-15 14:24:45','2019-05-15 14:24:45'),(75,1,7,'asdasasdas',1,'2019-05-15 14:26:14','2019-05-15 14:26:14'),(76,1,7,' asdasd',1,'2019-05-15 14:27:07','2019-05-15 14:27:07'),(77,1,7,'c',1,'2019-05-15 14:28:27','2019-05-15 14:28:27'),(78,1,7,'casdas',1,'2019-05-15 14:35:07','2019-05-15 14:35:07'),(79,1,7,'asda',1,'2019-05-15 14:37:35','2019-05-15 14:37:35'),(80,1,7,'asda',1,'2019-05-15 14:38:58','2019-05-15 14:38:58'),(81,1,7,'asda',1,'2019-05-15 14:39:38','2019-05-15 14:39:38'),(82,1,7,'asda',1,'2019-05-15 14:40:29','2019-05-15 14:40:29'),(83,1,7,'asdasd',1,'2019-05-15 14:44:34','2019-05-15 14:44:34'),(84,1,7,'asdas',1,'2019-05-15 14:49:38','2019-05-15 14:49:38'),(85,1,7,'asdasd',1,'2019-05-15 14:51:27','2019-05-15 14:51:27'),(86,1,7,'1 ',1,'2019-05-15 14:51:36','2019-05-15 14:51:36'),(87,1,7,' how are you ?',1,'2019-05-15 14:51:47','2019-05-15 14:51:47'),(88,1,7,'xzczx',1,'2019-05-15 14:56:04','2019-05-15 14:56:04'),(89,1,7,' asdasd',1,'2019-05-15 14:56:18','2019-05-15 14:56:18'),(90,1,7,'asdasd',1,'2019-05-15 14:57:34','2019-05-15 14:57:34'),(91,1,7,' 1',1,'2019-05-15 14:57:49','2019-05-15 14:57:49'),(92,1,7,'asdasd',1,'2019-05-15 14:58:48','2019-05-15 14:58:48'),(93,2,7,'asdasd',1,'2019-05-15 14:59:33','2019-05-15 14:59:33'),(94,1,7,' asdasd',1,'2019-05-15 14:59:37','2019-05-15 14:59:37'),(95,1,7,' ',1,'2019-05-15 14:59:38','2019-05-15 14:59:38'),(96,1,7,' asd',1,'2019-05-15 14:59:39','2019-05-15 14:59:39'),(97,1,7,' aaaaaaaaa',1,'2019-05-15 14:59:48','2019-05-15 14:59:48'),(98,2,7,' asd',1,'2019-05-15 15:00:33','2019-05-15 15:00:33'),(99,2,7,' 1',1,'2019-05-15 15:00:38','2019-05-15 15:00:38'),(100,1,7,' aaaaaaaaa',1,'2019-05-15 15:00:46','2019-05-15 15:00:46'),(101,1,7,'quoctienphamm@gmail.com',1,'2019-05-15 15:01:28','2019-05-15 15:01:28'),(102,2,7,' tigertocdo@gmail.com',1,'2019-05-15 15:01:37','2019-05-15 15:01:37'),(103,2,7,'asdasd',0,'2019-05-15 15:02:09','2019-05-15 15:02:09'),(104,2,7,'sad',0,'2019-05-15 15:02:15','2019-05-15 15:02:15'),(105,2,7,'aaaaaaaa',0,'2019-05-15 15:02:19','2019-05-15 15:02:19'),(106,2,7,'asdasd',0,'2019-05-15 15:06:21','2019-05-15 15:06:21'),(107,2,7,'asdasd',0,'2019-05-15 15:06:43','2019-05-15 15:06:43'),(108,2,7,'asdasd',0,'2019-05-15 15:10:39','2019-05-15 15:10:39'),(109,1,7,'a',0,'2019-05-15 15:10:56','2019-05-15 15:10:56'),(110,1,7,'asdasd',0,'2019-05-15 15:11:46','2019-05-15 15:11:46'),(111,1,7,'asdasd',0,'2019-05-15 15:11:59','2019-05-15 15:11:59'),(112,1,7,'123',0,'2019-05-15 15:12:14','2019-05-15 15:12:14'),(113,1,7,'asdasd',0,'2019-05-15 15:12:36','2019-05-15 15:12:36'),(114,1,7,'asd',0,'2019-05-15 15:13:17','2019-05-15 15:13:17'),(115,1,7,'s',0,'2019-05-15 15:13:23','2019-05-15 15:13:23'),(116,1,7,'as',0,'2019-05-15 15:14:35','2019-05-15 15:14:35'),(117,1,7,'abc',1,'2019-05-15 15:16:08','2019-05-15 15:16:08'),(118,1,7,'asdasd',1,'2019-05-15 15:16:34','2019-05-15 15:16:34'),(119,1,7,'asdasd',0,'2019-05-15 15:16:38','2019-05-15 15:16:38'),(120,1,7,' asda',1,'2019-05-15 15:16:44','2019-05-15 15:16:44'),(121,1,7,'a',0,'2019-05-15 15:16:48','2019-05-15 15:16:48'),(122,1,7,'123',1,'2019-05-15 15:18:31','2019-05-15 15:18:31'),(123,1,7,'321',0,'2019-05-15 15:18:35','2019-05-15 15:18:35'),(124,1,7,'asdas',1,'2019-05-15 15:19:17','2019-05-15 15:19:17'),(125,1,7,' quoctienphamm@gmail.com',1,'2019-05-15 15:19:28','2019-05-15 15:19:28'),(126,2,7,'tigertocdo@gmail.com',1,'2019-05-15 15:19:46','2019-05-15 15:19:46'),(127,2,7,'hello tigertocdo',0,'2019-05-15 15:20:14','2019-05-15 15:20:14'),(128,2,7,'can i help you',0,'2019-05-15 15:21:03','2019-05-15 15:21:03'),(129,2,7,' i need get buy a shoe brand nike',1,'2019-05-15 15:21:29','2019-05-15 15:21:29'),(130,2,7,'http://localhost:3000',0,'2019-05-15 15:21:59','2019-05-15 15:21:59'),(131,2,7,' ok i will watch',1,'2019-05-15 15:22:26','2019-05-15 15:22:26'),(132,2,7,'tigertocdo@gmail.com',1,'2019-05-15 15:24:08','2019-05-15 15:24:08'),(133,1,7,'quoctienphamm@gmail.com',1,'2019-05-15 15:24:24','2019-05-15 15:24:24'),(134,1,7,'sadasd',1,'2019-05-15 15:37:33','2019-05-15 15:37:33'),(135,1,7,'hello',1,'2019-05-15 15:40:12','2019-05-15 15:40:12'),(136,1,7,'hello',1,'2019-05-16 03:54:24','2019-05-16 03:54:24'),(137,1,7,'i am admin page , can i help you ?',0,'2019-05-16 03:54:53','2019-05-16 03:54:53');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_items`
--

DROP TABLE IF EXISTS `payment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_items`
--

LOCK TABLES `payment_items` WRITE;
/*!40000 ALTER TABLE `payment_items` DISABLE KEYS */;
INSERT INTO `payment_items` VALUES (1,1,123,35,1,1),(2,1,123,35,1,2);
/*!40000 ALTER TABLE `payment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `charge_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'123456','123456','Reinickendorf,Berlin,Deutschland',2,'ch_1ELXg7I6Y33JfdkZ1Bs5vGzK',1,0),(2,'123','123123','Lieto,Turun seutukunta,Lounais-Suomen aluehallintovirasto,Etelä-Suomi,Suomi',2,'ch_1ELXleI6Y33JfdkZljh2LHF7',1,0);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Reinickendorf,Berlin,Deutschland',52.6048,13.2953,'2019-04-04 15:40:34','2019-04-04 15:40:36',1),(2,'423,淀川区,大阪市,近畿地方,日本',34.7266,135.483,'2019-04-04 15:45:42','2019-04-04 15:45:42',NULL),(3,'Lieto,Turun seutukunta,Lounais-Suomen aluehallintovirasto,Etelä-Suomi,Suomi',60.5022,22.4555,'2019-04-04 15:46:16','2019-04-04 15:46:18',2);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `liked` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'123123123123',123,'12345612222222222222222222222222222222222222',1,'2019-04-04 15:38:06','2019-05-07 15:59:17',14),(2,'wwwwwwwwwwwwwwd',12,'asssssssssssssssssssssssssssadasdasdsss',1,'2019-04-09 16:45:13','2019-04-10 16:07:21',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190306060445'),('20190307035103'),('20190308045037'),('20190308071304'),('20190308074025'),('20190308083018'),('20190311041416'),('20190313030846'),('20190313031907'),('20190313084429'),('20190314024236'),('20190314024911'),('20190314035334'),('20190314145333'),('20190314151340'),('20190315020606'),('20190318073652'),('20190319035819'),('20190319134032'),('20190320034249'),('20190320062223'),('20190325132236'),('20190325155829'),('20190329095529'),('20190329110656'),('20190330145000'),('20190331162926'),('20190404143654'),('20190408155326'),('20190419055934'),('20190419060341'),('20190502105847'),('20190502110019'),('20190506114910'),('20190506115146'),('20190506115302'),('20190513042021'),('20190513050115'),('20190514025220'),('20190514031046'),('20190516010239'),('20190516020021');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,1,36,100),(2,2,35,5);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'123456','123456','quoctienphamm@gmail.com','$2a$11$zWeu5YQuEm3kQA.stsh/euZBrg2TdFLDbW3lHkHZ.tje1e2jMsF9G','1234567890','123456',0,NULL,NULL,NULL,'2019-04-04 15:39:28','2019-04-04 15:39:28',0),(2,'asd','asdasd','tigertocdo@gmail.com','$2a$11$59/MM/ee1V7gN42fieuJhOKE6Cu8gltnA9FkFoZfJn3euLymZpbNS','123456789','asdasd',0,NULL,NULL,NULL,'2019-05-15 11:17:32','2019-05-15 11:17:32',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vouchers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 23:26:08
