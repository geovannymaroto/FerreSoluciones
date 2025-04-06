$(document).ready(function() {

    $("#example").DataTable({
        language: {
            url: '../js/es-ES.json'
        },
        columnDefs: [{ type:"string", target: [0,1,2,3,4,5,6]}]
    });

});

$(document).on("click", "#btnOpenModal", function() {
    $("#txtArticuloID").val($(this).attr('data-id')); 
    $("#lblNombre").text($(this).attr('data-name')); 
});
