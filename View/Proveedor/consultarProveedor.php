<?php 
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';
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

                    <div id="consultas" class="card">
                        <div class="card-body">

                            <h5 class="card-title fw-semibold mb-4">Proveedores de la Ferretería</h5>
                            <a href="RegistarProveedor.php" class="btn btn-warning fw-bold mb-4">
                                <i class="fa fa-plus me-2"></i> Registrar Proveedor
                            </a>
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">ID</th>
                                            <th scope="col">Cédula</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Teléfono</th>
                                            <th scope="col">Dirección</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Fecha Registro</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <?php
                                            $datos = ConsultarProveedores();
                                            while($fila = mysqli_fetch_array($datos))
                                            {
                                                echo "<tr>";
                                                echo "<td>" . $fila["proveedorID"] . "</td>";
                                                echo "<td>" . $fila["cedula"] . "</td>";
                                                echo "<td>" . $fila["nombre"] . "</td>";
                                                echo "<td>" . $fila["correo"] . "</td>";
                                                echo "<td>" . $fila["telefono"] . "</td>";
                                                echo "<td>" . $fila["direccion"] . "</td>";
                                                echo "<td>" . ($fila["estadoID"] == 1 ? 'Activo' : 'Inactivo') . "</td>";
                                                echo "<td>" . $fila["fechaRegistro"] . "</td>";
                                                echo '<td>
                                                        <a href="actualizarProveedor.php?id=' . $fila["proveedorID"] . '" class="btn">
                                                            <i class="fa fa-edit" style="color:#FFC107; font-size: 1.6em;"></i>
                                                        </a>
                                                        <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                            data-id="' . $fila["proveedorID"] . '" data-name="' . $fila["nombre"] . '">
                                                            <i class="fa fa-trash" style="color:black; font-size: 1.6em;"></i>
                                                        </button>
                                                      </td>';
                                                echo "</tr>";   
                                            }
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
    <script src="../js/ConsultarProveedores.js"></script>

    <!-- Modal para eliminar -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: 700px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Confirmación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form action="" method="POST">
                    <div class="modal-body">
                        <input type="hidden" id="txtProveedorID" name="txtProveedorID">
                        ¿Desea eliminar el proveedor <label id="lblNombre"></label> en el sistema de la ferretería?
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary" value="Procesar"
                            id="btnCambiarEstadoProveedor" name="btnCambiarEstadoProveedor">
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
