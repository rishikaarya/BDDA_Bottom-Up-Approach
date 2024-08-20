-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Groceries'),(2,'Personal Care');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Invoices`
--

DROP TABLE IF EXISTS `Customer_Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Invoices` (
  `customer_invoice_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_invoice_id`),
  KEY `customer_id` (`customer_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `Customer_Invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  CONSTRAINT `Customer_Invoices_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Invoices`
--

LOCK TABLES `Customer_Invoices` WRITE;
/*!40000 ALTER TABLE `Customer_Invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'John Doe','john@example.com','123 Main St, Springfield, IL');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discounts`
--

DROP TABLE IF EXISTS `Discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discounts` (
  `discount_id` int NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_rate` decimal(5,2) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discounts`
--

LOCK TABLES `Discounts` WRITE;
/*!40000 ALTER TABLE `Discounts` DISABLE KEYS */;
INSERT INTO `Discounts` VALUES (1,'New Year Discount',10.00,'Percentage');
/*!40000 ALTER TABLE `Discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_Discounts`
--

DROP TABLE IF EXISTS `Invoice_Discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice_Discounts` (
  `invoice_discount_id` int NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`invoice_discount_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `Invoice_Discounts_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`),
  CONSTRAINT `Invoice_Discounts_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `Discounts` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_Discounts`
--

LOCK TABLES `Invoice_Discounts` WRITE;
/*!40000 ALTER TABLE `Invoice_Discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice_Discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_Items`
--

DROP TABLE IF EXISTS `Invoice_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice_Items` (
  `invoice_item_id` int NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `Invoice_Items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`),
  CONSTRAINT `Invoice_Items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_Items`
--

LOCK TABLES `Invoice_Items` WRITE;
/*!40000 ALTER TABLE `Invoice_Items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_Payments`
--

DROP TABLE IF EXISTS `Invoice_Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice_Payments` (
  `invoice_payment_id` int NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`invoice_payment_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `payment_method_id` (`payment_method_id`),
  CONSTRAINT `Invoice_Payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`),
  CONSTRAINT `Invoice_Payments_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `Payment_Methods` (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_Payments`
--

LOCK TABLES `Invoice_Payments` WRITE;
/*!40000 ALTER TABLE `Invoice_Payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice_Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoices` (
  `invoice_id` int NOT NULL,
  `invoice_date` date NOT NULL,
  `party` varchar(100) NOT NULL,
  `net_amount` decimal(10,2) NOT NULL,
  `username` varchar(50) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_Methods`
--

DROP TABLE IF EXISTS `Payment_Methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment_Methods` (
  `payment_method_id` int NOT NULL,
  `method_name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_Methods`
--

LOCK TABLES `Payment_Methods` WRITE;
/*!40000 ALTER TABLE `Payment_Methods` DISABLE KEYS */;
INSERT INTO `Payment_Methods` VALUES (1,'Cash'),(2,'Credit Card');
/*!40000 ALTER TABLE `Payment_Methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Discounts`
--

DROP TABLE IF EXISTS `Product_Discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Discounts` (
  `product_discount_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `Product_Discounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
  CONSTRAINT `Product_Discounts_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `Discounts` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Discounts`
--

LOCK TABLES `Product_Discounts` WRITE;
/*!40000 ALTER TABLE `Product_Discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_Discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Taxes`
--

DROP TABLE IF EXISTS `Product_Taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Taxes` (
  `product_tax_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  PRIMARY KEY (`product_tax_id`),
  KEY `product_id` (`product_id`),
  KEY `tax_id` (`tax_id`),
  CONSTRAINT `Product_Taxes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
  CONSTRAINT `Product_Taxes_ibfk_2` FOREIGN KEY (`tax_id`) REFERENCES `Taxes` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Taxes`
--

LOCK TABLES `Product_Taxes` WRITE;
/*!40000 ALTER TABLE `Product_Taxes` DISABLE KEYS */;
INSERT INTO `Product_Taxes` VALUES (1,1,1);
/*!40000 ALTER TABLE `Product_Taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  `mrp` decimal(10,2) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'FRUIT BISQUITS 400',1,170.00,150.00),(2,'HAIR SPA SHAMPOO',2,700.00,650.00);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Savings`
--

DROP TABLE IF EXISTS `Savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Savings` (
  `invoice_id` int DEFAULT NULL,
  `total_savings` decimal(10,2) NOT NULL,
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `Savings_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Savings`
--

LOCK TABLES `Savings` WRITE;
/*!40000 ALTER TABLE `Savings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxes`
--

DROP TABLE IF EXISTS `Taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taxes` (
  `tax_id` int NOT NULL,
  `tax_name` varchar(100) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxes`
--

LOCK TABLES `Taxes` WRITE;
/*!40000 ALTER TABLE `Taxes` DISABLE KEYS */;
INSERT INTO `Taxes` VALUES (1,'GST',18.00);
/*!40000 ALTER TABLE `Taxes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-17 10:49:13
