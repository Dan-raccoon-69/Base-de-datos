-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `camposimportantes`
--

DROP TABLE IF EXISTS `camposimportantes`;
/*!50001 DROP VIEW IF EXISTS `camposimportantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `camposimportantes` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `precioProducto`,
 1 AS `codigoSerial`,
 1 AS `nombreCategoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bebidas'),(2,'Bebidas'),(3,'Detergentes'),(4,'Galletas'),(5,'Chocolates'),(6,'Frituras');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigobarras`
--

DROP TABLE IF EXISTS `codigobarras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigobarras` (
  `idCodigoBarras` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `serie` varchar(30) NOT NULL,
  PRIMARY KEY (`idCodigoBarras`),
  KEY `fk_id_producto` (`idProducto`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigobarras`
--

LOCK TABLES `codigobarras` WRITE;
/*!40000 ALTER TABLE `codigobarras` DISABLE KEYS */;
INSERT INTO `codigobarras` VALUES (1,3,'ahdfbns'),(2,4,'ajkncvi'),(3,5,'pfnsuau'),(4,6,'uyrbduw'),(5,1,'asldhve'),(6,2,'ncvatey'),(7,7,'vcjkasyq');
/*!40000 ALTER TABLE `codigobarras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fechaVenta` date NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_id_Categoria` (`idCategoria`),
  CONSTRAINT `fk_id_Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Coca Cola',20.00,'2000-05-31'),(2,1,'Coca Cola',20.00,'2000-05-31'),(3,1,'Pepsi',18.00,'2000-07-14'),(4,3,'Clorox',30.00,'2005-02-03'),(5,4,'Trikitrakatelas',17.00,'2003-10-10'),(6,5,'Kiss',40.00,'2010-02-14'),(7,6,'Doritos',17.00,'2003-05-31');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista3_tablas`
--

DROP TABLE IF EXISTS `vista3_tablas`;
/*!50001 DROP VIEW IF EXISTS `vista3_tablas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista3_tablas` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `codigoSerial`,
 1 AS `nombreCategoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `camposimportantes`
--

/*!50001 DROP VIEW IF EXISTS `camposimportantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `camposimportantes` AS select `p`.`nombre` AS `nombreProducto`,`p`.`precio` AS `precioProducto`,`cb`.`serie` AS `codigoSerial`,`c`.`nombre` AS `nombreCategoria` from ((`producto` `p` join `codigobarras` `cb` on((`p`.`idProducto` = `cb`.`idProducto`))) join `categoria` `c` on((`c`.`idCategoria` = `p`.`idCategoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista3_tablas`
--

/*!50001 DROP VIEW IF EXISTS `vista3_tablas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista3_tablas` AS select `p`.`nombre` AS `nombreProducto`,`cb`.`serie` AS `codigoSerial`,`c`.`nombre` AS `nombreCategoria` from ((`producto` `p` join `codigobarras` `cb` on((`p`.`idProducto` = `cb`.`idProducto`))) join `categoria` `c` on((`c`.`idCategoria` = `p`.`idCategoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-07 16:15:16
