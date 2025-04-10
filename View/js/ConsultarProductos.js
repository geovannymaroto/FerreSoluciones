$(document).ready(function() {
<<<<<<< HEAD
=======

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
    $("#example").DataTable({
        language: {
            url: '../js/es-ES.json'
        },
<<<<<<< HEAD
        columnDefs: [{ type: "string", target: [0, 1, 2, 3, 4, 5, 6] }]
    });
});

$(document).on("click", "#btnOpenModal", function() {
    $("#txtProductoID").val($(this).attr('data-id'));
    $("#lblNombre").text($(this).attr('data-name'));
=======
        columnDefs: [{ type:"string", target: [0,1,2,3,4,5,6]}]
    });

});

$(document).on("click", "#btnOpenModal", function() {
    $("#txtProductoID").val($(this).attr('data-id')); 
    $("#lblNombre").text($(this).attr('data-name')); 
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
});
