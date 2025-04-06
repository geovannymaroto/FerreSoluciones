<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatos.php';

function ConsultarProductosModel()
{
    try
    {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarProductos()";
        $resultado = $enlace -> query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return null;
    }
}

function ConsultarProductoModel($ProductoID)
{
    try
    {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarProducto('$ProductoID')";
        $resultado = $enlace -> query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return null;
    }
}

function RegistrarProductoModel($nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL RegistrarProducto('$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return false;
    }
}

function ActualizarProductoModel($ProductoID, $nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBD();

        $sentencia = "CALL ActualizarProducto('$ProductoID', '$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

function ConsultarCategoriasModel() {
    try {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarCategorias()";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }
    
    function EliminarProductoModel($ProductoID) {
        try {
            $enlace = AbrirBD();
    
            $sentencia = "CALL EliminarProducto('$ProductoID')";
            $resultado = $enlace->query($sentencia);
    
            CerrarBD($enlace);
            return $resultado;
        } catch (Exception $ex) {
            return false;
        }
    }
    
?>
