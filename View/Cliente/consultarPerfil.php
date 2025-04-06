<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ClienteController.php';

    $id = $_SESSION["ClienteID"];
    $datos = ConsultarCliente($id);

?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" 

        <?php
            MostrarMenu();
        ?>

        <div class="body-wrapper">
            
        <?php
                MostrarHeader();
        ?> 
            <div class="container-fluid">
                <div class="row">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Mi Perfil</h5>

                            <?php
                                if(isset($_POST["txtMensaje"]))
                                {
                                    echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                }
                            ?>

                            <form action="" method="POST">

                                <div class="mb-3">
                                    <label class="form-label">Cédula</label>
                                    <input type="text" class="form-control" id="txtCedula"name="txtCedula" 
                                    value="<?php echo $datos["cedula"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" name="txtNombre"
                                    value="<?php echo $datos["nombre"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Primer Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido1" name="txtApellido1"
                                    value="<?php echo $datos["apellido1"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Segundo Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido2" name="txtApellido2"
                                    value="<?php echo $datos["apellido2"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Rol</label>
                                    <input type="text" class="form-control" id="txtRol" name="txtRol" readOnly="true"
                                    style="background-color: #B0C4DE"
                                    value="<?php echo $datos["nombreRol"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Fecha de Registro</label>
                                    <input type="text" class="form-control" id="txtFechaRegistro" name="txtFechaRegistro" readOnly="true"
                                    style="background-color: #B0C4DE"
                                    value="<?php echo $datos["fechaRegistro"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Código Postal</label>
                                    <input type="text" class="form-control" id="txtCodigoPostal" name="txtCodigoPostal"
                                    value="<?php echo $datos["codigoPostal"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="txtCorreo" name="txtCorreo"
                                    value="<?php echo $datos["correo"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Número de Teléfono</label>
                                    <input type="text" class="form-control" id="txtTelefono" name="txtTelefono"
                                    value="<?php echo $datos["telefono"] ?>">
                                </div>

                                <input type="submit" class="btn btn-primary" value="Procesar" id="btnActualizarPerfil"
                                    name="btnActualizarPerfil">

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <?php
        ReferenciasJS();
    ?>

</body>

</html>