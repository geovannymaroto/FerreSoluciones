<?php
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98


include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProductosController.php';


$id = $_GET["id"];
$datos = ConsultarProducto($id);

?>


<<<<<<< HEAD
=======
=======
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProductosController.php';

$id = $_GET["id"];
$datos = ConsultarProducto($id);
?>

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
                            <h5 class="card-title fw-semibold mb-4">Actualizar Producto Ferretero</h5>

                            <?php
                            if (isset($_POST["txtMensaje"])) {
                                echo '<div class="alert alert-info text-center">' . $_POST["txtMensaje"] . '</div>';
                            }
                            ?>

                            <form action="" method="POST" enctype="multipart/form-data">
<<<<<<< HEAD
                                <input type="hidden" id="txtProductoID" name="txtProductoID" value="<?php echo $datos["productoID"] ?>">
=======
<<<<<<< HEAD
                                <input type="hidden" id="txtProductoID" name="txtProductoID" value="<?php echo $datos["productoID"] ?>">
=======
                                <input type="hidden" id="txtproductoID" name="txtproductoID" value="<?php echo $datos["productoID"] ?>">
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

                                <div class="mb-3">
                                    <label class="form-label">Nombre del producto</label>
                                    <input type="text" class="form-control" id="txtNombre" name="txtNombre" value="<?php echo $datos["nombre"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Precio (₡)</label>
                                    <input type="text" class="form-control" id="txtPrecio" maxlength="8"
                                           onkeypress="return SoloNumeros(event)"
                                           name="txtPrecio" value="<?php echo $datos["precio"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Cantidad disponible</label>
                                    <input type="text" class="form-control" id="txtCantidad" maxlength="3"
                                           onkeypress="return SoloNumeros(event)"
                                           name="txtCantidad" value="<?php echo $datos["cantidad"] ?>">
                                </div>

                                <div class="mb-4 row">
                                    <div class="col-10">
                                        <label class="form-label">Imagen del producto</label>
                                        <input type="file" class="form-control" id="txtImagen" name="txtImagen"
                                               accept="image/png, image/jpg, image/jpeg">
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <img width='175' height='150' src="<?php echo $datos["imagen"] ?>" class="img-thumbnail">
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Categoría</label>
                                    <select id="ddlCategorias" name="ddlCategorias" class="form-control" required>
                                        <?php
                                            $categorias = ConsultarCategorias();
                                            echo "<option value=''> Seleccione </option>";
                                            while($fila = mysqli_fetch_array($categorias)) 
                                            {
                                                if($fila["categoriaID"] == $datos["categoriaID"]) 
                                                {
                                                    echo "<option selected value=" . $fila["categoriaID"] . ">" . $fila["nombre"] . "</option>";
                                                } 
                                                else 
                                                {
                                                    echo "<option value=" . $fila["categoriaID"] . ">" . $fila["nombre"] . "</option>";
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>

<<<<<<< HEAD
                                <input type="submit" class="btn btn-warning fw-bold" value="Actualizar Producto" id="btnActualizarProducto"
                                       name="btnActualizarProducto">
=======
<<<<<<< HEAD
                                <input type="submit" class="btn btn-warning fw-bold" value="Actualizar Producto" id="btnActualizarProducto"
                                       name="btnActualizarProducto">
=======
                                <input type="submit" class="btn btn-warning fw-bold" value="Actualizar Producto" id="btnActualizarproducto"
                                       name="btnActualizarproducto">
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
