<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProductosController.php';
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

                            <h5 class="card-title fw-semibold mb-4">Registrar Producto Ferretero</h5>

                            <a href="Consultarproductos.php" class="btn btn-warning fw-bold mb-4">
                                <i class="fa fa-wrench me-2"></i> Consultar Productos
                            </a>

                            <?php
                                if (isset($_POST["txtMensaje"])) {
                                    echo '<div class="alert alert-info text-center">' . $_POST["txtMensaje"] . '</div>';
                                }
                            ?>

                            <form action="" method="POST" enctype="multipart/form-data">

                                <div class="mb-3">
                                    <label class="form-label">Nombre del producto</label>
                                    <input type="text" class="form-control" required id="txtNombre" name="txtNombre">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Precio (₡)</label>
                                    <input type="text" class="form-control" required id="txtPrecio" name="txtPrecio"
                                           maxlength="8" onkeypress="return SoloNumeros(event)">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Cantidad disponible</label>
                                    <input type="text" class="form-control" required id="txtCantidad" name="txtCantidad"
                                           maxlength="3" onkeypress="return SoloNumeros(event)">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Imagen del producto</label>
                                    <input type="file" class="form-control" required id="txtImagen" name="txtImagen"
                                           accept="image/png, image/jpg, image/jpeg">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Categoría</label>
                                    <select id="ddlCategorias" name="ddlCategorias" class="form-control" required>
                                        <option value=''>Seleccione una categoría</option>
                                        <?php
                                            $categorias = ConsultarCategorias();
                                            while ($fila = mysqli_fetch_array($categorias)) {
                                                echo "<option value='{$fila["categoriaID"]}'>{$fila["nombre"]}</option>";
                                            }
                                        ?>
                                    </select>
                                </div>

                                <input type="submit" class="btn btn-warning fw-bold" value="Registrar Producto"
                                       id="btnRegistrarproducto" name="btnRegistrarproducto">
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
