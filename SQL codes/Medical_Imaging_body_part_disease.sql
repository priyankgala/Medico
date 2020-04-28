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
-- Table structure for table `body_part_disease`
--

DROP TABLE IF EXISTS `body_part_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_part_disease` (
  `Body_Part_DiseaseID` int(11) NOT NULL,
  `Body_PartID` int(11) NOT NULL,
  `DiseaseID` int(11) NOT NULL,
  KEY `Body_PartID` (`Body_PartID`),
  KEY `DiseaseID` (`DiseaseID`),
  CONSTRAINT `body_part_disease_ibfk_1` FOREIGN KEY (`Body_PartID`) REFERENCES `body_part` (`Body_PartID`),
  CONSTRAINT `body_part_disease_ibfk_2` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`DiseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_part_disease`
--

LOCK TABLES `body_part_disease` WRITE;
/*!40000 ALTER TABLE `body_part_disease` DISABLE KEYS */;
INSERT INTO `body_part_disease` VALUES (1,101,1),(2,101,2),(3,101,3),(4,101,4),(5,101,5),(6,101,6),(7,101,7),(8,101,8),(9,101,9),(10,101,10),(11,101,11),(12,101,12),(13,101,13),(14,101,14),(15,101,15),(16,102,15),(17,103,15),(18,101,16),(19,101,17),(20,102,18),(21,103,18),(22,102,19),(23,103,19),(24,101,20),(25,102,20),(26,103,20),(27,101,23),(28,102,23),(29,103,23),(30,101,24),(31,102,24),(32,103,24),(33,101,25),(34,101,26),(35,101,28),(36,102,29),(37,103,29);
/*!40000 ALTER TABLE `body_part_disease` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 23:56:23
