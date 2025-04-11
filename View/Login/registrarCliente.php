<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/LoginController.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ClienteController.php';

?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrarse</title>
    <link rel="shortcut icon" type="image/png" href="../images/logo-01.jpeg" />
    <link rel="stylesheet" href="../css/styles.min.css" />
    <link rel="stylesheet" href="../css/proyecto.css" />
</head>

<body>

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="home.php" class="logo-container">
                                    <img src="../images/FerreTech.png" alt="Logo">
                                </a>

                                <h5 class="card-title fw-semibold mb-4">Registrarse</h5>

                                <?php
                                    if(isset($_POST["txtMensaje"]))
                                    {
                                        echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                    }
                                ?>

                                <form action="" method="POST">

                                    <div class="mb-3">
                                        <label class="form-label">Cédula</label>
                                        <input type="text" class="form-control" id="txtCedula" name="txtCedula"
                                            required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="txtNombre" name="txtNombre"
                                            required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Primer Apellido</label>
                                        <input type="text" class="form-control" id="txtApellido1" name="txtApellido1"
                                            required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Segundo Apellido</label>
                                        <input type="text" class="form-control" id="txtApellido2" name="txtApellido2"
                                            required>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label">Contraseña</label>
                                        <input type="password" class="form-control" id="txtContrasena"
                                            name="txtContrasena" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Código Postal</label>
                                        <input type="text" class="form-control" id="txtCodigoPostal"
                                            name="txtCodigoPostal">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="txtTelefono" name="txtTelefono">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Correo Electrónico</label>
                                        <input type="email" class="form-control" id="txtCorreo" name="txtCorreo"
                                            required>
                                    </div>

                                    <input type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4" value="Procesar"
                                        id="btnRegistrarCliente" name="btnRegistrarCliente">

                                    <div class="d-flex align-items-center justify-content-center">
                                        <p class="fs-4 mb-0 fw-bold">Ya tienes una cuenta?</p>
                                        <a class="text-primary fw-bold ms-2" href="inicioSesion.php">Inicia sesión</a>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
    <!--<script src="../js/registrarClientes.js"></script>-->

</body>

</html>