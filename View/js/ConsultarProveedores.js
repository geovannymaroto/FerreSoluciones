$(document).ready(function () {
    $("#example").DataTable({
        language: {
            url: '../js/es-ES.json'
        },
        columnDefs: [{ type: "string", targetS: [0, 1, 2, 3, 4, 5, 6, 7] }]
    });
});

$(document).on("click", "#btnOpenModal", function () {
    $("#txtProveedorID").val($(this).attr('data-id'));
    $("#lblNombre").text($(this).attr('data-name'));
});
