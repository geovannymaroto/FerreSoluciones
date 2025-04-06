<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';


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