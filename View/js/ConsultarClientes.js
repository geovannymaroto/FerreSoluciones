$(document).ready(function() {

    $("#example").DataTable({
        language: {
            url: '../js/es-ES.json'
        },
<<<<<<< HEAD
        columnDefs: [{ type:"string", target: [0,1,2,3,4,5,6,7,8,9,10,11,12]}]
=======
        columnDefs: [{ type:"string", target: [0,1,2,3,4,5,6,7,8,9,10,11,12,13]}]
>>>>>>> 3270c3147b108942e1bdd2561c6e80348ca53357
    });

});

$(document).on("click", "#btnOpenModal", function(){

    $("#txtClienteID").val($(this).attr('data-id'));
    $("#lblNombre").text($(this).attr('data-name'));

});