-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: atenea
-- ------------------------------------------------------
-- Server version	8.0.26

 /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT  */;
 /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS  */;
 /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION  */;
 /*!50503 SET NAMES utf8mb4  */;
 /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE  */;
 /*!40103 SET TIME_ZONE='+00:00'  */;
 /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0  */;
 /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0  */;
 /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO'  */;
 /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0  */;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
 /*!40101 SET @saved_cs_client     = @@character_set_client  */;
 /*!50503 SET character_set_client = utf8mb4  */;
CREATE TABLE `Recipe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Recipe identifier',
  `user_id` int NOT NULL COMMENT 'User identifier, relationship with the User table',
  `name` varchar(50) NOT NULL COMMENT 'Recipe name in recipe table',
  `description` varchar(1500) COMMENT 'Recipe description  in recipe table',
  `au_creation_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit field to store the creation date',
  `au_creation_user` int DEFAULT NULL COMMENT 'Audit field to store the creation user',
  `au_modification_date` datetime DEFAULT NULL COMMENT 'Audit field to store the modification date',
  `au_modification_user` int DEFAULT NULL COMMENT 'Audit field to store the modification user',
  `au_active` tinyint(1) DEFAULT '1' COMMENT 'Audit field to store whether the table record is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_Recipe_auActive` (`au_active`),
  KEY `idx_Recipe_auCreationUser_auActive` (`au_creation_user`,`au_active`),
  KEY `idx_Recipe_name` (`name`),
  KEY `idx_Recipe_auCreationUser` (`au_creation_user`),
  KEY `idx_Recipe_auModificationUser` (`au_modification_user`),
  KEY `idx_Recipe_userId` (`user_id`),
  CONSTRAINT `fk_Recipe_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table that stores the recipes of the web application';
 
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgInsertBeforeRecipe` BEFORE INSERT ON `Recipe` FOR EACH ROW BEGIN      SET NEW.au_creation_date = NOW(); SET NEW.au_creation_user =(SELECT IF (NEW.au_creation_user IS NULL, USER(),NEW.au_creation_user)); END */;;
DELIMITER ;
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgUpdateBeforeRecipe` BEFORE UPDATE ON `Recipe` FOR EACH ROW BEGIN      SET NEW.au_modification_date = NOW(); SET NEW.au_modification_user =(SELECT IF (NEW.au_modification_user IS NULL, USER(),NEW.au_modification_user)); END */;;
DELIMITER ;
	
--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
 /*!40000 ALTER TABLE  `Recipe` DISABLE KEYS  */;
 /*!40000 ALTER TABLE  `Recipe` ENABLE KEYS  */;
UNLOCK TABLES;



--
-- Table structure for table `Keyword`
--

DROP TABLE IF EXISTS `Keyword`;
 /*!40101 SET @saved_cs_client     = @@character_set_client  */;
 /*!50503 SET character_set_client = utf8mb4  */;
CREATE TABLE `Keyword` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Keyword identifier',
  `recipe_id` int NOT NULL COMMENT 'Recipe identifier, relationship with the Recipe table',
  `keyword` varchar(100) NOT NULL COMMENT 'Keyword  in Keyword table',
  `au_creation_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit field to store the creation date',
  `au_creation_user` int DEFAULT NULL COMMENT 'Audit field to store the creation user',
  `au_modification_date` datetime DEFAULT NULL COMMENT 'Audit field to store the modification date',
  `au_modification_user` int DEFAULT NULL COMMENT 'Audit field to store the modification user',
  `au_active` tinyint(1) DEFAULT '1' COMMENT 'Audit field to store whether the table record is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_Keyword_auActive` (`au_active`),
  KEY `idx_Keyword_keyword` (`keyword`),
  KEY `idx_Keyword_auCreationUser` (`au_creation_user`),
  KEY `idx_Keyword_auModificationUser` (`au_modification_user`),
  KEY `idx_Keyword_recipeId` (`recipe_id`),
  CONSTRAINT `fk_Keyword_Recipe` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table that stores the recipes keywords of the web application.';
 
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgInsertBeforeKeyword` BEFORE INSERT ON `Keyword` FOR EACH ROW BEGIN      SET NEW.au_creation_date = NOW(); SET NEW.au_creation_user =(SELECT IF (NEW.au_creation_user IS NULL, USER(),NEW.au_creation_user)); END */;;
DELIMITER ;
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgUpdateBeforeKeyword` BEFORE UPDATE ON `Keyword` FOR EACH ROW BEGIN      SET NEW.au_modification_date = NOW(); SET NEW.au_modification_user =(SELECT IF (NEW.au_modification_user IS NULL, USER(),NEW.au_modification_user)); END */;;
DELIMITER ;
	
--
-- Dumping data for table `Keyword`
--

LOCK TABLES `Keyword` WRITE;
 /*!40000 ALTER TABLE  `Keyword` DISABLE KEYS  */;
 /*!40000 ALTER TABLE  `Keyword` ENABLE KEYS  */;
