<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';

    $id = $_GET["id"];
    $datos = ConsultarProveedor($id);
?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        
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
                            <h5 class="card-title fw-semibold mb-4">Actualizar Proveedor</h5>

                            <?php
                                if(isset($_POST["txtMensaje"]))
                                {
                                    echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                }
                            ?>

                            <form action="" method="POST">

                                <input type="hidden" id="txtproveedorID" name="txtProveedorID"value="<?php echo $datos["proveedorID"] ?>">

                                <div class="mb-3">
                                    <label class="form-label">Cédula</label>
                                    <input type="text" class="form-control" id="txtCedula" name="txtCedula"
                                        value="<?php echo $datos["cedula"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" name="txtNombre"
                                        value="<?php echo $datos["nombre"] ?>">
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
                                <div class="mb-4">
                                    <label class="form-label">Direccion</label>
                                    <input type="text" class="form-control" id="txtDireccion" name="txtDireccion"
                                        value="<?php echo $datos["direccion"] ?>">
                                </div>

                                <input type="submit" class="btn btn-warning" value="Procesar" id="btnActualizarProveedor"
                                    name="btnActualizarProveedor">
                            </form>
                        </div>
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