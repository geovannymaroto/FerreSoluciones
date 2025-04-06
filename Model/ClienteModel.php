<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatos.php';

    function ConsultarClienteModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarCliente('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
 
    function ConsultarClientesModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarClientes('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
    function ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, $rolID, 
    $provinciaID, $otrasSenas, $codigoPostal, $correo, $telefono)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ActualizarPerfil('$clienteID', '$cedula', '$nombre', '$apellido1', '$apellido2', '$rolID', 
            '$provinciaID', '$otrasSenas', '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            error_log($ex->getMessage());  // Log the error message
            return false;
        }
    }

    function CambiarEstadoClienteModel($clienteID)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL CambiarEstadoCliente('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarRolesModel()
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ConsultarRoles()";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarProvinciasModel()
    {
        try {
            $enlace = AbrirBaseDatos();
            
            $sentencia = "CALL ConsultarProvincias()";
            $resultado = $enlace->query($sentencia);
            
            CerrarBaseDatos($enlace);
            return $resultado;
        } catch (Exception $ex) {
            return null;
        }
    }

    ?>