<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/View/layout.php';
<<<<<<< HEAD
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedoresController.php';
=======
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Controller/ProveedorController.php';
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

    $id = $_GET["id"];
    $datos = ConsultarProveedor($id);
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

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Actualizar Proveedor</h5>

                            <?php
                                if(isset($_POST["txtMensaje"]))
                                {
                                    echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                }
                            ?>

                            <form action="" method="POST">

<<<<<<< HEAD
                                <input type="hidden" id="txtproveedorID" name="txtProveedorID"value="<?php echo $datos["proveedorID"] ?>">
=======
                                <input type="hidden" id="txtProveedorID" name="txtProveedorID"value="<?php echo $datos["ProveedorID"] ?>">
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

                                <div class="mb-3">
                                    <label class="form-label">Cédula</label>
                                    <input type="text" class="form-control" id="txtCedula" name="txtCedula"
                                        value="<?php echo $datos["cedula"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" name="txtNombre"
                                        value="<?php echo $datos["nombre"] ?>">
                                </div>

                                <div class="mb-3">
<<<<<<< HEAD
=======
                                    <label class="form-label">Primer Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido1" name="txtApellido1"
                                        value="<?php echo $datos["apellido1"] ?>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Segundo Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido2" name="txtApellido2"
                                        value="<?php echo $datos["apellido2"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Rol</label>
                                    <select id="ddlRoles" name="ddlRoles" class="form-control">

                                        <?php
                                        $roles = ConsultarRoles();
                                        echo "<option value=''> Seleccione </option>";                                        
                                        While($fila = mysqli_fetch_array($roles))
                                        {
                                            if($fila["rolID"] == $datos["rolID"])
                                            {
                                                echo "<option selected value=" . $fila["rolID"] . ">" . $fila["nombreRol"] . "</option>";
                                            }
                                            else
                                            {
                                                echo "<option value=" . $fila["rolID"] . ">" . $fila["nombreRol"] . "</option>";
                                            }                                            
                                        }
                                    ?>

                                    </select>

                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Provincia</label>
                                    <select id="ddlProvincias" name="ddlProvincias" class="form-control">
                                        <?php
                                            $provincias = ConsultarProvincias();
                                            echo "<option value=''> Seleccione </option>";
                                            while($fila = mysqli_fetch_array($provincias)) 
                                            {
                                                if($fila["provinciaID"] == $datos["provinciaID"]) 
                                                {
                                                    echo "<option selected value=" . $fila["provinciaID"] . ">" . $fila["provincia"] . "</option>";
                                                } 
                                                else 
                                                {
                                                    echo "<option value=" . $fila["provinciaID"] . ">" . $fila["provincia"] . "</option>";
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Otras Señas</label>
                                    <input type="text" class="form-control" id="txtOtrasSenas" name="txtOtrasSenas"
                                        value="<?php echo $datos["otrasSenas"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Código Postal</label>
                                    <input type="text" class="form-control" id="txtCodigoPostal" name="txtCodigoPostal"
                                        value="<?php echo $datos["codigoPostal"] ?>">
                                </div>

                                <div class="mb-3">
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="txtCorreo" name="txtCorreo"
                                        value="<?php echo $datos["correo"] ?>">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Número de Teléfono</label>
                                    <input type="text" class="form-control" id="txtTelefono" name="txtTelefono"
                                        value="<?php echo $datos["telefono"] ?>">
                                </div>
<<<<<<< HEAD
                                <div class="mb-4">
                                    <label class="form-label">Direccion</label>
                                    <input type="text" class="form-control" id="txtDireccion" name="txtDireccion"
                                        value="<?php echo $datos["direccion"] ?>">
                                </div>
=======
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98

                                <input type="submit" class="btn btn-warning" value="Procesar" id="btnActualizarProveedor"
                                    name="btnActualizarProveedor">
                            </form>
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

</body>

</html>