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
    C.articuloID,
    A.nombre,
    IFNULL(C.cantidadDeseada, 0) `cantidadDeseada`,
    IFNULL(A.precio, 0) `totalUnitario`,
    IFNULL(C.cantidadDeseada * A.precio, 0) `total`
FROM ferresoluciones.carrito C
INNER JOIN ferresoluciones.productos A ON C.articuloID = A.articuloID
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
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProvincias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(
    IN pCorreo VARCHAR(50),
    IN pContrasena VARCHAR(20)
)
BEGIN
    SELECT  
        clienteID AS ClienteID,
        cedula AS Cedula,
        nombre,
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

DELIMITER ;

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
									   AND articuloID = pProductoID) = 0 
	THEN

        INSERT INTO ferresoluciones.carrito (articuloID, clienteID, cantidadDeseada, fecha)
        VALUES (pProductoID, pClienteID, pCantidad, NOW());

    ELSE

        UPDATE ferresoluciones.carrito
        SET cantidadDeseada = pCantidad,
            Fecha = NOW()
        WHERE clienteID = pClienteID 
        AND articuloID = pProductoID;

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

