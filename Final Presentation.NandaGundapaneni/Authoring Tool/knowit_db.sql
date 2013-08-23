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
  `Location_History` text NOT NULL,
  `Location_longitude` text,
  `Location_latitude` text,
  `Media_id` int(5) default NULL,
  `Primary_Picture` text,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`Location_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Location_Details`
--

LOCK TABLES `Location_Details` WRITE;
/*!40000 ALTER TABLE `Location_Details` DISABLE KEYS */;
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
  `Location_id` int(5) default NULL,
  `Name` varchar(50) default NULL,
  `Description` blob,
  `Media_file_path` text,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `Location_id` (`Location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Location_Media`
--

LOCK TABLES `Location_Media` WRITE;
/*!40000 ALTER TABLE `Location_Media` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location_Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommended_Location`
--

DROP TABLE IF EXISTS `Recommended_Location`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Recommended_Location` (
  `uid` int(11) NOT NULL auto_increment,
  `Location_ID` int(5) NOT NULL,
  `Recommended_Location_id` int(3) NOT NULL,
  `CitationNeeded` tinyint(1) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `Location_ID` (`Location_ID`),
  KEY `Recommended_Location_id` (`Recommended_Location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Recommended_Location`
--

LOCK TABLES `Recommended_Location` WRITE;
/*!40000 ALTER TABLE `Recommended_Location` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Recommended_URL`
--

LOCK TABLES `Recommended_URL` WRITE;
/*!40000 ALTER TABLE `Recommended_URL` DISABLE KEYS */;
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

-- Dump completed on 2011-11-26 21:13:15
