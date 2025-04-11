<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';
?>

<!doctype html>
<html lang="es">

<?php ReferenciasCSS(); ?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">

        <?php MostrarMenu(); ?>

        <div class="body-wrapper">
            <?php MostrarHeader(); ?>

            <div class="container-fluid">
                <div class="row">
                    <div class="card shadow">
                        <div class="card-body">

                            <h5 class="card-title fw-semibold mb-4">Registrar Proveedor</h5>

                            <a href="consultarProveedor.php" class="btn btn-warning fw-bold mb-4">
                                <i class="fa fa-truck me-2"></i> Consultar Proveedores
                            </a>

                            <?php
                            if (isset($_POST["txtMensaje"])) {
                                echo '<div class="alert alert-info text-center">' . $_POST["txtMensaje"] . '</div>';
                            }
                            ?>

                            <form action="" method="POST">
                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" required id="txtNombre" name="txtNombre">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Cédula</label>
                                    <input type="text" class="form-control" required id="txtCedula" name="txtCedula"
                                           maxlength="12" onkeypress="return SoloNumeros(event)">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" class="form-control" required id="txtCorreo" name="txtCorreo">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" required id="txtTelefono" name="txtTelefono"
                                           maxlength="20">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Dirección</label>
                                    <textarea class="form-control" required id="txtDireccion" name="txtDireccion" rows="2"></textarea>
                                </div>

                                <input type="submit" class="btn btn-warning fw-bold" value="Registrar Proveedor"
                                       id="btnRegistrarProveedor" name="btnRegistrarProveedor">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php ReferenciasJS(); ?>
    <script src="../js/Comunes.js"></script>

</body>
</html>
