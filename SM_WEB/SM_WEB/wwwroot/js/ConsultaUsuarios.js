﻿ $(document).ready(function () {
        var table = new DataTable("#tabla-Usuarios", {
            language: {
                url: '//cdn.datatables.net/plug-ins/2.0.8/i18n/es-ES.json',
            },
            columnDefs: [{ type: 'string', target: [0] }]
        });
    });