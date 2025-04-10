<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';

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

    function ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, $rolID, $codigoPostal, $correo, $telefono)
    {
        try
        {
            $enlace = AbrirBaseDatos();
<<<<<<< HEAD
    
            $sentencia = "CALL ActualizarCliente('$clienteID', '$cedula', '$nombre', '$apellido1', '$apellido2', $rolID, '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace->query($sentencia);
    
=======

            $sentencia = "CALL ActualizarCliente('$clienteID', '$cedula', '$nombre', '$apellido1', '$apellido2', $rolID, '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace->query($sentencia);

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $error)
        {
<<<<<<< HEAD
            error_log($error->getMessage());  
            return false;
        }
    }
    

=======
        error_log($ex->getMessage());  // Log the error message
            return false;
        }
    }
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357

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

    // function ConsultarProvinciasModel()
    // {
    //     try {
    //         $enlace = AbrirBaseDatos();
            
    //         $sentencia = "CALL ConsultarProvincias()";
    //         $resultado = $enlace->query($sentencia);
            
    //         CerrarBaseDatos($enlace);
    //         return $resultado;
    //     } catch (Exception $ex) {
    //         return null;
    //     }
    // }

    ?>