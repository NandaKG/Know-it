-- MySQL dump 10.11
--
-- Host: localhost    Database: ngundap
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Table structure for table `Location_Details`
--

DROP TABLE IF EXISTS `Location_Details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Location_Details` (
  `Location_ID` int(11) NOT NULL auto_increment,
  `Location_Name` varchar(255) NOT NULL,
  `Location_History` blob,
  `Location_longitude` text,
  `Location_latitude` text,
  `Media_type` varchar(20) default NULL,
  `Primary_Picture` text,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`Location_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Location_Details`
--

LOCK TABLES `Location_Details` WRITE;
/*!40000 ALTER TABLE `Location_Details` DISABLE KEYS */;
INSERT INTO `Location_Details` VALUES (53,'MCADAMS HALL','McAdams Hall, completed in 1960, named for William Newton McAdams, Class of 1938, is headquarters for Biosystems Engineering and Computer Science. Many of the agricultural mechanization classes are also held in the building. McAdams also is home to the campus weather station. The latest renovation to McAdams was completed in the fall of 2004. The original building was completed in 1950 and previously renovated in 1974.','34.675729','-82.834446','image/jpeg','primary/image/28ee1-McAdams.jpg',0),(55,'Daniel Hall','Daniel Hall is a classroom building named for David Wistar Daniel, professor of English, 1898-1947. The building was completed in 1968 and is now home to classes in a wide variety of subject areas (English, foreign language, mathematics, chemistry, speech, history, etc.) There is one main auditorium and 5 floors of classrooms. The latest addition was completed in spring 2004 - a new speech and communications lab. This building was built prior to a large number of female students attending the university, thus there are female bathrooms located only on every other floor. The building is connected to Strode Tower and Kinard Laboratory of Physics in the middle of campus.','34.677582','-82.835069','image/jpeg','primary/image/b386a-Daniel_Exterior1.jpg',0),(57,'Brackett Hall','1951 (addition, 1966; renovation, 1992)\r\nRichard Newman Brackett, Professor of Chemistry (1891–1937)\r\nHouses the Political Science, Psychology, and Sociology departments.\r\n\r\n','34.679144','-82.836716',NULL,NULL,0);
/*!40000 ALTER TABLE `Location_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location_Media`
--

DROP TABLE IF EXISTS `Location_Media`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Location_Media` (
  `uid` int(11) NOT NULL auto_increment,
  `Media_type` varchar(30) default NULL,
  `Location_id` int(11) default NULL,
  `Name` varchar(50) default NULL,
  `Description` blob,
  `Media_file_path` text,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `Location_id` (`Location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Location_Media`
--

LOCK TABLES `Location_Media` WRITE;
/*!40000 ALTER TABLE `Location_Media` DISABLE KEYS */;
INSERT INTO `Location_Media` VALUES (42,'video/mp4',53,'MCADAMS','','upload/video/ed76a-McAdams Hall.mp4',1),(41,'video/quicktime',53,'movie','','upload/video/d3459-IMG_0080.MOV',1),(34,'image/jpeg',53,'Back View','MCAMS BACK VIEW','upload/image/28ee1-McAdams.jpg',1),(35,'image/jpeg',53,'SIDE ENTRANCE','','upload/image/a695f-Old_McAdams.jpg',1),(43,'image/jpeg',57,'Back','','upload/image/b29d5-800px-BrackettBack.jpg',1),(39,'image/jpeg',55,'Front View','','upload/image/ddae7-Daniel.jpg',1),(40,'image/jpeg',55,'SIDE VIEW','','upload/image/b386a-Daniel_Exterior1.jpg',1);
/*!40000 ALTER TABLE `Location_Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRCodes`
--

DROP TABLE IF EXISTS `QRCodes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `QRCodes` (
  `Code_ID` int(11) NOT NULL auto_increment,
  `Location_ID` int(11) NOT NULL,
  `Location_Name` varchar(255) default NULL,
  PRIMARY KEY  (`Code_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `QRCodes`
--

LOCK TABLES `QRCodes` WRITE;
/*!40000 ALTER TABLE `QRCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommended_Location`
--

DROP TABLE IF EXISTS `Recommended_Location`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Recommended_Location` (
  `uid` int(11) NOT NULL auto_increment,
  `Location_ID` int(11) default NULL,
  `Recommended_Location_id` int(11) default NULL,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `Location_ID` (`Location_ID`),
  KEY `Recommended_Location_id` (`Recommended_Location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Recommended_Location`
--

LOCK TABLES `Recommended_Location` WRITE;
/*!40000 ALTER TABLE `Recommended_Location` DISABLE KEYS */;
INSERT INTO `Recommended_Location` VALUES (9,53,55,0),(10,55,53,0),(11,53,57,0);
/*!40000 ALTER TABLE `Recommended_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommended_URL`
--

DROP TABLE IF EXISTS `Recommended_URL`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Recommended_URL` (
  `uid` int(11) NOT NULL auto_increment,
  `Location_ID` int(11) default NULL,
  `URL` text,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Recommended_URL`
--

LOCK TABLES `Recommended_URL` WRITE;
/*!40000 ALTER TABLE `Recommended_URL` DISABLE KEYS */;
INSERT INTO `Recommended_URL` VALUES (3,48,'http://www.clemsonwiki.com/wiki/Daniel_Hall',0);
/*!40000 ALTER TABLE `Recommended_URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserList`
--

DROP TABLE IF EXISTS `UserList`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `UserList` (
  `uid` int(11) NOT NULL auto_increment,
  `User_Name` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `UserList`
--

LOCK TABLES `UserList` WRITE;
/*!40000 ALTER TABLE `UserList` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserList` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-15 18:32:02
