-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: cspro
-- ------------------------------------------------------
-- Server version       8.0.32

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
-- Table structure for table `cspro_apps`
--

DROP TABLE IF EXISTS `cspro_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_apps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_time` datetime NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_apps`
--

LOCK TABLES `cspro_apps` WRITE;
/*!40000 ALTER TABLE `cspro_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_config`
--

DROP TABLE IF EXISTS `cspro_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_config` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_config`
--

LOCK TABLES `cspro_config` WRITE;
/*!40000 ALTER TABLE `cspro_config` DISABLE KEYS */;
INSERT INTO `cspro_config` VALUES ('schema_version','6','2023-02-24 18:51:06','1971-01-01 06:00:00'),('server_device_id','c27386ad-b8db-4d65-a3d0-a01fce32cca4','2023-02-24 18:51:06','1971-01-01 06:00:00');
/*!40000 ALTER TABLE `cspro_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_dictionaries`
--

DROP TABLE IF EXISTS `cspro_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_dictionaries` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `dictionary_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_full_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dictionary_name` (`dictionary_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_dictionaries`
--

LOCK TABLES `cspro_dictionaries` WRITE;
/*!40000 ALTER TABLE `cspro_dictionaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_dictionaries_schema`
--

DROP TABLE IF EXISTS `cspro_dictionaries_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_dictionaries_schema` (
  `dictionary_id` smallint unsigned NOT NULL,
  `host_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_password` varbinary(255) NOT NULL,
  `map_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`dictionary_id`),
  UNIQUE KEY `schema_name` (`schema_name`),
  CONSTRAINT `schema_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_dictionaries_schema`
--

LOCK TABLES `cspro_dictionaries_schema` WRITE;
/*!40000 ALTER TABLE `cspro_dictionaries_schema` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_dictionaries_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_permissions`
--

DROP TABLE IF EXISTS `cspro_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_permissions`
--

LOCK TABLES `cspro_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_permissions` DISABLE KEYS */;
INSERT INTO `cspro_permissions` VALUES (1,'data_all','2023-02-24 18:51:06','1971-01-01 06:00:00'),(2,'apps_all','2023-02-24 18:51:06','1971-01-01 06:00:00'),(3,'users_all','2023-02-24 18:51:06','1971-01-01 06:00:00'),(4,'roles_all','2023-02-24 18:51:06','1971-01-01 06:00:00'),(5,'reports_all','2023-02-24 18:51:06','1971-01-01 06:00:00'),(6,'dictionary_sync_upload','2023-02-24 18:51:06','1971-01-01 06:00:00'),(7,'dictionary_sync_download','2023-02-24 18:51:06','1971-01-01 06:00:00'),(8,'settings_all','2023-02-24 18:51:06','1971-01-01 06:00:00');
/*!40000 ALTER TABLE `cspro_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_role_dictionary_permissions`
--

DROP TABLE IF EXISTS `cspro_role_dictionary_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_role_dictionary_permissions` (
  `role_id` int unsigned NOT NULL,
  `dictionary_id` smallint unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  KEY `cspro_role_dictionary_role_id_constraint` (`role_id`),
  KEY `cspro_role_dictionary_id_constraint` (`dictionary_id`),
  KEY `cspro_role_dictionary_permission_id_constraint` (`permission_id`),
  CONSTRAINT `cspro_role_dictionary_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_dictionary_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_dictionary_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Dictionary Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_role_dictionary_permissions`
--

LOCK TABLES `cspro_role_dictionary_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_role_dictionary_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_role_dictionary_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_role_permissions`
--

DROP TABLE IF EXISTS `cspro_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  KEY `cspro_role_id_constraint` (`role_id`),
  KEY `cspro_permission_id_constraint` (`permission_id`),
  CONSTRAINT `cspro_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_role_permissions`
--

LOCK TABLES `cspro_role_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_roles`
--

DROP TABLE IF EXISTS `cspro_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Roles Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_roles`
--

LOCK TABLES `cspro_roles` WRITE;
/*!40000 ALTER TABLE `cspro_roles` DISABLE KEYS */;
INSERT INTO `cspro_roles` VALUES (1,'Standard User','2023-02-24 18:51:06','1971-01-01 06:00:00'),(2,'Administrator','2023-02-24 18:51:06','1971-01-01 06:00:00');
/*!40000 ALTER TABLE `cspro_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_sync_history`
--

DROP TABLE IF EXISTS `cspro_sync_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_sync_history` (
  `revision` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_id` smallint unsigned NOT NULL,
  `universe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('put','get','both') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`revision`),
  KEY `dictionary_id` (`dictionary_id`),
  CONSTRAINT `cspro_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_sync_history`
--

LOCK TABLES `cspro_sync_history` WRITE;
/*!40000 ALTER TABLE `cspro_sync_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_sync_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_users`
--

DROP TABLE IF EXISTS `cspro_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`username`),
  KEY `role` (`role`),
  CONSTRAINT `role_id_constraint` FOREIGN KEY (`role`) REFERENCES `cspro_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_users`
--

LOCK TABLES `cspro_users` WRITE;
/*!40000 ALTER TABLE `cspro_users` DISABLE KEYS */;
INSERT INTO `cspro_users` VALUES ('admin','$2y$10$IdtmAMutU6PYh9E3fQFXHexGbgOYI3.n3..oRZQKZpYshGc1vvWvO','System','Administrator',NULL,NULL,2,'2023-02-24 18:51:06','1971-01-01 06:00:00');
/*!40000 ALTER TABLE `cspro_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('4f2351e14c685c83715e61238d9b84c7d76b3ce2','cspro_android','admin','2023-02-24 19:51:06',NULL),('936f94bc984179abbfb448e6423cc113aeacdbf6','cspro_android','admin','2023-02-24 19:51:16',NULL);
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_authorization_codes`
--

DROP TABLE IF EXISTS `oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_authorization_codes`
--

LOCK TABLES `oauth_authorization_codes` WRITE;
/*!40000 ALTER TABLE `oauth_authorization_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grant_types` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('cspro_android','cspro','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_jwt`
--

DROP TABLE IF EXISTS `oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_jwt`
--

LOCK TABLES `oauth_jwt` WRITE;
/*!40000 ALTER TABLE `oauth_jwt` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('c37133c575e4938bafc11307053193631d68c18d','cspro_android','admin','2023-03-10 18:51:06',NULL),('a6b3c1c66ce6ad1bf35248c780aeda39032d5ce2','cspro_android','admin','2023-03-10 18:51:16',NULL);
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_scopes` (
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scopes`
--

LOCK TABLES `oauth_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_users`
--

LOCK TABLES `oauth_users` WRITE;
/*!40000 ALTER TABLE `oauth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 12:53:31