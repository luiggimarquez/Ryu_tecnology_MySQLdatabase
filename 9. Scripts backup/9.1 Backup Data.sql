-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ryu_technology
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,'NCS-5000',2,5,3500,'CISCO','3',22,NULL),(2,'SWS14-24',1,25,1500,'SONICWALL','4',30,NULL),(3,'M1065',2,10,1000,'AXIS','1',1,NULL),(4,'FIREPOWER2100',1,50,2500,'CISCO','2',10,1),(5,'NSA6700',3,50,2500,'SONICWALL','2',15,2),(6,'8200-SERIES',1,10,1200,'CISCO','3',18,NULL),(7,'CATALYST-9500',2,25,1780,'CISCO','4',27,NULL),(8,'SWS12-10',5,25,1600,'SONICWALL','4',31,NULL),(9,'NCS-5000',1,5,3500,'CISCO','3',22,NULL),(10,'ISA3000',2,10,2500,'CISCO','2',12,NULL),(11,'8200-SERIES',3,10,1200,'CISCO','3',18,NULL),(12,'M1065',1,10,1000,'AXIS','1',1,NULL),(13,'SWS12-10',2,50,2500,'CISCO','2',10,NULL),(14,'8300-SERIES',3,10,2500,'CISCO','3',20,NULL),(15,'SWS14-24',4,25,1500,'CISCO','4',30,NULL);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_CARRITO` AFTER INSERT ON `carrito` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA (NOMBRE_ACCION , NOMBRE_TABLA , USUARIO,FECHA_EVENTO, HORA_EVENTO)
VALUES ( 'INSERT' , 'CARRITO' , CURRENT_USER() , NOW(), CURRENT_TIME());

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_CARRITO_UPDATE` BEFORE UPDATE ON `carrito` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA_CARRITO (ID_PRODUCTO, NOMBRE_PRODUCTO, CANTIDAD_PRODUCTO_OLD_NEW, NOMBRE_ACCION , NOMBRE_TABLA , USUARIO, FECHA_EVENTO, HORA_EVENTO)
VALUES(OLD.id_producto , OLD.NOMBRE , CONCAT('ANTERIOR: ', OLD.CANTIDAD_AGREGADA, ' - ', 'NUEVO: ' , NEW.CANTIDAD_AGREGADA ), 'UPDATE' , 'CARRITO' , CURRENT_USER(), NOW(), CURRENT_TIME());

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_CARRITO_DELETE` BEFORE DELETE ON `carrito` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA_CARRITO (ID_PRODUCTO, NOMBRE_PRODUCTO, CANTIDAD_PRODUCTO_OLD_NEW, NOMBRE_ACCION , NOMBRE_TABLA , USUARIO, FECHA_EVENTO, HORA_EVENTO)
VALUES(OLD.id_producto , OLD.NOMBRE, OLD.CANTIDAD_AGREGADA, 'DELETE' , 'CARRITO' , CURRENT_USER(), NOW(), CURRENT_TIME());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'CAMARA'),(2,'FIREWALL'),(3,'ROUTER'),(4,'SWITCH'),(5,'WIFI_EXTENDER');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,2,5,3500,'CISCO',3,1,22),(2,1,25,1500,'CISCO',4,2,30),(3,2,10,1000,'CISCO',1,3,1),(4,1,50,2500,'CISCO',2,4,10),(5,3,50,2500,'CISCO',2,5,15),(6,1,5,4000,'AXIS',1,6,38),(7,4,10,1750,'AXIS',1,7,34),(8,2,18,2750,'AXIS',1,8,36),(9,1,5,3500,'CISCO',3,9,22),(10,2,10,2500,'CISCO',2,10,12),(11,3,10,1200,'CISCO',3,11,18),(12,1,10,1000,'AXIS',1,12,1),(13,2,50,2500,'CISCO',2,13,10),(14,3,10,2500,'CISCO',3,14,20),(15,4,25,1500,'CISCO',4,15,30);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,'2022-08-01 00:00:00',1,'A1B2C3',12005678),(2,'2022-08-01 00:00:00',2,'A1B2C3',12005678),(3,'2022-08-01 00:00:00',3,'A1B2C3',12005678),(4,'2022-08-01 00:00:00',4,'A1B2C3',12005678),(5,'2022-08-01 00:00:00',5,'A1B2C3',12005678),(6,'2022-08-11 00:00:00',6,'XRZ111',45963741),(7,'2022-08-11 00:00:00',7,'XRZ111',45963741),(8,'2022-08-11 00:00:00',8,'XRZ111',45963741),(9,'2022-05-01 00:00:00',9,'XXZ121',15235678),(10,'2022-05-01 00:00:00',10,'22F55A',12345678),(11,'2022-05-01 00:00:00',11,'22F55A',12345678),(12,'2022-06-21 00:00:00',12,'WQ99KL',95930258),(13,'2022-06-21 00:00:00',13,'WQ99KL',95930258),(14,'2022-06-21 00:00:00',14,'WQ99KL',95930258),(15,'2022-06-21 00:00:00',15,'WQ99KL',95930258);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_auditoria_carrito`
--

