-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: coffee
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `adminID` int NOT NULL,
  `Fname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Hamad','Saad',3000),(2,'Nour','Ahmad',4000),(3,'Saud','Mohammed',2700),(4,'May','Saleh',3500),(5,'Ahmad','Ali',3200),(6,'Lena','Khaled',3700);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cach`
--

DROP TABLE IF EXISTS `cach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cach` (
  `currency` varchar(30) NOT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `orderID` int DEFAULT NULL,
  PRIMARY KEY (`currency`),
  KEY `orderID_idx` (`orderID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `orderID1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cach`
--

LOCK TABLES `cach` WRITE;
/*!40000 ALTER TABLE `cach` DISABLE KEYS */;
INSERT INTO `cach` VALUES ('BH','cash',3),('SR','cash',2),('US','cach',1);
/*!40000 ALTER TABLE `cach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coffee_beans`
--

DROP TABLE IF EXISTS `coffee_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coffee_beans` (
  `itemID` int NOT NULL,
  `beansType` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roasterName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`beansType`,`roasterName`,`itemID`),
  KEY `itemID_idx` (`itemID`),
  CONSTRAINT `itemID4` FOREIGN KEY (`itemID`) REFERENCES `storeitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coffee_beans`
--

LOCK TABLES `coffee_beans` WRITE;
/*!40000 ALTER TABLE `coffee_beans` DISABLE KEYS */;
INSERT INTO `coffee_beans` VALUES (2,'Brazil','soil'),(9,'Ethiopia','october'),(10,'Colombia','suwaa'),(11,'Ethiopia','chapter3'),(12,'Colombia','srn'),(13,'Ethiopia','camel step'),(29,'Arabic','Soil');
/*!40000 ALTER TABLE `coffee_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coffee_machines`
--

DROP TABLE IF EXISTS `coffee_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coffee_machines` (
  `itemID` int NOT NULL,
  `Brand` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MadeIn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `voltage` int DEFAULT NULL,
  PRIMARY KEY (`Brand`,`Color`,`itemID`),
  KEY `itemID_idx` (`itemID`),
  CONSTRAINT `itemID5` FOREIGN KEY (`itemID`) REFERENCES `storeitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coffee_machines`
--

LOCK TABLES `coffee_machines` WRITE;
/*!40000 ALTER TABLE `coffee_machines` DISABLE KEYS */;
INSERT INTO `coffee_machines` VALUES (14,'coco','silver','China',2,220),(15,'princess ','silver','US',3,110),(17,'Rocket','silver','China',4,220),(16,'sage','black','US',7,220),(3,'sage','silver','US',6,220),(18,'swan','white','France',2,110);
/*!40000 ALTER TABLE `coffee_machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlling`
--

DROP TABLE IF EXISTS `controlling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlling` (
  `adminID` int NOT NULL,
  `itemID` int NOT NULL,
  PRIMARY KEY (`adminID`,`itemID`),
  KEY `itemID3_idx` (`itemID`),
  CONSTRAINT `adminID3` FOREIGN KEY (`adminID`) REFERENCES `administrator` (`adminID`),
  CONSTRAINT `itemID3` FOREIGN KEY (`itemID`) REFERENCES `storeitems` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlling`
--

LOCK TABLES `controlling` WRITE;
/*!40000 ALTER TABLE `controlling` DISABLE KEYS */;
INSERT INTO `controlling` VALUES (5,2),(2,6),(4,7),(1,12),(3,15);
/*!40000 ALTER TABLE `controlling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `CVV` int NOT NULL,
  `orderID` int NOT NULL,
  `PaymentType` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CVV`,`PaymentType`,`orderID`),
  KEY `orderID_idx` (`orderID`),
  KEY `PaymentType_idx` (`PaymentType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (990,4,'Credit Card'),(560,5,'Credit Card'),(445,6,'Credit Card');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cups`
--

DROP TABLE IF EXISTS `cups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cups` (
  `itemID` int NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `itemID_idx` (`itemID`),
  CONSTRAINT `itemID` FOREIGN KEY (`itemID`) REFERENCES `storeitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cups`
--

LOCK TABLES `cups` WRITE;
/*!40000 ALTER TABLE `cups` DISABLE KEYS */;
INSERT INTO `cups` VALUES (1,'red'),(4,'blue'),(5,'white'),(6,'brown'),(7,'black'),(8,'ceramics');
/*!40000 ALTER TABLE `cups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Customer_Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AdminID` int DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `AdminID_idx` (`AdminID`),
  CONSTRAINT `AdminID` FOREIGN KEY (`AdminID`) REFERENCES `administrator` (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Manar','Alsayed@gmail.com','manar123',1),(2,'Abrar','abrar@hotmail.com','abrar123',3),(3,'Haifa','haifa@hotmail.com','haifa123',4),(4,'Bushra','bushra@outlook.com','bushra123',5),(5,'Nouf','nouf@gmail.com','nouf123',6),(6,'Sara','sara@outlook.com','sara123',2),(8,'Ahmad','Ahmad@xyz.com','Ahmad123',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `ItemID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `itemID1_idx` (`ItemID`),
  KEY `order_items_ibfk_2` (`orderID`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `storeitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,2),(2,1,14,2),(3,2,11,1),(4,2,14,1),(5,2,15,1),(6,3,2,1),(8,5,2,1),(9,6,14,1),(10,6,15,1),(11,7,29,2),(12,8,9,47),(13,8,11,28),(14,9,9,30);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustID` int NOT NULL,
  `bill` double DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustID_idx` (`CustID`),
  CONSTRAINT `CustID` FOREIGN KEY (`CustID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Credit Card',1,940.8),(2,'Credit Card',1,1423.2),(3,'Cash',1,88),(5,'Cash',1,88),(6,'Credit Card',8,1360),(7,'Cash',5,100),(8,'Credit Card',5,3461.6),(9,'Credit Card',5,1080);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeitems`
--

DROP TABLE IF EXISTS `storeitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeitems` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantityAvailable` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  UNIQUE KEY `idstoreItems_UNIQUE` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeitems`
--

LOCK TABLES `storeitems` WRITE;
/*!40000 ALTER TABLE `storeitems` DISABLE KEYS */;
INSERT INTO `storeitems` VALUES (1,'red cup','cups',80,20),(2,'Fazenda','Beans',88,80),(3,'Barista express','machine',1899,5),(4,'blue cup','cups',40,15),(5,'white cup','cups',50,25),(6,'brown cup','cups',35,40),(7,'black cup','cups',10,60),(8,'ceramics cup','cups',20,50),(9,'Chaila','Beans',45,30),(10,'Aponte','Beans',66,150),(11,'Gedeb','Beans',79,90),(12,'huila','Beans',130,10),(13,'gaid','Beans',88,4),(14,'express coffee','machine',500,20),(15,'expresso 249412','machine',1200,10),(16,'barista pro','machine',3500,11),(17,'Rocket expresso','machine',1000,20),(18,'nordic','machine',800,30),(19,'chocolate syrup','syrup',50,20),(20,'gingerbread syrup','syrup',70,15),(21,'hazelnut syrup','syrup',100,30),(22,'vanilla syrup','syrup',60,50),(23,'caramel syrup','syrup',80,45),(24,'amaretto syrup','syrup',44,60),(29,'Arabica','Beans',50,20);
/*!40000 ALTER TABLE `storeitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syrups`
--

DROP TABLE IF EXISTS `syrups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syrups` (
  `itemID` int NOT NULL,
  `flavor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ItemID_UNIQUE` (`itemID`),
  CONSTRAINT `itemID1` FOREIGN KEY (`itemID`) REFERENCES `storeitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syrups`
--

LOCK TABLES `syrups` WRITE;
/*!40000 ALTER TABLE `syrups` DISABLE KEYS */;
INSERT INTO `syrups` VALUES (19,'chocolate'),(20,'gingerbread'),(21,'hazelnut'),(22,'vanilla'),(23,'caramel'),(24,'amaretto');
/*!40000 ALTER TABLE `syrups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07  1:00:03
