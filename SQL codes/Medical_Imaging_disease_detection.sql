-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Medical_Imaging
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `disease_detection`
--

DROP TABLE IF EXISTS `disease_detection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_detection` (
  `Disease_DetectionID` int(11) NOT NULL AUTO_INCREMENT,
  `Imaging_TechniqueID` int(11) NOT NULL,
  `DiseaseID` int(11) NOT NULL,
  PRIMARY KEY (`Disease_DetectionID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  KEY `DiseaseID` (`DiseaseID`),
  CONSTRAINT `disease_detection_ibfk_1` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`),
  CONSTRAINT `disease_detection_ibfk_2` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`DiseaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_detection`
--

LOCK TABLES `disease_detection` WRITE;
/*!40000 ALTER TABLE `disease_detection` DISABLE KEYS */;
INSERT INTO `disease_detection` VALUES (1,3,1),(2,7,2),(3,1,2),(4,7,3),(5,2,3),(6,2,4),(7,9,4),(8,2,5),(9,2,6),(10,7,7),(11,7,8),(12,2,8),(13,7,9),(14,2,10),(15,2,11),(16,2,12),(17,2,13),(18,2,14),(19,4,14),(20,7,14),(21,2,15),(22,2,16),(23,7,16),(24,2,17),(25,7,17),(26,1,18),(27,2,18),(28,7,18),(29,1,19),(30,2,19),(31,7,20),(32,1,21),(33,2,21),(34,4,21),(35,7,21),(36,7,22),(37,1,23),(38,2,23),(39,7,23),(40,2,24),(41,7,24),(42,1,25),(43,2,25),(44,7,25),(45,2,26),(46,7,26),(47,4,27),(48,2,28),(49,1,29),(50,2,29),(51,1,30);
/*!40000 ALTER TABLE `disease_detection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 23:56:25
