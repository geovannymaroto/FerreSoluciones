$(document).ready(function() {
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
    $("#example").DataTable({
        language: {
            url: '../js/es-ES.json'
        },
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
        columnDefs: [{ type: "string", target: [0, 1, 2, 3, 4, 5, 6] }]
    });
});

$(document).on("click", "#btnOpenModal", function() {
    $("#txtProductoID").val($(this).attr('data-id'));
    $("#lblNombre").text($(this).attr('data-name'));
<<<<<<< HEAD
=======
=======
        columnDefs: [{ type:"string", target: [0,1,2,3,4,5,6]}]
    });

});

$(document).on("click", "#btnOpenModal", function() {
    $("#txtProductoID").val($(this).attr('data-id')); 
    $("#lblNombre").text($(this).attr('data-name')); 
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
>>>>>>> 2951a02a3f768bbb53a7ae38a4574942d6db5d98
});
