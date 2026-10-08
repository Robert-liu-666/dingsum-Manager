-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: desserts
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Current Database: `desserts`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `desserts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `desserts`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `descp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'传统甜品','精致到不忍下嘴的中国传统甜品,个个都经典'),(2,'凉粉系列','创意凉粉系列,将凉粉这一种民间小吃融入菜肴'),(3,'雪山系列','造型高颜值,口感绵软,越嚼越有嚼劲'),(4,'炭烧奶茶','奶茶搭配可可粉或咖啡粉，香味扑鼻'),(5,'黑森林蛋糕','融合了樱桃的酸、奶油的甜、巧克力的苦、樱桃酒的醇香'),(6,'传统奶茶！','醇香留口，香味扑鼻！');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dessert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photoUrl` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `descp` varchar(500) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert`
--

LOCK TABLES `dessert` WRITE;
/*!40000 ALTER TABLE `dessert` DISABLE KEYS */;
INSERT INTO `dessert` VALUES (1,'生磨芝麻糊加黑糯米2','/photo/001.jpg',12,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香2','2025-01-02',2),(2,'鲜杂果凉粉(椰汁芒汁)','/photo/002.jpg',20,'新鲜水果料足量多，吸引人眼球。如艺术品般令人赞叹的造型，味道也很赞。','2024-02-03',2),(3,'生磨芝麻糊加黑糯米','/photo/003.jpg',25,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香','2024-02-05',1),(4,'生磨芝麻糊加黑糯米Ⅱ','/photo/001.jpg',15,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香','2024-02-01',1),(5,'鲜杂果凉粉(椰汁芒汁)Ⅱ','/photo/002.jpg',20,'新鲜水果料足量多，吸引人眼球。如艺术品般令人赞叹的造型，味道也很赞。','2024-02-03',2),(6,'生磨芝麻糊加黑糯米Ⅱ','/photo/003.jpg',25,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香','2024-02-05',1),(7,'生磨芝麻糊加黑糯米Ⅲ','/photo/001.jpg',15,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香','2024-02-01',1),(8,'鲜杂果凉粉(椰汁芒汁)Ⅲ','/photo/002.jpg',20,'新鲜水果料足量多，吸引人眼球。如艺术品般令人赞叹的造型，味道也很赞。','2024-02-03',2),(9,'生磨芝麻糊加黑糯米Ⅲ','/photo/003.jpg',25,'满满一碗芝麻糊中央放了一个圆圆的黑糯米球，入口醇香柔滑，满满一口，让人齿颊留香','2024-02-05',1),(10,'测试小甜点','/photo/e6489febeb274201966be11bdb1cb92e.jpg',18,'小甜点，甜甜蜜蜜','2025-01-21',1),(14,'测试Q','/photo/22de77dacdd54eaaabe3d31d292b96a6.jpg',33,'Q弹可口','2025-01-08',1);
/*!40000 ALTER TABLE `dessert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'ROLE_admin'),(2,'ROLE_normal');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','12345',1),(2,'bob','123',1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08 18:53:51
