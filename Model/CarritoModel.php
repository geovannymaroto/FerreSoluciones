<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';

    function RegistrarCarritoModel($clienteID, $productoID, $cantidad)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL RegistrarCarrito('$clienteID', '$productoID', '$cantidad')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarResumenCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarResumenCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function RemoverproductoCarritoModel($clienteID, $productoID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL RemoverproductoCarrito('$clienteID', '$productoID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function PagarCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL PagarCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarFacturasModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarFacturas('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarDetalleFacturaModel($id)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarDetalleFactura('$id')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
?>
