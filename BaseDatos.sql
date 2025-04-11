<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ferresoluciones
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `carritoID` int(11) NOT NULL AUTO_INCREMENT,
  `productoID` int(11) DEFAULT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `cantidadDeseada` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`carritoID`),
  KEY `productoID` (`productoID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (7,1,2,3,'2025-04-09 09:03:44');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Herramientas manuales'),(2,'Materiales de construcción'),(3,'Tornillería y fijación'),(4,'Pinturas y acabados'),(5,'Electricidad'),(6,'Plomería'),(7,'Equipos de protección personal'),(8,'Ferretería general');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clienteID` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estadoID` int(11) NOT NULL,
  `rolID` int(11) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `otrasSenas` varchar(200) DEFAULT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`clienteID`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `estadoID` (`estadoID`),
  KEY `rolID` (`rolID`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`estadoID`) REFERENCES `estados` (`estadoID`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`rolID`) REFERENCES `roles` (`rolID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'101010101','Sebastian ','Castro','Alfaro','1234pass',1,1,'2025-04-06 14:55:09','Alajuela','10101','carlos@example.com','8888-8888'),(2,'888888889','Juan','Castro','Perez','1234pa',1,1,'2025-04-06 14:55:09','Guanacaste','10101','juan@example.com','9999-9999'),(3,'99999999','Luis','Marin','Castro','12345pass',1,2,'2025-04-06 14:55:09','San Jose','10101','luis@example.com','1111-1111'),(4,'1111111','Marta','Gomez','Lopez','12345pass',1,2,'2025-04-06 14:55:09','Puntarenas','10101','marta@example.com','2222-2222'),(5,'44444444','Arturo','Alfaro','Lopez','1234passs',1,2,'2025-04-08 19:50:14','Heredia','101011','arturo@example.com','555555555'),(8,'5555555','Norberto','Alfaro','Lopez','1234pass',1,2,'2025-04-08 19:52:19','Limon','101011','norberto@example.com','66666666');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `consultaID` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`consultaID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `detalleID` int(11) NOT NULL AUTO_INCREMENT,
  `maestroID` int(11) DEFAULT NULL,
  `productoID` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`detalleID`),
  KEY `maestroID` (`maestroID`),
  KEY `productoID` (`productoID`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`maestroID`) REFERENCES `maestro` (`maestroID`),
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `estadoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(25) NOT NULL,
  PRIMARY KEY (`estadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestro` (
  `maestroID` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`maestroID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `maestro_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodospago`
--

DROP TABLE IF EXISTS `metodospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodospago` (
  `metodoPagoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`metodoPagoID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodospago`
--

LOCK TABLES `metodospago` WRITE;
/*!40000 ALTER TABLE `metodospago` DISABLE KEYS */;
INSERT INTO `metodospago` VALUES (1,'Efectivo'),(2,'Tarjeta de crédito'),(3,'Transferencia bancaria');
/*!40000 ALTER TABLE `metodospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `productoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `categoriaID` int(11) NOT NULL,
  PRIMARY KEY (`productoID`),
  KEY `categoriaID` (`categoriaID`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Martillo',12000.00,15,'/FerreSoluciones/View/images/Productos/Martillo.jpeg',3),(2,'Tornillos',2000.00,4,'/FerreSoluciones/View/images/Productos/Tornillos.jpeg',3),(3,'Cemento',150000.00,15,'/FerreSoluciones/View/images/Productos/cemento.jpeg',2),(4,'Tomacorriente',2500.00,4,'/FerreSoluciones/View/images/Productos/toma.jpg',5),(5,'Llave de paso 1/4',5000.00,2,'/FerreSoluciones/View/images/Productos/paso.jpeg',6),(6,'Lamina de Zinc',7900.00,16,'/FerreSoluciones/View/images/Productos/lamina.jpeg',2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedorID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estadoID` int(11) DEFAULT 1,
  `fechaRegistro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`proveedorID`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Amanco S.A.','3101101111','luisventas@amco.com','8888-1234','San José, Costa Rica',1,'2025-04-09 09:23:43'),(2,'Durman','3102456789','ventas@durman.com','2450-7081','Coyol, ZF Propark',1,'2025-04-09 09:53:33');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(25) NOT NULL,
  PRIMARY KEY (`rolID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ferresoluciones'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCliente`(
    IN pClienteID INT,
    IN pCedula VARCHAR(15),
    IN pNombre VARCHAR(50),
    IN pApellido1 VARCHAR(50),
    IN pApellido2 VARCHAR(50),
    IN pRolID INT,
    IN pCodigoPostal VARCHAR(10),
    IN pCorreo VARCHAR(50),
    IN pTelefono VARCHAR(15)
)
BEGIN
    UPDATE Clientes
    SET
        cedula = pCedula,
        nombre = pNombre,
        apellido1 = pApellido1,
        apellido2 = pApellido2,
        rolID = pRolID,
        codigoPostal = pCodigoPostal,
        correo = pCorreo,
        telefono = pTelefono
    WHERE clienteID = pClienteID;
=======
CREATE DATABASE IF NOT EXISTS ferresoluciones CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ferresoluciones;

-- =========================
-- TABLA: categorias
-- =========================
CREATE TABLE categorias (
    categoriaID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO categorias (nombre) VALUES
('Herramientas manuales'),
('Materiales de construcción'),

('Tornillería y fijación'),
('Pinturas y acabados'),
('Electricidad'),
('Plomería'),
('Equipos de protección personal'),
('Ferretería general');

-- =========================
-- TABLA: productos
-- =========================
CREATE TABLE productos (
    productoID INT AUTO_INCREMENT PRIMARY KEY,	
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    imagen VARCHAR(1000) NOT NULL,
    categoriaID INT NOT NULL,
    FOREIGN KEY (categoriaID) REFERENCES categorias(categoriaID)
);

INSERT INTO productos (nombre, precio, cantidad, imagen, categoriaID) VALUES
('Martillo de carpintero', 3500.00, 20, '/img/martillo.jpg', 1),
('Caja de tornillos 1/4', 1500.00, 100, '/img/tornillos.jpg', 3),
('Brocha 3 pulgadas', 800.00, 50, '/img/brocha.jpg', 4),
('Pintura acrílica blanca 1 galón', 8500.00, 30, '/img/pintura.jpg', 4),
('Casco de seguridad', 6000.00, 15, '/img/casco.jpg', 7);

-- =========================
-- TABLA: roles
-- =========================
CREATE TABLE roles (
    rolID INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(25) NOT NULL
);

INSERT INTO roles (nombreRol) VALUES
('Administrador'), ('Cliente');

-- =========================
-- TABLA: estados
-- =========================
CREATE TABLE estados (
    estadoID INT AUTO_INCREMENT PRIMARY KEY,
    nombreEstado VARCHAR(25) NOT NULL
);

INSERT INTO estados (nombreEstado) VALUES
('Activo'), ('Inactivo');

-- =========================
-- TABLA: clientes (sin provincia)
-- =========================
CREATE TABLE clientes (
    clienteID INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    estadoID INT NOT NULL,
    rolID INT NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    otrasSenas VARCHAR(200),
    codigoPostal VARCHAR(10),
    correo VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL UNIQUE,
    FOREIGN KEY (estadoID) REFERENCES estados(estadoID),
    FOREIGN KEY (rolID) REFERENCES roles(rolID)
);

-- =========================
-- TABLA: carrito
-- =========================
CREATE TABLE carrito (
    carritoID INT AUTO_INCREMENT PRIMARY KEY,
    productoID INT,
    clienteID INT,
    cantidadDeseada INT,
    fecha DATETIME,
    FOREIGN KEY (productoID) REFERENCES productos(productoID),
    FOREIGN KEY (clienteID) REFERENCES clientes(clienteID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================
-- TABLA: maestro (factura)
-- =========================
CREATE TABLE maestro (
    maestroID INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    clienteID INT,
    total DECIMAL(18,2),
    FOREIGN KEY (clienteID) REFERENCES clientes(clienteID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================
-- TABLA: detalle (detalle de factura)
-- =========================
CREATE TABLE detalle (
    detalleID INT AUTO_INCREMENT PRIMARY KEY,
    maestroID INT,
    productoID INT,
    cantidad INT,
    precio DECIMAL(18,2),
    total DECIMAL(18,2),
    FOREIGN KEY (maestroID) REFERENCES maestro(maestroID),
    FOREIGN KEY (productoID) REFERENCES productos(productoID)
);

-- =========================
-- TABLA: consultas/sugerencias
-- =========================
CREATE TABLE consultas (
    consultaID INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(500) NOT NULL,
    clienteID INT,
    nombreCliente VARCHAR(100),
    FOREIGN KEY (clienteID) REFERENCES clientes(clienteID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================
-- TABLA: metodos de pago
-- =========================
CREATE TABLE metodospago (
    metodoPagoID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO metodospago (nombre) VALUES
('Efectivo'), ('Tarjeta de crédito'), ('Transferencia bancaria');

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto`(
    IN pProductoID INT,
    IN pNombre VARCHAR(100),
    IN pPrecio DECIMAL(10,2),
    IN pCantidad INT,
    IN pImagen VARCHAR(1000),
    IN pCategoriaID INT
)
BEGIN
    UPDATE articulos
    SET 
        nombre = pNombre,
        precio = pPrecio,
        cantidad = pCantidad,
        imagen = CASE WHEN pImagen = '' THEN imagen ELSE pImagen END,
        categoriaID = pCategoriaID
    WHERE articuloID = pProductoID;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarContrasena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContrasena`(pClienteID VARCHAR(9),
																	pCodigo varchar(10))
BEGIN

	UPDATE 	ferresoluciones.clientes
    SET 	Contrasena = pCodigo
    WHERE	clienteID = pClienteID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPerfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPerfil`(
    pClienteID INT(11),
    pCedula VARCHAR(9),
    pNombre VARCHAR(50),
    pApellido1 VARCHAR(50),
    pApellido2 VARCHAR(50),
    pRolID INT(11),
    pProvinciaID INT(11),
    pOtrasSenas VARCHAR(200),
    pCodigoPostal VARCHAR(10),
    pCorreo VARCHAR(50),
    pTelefono VARCHAR(15)
)
BEGIN
    UPDATE ferresoluciones.Clientes
    SET 
        Cedula = pCedula,
        Nombre = pNombre,
        Apellido1 = pApellido1,
        Apellido2 = pApellido2,
        RolID = CASE WHEN pRolID != 0 THEN pRolID ELSE RolID END,
        ProvinciaID = pProvinciaID,
        OtrasSenas = pOtrasSenas,
        CodigoPostal = pCodigoPostal,
        Correo = pCorreo,
        Telefono = pTelefono
    WHERE ClienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto`(
    IN pProductoID INT,
    IN pNombre VARCHAR(100),
    IN pPrecio DECIMAL(10,2),
    IN pCantidad INT,
    IN pImagen VARCHAR(1000),
    IN pCategoriaID INT
)
BEGIN
    UPDATE productos
    SET 
        nombre = pNombre,
        precio = pPrecio,
        cantidad = pCantidad,
        imagen = CASE WHEN pImagen = '' THEN imagen ELSE pImagen END,
        categoriaID = pCategoriaID
    WHERE ProductoID = pProductoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProveedor`(
    IN pProveedorID INT,
    IN pNombre VARCHAR(100),
    IN pCedula VARCHAR(20),
    IN pCorreo VARCHAR(100),
    IN pTelefono VARCHAR(20),
    IN pDireccion VARCHAR(200)
)
BEGIN
    UPDATE proveedores
    SET 
        nombre = pNombre,
        cedula = pCedula,
        correo = pCorreo,
        telefono = pTelefono,
        direccion = pDireccion
    WHERE proveedorID = pProveedorID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
=======
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 DROP PROCEDURE IF EXISTS `CambiarEstadoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CambiarEstadoCliente`(pClienteID INT)
BEGIN
    UPDATE ferresoluciones.clientes
    SET estadoID = CASE 
                       WHEN estadoID = 1 THEN 2  
                       ELSE 1                   
                   END
    WHERE clienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
=======
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProducto`(
    IN pProductoID INT
)
BEGIN
    SELECT 
        articuloID, 
        nombre, 
        precio, 
        cantidad, 
        imagen, 
        categoriaID
    FROM articulos
    WHERE articuloID = pProductoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProductos`()
BEGIN
    SELECT 
        A.articuloID, 
        A.nombre, 
        A.precio, 
        A.cantidad, 
        A.imagen, 
        A.categoriaID,
        C.nombre AS nombreCategoria
    FROM articulos A
    INNER JOIN categorias C 
        ON A.categoriaID = C.categoriaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCarrito`(pClienteID int)
BEGIN

SELECT 
    C.carritoID,
<<<<<<< HEAD
    C.productoID,
=======
    C.articuloID,
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    A.nombre,
    IFNULL(C.cantidadDeseada, 0) `cantidadDeseada`,
    IFNULL(A.precio, 0) `totalUnitario`,
    IFNULL(C.cantidadDeseada * A.precio, 0) `total`
FROM ferresoluciones.carrito C
<<<<<<< HEAD
INNER JOIN ferresoluciones.productos A ON C.productoID = A.productoID
=======
INNER JOIN ferresoluciones.productos A ON C.articuloID = A.articuloID
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
WHERE C.ClienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCategorias`()
BEGIN
    SELECT categoriaID, nombre
    FROM categorias
    ORDER BY categoriaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
<<<<<<< HEAD
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCliente`(pClienteID INT)
BEGIN
  SELECT
    C.clienteID,
    cedula,
    nombre,
    apellido1,
    apellido2,
    contrasena,
    C.estadoID,
    E.nombreEstado,
    C.rolID,
    R.nombreRol,
    fechaRegistro,
    otrasSenas,
    codigoPostal,
    correo,
    telefono
  FROM ferresoluciones.Clientes C
  INNER JOIN ferresoluciones.Roles R ON C.rolID = R.rolID
  INNER JOIN ferresoluciones.Estados E ON C.estadoID = E.estadoID
  WHERE C.ClienteID = pClienteID;
END ;;
DELIMITER ;
=======
DELIMITER ;;
DROP PROCEDURE IF EXISTS ConsultarClientes;;

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarClientes`()
BEGIN
	SELECT	
        C.ClienteID AS clienteID,
		cedula,
		nombre,
        apellido1,
        apellido2,
        E.estadoID as estadoID,
		CASE 
            WHEN E.estadoID = 1 THEN 'Activo' 
            WHEN E.estadoID = 2 THEN 'Inactivo' 
        END AS DescripcionActivo,
		C.rolID as rolID,
        R.nombreRol AS nombreRol,
        fechaRegistro,
        C.provinciaID, -- si querés conservar el ID, podés dejarlo
        otrasSenas,
        codigoPostal,
        correo,
        telefono
	FROM 	ferresoluciones.Clientes C
    INNER JOIN ferresoluciones.Roles R ON C.rolID = R.rolID
    INNER JOIN ferresoluciones.Estados E ON C.estadoID = E.estadoID;
END ;;
DELIMITER ;

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
<<<<<<< HEAD
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarClientes`(pClienteID INT)
BEGIN
    SELECT  
        C.ClienteID AS clienteID,
        cedula,
        nombre,
        apellido1,
        apellido2,
        E.estadoID AS estadoID,
        CASE  
            WHEN E.estadoID = 1 THEN 'Activo'  
            WHEN E.estadoID = 2 THEN 'Inactivo'  
        END AS DescripcionActivo,
        C.rolID AS rolID,
        R.nombreRol AS nombreRol,
        fechaRegistro,
        otrasSenas,
        codigoPostal,
        correo,
        telefono
    FROM ferresoluciones.Clientes C
    INNER JOIN ferresoluciones.Roles R ON C.rolID = R.rolID
    INNER JOIN ferresoluciones.Estados E ON C.estadoID = E.estadoID;
END ;;
DELIMITER ;
=======
DROP PROCEDURE IF EXISTS ConsultarClientes;;

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarClientes`(pClienteID INT)
BEGIN
	SELECT
		C.ClienteID AS clienteID,
		cedula,
		nombre,
		apellido1,
		apellido2,
		E.estadoID AS estadoID,
		CASE 
			WHEN E.estadoID = 1 THEN 'Activo' 
			WHEN E.estadoID = 2 THEN 'Inactivo' 
		END AS DescripcionActivo,
		C.rolID AS rolID,
		R.nombreRol AS nombreRol,
		fechaRegistro,
		C.provinciaID, -- Puedes mantener esto si necesitas el ID
		otrasSenas,
		codigoPostal,
		correo,
		telefono
	FROM ferresoluciones.Clientes C
	INNER JOIN ferresoluciones.Roles R ON C.rolID = R.rolID
	INNER JOIN ferresoluciones.Estados E ON C.estadoID = E.estadoID;
END ;;
DELIMITER ;

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarDetalleFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarDetalleFactura`(pMaestroID int(11))
BEGIN

    SELECT  D.articuloID,
			A.nombre,
			D.cantidad,
			D.precio,
			D.total
    FROM ferresoluciones.Detalle D
    INNER JOIN ferresoluciones.Productos A ON A.articuloID = D.articuloID
    WHERE D.MaestroID = pMaestroID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
=======
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarDetalleFacturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarDetalleFacturas`(pMaestroID int(11))
BEGIN

    SELECT  
        D.detalleID,
        A.Nombre,
        D.Cantidad,
        D.Precio,
        D.Total
    FROM 
        ferresoluciones.Detalle D
    INNER JOIN 
        ferresoluciones.Productos A ON A.articuloID = D.articuloID
    WHERE 
        D.MaestroID = pMaestroID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarEstados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarEstados`()
BEGIN
    SELECT estadoID, nombreEstado 
    FROM estados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarFacturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarFacturas`(pClienteID int)
BEGIN

SELECT  M.maestroID,
		M.fecha,
        C.nombre,
        M.total
FROM ferresoluciones.maestro M
INNER JOIN ferresoluciones.clientes C on M.clienteID = C.clienteID
WHERE C.clienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProducto` */;
=======
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProvincias` */;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
<<<<<<< HEAD
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProducto`(
    IN pProductoID INT
)
BEGIN
    SELECT 
        productoID, 
        nombre, 
        precio, 
        cantidad, 
        imagen, 
        categoriaID
    FROM productos
    WHERE productoID = pProductoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProductos`()
BEGIN
    SELECT 
        P.productoID, 
        P.nombre, 
        P.precio, 
        P.cantidad, 
        P.imagen, 
        P.categoriaID,
        C.nombre AS nombreCategoria
    FROM productos P
    INNER JOIN categorias C 
        ON P.categoriaID = C.categoriaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProveedor`(
    IN pProveedorID INT
)
BEGIN
    SELECT 
        proveedorID,
        cedula,
        nombre,
        correo,
        telefono,
        direccion,
        estadoID,
        fechaRegistro
    FROM proveedores
    WHERE proveedorID = pProveedorID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProveedores`()
BEGIN
    SELECT 
        proveedorID,
        nombre,
        cedula,
        correo,
        telefono,
        direccion,
        estadoID,
        fechaRegistro
    FROM proveedores;
END ;;
DELIMITER ;
=======

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarResumenCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarResumenCarrito`(pClienteID int)
BEGIN

	SELECT  IFNULL(SUM(C.cantidadDeseada),0) 'Cantidad', 
			IFNULL(SUM(C.cantidadDeseada * A.precio), 0) 'Total'
	FROM ferresoluciones.Carrito C
	INNER JOIN ferresoluciones.Productos A ON C.articuloID = A.articuloID
	WHERE C.clienteID = pClienteID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarRoles`()
BEGIN

	SELECT	rolID, nombreRol
	FROM 	roles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarSugerencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarSugerencias`()
BEGIN
    SELECT 
        c.consultaID, 
        c.descripcion, 
        IFNULL(c.nombreCliente, 'Anónimo') AS nombreCliente
    FROM 
        consultas c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto`(
    IN pProductoID INT
)
BEGIN
    DELETE FROM articulos
    WHERE articuloID = pProductoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarSugerencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSugerencia`(
    IN p_consultaID INT
)
BEGIN
    DELETE FROM consultas WHERE consultaID = p_consultaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
<<<<<<< HEAD
=======

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(
    IN pCorreo VARCHAR(50),
    IN pContrasena VARCHAR(20)
)
BEGIN
    SELECT  
        clienteID AS ClienteID,
        cedula AS Cedula,
<<<<<<< HEAD
        nombre AS Nombre,  -- ✅ alias correcto para $_SESSION
=======
        nombre,
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
        apellido1,
        apellido2,
        contrasena,
        estadoID,
        rolID,
        fechaRegistro,
        otrasSenas,
        codigoPostal,
        correo,
        telefono
    FROM ferresoluciones.clientes
    WHERE correo = pCorreo
        AND contrasena = pContrasena
        AND estadoID = 1;
END ;;
<<<<<<< HEAD
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
    IN pNombre VARCHAR(100),
    IN pPrecio DECIMAL(10,2),
    IN pCantidad INT,
    IN pImagen VARCHAR(255),
    IN pCategoriaID INT
)
BEGIN
    INSERT INTO productos(nombre, precio, cantidad, imagen, categoriaID)
    VALUES (pNombre, pPrecio, pCantidad, pImagen, pCategoriaID);
END ;;
DELIMITER ;
=======

DELIMITER ;

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarSugerencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSugerencia`(
    IN p_descripcion VARCHAR(500), 
    IN p_clienteID INT, 
    IN p_nombreCliente VARCHAR(100)
)
BEGIN
    INSERT INTO consultas (descripcion, clienteID, nombreCliente) 
    VALUES (p_descripcion, p_clienteID, p_nombreCliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PagarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PagarCarrito`(pClienteID int)
BEGIN

    INSERT INTO ferresoluciones.maestro (fecha, clienteID, total)
    SELECT NOW(),
        C.clienteID,
        IFNULL(SUM(C.cantidadDeseada * A.precio), 0)
    FROM carrito C
    INNER JOIN articulos A ON C.articuloID = A.articuloID
    WHERE C.clienteID = pClienteID;


    INSERT INTO ferresoluciones.detalle (maestroID, articuloID, cantidad, precio, total)
    SELECT  LAST_INSERT_ID(),
			C.articuloID,
			IFNULL(C.cantidadDeseada, 0),
			IFNULL(A.precio, 0),
			IFNULL(C.cantidadDeseada * A.Precio, 0)
    FROM carrito C
    INNER JOIN articulos A ON C.articuloID = A.articuloID
    WHERE C.clienteID = pClienteID;

    UPDATE articulos A
    INNER JOIN carrito C ON A.articuloID = C.articuloID
    SET A.Cantidad = A.Cantidad - C.cantidadDeseada
    WHERE C.clienteID = pClienteID;


    DELETE FROM carrito
    WHERE ClienteID = pClienteID;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecuperarAcceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecuperarAcceso`(pCorreo varchar(50))
BEGIN

	SELECT	clienteID,
			cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
            rolID,
            fechaRegistro,
            provinciaID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	ferresoluciones.clientes
	WHERE 	Correo = pCorreo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
=======
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProducto`(
    IN pNombre VARCHAR(100),
    IN pPrecio DECIMAL(10,2),
    IN pCantidad INT,
    IN pImagen VARCHAR(1000),
    IN pCategoriaID INT
)
BEGIN
    INSERT INTO articulos (nombre, precio, cantidad, imagen, categoriaID)
    VALUES (pNombre, pPrecio, pCantidad, pImagen, pCategoriaID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCarrito`(	pClienteID INT,
																pProductoID INT,
																pCantidad INT)
BEGIN

    IF (SELECT COUNT(*) FROM carrito WHERE clienteID = pClienteID 
<<<<<<< HEAD
									   AND productoID = pProductoID) = 0 
	THEN

        INSERT INTO ferresoluciones.carrito (productoID, clienteID, cantidadDeseada, fecha)
=======
									   AND articuloID = pProductoID) = 0 
	THEN

        INSERT INTO ferresoluciones.carrito (articuloID, clienteID, cantidadDeseada, fecha)
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
        VALUES (pProductoID, pClienteID, pCantidad, NOW());

    ELSE

        UPDATE ferresoluciones.carrito
        SET cantidadDeseada = pCantidad,
            Fecha = NOW()
        WHERE clienteID = pClienteID 
<<<<<<< HEAD
        AND productoID = pProductoID;
=======
        AND articuloID = pProductoID;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCliente`(
<<<<<<< HEAD
    IN pCedula VARCHAR(20),
    IN pNombre VARCHAR(50),
    IN pApellido1 VARCHAR(50),
    IN pApellido2 VARCHAR(50),
    IN pContrasena VARCHAR(50),
    IN pCodigoPostal VARCHAR(10),
    IN pCorreo VARCHAR(100),
    IN pTelefono VARCHAR(20)
)
BEGIN
    INSERT INTO clientes (
        cedula,
        nombre,
        apellido1,
        apellido2,
        contrasena,
        estadoID,
        rolID,
        fechaRegistro,
        codigoPostal,
        correo,
        telefono
    ) VALUES (
        pCedula,
        pNombre,
        pApellido1,
        pApellido2,
        pContrasena,
        1,                     -- estadoID por defecto (Activo)
        2,                     -- rolID por defecto (Cliente)
        NOW(),                 -- fecha de registro
        pCodigoPostal,
        pCorreo,
        pTelefono
    );
=======
    pCedula int,
    pNombre VARCHAR(50),
    pApellido1 VARCHAR(50),
    pApellido2 VARCHAR(50),
    pContrasena VARCHAR(20),
    pProvinciaID INT,
    pOtrasSenas VARCHAR(200),
    pCodigoPostal VARCHAR(10),
    pCorreo VARCHAR(50),
    pTelefono VARCHAR(15)
)
BEGIN
    INSERT INTO `ferresoluciones`.`clientes`(`cedula`, `nombre`, `apellido1`, `apellido2`, `contrasena`, `estadoID`, `rolID`, 
                           `fechaRegistro`, `provinciaID`, `otrasSenas`, `codigoPostal`, 
                           `correo`, `telefono`)
    VALUES (pCedula, pNombre, pApellido1, pApellido2, pContrasena, 1, 2, NOW(), 
            pProvinciaID, pOtrasSenas, pCodigoPostal, pCorreo, pTelefono);
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
<<<<<<< HEAD
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProducto` */;
=======
/*!50003 DROP PROCEDURE IF EXISTS `RemoverProductoCarrito` */;
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
<<<<<<< HEAD
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProducto`(
    IN pNombre VARCHAR(100),
    IN pPrecio DECIMAL(10,2),
    IN pCantidad INT,
    IN pImagen VARCHAR(1000),
    IN pCategoriaID INT
)
BEGIN
    INSERT INTO productos (nombre, precio, cantidad, imagen, categoriaID)
    VALUES (pNombre, pPrecio, pCantidad, pImagen, pCategoriaID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProveedor`(
    IN pNombre VARCHAR(100),
    IN pCedula VARCHAR(15),
    IN pCorreo VARCHAR(100),
    IN pTelefono VARCHAR(20),
    IN pDireccion VARCHAR(255)
)
BEGIN
    INSERT INTO proveedores (nombre, cedula, correo, telefono, direccion, estadoID, fechaRegistro)
    VALUES (pNombre, pCedula, pCorreo, pTelefono, pDireccion, 1, NOW());
=======
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoverProductoCarrito`(pClienteID int, pProductoID int)
BEGIN

	DELETE FROM Carrito
	WHERE	clienteID = pClienteID
		AND articuloID = pProductoID;

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoverProductoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoverProductoCarrito`(pClienteID int, pProductoID int)
BEGIN

	DELETE FROM Carrito
	WHERE	clienteID = pClienteID
		AND articuloID = pProductoID;

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

<<<<<<< HEAD
-- Dump completed on 2025-04-09 18:26:22
=======
-- Dump completed on 2024-12-18 17:52:57


use ferresoluciones 
select * from clientes;

INSERT INTO clientes (
    cedula, nombre, apellido1, apellido2, contrasena, estadoID,
    rolID, fechaRegistro, otrasSenas, codigoPostal, correo, telefono
)
VALUES (
    '101010101',           -- cédula
    'Carlos',              -- nombre
    'Ramírez',             -- apellido1
    'Jiménez',             -- apellido2
    '1234pass',            -- contraseña
    1,                     -- estadoID (ej: 1 = Activo)
    2,                     -- rolID (ej: 2 = Cliente)
    NOW(),                 -- fecha de registro actual
    'Del parque 200m sur', -- otras señas
    '10101',               -- código postal
    'carlos@example.com',  -- correo
    '8888-8888'            -- teléfono
);

>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
