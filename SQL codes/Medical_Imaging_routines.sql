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
-- Temporary view structure for view `disease_xray`
--

DROP TABLE IF EXISTS `disease_xray`;
/*!50001 DROP VIEW IF EXISTS `disease_xray`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_xray` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `disease_ctscan`
--

DROP TABLE IF EXISTS `disease_ctscan`;
/*!50001 DROP VIEW IF EXISTS `disease_ctscan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_ctscan` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_with_instructor_role_vw`
--

DROP TABLE IF EXISTS `user_with_instructor_role_vw`;
/*!50001 DROP VIEW IF EXISTS `user_with_instructor_role_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_with_instructor_role_vw` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Age`,
 1 AS `Sex`,
 1 AS `Email`,
 1 AS `Phone_No`,
 1 AS `Role_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `disease_mri`
--

DROP TABLE IF EXISTS `disease_mri`;
/*!50001 DROP VIEW IF EXISTS `disease_mri`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_mri` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `disease_xray`
--

/*!50001 DROP VIEW IF EXISTS `disease_xray`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_xray` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'X-Ray')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disease_ctscan`
--

/*!50001 DROP VIEW IF EXISTS `disease_ctscan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_ctscan` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'CT Scan')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_with_instructor_role_vw`
--

/*!50001 DROP VIEW IF EXISTS `user_with_instructor_role_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_with_instructor_role_vw` AS select `u`.`First_Name` AS `First_Name`,`u`.`Last_Name` AS `Last_Name`,`u`.`Age` AS `Age`,`u`.`Sex` AS `Sex`,`u`.`Email` AS `Email`,`u`.`Phone_No` AS `Phone_No`,`r`.`Role_Name` AS `Role_Name` from ((`user` `u` join `user_role` `ur`) join `role` `r`) where ((`u`.`UserID` = `ur`.`UserID`) and (`ur`.`RoleID` = `r`.`RoleID`) and (`r`.`Role_Name` = 'Instructor')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disease_mri`
--

/*!50001 DROP VIEW IF EXISTS `disease_mri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_mri` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'MRI')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'Medical_Imaging'
--

--
-- Dumping routines for database 'Medical_Imaging'
--
/*!50003 DROP FUNCTION IF EXISTS `body_part_max_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `body_part_max_image`() RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
 DECLARE stringValue VARCHAR(50);
 DECLARE Total__Brain_Image INT;
 DECLARE Total__Knee_Image INT;
 DECLARE Total__Shoulder_Image INT;
 
 SET Total__Brain_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN MRI_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Brain'); 
    
SET Total__Knee_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN CT_Scan_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Knee');
    
SET Total__Shoulder_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN XRay_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Shoulder');
    
IF (Total__Brain_Image > Total__Knee_Image) AND (Total__Brain_Image > Total__Shoulder_Image) THEN
SET stringValue = 'BRAIN';
ELSEIF Total__Brain_Image > Total__Knee_Image THEN                
SET stringValue = 'BRAIN';
ELSEIF Total__Brain_Image > Total__Shoulder_Image THEN                
SET stringValue = 'BRAIN';

ELSEIF (Total__Knee_Image > Total__Brain_Image) AND (Total__Knee_Image > Total__Shoulder_Image) THEN
SET stringValue = 'KNEE';
ELSEIF Total__Knee_Image > Total__Brain_Image THEN                
SET stringValue = 'KNEE';
ELSEIF Total__Knee_Image > Total__Shoulder_Image THEN                
SET stringValue = 'KNEE';

ELSEIF (Total__Shoulder_Image > Total__Brain_Image) AND (Total__Shoulder_Image > Total__Knee_Image) THEN
SET stringValue = 'KNEE';
ELSEIF Total__Shoulder_Image > Total__Knee_Image THEN                
SET stringValue = 'KNEE';
ELSEIF Total__Shoulder_Image > Total__Shoulder_Image THEN                
SET stringValue = 'KNEE';
ELSE
SET stringValue = 'ALL ARE EQUAL';
 END IF;
 RETURN stringValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `technique_performance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `technique_performance`() RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
Begin
 DECLARE stringValue VARCHAR(50);
 DECLARE Total__By_MRI INT;
 DECLARE Total__By_CT_SCAN INT;
 DECLARE Total__By_XRAY INT;
 
 SET Total__By_MRI = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'MRI'); 
SET Total__By_CT_SCAN = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'CT Scan');
SET Total__By_XRAY = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'X-Ray');
 IF (Total__By_MRI > Total__By_CT_SCAN) AND (Total__By_MRI > Total__By_XRAY) THEN
 SET stringValue = 'MRI detected more disease than CT Scan AND X-Ray ';
 ELSEIF Total__By_MRI > Total__By_CT_SCAN THEN                
 SET stringValue = 'MRI detected more disease than CT_Scan';
 ELSEIF Total__By_MRI > Total__By_XRAY THEN                
 SET stringValue = 'MRI detected more disease than X-Ray';
 ELSE
 SET stringValue = 'MRI detected less disease than CT Scan and X-Ray';
 END IF;
 RETURN stringValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_body_part` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_body_part`(IN bodypartID INT, IN bodypartname VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO Body_Part (Body_PartID, Body_Part_Name)
SELECT @bodypartID, @bodypartname;
SET @message_text = 'New BodyPart added successfully';
SELECT @message_text;
##LIMIT 1
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_disease`(IN diseaseID INT, IN diseasename VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO Disease (DiseaseID, Disease_Name)
SELECT @diseaseid, @diseasename;
SET @message_text = 'Disease added successfully';
SELECT @message_text;
##LIMIT 1

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_imaging_technique` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_imaging_technique`(IN techniqueID INT, IN techniquename VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO Imaging_Technique (Imaging_TechniqueID, Imaging_Technique_Name)
SELECT @techniqueID, @techniquename;
SET @message_text = 'New Technique added successfully';
SELECT @message_text;
##LIMIT 1
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(IN userid INT, IN fname VARCHAR(50), IN lname VARCHAR(50), IN age INT, IN sex VARCHAR(10), IN emailid VARCHAR(50), IN phone VARCHAR(50), IN addressid INT)
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO User (UserID, First_Name, Last_Name, Age, Sex, Email, Phone_No, AddressID)
SELECT @userid, @fname, @lname, @age, @sex, @emailid, @phone, @addressid;
SET @message_text = 'User added successfully';
SELECT @message_text;
##LIMIT 1
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_technique_for_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_technique_for_disease`(IN diseasename VARCHAR(50))
BEGIN
SELECT Imaging_Technique_Name 
FROM Imaging_Technique I
WHERE Imaging_TechniqueID IN (
	SELECT Imaging_TechniqueID 
    FROM Disease_Detection DD
	JOIN Disease D
	WHERE I.Imaging_TechniqueID = DD.Imaging_TechniqueID
	AND DD.DiseaseID = D.DiseaseID
	AND Disease_Name = diseasename);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verify_user_login_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_user_login_proc`(IN user_name VARCHAR(20), IN password VARCHAR(20))
    READS SQL DATA
BEGIN
	SELECT IF(count(*) > 0, 0, 1) AS Result
    FROM user_login 
    WHERE Username = user_name 
    AND Password = password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 23:56:25
