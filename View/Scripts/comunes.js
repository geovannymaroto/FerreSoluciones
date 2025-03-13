function ConsultarNombre()
{
    let identificacion = $("#txtIdentificacion").val();

    document.getElementById("txtNombre").value = "";
    
    if (identificacion.length >= 9) {
        $.ajax({
            url: 'https://apis.gometa.org/cedulas/' + identificacion,
            method: 'GET',
            success: function (data) {
                document.getElementById("txtNombre").value = data.nombre;     
            }
        });
    }
}
