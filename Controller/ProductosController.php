<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/ProductosModel.php';

if(session_status() == PHP_SESSION_NONE) {
    session_start();
}

function ConsultarProductos()
{
    return ConsultarProductosModel();
}

<<<<<<< HEAD
function ConsultarProducto($ProductoID) {
    $resultado = ConsultarProductoModel($ProductoID); 

    if ($resultado !== null) {
        return $resultado;
    } else {
        $_POST["txtMensaje"] = "La información del artículo no se ha obtenido correctamente";
        header('location: ../../View/Productos/consultarProductos.php');
        exit(); 
    }
}


if (isset($_POST["btnRegistrarProducto"])) {
=======
function Consultarproducto($productoID) {
    $resultado = ConsultarproductoModel($productoID);

    if($resultado != null && $resultado -> num_rows > 0)
    {
        return mysqli_fetch_array($resultado);
    }
    else
    {
        $_POST["txtMensaje"] = "La información del artículo no se ha obtenido correctamente";
        header('location: ../../View/Productos/consultarProductos.php');
    }
}

if (isset($_POST["btnRegistrarproducto"])) {
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = '/FerreSoluciones/View/images/Productos/' . $_FILES["txtImagen"]["name"];
    $categoriaID = $_POST["ddlCategorias"];

    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/images/Productos/' .  $_FILES["txtImagen"]["name"];
    copy($origen,$destino);

<<<<<<< HEAD
    $resultado = RegistrarProductoModel($nombre, $precio, $cantidad, $imagen, $categoriaID);
=======
    $resultado = RegistrarproductoModel($nombre, $precio, $cantidad, $imagen, $categoriaID);
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357

    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible registrar el artículo";
    }
}


<<<<<<< HEAD
if(isset($_POST["btnActualizarProducto"]))
{
    $ProductoID = $_POST["txtProductoID"];
=======
if(isset($_POST["btnActualizarproducto"]))
{
    $productoID = $_POST["txtproductoID"];
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = "";

    if($_FILES["txtImagen"]["name"] != "")
    {
        $imagen = '/FerreSoluciones/View/images/Productos/' . $_FILES["txtImagen"]["name"];

        $origen = $_FILES["txtImagen"]["tmp_name"];
        $destino = $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/images/Productos/' .  $_FILES["txtImagen"]["name"];
        copy($origen,$destino);
    }

    $categoriaID = $_POST["ddlCategorias"];

<<<<<<< HEAD
    $resultado = ActualizarProductoModel($ProductoID, $nombre, $precio, $cantidad, $imagen, $categoriaID);
=======
    $resultado = ActualizarproductoModel($productoID, $nombre, $precio, $cantidad, $imagen, $categoriaID);
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357

    if($resultado == true)
    {
        header('location: ../../View/Productos/consultarProductos.php');
    }
    else
    {
        $_POST["txtMensaje"] = "El artículo no se ha actualizado correctamente";
    }
    
}

function ConsultarCategorias() {
    return ConsultarCategoriasModel();
}

<<<<<<< HEAD
if (isset($_POST["btnEliminarProducto"])) {
    $ProductoID = $_POST["txtProductoID"];
    $resultado = EliminarProductoModel($ProductoID);
=======
if (isset($_POST["btnEliminarproducto"])) {
    $productoID = $_POST["txtproductoID"];
    $resultado = EliminarproductoModel($productoID);
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
    } else {
        $_POST["txtMensaje"] = "No fue posible eliminar el artículo";
    }
}

?>
