<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/ProductosModel.php';

if(session_status() == PHP_SESSION_NONE) {
    session_start();
}

function ConsultarProductos()
{
    return ConsultarProductosModel();
}

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
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = '/FerreSoluciones/View/images/Productos/' . $_FILES["txtImagen"]["name"];
    $categoriaID = $_POST["ddlCategorias"];

    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/images/Productos/' .  $_FILES["txtImagen"]["name"];
    copy($origen,$destino);

    $resultado = RegistrarProductoModel($nombre, $precio, $cantidad, $imagen, $categoriaID);

    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible registrar el artículo";
    }
}


if(isset($_POST["btnActualizarProducto"]))
{
    $ProductoID = $_POST["txtProductoID"];
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

    $resultado = ActualizarProductoModel($ProductoID, $nombre, $precio, $cantidad, $imagen, $categoriaID);

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

if (isset($_POST["btnEliminarProducto"])) {
    $ProductoID = $_POST["txtProductoID"];
    $resultado = EliminarProductoModel($ProductoID);
    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
    } else {
        $_POST["txtMensaje"] = "No fue posible eliminar el artículo";
    }
}

?>
