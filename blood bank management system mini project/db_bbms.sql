CREATE DATABASE  IF NOT EXISTS `bbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bbms`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bbms
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `ID` varchar(10) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PHONE` (`PHONE`),
  KEY `CITY` (`CITY`),
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`CITY`) REFERENCES `cities` (`CITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `INSERT_BANK` BEFORE INSERT ON `bank` FOR EACH ROW BEGIN
  IF(NOT EXISTS (SELECT CITY_NAME FROM CITIES  WHERE CITY_NAME = NEW.CITY))
  THEN
  INSERT INTO CITIES VALUES(NEW.city);
  END IF;
  SET 
  NEW.ID = CONCAT("BB",(SELECT COUNT(*)+1 FROM BANK));
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `UPDATE_BANK` BEFORE UPDATE ON `bank` FOR EACH ROW BEGIN
  IF(NOT EXISTS (SELECT CITY_NAME FROM CITIES  WHERE CITY_NAME = NEW.CITY))
  THEN
  INSERT INTO CITIES VALUES(NEW.city);
  END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `BILL_NO` varchar(10) NOT NULL,
  `REFER_ID` int NOT NULL,
  `BILL_DATE` date NOT NULL,
  PRIMARY KEY (`BILL_NO`),
  KEY `REFER_ID` (`REFER_ID`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`REFER_ID`) REFERENCES `refer` (`REFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `BILL_INSERT_TRIGGER` BEFORE INSERT ON `bill` FOR EACH ROW SET NEW.BILL_NO = CONCAT("BILL-",(SELECT COUNT(*)+1 FROM BILL)),
                 NEW.BILL_DATE = CURRENT_DATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `CITY_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`CITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DOCTOR_ID` int NOT NULL,
  `DOCTOR_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `DOB` date DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WEIGHT` int DEFAULT NULL,
  `GENDER` varchar(10) NOT NULL,
  `ELIGIBLE` tinyint(1) NOT NULL DEFAULT '0',
  `NEXT_DATE_FOR_DONATION` date DEFAULT NULL,
  `BLOOD_GROUP` varchar(3) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CITY` (`CITY`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`CITY`) REFERENCES `cities` (`CITY_NAME`),
  CONSTRAINT `BLOOD_GROUP_CONSTRAINT` CHECK (((`BLOOD_GROUP` = _utf8mb4'AP') or (`BLOOD_GROUP` = _utf8mb4'AN') or (`BLOOD_GROUP` = _utf8mb4'BP') or (`BLOOD_GROUP` = _utf8mb4'BN') or (`BLOOD_GROUP` = _utf8mb4'OP') or (`BLOOD_GROUP` = _utf8mb4'ON') or (`BLOOD_GROUP` = _utf8mb4'ABP') or (`BLOOD_GROUP` = _utf8mb4'ABN'))),
  CONSTRAINT `ELIGIBLE_CONSTRAINT` CHECK ((((`ELIGIBLE` = true) and (`NEXT_DATE_FOR_DONATION` <> NULL)) or ((`ELIGIBLE` = false) and (`NEXT_DATE_FOR_DONATION` = NULL)))),
  CONSTRAINT `GENDER` CHECK (((`GENDER` = _utf8mb4'MALE') or (`GENDER` = _utf8mb4'FEMALE')))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `ELIGIBLE_TRIGGER` BEFORE INSERT ON `person` FOR EACH ROW BEGIN
 IF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)<CURRENT_DATE()) AND (ADDDATE(NEW.DOB,INTERVAL 65 YEAR)>CURRENT_DATE()) AND (NEW.WEIGHT>50) AND (NEW.ELIGIBLE IS TRUE))
 THEN SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = CURRENT_DATE();
 ELSEIF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)<CURRENT_DATE()) AND (ADDDATE(NEW.DOB,INTERVAL 65 YEAR)>CURRENT_DATE()) AND (NEW.WEIGHT<50) AND (NEW.ELIGIBLE IS TRUE))
 THEN SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = ADDDATE(CURRENT_DATE(),INTERVAL 1 YEAR);
 ELSEIF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)>CURRENT_DATE()) AND (NEW.ELIGIBLE IS TRUE))
THEN
SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = ADDDATE(NEW.DOB,INTERVAL 18 YEAR);
 ELSE 
 SET NEW.ELIGIBLE = FALSE,
 NEW.NEXT_DATE_FOR_DONATION = NULL;
 END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `PERSON_CITY_TRIGGER` BEFORE INSERT ON `person` FOR EACH ROW BEGIN
  IF(NOT EXISTS (SELECT CITY_NAME FROM CITIES  WHERE CITY_NAME = NEW.CITY))
  THEN
  INSERT INTO CITIES VALUES(NEW.city);
  END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `PERSON_CITY_UPDATE_TRIGGER` BEFORE UPDATE ON `person` FOR EACH ROW BEGIN
  IF(NOT EXISTS (SELECT CITY_NAME FROM CITIES  WHERE CITY_NAME = NEW.CITY))
  THEN
  INSERT INTO CITIES VALUES(NEW.city);
  END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `ELIGIBLE_TRIGGER_UPDATE` BEFORE UPDATE ON `person` FOR EACH ROW BEGIN
 IF((OLD.NEXT_DATE_FOR_DONATION < NEW.NEXT_DATE_FOR_DONATION))
 THEN SET NEW.NEXT_DATE_FOR_DONATION = NEW.NEXT_DATE_FOR_DONATION;
 ELSEIF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)<CURRENT_DATE()) AND (ADDDATE(NEW.DOB,INTERVAL 65 YEAR)>CURRENT_DATE()) AND (NEW.WEIGHT>=50) AND (NEW.ELIGIBLE IS TRUE))
 THEN SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = CURRENT_DATE();
 ELSEIF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)<CURRENT_DATE()) AND (ADDDATE(NEW.DOB,INTERVAL 65 YEAR)>CURRENT_DATE()) AND (NEW.WEIGHT<50) AND (NEW.ELIGIBLE IS TRUE))
 THEN SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = ADDDATE(CURRENT_DATE(),INTERVAL 1 YEAR);
 ELSEIF((ADDDATE(NEW.DOB,INTERVAL 18 YEAR)>CURRENT_DATE()) AND (NEW.ELIGIBLE IS TRUE))
 THEN
 SET NEW.ELIGIBLE = TRUE,
 NEW.NEXT_DATE_FOR_DONATION = ADDDATE(NEW.DOB,INTERVAL 18 YEAR);
 ELSE 
 SET NEW.ELIGIBLE = FALSE,
 NEW.NEXT_DATE_FOR_DONATION = NULL;
 END IF;

 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `refer`
--

DROP TABLE IF EXISTS `refer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refer` (
  `REFER_ID` int NOT NULL,
  `DOCTOR_ID` int NOT NULL,
  `PATIENT_ID` int NOT NULL,
  `HOSPITAL` varchar(50) NOT NULL,
  PRIMARY KEY (`REFER_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `refer_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `doctor` (`DOCTOR_ID`),
  CONSTRAINT `refer_ibfk_2` FOREIGN KEY (`PATIENT_ID`) REFERENCES `person` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ret`
--

DROP TABLE IF EXISTS `ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ret` (
  `BILL_NO` varchar(10) NOT NULL,
  `RET_DATE` date NOT NULL,
  `UNIT_ID` varchar(15) NOT NULL,
  KEY `BILL_NO` (`BILL_NO`),
  KEY `UNIT_ID` (`UNIT_ID`),
  CONSTRAINT `ret_ibfk_1` FOREIGN KEY (`BILL_NO`) REFERENCES `bill` (`BILL_NO`),
  CONSTRAINT `ret_ibfk_2` FOREIGN KEY (`UNIT_ID`) REFERENCES `unit` (`UNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `RETURN_INSERT_TRIGGER` BEFORE INSERT ON `ret` FOR EACH ROW BEGIN
 IF("SOLD" = (SELECT STATE FROM UNIT WHERE UNIT_ID = NEW.UNIT_ID) AND (CURRENT_DATE<=(SELECT EXPIERY FROM UNIT WHERE UNIT_ID = NEW.UNIT_ID)))
 THEN
 SET NEW.RET_DATE = CURRENT_DATE();
 UPDATE UNIT SET STATE = "INSTOCK" WHERE UNIT_ID = NEW.UNIT_ID;
 UPDATE UNIT SET BILL_NO = NULL WHERE UNIT_ID = NEW.UNIT_ID;
 END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `UNIT_ID` varchar(15) NOT NULL,
  `DONOR_ID` int NOT NULL,
  `BANK_ID` varchar(10) NOT NULL,
  `CREATED` date NOT NULL,
  `EXPIERY` date NOT NULL,
  `CONTENT` varchar(15) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `SEPERATED_FROM` varchar(15) DEFAULT NULL,
  `BILL_NO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`UNIT_ID`),
  KEY `DONOR_ID` (`DONOR_ID`),
  KEY `BANK_ID` (`BANK_ID`),
  KEY `SEPERATED_FROM` (`SEPERATED_FROM`),
  KEY `BILL_NO` (`BILL_NO`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`DONOR_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`BANK_ID`) REFERENCES `bank` (`ID`),
  CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`SEPERATED_FROM`) REFERENCES `unit` (`UNIT_ID`),
  CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`BILL_NO`) REFERENCES `bill` (`BILL_NO`),
  CONSTRAINT `CONTENT_CONSTRAINT` CHECK (((`CONTENT` = _utf8mb4'WHOLE') or (`CONTENT` = _utf8mb4'PLASMA') or (`CONTENT` = _utf8mb4'PLATE') or (`CONTENT` = _utf8mb4'RED'))),
  CONSTRAINT `STATE_CONSTRAINT` CHECK ((((`CONTENT` = _utf8mb4'WHOLE') and ((`STATE` = _utf8mb4'INSTOCK') or (`STATE` = _utf8mb4'SOLD') or (`STATE` = _utf8mb4'SEPERATED') or (`STATE` = _utf8mb4'DISCARDED')) and (`SEPERATED_FROM` = NULL)) or ((`CONTENT` <> _utf8mb4'WHOLE') and ((`STATE` = _utf8mb4'INSTOCK') or (`STATE` = _utf8mb4'SOLD') or (`STATE` = _utf8mb4'DISCARDED')) and ((`SEPERATED_FROM` = NULL) or (`SEPERATED_FROM` <> NULL)))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`HARISH`@`%`*/ /*!50003 TRIGGER `ADD_PACKET` BEFORE INSERT ON `unit` FOR EACH ROW BEGIN
IF(CURRENT_DATE()>=(SELECT NEXT_DATE_FOR_DONATION FROM PERSON WHERE ID = NEW.DONOR_ID ) OR (NEW.SEPERATED_FROM IS NOT NULL)) 
THEN
SET NEW.CREATED = CURRENT_DATE(),
NEW.STATE = "INSTOCK",
NEW.UNIT_ID = CONCAT(CASE NEW.CONTENT
                   WHEN "WHOLE" THEN "WH"
                   WHEN "PLASMA" THEN "PS"
                   WHEN "PLATE" THEN "PL"
                   WHEN "RED" THEN "RD" END,(SELECT COUNT(*)+1 FROM UNIT),(SELECT BLOOD_GROUP FROM PERSON  WHERE ID = NEW.DONOR_ID));             
                  SET NEW.EXPIERY = CASE NEW.CONTENT 
                  WHEN "WHOLE" THEN ADDDATE(NEW.CREATED, INTERVAL 35 DAY)
                  WHEN "PLASMA" THEN ADDDATE(NEW.CREATED, INTERVAL 1 DAY)
                  WHEN "PLATE" THEN ADDDATE(NEW.CREATED, INTERVAL 5 DAY)
                  WHEN "RED" THEN ADDDATE(NEW.CREATED, INTERVAL 42 DAY) END;
                  END IF;
                  IF(NEW.SEPERATED_FROM IS NULL)
                  THEN 
                  UPDATE PERSON SET NEXT_DATE_FOR_DONATION = ADDDATE(CURRENT_DATE(),INTERVAL 3 MONTH) WHERE ID = NEW.DONOR_ID;
                  END IF;
                  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bbms'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `AGE_EVENT` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`HARISH`@`%`*/ /*!50106 EVENT `AGE_EVENT` ON SCHEDULE EVERY 1 DAY STARTS '2021-01-09 15:07:50' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE PERSON SET ELIGIBLE = FALSE WHERE ADDDATE(DOB,INTERVAL 65 YEAR) < CURRENT_DATE() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `EXPIERY_EVENT` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`HARISH`@`%`*/ /*!50106 EVENT `EXPIERY_EVENT` ON SCHEDULE EVERY 1 SECOND STARTS '2021-01-09 23:25:39' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE UNIT SET STATE = "DISCARDED" WHERE EXPIERY < CURRENT_DATE() AND STATE = "INSTOCK" */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `DOCTOR_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `DOCTOR_EXISTS`(ID INTEGER,NAME VARCHAR(30))
BEGIN
IF(ID = (SELECT DOCTOR_ID FROM DOCTOR WHERE DOCTOR_ID = ID))
THEN
SELECT "YES";
ELSE 
INSERT INTO DOCTOR VALUES(ID,NAME);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REFER_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `REFER_EXISTS`(DOCID INTEGER,DOCNAME VARCHAR(30),REFID INTEGER,PATID INTEGER,HOSP VARCHAR(50),ELIG BOOL)
BEGIN
   IF(PATID = (SELECT ID FROM PERSON WHERE ID = PATID))
   THEN 
   IF(DOCID = (SELECT DOCTOR_ID FROM DOCTOR WHERE DOCTOR_ID = DOCID))
   THEN
   IF(REFID = (SELECT REFER_ID FROM REFER WHERE REFER_ID = REFID))
   THEN
   IF(ELIGIBLE IS TRUE)
   THEN
   UPDATE PERSON SET NEXT_DATE_FOR_DONATION = ADDDATE(CURRENT_DATE(),INTERVAL 2 YEAR) WHERE ID = PATID;
   ELSE
   UPDATE PERSON SET ELIGIBLE = FALSE  WHERE ID = PATID;
   END IF;
   ELSE
   CALL REFER_PROCEDURE(REFID,DOCID,PATID,HOSP,ELIG);
   END IF;
   ELSE
   INSERT INTO DOCTOR VALUES(DOCID,DOCNAME);
   CALL REFER_PROCEDURE(REFID,DOCID,PATID,HOSP,ELIG);
   END IF;
   END IF;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REFER_PROCEDURE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `REFER_PROCEDURE`(REFER_ID INTEGER,DOCTOR_ID INTEGER,PATIENT_ID INTEGER,HOSPITAL VARCHAR(50),ELIGIBLE BOOL)
BEGIN
   INSERT INTO REFER VALUES(REFER_ID,DOCTOR_ID,PATIENT_ID,HOSPITAL);
   IF(ELIGIBLE IS TRUE)
   THEN
   UPDATE PERSON SET NEXT_DATE_FOR_DONATION = ADDDATE(CURRENT_DATE(),INTERVAL 2 YEAR) WHERE ID = PATIENT_ID;
   ELSE
   UPDATE PERSON SET ELIGIBLE = FALSE  WHERE ID = PATIENT_ID;
   END IF;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RETURN_PROCEDURE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `RETURN_PROCEDURE`(UNIT VARCHAR(10),BANK VARCHAR(10))
IF("SOLD" = (SELECT STATE FROM UNIT WHERE UNIT_ID = UNIT) AND (CURRENT_DATE<=(SELECT EXPIERY FROM UNIT WHERE UNIT_ID = UNIT)))
THEN
SELECT @BILL:=BILL_NO FROM UNIT WHERE UNIT_ID = UNIT;
INSERT INTO RET(BILL_NO,UNIT_ID) VALUES(@BILL,UNIT);
UPDATE UNIT SET BANK_ID = BANK WHERE UNIT_ID = UNIT;
END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELLING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `SELLING`(BILL VARCHAR(10),UNIT VARCHAR(10))
IF(("INSTOCK" = (SELECT STATE FROM UNIT WHERE UNIT_ID = UNIT)))
THEN
UPDATE UNIT SET BILL_NO = BILL WHERE UNIT_ID = UNIT;
UPDATE UNIT SET STATE = "SOLD" WHERE UNIT_ID = UNIT;
END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEPERATION_PROCEDURE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`HARISH`@`%` PROCEDURE `SEPERATION_PROCEDURE`(WHOLE_UNIT_ID VARCHAR(20))
IF(("INSTOCK" = (SELECT STATE FROM UNIT WHERE UNIT_ID = WHOLE_UNIT_ID)) AND ("WHOLE" = (SELECT CONTENT FROM UNIT WHERE UNIT_ID = WHOLE_UNIT_ID)))
  THEN
  SELECT @DONOR:=DONOR_ID FROM UNIT WHERE UNIT_ID = WHOLE_UNIT_ID;
  SELECT @BANKS:=BANK_ID FROM UNIT WHERE UNIT_ID = WHOLE_UNIT_ID;
  INSERT INTO UNIT(CONTENT,SEPERATED_FROM,DONOR_ID,BANK_ID) VALUES("PLASMA",WHOLE_UNIT_ID,@DONOR,@BANKS);
  INSERT INTO UNIT(CONTENT,SEPERATED_FROM,DONOR_ID,BANK_ID) VALUES("PLATE",WHOLE_UNIT_ID,@DONOR,@BANKS);
  INSERT INTO UNIT(CONTENT,SEPERATED_FROM,DONOR_ID,BANK_ID) VALUES("RED",WHOLE_UNIT_ID,@DONOR,@BANKS);
  UPDATE UNIT SET STATE = "SEPERATED" WHERE UNIT_ID = WHOLE_UNIT_ID;
  END IF ;;
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

-- Dump completed on 2021-04-20  0:14:42
