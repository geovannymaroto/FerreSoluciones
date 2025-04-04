<?php
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
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Recuperar Contraseña</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                        placeholder="Correo" id="txtCorreo" name="txtCorreo">
                                        </div>
                                        <div class="text-center mt-3">
                                            <input type="submit" class="btn btn-danger btn-user btn-block" 
                                                value="Procesar" id="btnRecuperarCuenta" name="btnRecuperarCuenta">
                                        </div>
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="registrarCuenta.php">Crear una Cuenta</a>
                                    </div>
                                    <div class="text-center">
                                    <a class="small" href="login.php">Iniciar Sesión</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
</body>
</html>