<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layoutExterno.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/LoginController.php';
    
?>

<!doctype html>
<html lang="es">

<?php
    ReferenciasCSS();
?>

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
                                    <img src="../images/FerreTech.png" alt="Ferretería Logo">
                                </a>

                                <p class="text-center">Iniciar sesión en el sistema de la ferretería</p>

                                <?php
                                    if(isset($_POST["txtMensaje"]))
                                    {
                                        echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                    }
                                ?>

                                <form action="" method="POST">

                                    <div class="mb-3">
                                        <label class="form-label">Correo Electrónico</label>
                                        <input type="email" class="form-control" id="txtCorreo" name="txtCorreo">
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label">Contraseña</label>
                                        <input type="password" class="form-control" id="txtContrasena" name="txtContrasena">
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="form-check">
                                        </div>
                                        <a class="text-warning fw-bold" href="recuperarAcceso.php">Recuperar Acceso</a>
                                    </div>

                                    <input type="submit" class="btn btn-warning w-100 py-8 fs-4 mb-4" value="Ingresar"
                                        id="btnIniciarSesion" name="btnIniciarSesion">
                                    
                                    <div class="d-flex align-items-center justify-content-center">
                                        <p class="fs-4 mb-0 fw-bold">¿No tienes cuenta?</p>
                                        <a class="text-warning fw-bold ms-2" href="registrarCliente.php">Registrarse en la ferretería</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; FerreSoluciones 2025</div>               
                </div>
            </div>
        </footer>

    <?php
        ReferenciasJS();
    ?>

</body>

</html>
