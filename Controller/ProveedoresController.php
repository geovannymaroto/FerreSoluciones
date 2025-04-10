<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/ProveedoresModel.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

function ConsultarProveedores()
{
    return ConsultarProveedoresModel();
}

function ConsultarProveedor($proveedorID)
{
    $resultado = ConsultarProveedorModel($proveedorID);

    if ($resultado != null && $resultado->num_rows > 0) {
        return mysqli_fetch_array($resultado);
    } else {
        $_POST["txtMensaje"] = "La información del proveedor no se ha obtenido correctamente";
        header('location: ../../View/Proveedor/consultarProveedor.php');
        exit();
    }
}

if (isset($_POST["btnRegistrarProveedor"])) {
    $nombre = $_POST["txtNombre"];
    $cedula = $_POST["txtCedula"];
    $correo = $_POST["txtCorreo"];
    $telefono = $_POST["txtTelefono"];
    $direccion = $_POST["txtDireccion"];

    $resultado = RegistrarProveedorModel($nombre, $cedula, $correo, $telefono, $direccion);

    if ($resultado === true) {
        header('location: ../../View/Proveedor/consultarProveedor.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible registrar el proveedor";
    }
}

if (isset($_POST["btnActualizarProveedor"])) {
    $proveedorID = $_POST["txtProveedorID"];
    $nombre = $_POST["txtNombre"];
    $cedula = $_POST["txtCedula"];
    $correo = $_POST["txtCorreo"];
    $telefono = $_POST["txtTelefono"];
    $direccion = $_POST["txtDireccion"];

    $resultado = ActualizarProveedorModel($proveedorID, $nombre, $cedula, $correo, $telefono, $direccion);

    if ($resultado === true) {
        header('location: ../../View/Proveedor/consultarProveedor.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible actualizar el proveedor";
    }
}
?>
