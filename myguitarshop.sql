-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: myguitarshop
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Phone` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'ravi','Thapa','9854123675'),(2,'Pemba','Sherpa','9842658762'),(3,'David','Gurung','9865236545'),(4,'Abishek','Pandey','9801254564'),(5,'Kripal','Karki','9814523654'),(6,'rajan','magar','9854003675'),(7,'mainsh','thapa','9802658745');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guitar`
--

DROP TABLE IF EXISTS `guitar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guitar` (
  `InstrumentID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Genre` int(11) NOT NULL,
  `Product` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`InstrumentID`),
  KEY `Genre` (`Genre`),
  CONSTRAINT `guitar_ibfk_1` FOREIGN KEY (`Genre`) REFERENCES `guitargenre` (`GenreID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guitar`
--

LOCK TABLES `guitar` WRITE;
/*!40000 ALTER TABLE `guitar` DISABLE KEYS */;
INSERT INTO `guitar` VALUES (1,'Fender',2,'Tuner',10000),(2,'Gibson',5,'Capo',20000),(3,'Yamaha',3,'Guitar String',15000),(4,'Epiphone',4,'Guitar Pick',30000),(5,'Ibanez',1,'Guitar Strap',40000);
/*!40000 ALTER TABLE `guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guitargenre`
--

DROP TABLE IF EXISTS `guitargenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guitargenre` (
  `GenreID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guitargenre`
--

LOCK TABLES `guitargenre` WRITE;
/*!40000 ALTER TABLE `guitargenre` DISABLE KEYS */;
INSERT INTO `guitargenre` VALUES (1,'Electric Guitar'),(2,'Acoustic Guitar'),(3,'Classical Guitar'),(4,'Twelve String Guitar'),(5,'Touch Guitar');
/*!40000 ALTER TABLE `guitargenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Instrument` int(11) NOT NULL,
  `Client` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Instrument` (`Instrument`),
  KEY `Client` (`Client`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Instrument`) REFERENCES `guitar` (`InstrumentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Client`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2017-05-15'),(2,5,3,'2018-07-18'),(3,2,4,'2018-12-19'),(4,3,2,'2019-01-20'),(5,4,5,'2019-03-01'),(6,1,1,'2016-05-25'),(7,5,3,'2017-01-10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesreport`
--

DROP TABLE IF EXISTS `salesreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesreport` (
  `Paid` varchar(10) DEFAULT NULL,
  `ReportDate` date NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  KEY `OrderNumber` (`OrderNumber`),
  CONSTRAINT `salesreport_ibfk_1` FOREIGN KEY (`OrderNumber`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesreport`
--

LOCK TABLES `salesreport` WRITE;
/*!40000 ALTER TABLE `salesreport` DISABLE KEYS */;
INSERT INTO `salesreport` VALUES ('Yes','2017-05-18',1),('No','2018-08-13',2),('Yes','2019-01-02',3),('Yes','2019-01-30',4),('No','2019-03-06',5),('Yes','2016-06-28',6),('No','2017-02-15',7);
/*!40000 ALTER TABLE `salesreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-22 13:02:52
