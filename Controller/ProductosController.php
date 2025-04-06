<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/ProductosModel.php';

if(session_status() == PHP_SESSION_NONE) {
    session_start();
}

function ConsultarProductos()
{
    return ConsultarProductosModel();
}

function ConsultarArticulo($articuloID) {
    $resultado = ConsultarArticuloModel($articuloID);

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

if (isset($_POST["btnRegistrarArticulo"])) {
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = '/FerreSoluciones/View/images/Productos/' . $_FILES["txtImagen"]["name"];
    $categoriaID = $_POST["ddlCategorias"];

    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/images/Productos/' .  $_FILES["txtImagen"]["name"];
    copy($origen,$destino);

    $resultado = RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID);

    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible registrar el artículo";
    }
}


if(isset($_POST["btnActualizarArticulo"]))
{
    $articuloID = $_POST["txtArticuloID"];
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

    $resultado = ActualizarArticuloModel($articuloID, $nombre, $precio, $cantidad, $imagen, $categoriaID);

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

if (isset($_POST["btnEliminarArticulo"])) {
    $articuloID = $_POST["txtArticuloID"];
    $resultado = EliminarArticuloModel($articuloID);
    if ($resultado == true) {
        header('location: ../../View/Productos/ConsultarProductos.php');
    } else {
        $_POST["txtMensaje"] = "No fue posible eliminar el artículo";
    }
}

?>
