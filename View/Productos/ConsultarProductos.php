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
                    <div id="consultas" class="card shadow">
                        <div class="card-body">

                            <h5 class="card-title fw-semibold mb-4">Consulta de Productos Ferreteros</h5>

                            <a href="RegistarProductos.php" class="btn btn-warning fw-bold mb-4">
                                <i class="fa fa-plus me-2"></i> Registrar Producto
                            </a>

                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-warning border-0">
                                            <th scope="col">#</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Imagen</th>
                                            <th scope="col">Categoría</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <?php
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                            $datos = Consultarproductos();
                                            if ($datos != null && $datos->num_rows > 0) {
                                            while ($fila = mysqli_fetch_array($datos)) {
                                                echo "<tr>";
                                                echo "<td>" . $fila["productoID"] . "</td>";
                                                echo "<td>" . $fila["nombre"] . "</td>";
                                                echo "<td>₡ " . number_format($fila["precio"], 2) . "</td>";
                                                echo "<td>" . $fila["cantidad"] . "</td>";
                                                echo "<td><img width='125' height='100' src='" . $fila["imagen"] . "' alt='Imagen'></td>";
                                                echo "<td>" . $fila["nombreCategoria"] . "</td>";
                                                echo '<td>
                                                        <a href="ActualizarProductos.php?id=' . $fila["productoID"] . '" class="btn">
                                                            <i class="fa fa-edit" style="color:#FFC107; font-size: 1.6em;"></i>
                                                        </a>

                                                        <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                            data-id="' . $fila["productoID"] . '" data-name="' . $fila["nombre"] . '">
                                                            <i class="fa fa-trash" style="color:black; font-size: 1.6em;"></i>
                                                        </button>
                                                    </td>';
                                                echo "</tr>";
                                            }
                                        }else{

                                            }
<<<<<<< HEAD
=======
=======
                                        $datos = Consultarproductos();
                                        while ($fila = mysqli_fetch_array($datos)) {
                                            echo "<tr>";
                                            echo "<td>" . $fila["productoID"] . "</td>";
                                            echo "<td>" . $fila["nombre"] . "</td>";
                                            echo "<td>₡ " . number_format($fila["precio"], 2) . "</td>";
                                            echo "<td>" . $fila["cantidad"] . "</td>";
                                            echo "<td><img width='125' height='100' src='" . $fila["imagen"] . "' alt='Imagen'></td>";
                                            echo "<td>" . $fila["nombreCategoria"] . "</td>";
                                            echo '<td>
                                                    <a href="ActualizarProductos.php?id=' . $fila["productoID"] . '" class="btn">
                                                        <i class="fa fa-edit" style="color:#FFC107; font-size: 1.6em;"></i>
                                                    </a>

                                                    <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                        data-id="' . $fila["productoID"] . '" data-name="' . $fila["nombre"] . '">
                                                        <i class="fa fa-trash" style="color:black; font-size: 1.6em;"></i>
                                                    </button>
                                                  </td>';
                                            echo "</tr>";
                                        }
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                        ?>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php ReferenciasJS(); ?>
    <script src="../js/Consultarproductos.js"></script>

    <!-- Modal para eliminar -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: 700px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Confirmación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <form action="" method="POST">
                    <div class="modal-body">
<<<<<<< HEAD
                        <input type="hidden" id="txtProductoID" name="txtProductoID">
                        ¿Desea eliminar el producto: <label id="lblNombre" class="fw-bold text-danger"></label>?
=======
<<<<<<< HEAD
                        <input type="hidden" id="txtProductoID" name="txtProductoID">
                        ¿Desea eliminar el producto: <label id="lblNombre" class="fw-bold text-danger"></label>?
=======
                        <input type="hidden" id="txtproductoID" name="txtproductoID">
                        ¿Desea eliminar el artículo: <label id="lblNombre" class="fw-bold text-danger"></label>?
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-warning fw-bold" value="Eliminar"
                            id="btnEliminarproducto" name="btnEliminarproducto">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
