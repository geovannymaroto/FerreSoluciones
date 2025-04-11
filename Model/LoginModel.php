<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';


<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    function RegistrarClienteModel($cedula, $nombre, $apellido1, $apellido2, $contrasena, $codigoPostal, $correo, $telefono)
    {
        try {
            $context = AbrirBaseDatos();

            $sentencia = "CALL RegistrarCliente('$cedula', '$nombre', '$apellido1', '$apellido2', '$contrasena', '$codigoPostal', '$correo', '$telefono')";
            
            $resultado = $context->query($sentencia);
            CerrarBaseDatos($context);

            return $resultado;
        } catch (Exception $error) {
            return false;
        }
    }
<<<<<<< HEAD
=======
=======
    function RegistrarClienteModel($cedula, $nombre, $apellido1, $apellido2, $contrasena, $provinciaID, $otrasSenas, $codigoPostal, $correo, $telefono) 
    {
        try 
        {
            $enlace = AbrirBaseDatos();
    
            $sentencia = "CALL RegistrarCliente('$cedula', '$nombre', '$apellido1', '$apellido2', '$contrasena', '$otrasSenas', '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace->query($sentencia);
    
            CerrarBaseDatos($enlace);
            return $resultado;
        } 
        catch (Exception $ex) 
        {
            return false;
        }
    }

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    function IniciarSesionModel($correo, $contrasena)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL IniciarSesion('$correo','$contrasena')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function RecuperarAccesoModel($correo)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL RecuperarAcceso('$correo')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ActualizarContrasenaModel($ClienteID, $Codigo)
    {
        try
        {
            $enlace = AbrirBaseDatos();

            $sentencia = "CALL ActualizarContrasena('$ClienteID','$Codigo')";
            $resultado = $enlace -> query($sentencia);

            CerrarBaseDatos($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

?>