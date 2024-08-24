 $(document).ready(function () {
        var table = new DataTable("#tabla-Productos", {
            language: {
                url: '//cdn.datatables.net/plug-ins/2.0.8/i18n/es-ES.json',
            },
            columnDefs: [{ type: 'string', target: [0] }]
        });
 });

$(document).on("click", ".Modales", function () {
  $("#IdProducto").val($(this).attr("data-id"));
  $("#NombreProducto").text($(this).attr("data-name"));
});