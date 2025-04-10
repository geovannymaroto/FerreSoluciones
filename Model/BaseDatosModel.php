<?php

    function AbrirBaseDatos()
    {
        return mysqli_connect("127.0.0.1:3306", "root", "", "ferresoluciones");
    }

    function CerrarBaseDatos($context)
    {
        mysqli_close($context);
    }

?>