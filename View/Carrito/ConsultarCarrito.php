<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/CarritoController.php';

?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">

        <?php
            MostrarMenu();
        ?>

        <div class="body-wrapper">

            <?php
                MostrarHeader();
            ?>

            <div class="container-fluid">
                <div class="row">

                <div id="consultas" class="card">
                        <div class="card-body">

                        <h5 class="card-title fw-semibold mb-4">Mi Carrito</h5>

                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">Artículo</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Precio Unitario</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">

                                        <?php
                                            $datos = ConsultarCarrito();
                                            while($fila = mysqli_fetch_array($datos))
                                            {
                                                echo "<tr>";
<<<<<<< HEAD
                                                echo "<td>" . $fila["productoID"] . ' - '. $fila["nombre"] . "</td>";
=======
<<<<<<< HEAD
                                                echo "<td>" . $fila["productoID"] . ' - '. $fila["nombre"] . "</td>";
=======
                                                echo "<td>" . $fila["articuloID"] . ' - '. $fila["nombre"] . "</td>";
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                                echo "<td>" . $fila["cantidadDeseada"] . "</td>";
                                                echo "<td>¢ " . number_format($fila["totalUnitario"],2) . "</td>";
                                                echo "<td>¢ " . number_format($fila["total"],2) . "</td>";
                                                echo '<td>

                                                    <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
<<<<<<< HEAD
                                                            data-id=' . $fila["productoID"] . ' data-name="' . $fila["nombre"] . '">
=======
<<<<<<< HEAD
                                                            data-id=' . $fila["productoID"] . ' data-name="' . $fila["nombre"] . '">
=======
                                                            data-id=' . $fila["articuloID"] . ' data-name="' . $fila["nombre"] . '">
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                                            <i class="fa fa-trash" style="color:red; font-size: 1.6em;"></i>
                                                        </button>

                                                    </td>';
                                                echo "</tr>";   
                                            }
                                        ?>

                                    </tbody>
                                </table>
                            </div>

                            <br/><br/>

                            <div class="row">
                                <div class="col-lg-5">
                                    <p style="font-size:14pt; margin-top:2%;">El monto total a cancelar es: <b>¢ <?php echo number_format($_SESSION["TotalCarrito"],2) ?></b></p>
                                </div>
                                <div class="col-lg-7">
                                    <form action="" method="POST">
                                        <?php 
                                            if($_SESSION["TotalCarrito"] != "0")
                                            {
                                                echo '<button type="submit" id="btnPagarCarrito" name="btnPagarCarrito" class="btn btn-outline-primary" style="width:200px">
                                                    Comprar Artículos
                                                </button>';
                                            }
                                        ?>
                                    </form>
                                </div>
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
    <script src="../js/ConsultarCarrito.js"></script>

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: 700px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Confirmación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form action="" method="POST">
                    <div class="modal-body">
<<<<<<< HEAD
                        <input type="hidden" id="txtProductoID" name="txtProductoID">
=======
                        <input type="hidden" id="txtArticuloID" name="txtArticuloID">
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                        ¿Desea eliminar el siguiente artículo:<label id="lblNombre"></label> de su carrito?
                    </div>
                    <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Eliminar"
                        id="btnRemoverArticuloCarrito" name="btnRemoverArticuloCarrito">
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>