LOCK TABLES `log_auditoria_carrito` WRITE;
/*!40000 ALTER TABLE `log_auditoria_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_auditoria_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_auditoria_producto`
--

LOCK TABLES `log_auditoria_producto` WRITE;
/*!40000 ALTER TABLE `log_auditoria_producto` DISABLE KEYS */;
INSERT INTO `log_auditoria_producto` VALUES (1,30,'SWS14-24','1500','DELETE','PRODUCTO','root@localhost','2022-09-03','01:37:04'),(2,31,'SWS12-10','1600','DELETE','PRODUCTO','root@localhost','2022-09-03','01:37:04'),(3,32,'SWS12-24','2500','DELETE','PRODUCTO','root@localhost','2022-09-03','01:37:04'),(4,33,'SWS12-48','2500','DELETE','PRODUCTO','root@localhost','2022-09-03','01:37:04');
/*!40000 ALTER TABLE `log_auditoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'M1065','AXIS','BULLET','1',1000,10,'/M1065.JPG',1),(2,'M1134','AXIS','BULLET','1',1200,20,'/M1134.JPG',1),(3,'M1137','AXIS','BULLET','1',900,15,'/M1137.JPG',1),(4,'P1375','AXIS','BULLET','1',1700,50,'/P1375.JPG',1),(5,'M3058','AXIS','BULLET','1',2000,2,'/MM3058.JPG',1),(6,'P3807','AXIS','PANORAMICA','1',1000,5,'/P3807.JPG',1),(7,'P3717\"','AXIS','BULLET','1',1000,10,'/P3717\".JPG',1),(8,'Q6100','AXIS','BULLET','1',1520,10,'/Q6100.JPG',1),(9,'FIREPOWER1000','CISCO','SMALLER BUSINESSES','2',2000,10,'/FIREPOWER1000.JPG',2),(10,'FIREPOWER2100','CISCO','SMALLER BUSINESSES','2',2500,50,'/FIREPOWER2100.JPG',2),(11,'FIREPOWER4100','CISCO','DATACENTER','2',3500,30,'/FIREPOWER4100.WEBP',2),(12,'ISA3000','CISCO','INDUSTRIAL','2',2500,10,'/ISA3000.WEBP',2),(13,'NSA2650','SONICWALL','SMALLER BUSINESSES','2',2500,20,'/NSA2650,JPG',2),(14,'NSA2700','SONICWALL','SMALLER BUSINESSES','2',2100,5,'/NSA2700.JPG',2),(15,'NSA6700','SONICWALL','DATACENTER','2',2500,50,'/NSA6700.JPG',2),(16,'NSA9650','SONICWALL','DATACENTER','2',2500,30,'/NSA9650.JPG',2),(17,'4000-SERIES','CISCO','BRANCH','3',1500,23,'/4000-SERIES.WEBP',3),(18,'8200-SERIES','CISCO','BRANCH','3',1200,10,'/8200-SERIES.WEBP',3),(19,'8200-UCPE','CISCO','BRANCH','3',3500,12,'/8200-UCPE.WEBP',3),(20,'8300-SERIES','CISCO','WAN-AGGREGATION','3',2500,50,'/8300-SERIES.WEBP',3),(21,'NCS-500','CISCO','WAN-AGGREGATION','3',3500,5,'/NCS-500.WEBP',3),(22,'NCS-5000','CISCO','WAN-AGGREGATION','3',3500,5,'/NCS-5000.WEBP',3),(23,'NCS-5500','CISCO','WAN-AGGREGATION','3',4500,55,'/NCS-5500.WEBP',3),(24,'NCS-5700','CISCO','WAN-AGGREGATION','3',3500,5,'/NCS-5700.JPG',3),(25,'CATALYST-9300','CISCO','CORE','4',1500,5,'/CATALYST-9300.JPG',4),(26,'CATALYST-9400','CISCO','CORE','4',1500,25,'/CATALYST-9400.JPG',4),(27,'CATALYST-9500','CISCO','CORE','4',1780,25,'/CATALYST-9500.JPG',4),(28,'CATALYST-9600','CISCO','CORE','4',1600,25,'/CATALYST-9600.JPG',4),(29,'SWS12-8','SONICWALL','LAN-ACCESS','4',2000,25,'/SWS12-8.JPG',4),(34,'M5525','AXIS','PTZ','1',1750,10,'/M5525.JPG',1),(35,'P5655','AXIS','PTZ','1',1550,15,'/P5655.JPG',1),(36,'Q6075','AXIS','PTZ','1',2750,18,'/Q6075.JPG',1),(37,'Q6315','AXIS','PTZ','1',3050,20,'/Q6315.JPG',1),(38,'P1290','AXIS','TERMICA','1',4000,5,'/P1290.JPG',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_PRODUCTO` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA (NOMBRE_ACCION , NOMBRE_TABLA , USUARIO,FECHA_EVENTO, HORA_EVENTO)
VALUES ( 'INSERT' , 'PRODUCTO' , CURRENT_USER() , NOW(), CURRENT_TIME());

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_PRODUCTO_UPDATE` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA_PRODUCTO (ID_PRODUCTO, NOMBRE_PRODUCTO_OLD_NEW, PRECIO_PRODUCTO_OLD_NEW, NOMBRE_ACCION , NOMBRE_TABLA , USUARIO, FECHA_EVENTO, HORA_EVENTO)
VALUES(OLD.id_producto ,CONCAT('ANTERIOR: ', OLD.NOMBRE, ' - ', 'NUEVO: ' , NEW.NOMBRE ), CONCAT('ANTERIOR: ', OLD.PRECIO, ' - ', 'NUEVO: ' , NEW.PRECIO ), 'UPDATE' , 'PRODUCTO' , CURRENT_USER(), NOW(), CURRENT_TIME());

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_PRODUCTO_DELETE` BEFORE DELETE ON `producto` FOR EACH ROW BEGIN
INSERT INTO LOG_AUDITORIA_PRODUCTO (ID_PRODUCTO, NOMBRE_PRODUCTO_OLD_NEW, PRECIO_PRODUCTO_OLD_NEW, NOMBRE_ACCION , NOMBRE_TABLA , USUARIO, FECHA_EVENTO, HORA_EVENTO)
VALUES(OLD.id_producto , OLD.NOMBRE, OLD.PRECIO, 'DELETE' , 'PRODUCTO' , CURRENT_USER(), NOW(), CURRENT_TIME());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10582469,'CONSTANZA','ALVAREZ','CONNY98PEACE@HOTMAIL.COM','OLLEROS 1598, TIERRA DE FUEGO',1156453952),(12005678,'NATALIA','CUNSELO','NATY_GIRL99@HOTMAIL.COM','CORDOBA 4523, CABA',1125123674),(12345000,'BARBARA','MATINEZ','BARBIEMARTI456@OUTLOOK.COM','BOLIVAR 999, CABA',1133309874),(12345678,'PEDRO','GARCIA','GARPE123@HOTMAIL.COM','CORRIENTES 523, ROSARIO',1145569874),(15235678,'LUIS','PEREZ','LPVZLA858@HOTMAIL.COM','LAPRIDA 415, AMBA',1173199874),(20587416,'JOSE','SUAREZ','JOSHEPFOY@OUTLOOK.COM','SANTA FE 523, CABA',1145569874),(23456781,'JOSE','RAMIREZ','JRAMI@OUTLOOK.COM','SANTA FE 253, CABA',1155698744),(34567812,'ALBERTO','SANCHEZ','SANAL88@YAHOO.COM','SAN MARTIN 2585, CORDOBA',1169874455),(45678123,'MARIA','FERNANDEZ','MFERNAN74@HOTMAIL.COM','MIGUEL ANGEL 523, CABA',1133569874),(45963741,'LUZ','SALLIS','LIGHTSAL@GMAIL.COM','VILLA DEL PARQUE 2589, CABA',1132657845),(95930258,'CATALINA','GARCIA','CATUSGAR98@GMAIL.COM','FLORIDA 852, MENDOZA',1198742274);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'FIREPOWER2100','CISCO',10),(2,'NSA6700','SONICWALL',15);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ryu_technology'
--

--
-- Dumping routines for database 'ryu_technology'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CONSULTA_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CONSULTA_MARCA`(MARCAS VARCHAR(20)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE CANTIDADES INT;
DECLARE ARTICULOS INT;
SELECT SUM(CANTIDAD) INTO CANTIDADES FROM PRODUCTO
WHERE MARCA = MARCAS ;
SELECT COUNT(NOMBRE) INTO ARTICULOS FROM PRODUCTO
WHERE MARCA = MARCAS ;
RETURN CONCAT('LA MARCA CONSULTADA: ', MARCAS,' TIENE DISPONIBLES: ', CANTIDADES, ' ARTICULOS, DISTRIBUIDOS ENTRE: ',ARTICULOS, ' ARTICULOS');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_IVA_POR_CATEGORIA_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_IVA_POR_CATEGORIA_COMPRA`(CATEGORY VARCHAR(20), IVA DECIMAL(4,2)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE CONSULTA_CATEGORIA INT;
DECLARE ARTICULOS INT;
DECLARE RESPUESTA INT;
SELECT ID_CATEGORIA INTO CONSULTA_CATEGORIA FROM CATEGORIA
WHERE NOMBRE_CATEGORIA = CATEGORY;
SELECT SUM(CANTIDAD_COMPRADA*PRECIO) INTO ARTICULOS FROM COMPRA
WHERE CATEGORIA = CONSULTA_CATEGORIA;
SET RESPUESTA = ARTICULOS*(IVA*0.01) + ARTICULOS;
RETURN RESPUESTA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_DELETE_PRODUCT_CATEGORY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_DELETE_PRODUCT_CATEGORY`(IN INSERT_OR_DELETE VARCHAR(7),IN CATEGORY_NAME VARCHAR(20))
PROC_LABEL:BEGIN 
	-- SE EJECUTA UN CONDICIONAL IF-ELSE PARA REALIZAR LA OPERACION, ESTO DEPENDE DE PARAMETRO DE ENTRADA INSERT_OR_DELETE

	IF UPPER(INSERT_OR_DELETE) LIKE 'INSERT' THEN
	SET @RESULT= CONCAT("INSERT INTO CATEGORIA(NOMBRE_CATEGORIA) VALUES ('" , CATEGORY_NAME, "')");
	-- SI TENEMOS UN INSERT, SE CUMPLE EL IF Y GUARDARMOS EN @RESULT LA CONCATENACI??N DE LA INSTRUCCION SQL PARA INSERTAR EL VALOR CON EL PARAMETRO CATEGORY_NAME
    
    ELSEIF UPPER(INSERT_OR_DELETE) = 'DELETE' THEN
    SET @RESULT= CONCAT("DELETE FROM CATEGORIA WHERE NOMBRE_CATEGORIA ='", CATEGORY_NAME,"'");
    -- SI TENEMOS UN DELETE, SE CUMPLE EL ELSEIF Y GUARDARMOS EN @RESULT LA CONCATENACI??N DE LA INSTRUCCION SQL PARA BORRAR EL VALOR CON EL PARAMETRO CATEGORY_NAME

	ELSE
	LEAVE PROC_LABEL;
    -- ESTADO NULO, SI NO SE CUMPLE IF O ELSEIF NOS SALIMOS DEL CONDICIONAL CON LEAVE

	END IF;
    SET SQL_SAFE_UPDATES = 0; -- DESHABILITAMOS EL MODO SEGURO DE ACTUALIZACIONES PARA EVITAR ERROR AL ACTUALIZAR/ BORRAR
	PREPARE MODIFICATION FROM @RESULT; -- SIRVE PARA PREPARAR UNA PREPARED STATEMENT PARA LA  APLICACI??N DARLE UN NOMBRE UN??VOCO  PARA RECUPERAR Y CONTROLAR LA SENTENCIA.
	EXECUTE MODIFICATION; -- SIRVE PARA INDICAR QU?? PREPARED STATEMENT SE QUIERE EJECUTAR, SE INTRODUCE EL NOMBRE GENERADO CON PREPARE
	DEALLOCATE PREPARE MODIFICATION; -- SE USA ARA ANULAR UNA PREPARED STATEMENT.
    SET SQL_SAFE_UPDATES = 1; -- ACTIVAMOS NUEVAMENTE EL MODO SEGURO DE ACTUALIZACIONES

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDENAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDENAR`(INOUT PARAMETRO_POR_ORDENAR VARCHAR(25),INOUT ORDEN_ASCENDENTE_DESCENDENTE VARCHAR(4))
BEGIN
SET @CATEGORY =  CONCAT('SELECT * FROM PRODUCTO ORDER BY',' ',PARAMETRO_POR_ORDENAR,' ',ORDEN_ASCENDENTE_DESCENDENTE);
/* SE ALMACENA EN @CATEGORY LA SENTENCIA CONCATENADA DONDE SELECCIONAMOS LA TABLA A ANALIZAR, EN ESTE CASO PRODUCTO CON LA SENTENCIA ORDEN BY DEL DESAF??O,
ESTOS VAN EN COMILLAS SIMPLES Y LUEGO, PARAMETRO_POR_ORDENAR ENTRE COMAS, SIN COMILLAS Y POR ??LTIMA, ORDEN_ASCENDENTE_DESCENDENTE, EL SEGUNDO PARAMETRO QUE INDICA EL ORDEN*/
PREPARE CONSULTA FROM @CATEGORY; -- SIRVE PARA PREPARAR UNA PREPARED STATEMENT PARA LA  APLICACI??N DARLE UN NOMBRE UN??VOCO  PARA RECUPERAR Y CONTROLAR LA SENTENCIA.
EXECUTE CONSULTA;  -- SIRVE PARA INDICAR QU?? PREPARED STATEMENT SE QUIERE EJECUTAR, SE INTRODUCE EL NOMBRE GENERADO CON PREPARE
DEALLOCATE PREPARE CONSULTA; -- SE USA PARA ANULAR UNA PREPARED STATEMENT.
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

-- Dump completed on 2022-09-03  1:41:59