UNLOCK TABLES;



--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
 /*!40101 SET @saved_cs_client     = @@character_set_client  */;
 /*!50503 SET character_set_client = utf8mb4  */;
CREATE TABLE `Role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Role identifier',
  `name` varchar(50) NOT NULL COMMENT 'Role name in role table',
  `au_creation_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit field to store the creation date',
  `au_creation_user` int DEFAULT NULL COMMENT 'Audit field to store the creation user',
  `au_modification_date` datetime DEFAULT NULL COMMENT 'Audit field to store the modification date',
  `au_modification_user` int DEFAULT NULL COMMENT 'Audit field to store the modification user',
  `au_active` tinyint(1) DEFAULT '1' COMMENT 'Audit field to store whether the table record is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_Role_auActive` (`au_active`),
  KEY `idx_Role_name` (`name`),
  KEY `idx_Role_auCreationUser` (`au_creation_user`),
  KEY `idx_Role_auModificationUser` (`au_modification_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table that stores the roles of the web application';
 
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgInsertBeforeRole` BEFORE INSERT ON `Role` FOR EACH ROW BEGIN      SET NEW.au_creation_date = NOW(); SET NEW.au_creation_user =(SELECT IF (NEW.au_creation_user IS NULL, USER(),NEW.au_creation_user)); END */;;
DELIMITER ;
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgUpdateBeforeRole` BEFORE UPDATE ON `Role` FOR EACH ROW BEGIN      SET NEW.au_modification_date = NOW(); SET NEW.au_modification_user =(SELECT IF (NEW.au_modification_user IS NULL, USER(),NEW.au_modification_user)); END */;;
DELIMITER ;
	
--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
 /*!40000 ALTER TABLE  `Role` DISABLE KEYS  */;
 /*!40000 ALTER TABLE  `Role` ENABLE KEYS  */;
UNLOCK TABLES;


--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
 /*!40101 SET @saved_cs_client     = @@character_set_client  */;
 /*!50503 SET character_set_client = utf8mb4  */;
CREATE TABLE `Membership` (
  `role_id` int NOT NULL COMMENT 'Role identifier, relationship with the Role table',
  `user_id` int NOT NULL COMMENT 'User identifier, relationship with the User table',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `idx_Membership_userId` (`user_id`),
  KEY `idx_Membership_roleId` (`role_id`),
  CONSTRAINT `fk_Membership_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `fk_Membership_Role` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table that stores the memberships of the users (authors of the recipes) in the web application.';

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
 /*!40000 ALTER TABLE  `Membership` DISABLE KEYS  */;
 /*!40000 ALTER TABLE  `Membership` ENABLE KEYS  */;
UNLOCK TABLES;




--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
 /*!40101 SET @saved_cs_client     = @@character_set_client  */;
 /*!50503 SET character_set_client = utf8mb4  */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'User identifier',
  `username` varchar(50) NOT NULL COMMENT 'User name in user table',
  `password` varchar(100) NOT NULL COMMENT 'User password  in user table',
  `firstname` varchar(150) NOT NULL COMMENT 'Firstname in Author table',
  `lastname` varchar(300) NOT NULL COMMENT 'Lastname in Author table',
  `email` varchar(300) NOT NULL COMMENT 'Email in Author table',
  `au_creation_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit field to store the creation date',
  `au_creation_user` int COMMENT 'Audit field to store the creation user',
  `au_modification_date` datetime DEFAULT NULL COMMENT 'Audit field to store the modification date',
  `au_modification_user` int  COMMENT 'Audit field to store the modification user',
  `au_active` tinyint(1) DEFAULT '1' COMMENT 'Audit field to store whether the table record is active or not',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_User_username` (`username`),
  KEY `idx_User_auActive` (`au_active`),
  KEY `idx_User_username` (`username`),
  KEY `idx_User_auCreationUser` (`au_creation_user`),
  KEY `idx_User_auModificationUser` (`au_modification_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table that stores the users of the web application';
 
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgInsertBeforeUser` BEFORE INSERT ON `User` FOR EACH ROW BEGIN      SET NEW.au_creation_date = NOW(); SET NEW.au_creation_user =(SELECT IF (NEW.au_creation_user IS NULL, USER(),NEW.au_creation_user)); END */;;
DELIMITER ;
	/*!50003 SET character_set_client  = utf8mb4 */ ;
	/*!50003 SET character_set_results = utf8mb4 */ ;
	/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
	/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
	/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
	/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `tgUpdateBeforeUser` BEFORE UPDATE ON `User` FOR EACH ROW BEGIN      SET NEW.au_modification_date = NOW(); SET NEW.au_modification_user =(SELECT IF (NEW.au_modification_user IS NULL, USER(),NEW.au_modification_user)); END */;;
DELIMITER ;
	
--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
 /*!40000 ALTER TABLE  `User` DISABLE KEYS  */;
 /*!40000 ALTER TABLE  `User` ENABLE KEYS  */;
UNLOCK TABLES;