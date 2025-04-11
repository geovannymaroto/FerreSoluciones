<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/LoginController.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/CarritoController.php';




if(isset($_SESSION["NombreCliente"]))
{
    ConsultarResumenCarrito();
}

function MostrarMenu()
{
    if (isset($_SESSION["NombreCliente"]) && $_SESSION["RolID"] == "1") {
        echo '       
                    <!-- para admins -->
                    <div class="container-menu-desktop" style="overflow-y: auto; max-height: 100vh;">
                        <div class="top-bar">
                            <div class="content-topbar flex-sb-m h-full container">
                                <div class="left-top-bar">
                                    Vista Administrador: ' . $_SESSION["NombreCliente"] . '
                                </div>

                            <div class="right-top-bar flex-w h-full">

                                <a href="../Cliente/consultarClientes.php" class="flex-c-m trans-04 p-lr-25">
                                    Clientes
                                </a>
                                <!-- Botón Clientes -->
                                <a href="../Productos/ConsultarProductos.php" class="flex-c-m trans-04 p-lr-25"> 
                                    Productos
                                </a>
                                <a href="../Proveedor/ConsultarProveedor.php" class="flex-c-m trans-04 p-lr-25">
                                    Proveedores
                                </a>

                            </div>
                        </div>
                    </div>';
    } else if (isset($_SESSION["NombreCliente"]) && $_SESSION["RolID"] == "2") {
        echo '       
                <!-- para clientes -->
                <div class="container-menu-desktop" style="overflow-y: auto; max-height: 100vh;">
                    <div class="top-bar">
                        <div class="content-topbar flex-sb-m h-full container">
                            <div class="left-top-bar">
                                Bienvenido/a: ' . $_SESSION["NombreCliente"] . '
                            </div>
                        </div>
                    </div>
                </div>';
    }
}


function MostrarHeader()
{
    $cliente = "Invitado";
    $cantidad = "0";
    $total = "0";

    if (isset($_SESSION["NombreCliente"])) 
    {
        $cliente = $_SESSION["NombreCliente"];
        $cantidad = $_SESSION["CantidadCarrito"];
        $total = $_SESSION["TotalCarrito"];
    }

    echo '
    <!-- Header -->
    <header style="position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; background-color: #fff; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
        <!-- Header desktop -->
        <div class="container-menu-desktop">
            <div class="wrap-menu-desktop">
                <nav class="limiter-menu-desktop container">
                    <!-- Logo desktop -->
                    <a href="../Login/Home.php" class="logo">
                        <img src="../images/FerreTech.png" alt="IMG-LOGO">
                    </a>
                    <!-- Menu desktop -->
                    <div class="menu-desktop">
                        <ul class="main-menu">';
if (isset($_SESSION["NombreCliente"])) {
    echo '
                            <li>
                                <a href="../Cliente/consultarPerfil.php">Mi Perfil</a>
                            </li>
                            <li>
                                <a href="../Cliente/cambiarAcceso.php">Seguridad</a>
                            </li>
                            <li>
                                <a href="../Proveedor/ConsultarProveedor.php">Proveedores</a>
                            </li>
                            <li>
                                <a href="../Carrito/ConsultarCarrito.php">Mi Carrito</a>
                            </li>
                            <li>
                                <a href="../Carrito/ConsultarFacturas.php">Mis Compras</a>
                            </li>
                            
                            <li>
                                <form action="" method="POST">
                                    <button type="submit" style="width:150px" id="btnCerrarSesion" name="btnCerrarSesion"
                                    class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar Sesión</button>
                                </form>
                            </li>';
} else {
    echo '
                            <li>
                                <a href="../Login/inicioSesion.php" style="width:150px"
                                            class="btn btn-outline-primary mx-3 mt-2 d-block">Iniciar Sesión</a>
                            </li>';
}
echo '
                        </ul>
                    </div>
                    <div class="wrap-icon-header flex-w flex-r-m">
                        <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="' . $cantidad . '">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <div style="margin-top: 80px;"></div>

    <div class="wrap-header-cart js-panel-cart">
        <div class="s-full js-hide-cart"></div>

        <div class="header-cart flex-col-l p-l-65 p-r-25">
            <div class="header-cart-title flex-w flex-sb-m p-b-8">
                <span class="mtext-103 cl2">
                    Su carrito
                </span>

                <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                    <i class="zmdi zmdi-close"></i>
                </div>
            </div>

            <div class="header-cart-content flex-w js-pscroll">
                <ul class="header-cart-wrapitem w-full">
                </ul>

                <div class="w-full">
                    <div class="header-cart-total w-full p-tb-40">
                        Total: ¢' . number_format($total, 2) . '
                    </div>

                    <div class="header-cart-buttons flex-w w-full">
                        <a href="../Carrito/consultarCarrito.php" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                            Ver Carrito
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>';
}


function ReferenciasCSS()
{
    echo '
            <head>
	            <meta charset="UTF-8">
	            <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta charset="utf-8">
                <title>Ferre Soluciones</title>
                <link rel="shortcut icon" type="image/png" href="../images/FerreTech.png" />
                <link rel="stylesheet" href="../css/proyecto.css" />
                <link rel="stylesheet" href="../css/styles.min.css" />
                <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.min.css" />
                <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
                <link rel="stylesheet" type="text/css" href="../css/material-design-iconic-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/icon-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animate.css">
                <link rel="stylesheet" type="text/css" href="../css/hamburgers.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animsition.min.css">
                <link rel="stylesheet" type="text/css" href="../css/select2.min.css">
                <link rel="stylesheet" type="text/css" href="../css/daterangepicker.css">
                <link rel="stylesheet" type="text/css" href="../css/slick.css">
                <link rel="stylesheet" type="text/css" href="../css/magnific-popup.css">
                <link rel="stylesheet" type="text/css" href="../css/perfect-scrollbar.css">
                <link rel="stylesheet" type="text/css" href="../css/util.css">
                <link rel="stylesheet" type="text/css" href="../css/main.css">
            </head>';
}

function ReferenciasJS()
{
    echo '
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.bundle.min.js"></script>
            <script src="../js/simplebar.js"></script>
            <script src="../js/sidebarmenu.js"></script>
            <script src="../js/app.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.all.min.js"></script>
        ';
}
