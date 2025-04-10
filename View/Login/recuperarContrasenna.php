<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layoutExterno.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/LoginController.php';
?>

<!doctype html>
<html lang="en">

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
                                    <img src="../images/FerreTech.png" alt="Logo">
                                </a>

                                <p class="text-center">Recuperar acceso</p>

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

                                    <input type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4" value="Procesar"
                                    id="btnRecuperarAcceso" name="btnRecuperarAcceso">
                                    
                                    <div class="d-flex align-items-center justify-content-center">
                                        <p class="fs-4 mb-0 fw-bold">Si te acuerdas de tu contraseña, puedes volver a: </p>
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
    
    <?php
        ReferenciasJS();
    ?>
</body>

</html>