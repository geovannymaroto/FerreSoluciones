<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProductosController.php';
    //include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/CarritoController.php';
?>

<!DOCTYPE html>
<html lang="es">

<?php
    ReferenciasCSS();
?>

<body class="animsition">

	<?php
        MostrarMenu();
    ?>

	<?php
        MostrarHeader();
    ?>

<!-- PRODUCTOS DE FERRETERÍA -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5 text-center">
                <br/><br/>
                CATÁLOGO DE PRODUCTOS DE FERRETERÍA
            </h3>
        </div>

		<br/><br/>

        <div class="row"> 
            <?php
                $Productos = ConsultarProductos();
                while ($fila = mysqli_fetch_array($Productos)) {
                    echo '
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <img class="card-img-top" src="' . $fila["imagen"] . '" style="width:175px; height:150px; margin-top:20px">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">' . $fila["nombre"] . '</h5>
                                
                                Unidades disponibles: ' . $fila["cantidad"] . ' <br/>
                                Precio: ¢ ' . number_format($fila["precio"], 2) . '

                                <br/>';

                                if (isset($_SESSION["NombreCliente"])) {
                                    if ($fila["cantidad"] > 0) {
                                        echo '
                                        <div class="row mt-3">
                                            <div class="col-6">
                                                <input id="' . $fila["articuloID"] . '" type="number" class="form-control text-center" 
                                                onkeypress="return false;" value="0" min="1" max="' . $fila["cantidad"] . '">
                                            </div>
                                            <div class="col-6">
                                                <a onclick="RegistrarCarritoJS(' . $fila["articuloID"] . ', ' . $fila["cantidad"] . ');" 
                                                class="btn btn-warning w-100 fw-bold">+ Añadir</a>
                                            </div>
                                        </div>';
                                    } else {
                                        echo '
                                        <div class="row mt-3">
                                            <div class="col-12 text-center">
                                                <p class="text-danger fw-bold">AGOTADO</p>
                                            </div>
                                        </div>';
                                    }
                                }

                                echo '</div>
                        </div>
                    </div>';
                }
            ?>
        </div>
    </div>
</section> 

<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
        <h4 class="stext-301 cl0 p-b-30">
            Grupo 
        </h4>
        <p>
            Sebastian Castro Alfaro
        </p>
    </div>
</footer>

<!-- Scripts -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/animsition.min.js"></script>
<script src="../js/popper.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/select2.min.js"></script>
<script src="../js/moment.min.js"></script>
<script src="../js/daterangepicker.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/slick-custom.js"></script>
<script src="../js/parallax100.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/isotope.pkgd.min.js"></script>
<script src="../js/sweetalert.min.js"></script>
<script src="../js/perfect-scrollbar.min.js"></script>
<script src="../js/main.js"></script>

<script src="../js/Comunes.js"></script>
<script src="../js/RegistrarCarrito.js"></script>

</body>

</html>
