<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';

function ConsultarProductosModel()
{
    try
    {
        $enlace = AbrirBaseDatos();

        $sentencia = "CALL ConsultarProductos()";
        $resultado = $enlace -> query($sentencia);

        CerrarBaseDatos($enlace);
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
        $enlace = AbrirBaseDatos();

        $sentencia = "CALL ConsultarProducto('$ProductoID')";
        $resultado = $enlace -> query($sentencia);

        CerrarBaseDatos($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return null;
    }
}

function RegistrarProductoModel($nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL RegistrarProducto('$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBaseDatos($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return false;
    }
}

function ActualizarProductoModel($ProductoID, $nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBaseDatos();

        $sentencia = "CALL ActualizarProducto('$ProductoID', '$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

function ConsultarCategoriasModel() {
    try {
        $enlace = AbrirBaseDatos();

        $sentencia = "CALL ConsultarCategorias()";
        $resultado = $enlace->query($sentencia);

        CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }
    
    function EliminarProductoModel($ProductoID) {
        try {
            $enlace = AbrirBaseDatos();
    
            $sentencia = "CALL EliminarProducto('$ProductoID')";
            $resultado = $enlace->query($sentencia);
    
            CerrarBaseDatos($enlace);
            return $resultado;
        } catch (Exception $ex) {
            return false;
        }
    }
    
?>
