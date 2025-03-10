<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . "/FerreSoluciones/Model/BaseDatosModel.php";

	
function IniciarSesionModel($identificacion,$contrasenna)
    {
        try
        {
       //     $context = AbrirBaseDatos();

            $sentencia = "CALL SP_IniciarSesion('$identificacion','$contrasenna')";
        //    $resultado = $context -> query($sentencia);
    
        //    CerrarBaseDatos($context);
        //    return $resultado;
        }
        catch(Exception $error)
        {
            return null;
        }        
    }

?>