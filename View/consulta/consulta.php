<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/casoEstudio/Controller/consultaController.php";
include_once $_SERVER["DOCUMENT_ROOT"] . "/casoEstudio/View/layoutInterno.php";

$controller = new consultaController();
?>

<!DOCTYPE html>
<html lang="es">

<?php PrintCss(); ?>

<body id="page-top">
    <div id="wrapper">
        <?php MenuNavegacion(); ?>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="container-fluid">

                    <hr>
                    <h3>Consultar Ejercicios</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Monto</th>
                                <th>Tipo de Ejercicio</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $datos = $controller->consultarEjercicios();

                                while ($row = mysqli_fetch_array($datos)) {
                                    echo "<tr>";
                                    echo "<td>" . $row["Fecha"] . "</td>";
                                    echo "<td>" . $row["Monto"] . "</td>";
                                    echo "<td>" . $row["TipoEjercicio"] . "</td>";
                                    echo "<td>" . $row["Nombre"] . "</td>";
                                    echo "</tr>";
                                }
                            
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php PrintFooter(); ?>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <?php PrintScript(); ?>
</body>
</html>
