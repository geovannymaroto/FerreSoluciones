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

<<<<<<< HEAD
        if ($resultado && $resultado->num_rows > 0) {
            $fila = mysqli_fetch_array($resultado); // ✅
        } else {
            $fila = null;
        }

        CerrarBaseDatos($enlace);
        return $fila; // ✅ Devuelve directamente el array
=======
        CerrarBaseDatos($enlace);
        return $resultado;
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
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
