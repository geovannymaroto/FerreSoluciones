<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/FerreSoluciones/Model/CarritoModel.php';

    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if(isset($_POST["btnRegistrarCarrito"]))
    {
        $productoID = $_POST["ID_producto"];
        $cantidad = $_POST["CANTIDAD"];
        
        $resultado = RegistrarCarritoModel($_SESSION["ClienteID"], $productoID, $cantidad);

        if($resultado == true)
        {
            echo "OK";
        }
        else
        {
            echo "ERROR";
        }
    }

    function ConsultarCarrito()
    {
        return ConsultarCarritoModel($_SESSION["ClienteID"]);
    }

    function ConsultarResumenCarrito()
    {
        $resultado = ConsultarResumenCarritoModel($_SESSION["ClienteID"]);
        
        if($resultado != null && $resultado -> num_rows > 0)
        {
            $datos = mysqli_fetch_array($resultado);
            $_SESSION["CantidadCarrito"] = $datos["Cantidad"];
            $_SESSION["TotalCarrito"] = $datos["Total"];
        }
        else
        {
            $_SESSION["CantidadCarrito"] = "0";
            $_SESSION["TotalCarrito"] = "0";
        }
    }

    if(isset($_POST["btnRemoverproductoCarrito"]))
    {
        $productoID = $_POST["txtproductoID"];
        $resultado = RemoverproductoCarritoModel($_SESSION["ClienteID"], $productoID);
    
        if($resultado == true)
        {
            header('location: ../../View/Carrito/consultarCarrito.php');
        }
        else
        {
            $_POST["txtMensaje"] = "No fue posible remover el artículo de su carrito";
        }
    }  
    
    if(isset($_POST["btnPagarCarrito"]))
    {
        $respuesta = PagarCarritoModel($_SESSION["ClienteID"]);

        if($respuesta == true)
        {
            header('location: ../../View/Login/home.php');
        }
        else
        {
            $_POST["txtMensaje"] = "No fue posible pagar su carrito";
        }
    }

    function ConsultarFacturas()
    {
        return ConsultarFacturasModel($_SESSION["ClienteID"]);
    }

    function ConsultarDetalleFactura($id)
    {
        return ConsultarDetalleFacturaModel($id);
    }    
    
?>

