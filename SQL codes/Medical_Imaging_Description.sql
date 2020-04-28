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
-- Table structure for table `Description`
--

DROP TABLE IF EXISTS `Description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Description` (
  `DescriptionID` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL DEFAULT 'No Description',
  `Body_Part` varchar(50) NOT NULL,
  `Technique_Name` varchar(50) NOT NULL,
  `Body_PartID` int(11) NOT NULL,
  `Imaging_TechniqueID` int(11) NOT NULL,
  KEY `Body_PartID` (`Body_PartID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `description_ibfk_1` FOREIGN KEY (`Body_PartID`) REFERENCES `body_part` (`Body_PartID`),
  CONSTRAINT `description_ibfk_2` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Description`
--

LOCK TABLES `Description` WRITE;
/*!40000 ALTER TABLE `Description` DISABLE KEYS */;
INSERT INTO `Description` VALUES (1,'Magnetic resonance imaging (MRI) of the head is a painless, \nnoninvasive test that produces detailed images of your brain and brain stem. \nAn MRI machine creates the images using a magnetic field and radio waves. \nThis test is also known as a brain MRI or a cranial MRI. \nYou will go to a hospital or radiology center to take a head MRI.','Brain','MRI',101,2),(2,'Magnetic resonance imaging (MRI) of the knee uses a powerful magnetic field, \nradio waves and a computer to produce detailed pictures of the structures within the knee joint. \nIt is typically used to help diagnose or evaluate pain, weakness, swelling or bleeding in and around the joint. \nKnee MRI does not use ionizing radiation, and it can help determine whether you require surgery.',' Knee','MRI',102,2),(3,'Magnetic resonance imaging (MRI) of the shoulder uses a powerful magnetic field, \nradio waves and a computer to produce detailed pictures of the bones, tendons, \nmuscles and blood vessels within the shoulder joint. It is primarily used to assess injuries.','Shoulder','MRI',103,2),(4,'A CT of the brain is a noninvasive diagnostic imaging procedure that uses\n special X-rays measurements to produce horizontal, or axial, images (often called slices) of the brain. \n Brain CT scans can provide more detailed information about brain tissue and brain structures than standard X-rays of the head,\n thus providing more data related to injuries and/or diseases of the brain.','Brain','CT',101,7),(5,'A computed tomography (CT) scan is a type of X-ray that shows cross-sectional images of a specific area on your body. \nFor example, a CT scan of your knee would help doctors diagnose disease or inspect injuries on your knee. \nA CT scanner circles the body and sends images to a computer. The computer uses these images to make detailed pictures. \nThis allows doctors and trained technicians to see the muscles, tendons, ligaments, vessels, and bones that make up your knee.','Knee','CT',102,7),(6,'A shoulder computed tomography scan or (CT or CAT scan) creates cross-sectional images of the shoulder using specialized X-ray cameras. \nThis scan can help doctors see the bones and soft tissues in the shoulder in order to detect abnormalities. \nThe CT scan may also help identify tumors and blood clots. A CT scan can be performed with or without contrast dye. \nThe contrast material helps your doctor analyze important vessels and structures. \nIt also allows them to identify abnormalities that cannot be seen without the dye.','Shoulder','CT',103,7),(7,'A skull X-ray is an imaging test doctors use to examine the bones of the skull, \nincluding the facial bones, the nose, and the sinuses.avg an easy, quick, \nand effective method that has been used for decades to help doctors view the area that houses your most vital organ — your brain.','Brain','Xray',101,1),(8,'A standard X-ray is a simple test in which an X-ray beam \n(a form of electromagnetic radiation) is passed through the knee to create a two-dimensional picture of the bones that form the joint. \nYour doctor can use X-rays to view bone spurs. \nBony overgrowths at the joint are a sign of osteoarthritis.','Knee','Xray',102,1),(9,'A standard X-ray is a simple test in which an X-ray beam (a form of electromagnetic radiation) \nis passed through the shoulder to create a two-dimensional picture of the bones that form the joint. \nYour doctor can use X-rays to view: joint space.','Shoulder','Xray',103,1);
/*!40000 ALTER TABLE `Description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 23:56:24
