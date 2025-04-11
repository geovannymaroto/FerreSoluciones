<?php 
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
<<<<<<< HEAD
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';
=======
<<<<<<< HEAD
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';
=======
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedorController.php';
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
?>

<!doctype html>
<html lang="es">

<<<<<<< HEAD
<?php ReferenciasCSS(); ?>
=======
<<<<<<< HEAD
<?php ReferenciasCSS(); ?>
=======
<?php
    ReferenciasCSS();
?>
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed"> 

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
        <?php MostrarMenu(); ?>

        <div class="body-wrapper">
        <?php MostrarHeader(); ?> 
<<<<<<< HEAD
=======
=======
        <?php
            MostrarMenu();
        ?>

        <div class="body-wrapper">
        <?php
            MostrarHeader();
        ?> 
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
            <div class="container-fluid">
                <div class="row">

                    <div id="consultas" class="card">
                        <div class="card-body">

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                            <h5 class="card-title fw-semibold mb-4">Proveedores de la Ferretería</h5>
                            <a href="RegistarProveedor.php" class="btn btn-warning fw-bold mb-4">
                                <i class="fa fa-plus me-2"></i> Registrar Proveedor
                            </a>
<<<<<<< HEAD
=======
=======
                            <h5 class="card-title fw-semibold mb-4">Proveedors de la Ferretería</h5>
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">ID</th>
                                            <th scope="col">Cédula</th>
                                            <th scope="col">Nombre</th>
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                            <th scope="col">Correo</th>
                                            <th scope="col">Teléfono</th>
                                            <th scope="col">Dirección</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Fecha Registro</th>
<<<<<<< HEAD
=======
=======
                                            <th scope="col">Apellido</th>
                                            <th scope="col">Apellido2</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Rol</th>
                                            <th scope="col">Fecha Registro</th>
                                            <th scope="col">Provincia</th>
                                            <th scope="col">Dirección</th>
                                            <th scope="col">Código Postal</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Teléfono</th>
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <?php
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
<<<<<<< HEAD
=======
=======
                                            $datos = ConsultarProveedors();
                                            while($fila = mysqli_fetch_array($datos))
                                            {
                                                echo "<tr>";
                                                echo "<td>" . $fila["ProveedorID"] . "</td>";
                                                echo "<td>" . $fila["cedula"] . "</td>";
                                                echo "<td>" . $fila["nombre"] . "</td>";
                                                echo "<td>" . $fila["apellido1"] . "</td>";
                                                echo "<td>" . $fila["apellido2"] . "</td>";
                                                echo "<td>" . $fila["DescripcionActivo"] . "</td>";
                                                echo "<td>" . $fila["nombreRol"] . "</td>";
                                                echo "<td>" . $fila["fechaRegistro"] . "</td>";
                                                echo "<td>" . $fila["nombreProvincia"] . "</td>";
                                                echo "<td>" . $fila["otrasSenas"] . "</td>";
                                                echo "<td>" . $fila["codigoPostal"] . "</td>";
                                                echo "<td>" . $fila["correo"] . "</td>";
                                                echo "<td>" . $fila["telefono"] . "</td>";
                                                echo '<td>
                                                        <a href="actualizarProveedor.php?id=' . $fila["ProveedorID"] . '" class="btn">
                                                            <i class="fa fa-edit" style="color:#FFC107; font-size: 1.6em;"></i>
                                                        </a>
                                                        <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                            data-id=' . $fila["ProveedorID"] . ' data-name="' . $fila["nombre"] . '">
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    <?php ReferenciasJS(); ?>
    <script src="../js/ConsultarProveedores.js"></script>

    <!-- Modal para eliminar -->
<<<<<<< HEAD
=======
=======
    <?php
        ReferenciasJS();
    ?>
    <script src="../js/ConsultarProveedors.js"></script>

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
<<<<<<< HEAD
                        ¿Desea eliminar el proveedor <label id="lblNombre"></label> en el sistema de la ferretería?
=======
<<<<<<< HEAD
                        ¿Desea eliminar el proveedor <label id="lblNombre"></label> en el sistema de la ferretería?
=======
                        ¿Desea cambiar el estado del Proveedor <label id="lblNombre"></label> en el sistema de la ferretería?
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
</html>
