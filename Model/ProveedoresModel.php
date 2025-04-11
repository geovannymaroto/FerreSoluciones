<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/BaseDatosModel.php';

function ConsultarProveedoresModel()
{
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL ConsultarProveedores()";
        $resultado = $enlace->query($sentencia);
        CerrarBaseDatos($enlace);
        return $resultado;
    } catch(Exception $ex) {
        return null;
    }
}

function ConsultarProveedorModel($proveedorID)
{
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL ConsultarProveedor('$proveedorID')";
        $resultado = $enlace->query($sentencia);
        CerrarBaseDatos($enlace);
        return $resultado;
    } catch(Exception $ex) {
        return null;
    }
}

function RegistrarProveedorModel($nombre, $cedula, $correo, $telefono, $direccion)
{
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL RegistrarProveedor('$nombre', '$cedula', '$correo', '$telefono', '$direccion')";
        $resultado = $enlace->query($sentencia);
        CerrarBaseDatos($enlace);
        return $resultado;
    } catch(Exception $ex) {
        return false;
    }
}

function ActualizarProveedorModel($proveedorID, $nombre, $cedula, $correo, $telefono, $direccion)
{
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL ActualizarProveedor('$proveedorID', '$nombre', '$cedula', '$correo', '$telefono', '$direccion')";
        $resultado = $enlace->query($sentencia);
        CerrarBaseDatos($enlace);
        return $resultado;
    } catch(Exception $ex) {
        return false;
    }
}

function EliminarProveedorModel($proveedorID)
{
    try {
        $enlace = AbrirBaseDatos();
        $sentencia = "CALL EliminarProveedor('$proveedorID')";
        $resultado = $enlace->query($sentencia);
        CerrarBaseDatos($enlace);
        return $resultado;
    } catch(Exception $ex) {
        return false;
    }
}
?>
