<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . "/FerreSoluciones/Controller/LoginController.php";
    include_once $_SERVER["DOCUMENT_ROOT"] . "/FerreSoluciones/View/layoutInterno.php";
    
?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ferresoluciones</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../Styles/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
  
    <body class="d-flex flex-column min-vh-100">
        <div class="container MargenSuperior">
            <div class="row justify-content-center">
                <div class="col-xl-9 col-lg-12 col-md-9">
                    <div class="card o-hidden border-9 shadow-lg my-5">
                        <div class="card-body p-6">
                            <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <div class="p-5">

                                            <div class="text-center">
                                                <h1 class="h1 text-gray-900 mb-8">FerreSoluciones</h1>
                                            </div>

                                            <br>
                                            
                                            <?php
                                                if(isset($_POST["Message"]))
                                                {
                                                echo '<div class="alert alert-warning Mensajes">' . $_POST["Message"] . '</div>';                                   
                                                }
                                            ?>
                                            <form action="" method="POST" class="user">
                                                <div class="form-group">
                                                    <input type="text" class="form-control form-control-user"
                                                        id="txtIdentificacion" name="txtIdentificacion"
                                                        placeholder="Identificación" required>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user"
                                                        id="txtContrasenna" name="txtContrasenna" 
                                                        placeholder="Contraseña" required>
                                                        
                                                </div>
                                                <br>
                                                <br>
                                                <input type="submit" class="btn btn-warning btn-user btn-block" value="Procesar"
                                                id="btnIniciarSesion" name="btnIniciarSesion" >
                                            </form>

                                            <hr>
                                        
                                            <div class="text-center">
                                                <a class="small" href="recuperarContrasenna.php" style="color: #dcc107; text-decoration: bold;">Recuperar Contraseña</a>
                                            </div>

                                            <div class="text-center">
                                                <a class="small" href="registrarCuenta.php" style="color: #dcc107; text-decoration: bold;">Crear una Cuenta</a>
                                            </div>

                                        </div>
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
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                       
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../Scripts/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    </body>
</html>