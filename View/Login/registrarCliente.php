<?php
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
<<<<<<< HEAD
=======
=======
    include_once $_SERVER["DOCUMENT_ROOT"] . "/FerreSoluciones/Controller/LoginController.php";
    include_once $_SERVER["DOCUMENT_ROOT"] . "/FerreSoluciones/View/layoutExterno.php";

    function PrintCss() {
        echo '<link href="/path/to/your/css/file.css" rel="stylesheet">';
    }

    function PrintScript() {
        echo '<script src="/path/to/your/js/file.js"></script>';
    }
?>

<!DOCTYPE html>
<html lang="en">

<?php PrintCss(); ?>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FerreSoluciones</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../Styles/style.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body class="bg-gradient-primary">
    <div class="container MargenSuperior">
    <div class="row justify-content-center">
    <div class="col-xl-10 col-lg-12 col-md-9">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">

                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Crear Cuenta</h1>
                            </div>

                            <?php
                                if(isset($_POST["Message"]))
                                {
                                    echo '<div class="alert alert-warning Mensajes">' . $_POST["Message"] . '</div>';                                   
                                }
                            ?>   
                            <form action="" method="POST" class="user">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                    placeholder="Identificación" id="txtIdentificacion" name="txtIdentificacion"
                                    onkeyup="ConsultarNombre()" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                        placeholder="Nombre" id="txtNombre" name="txtNombre" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user"
                                        placeholder="Correo" id="txtCorreo" name="txtCorreo" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user"
                                        placeholder="Contraseña" id="txtContrasenna" name="txtContrasenna" required>
                                </div>
                                <br>
                                <div class="text-center">
                                    <input type="submit" class="btn btn-danger btn-user btn-block" 
                                        value="Procesar" id="btnRegistrarCuenta" name="btnRegistrarCuenta">
                                </div>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="recuperarContrasenna.php">Recuperar Contraseña</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.php">Iniciar Sesión</a>
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
    <!--<script src="../js/registrarClientes.js"></script>-->

<<<<<<< HEAD
=======
=======
        </div>
        </div>
    </div>
        <footer>
            <div class="container-fluid bg-light text-center py-3">
                <div class="text-center mt-3">
                    <div class="text-muted">Copyright &copy; FerreSoluciones 2025</div>       
                </div>
            </div>
        </footer>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../Scripts/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="../Scripts/comunes.js"></script>
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
</body>

</html>