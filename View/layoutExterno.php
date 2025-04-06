<?php
    
    function ReferenciasCSS()
    {
        echo '
            <head>
	            <meta charset="UTF-8">
	            <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta charset="utf-8">
                <title>Tienda Ambiente</title>
                <link rel="shortcut icon" type="image/png" href="../images/FerreTech.png" />
                <link rel="stylesheet" href="../css/proyecto.css" />
                <link rel="stylesheet" href="../css/styles.min.css" />
                <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.min.css" />
                <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
                <link rel="stylesheet" type="text/css" href="../css/material-design-iconic-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/icon-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animate.css">
                <link rel="stylesheet" type="text/css" href="../css/hamburgers.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animsition.min.css">
                <link rel="stylesheet" type="text/css" href="../css/select2.min.css">
                <link rel="stylesheet" type="text/css" href="../css/daterangepicker.css">
                <link rel="stylesheet" type="text/css" href="../css/slick.css">
                <link rel="stylesheet" type="text/css" href="../css/magnific-popup.css">
                <link rel="stylesheet" type="text/css" href="../css/perfect-scrollbar.css">
                <link rel="stylesheet" type="text/css" href="../css/util.css">
                <link rel="stylesheet" type="text/css" href="../css/main.css">
            </head>';
    }

    function ReferenciasJS()
    {
        echo '
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.bundle.min.js"></script>
            <script src="../js/simplebar.js"></script>
            <script src="../js/sidebarmenu.js"></script>
            <script src="../js/app.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.all.min.js"></script>
        ';
    }

?>