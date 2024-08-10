﻿using System.Security.Claims;

namespace SM_API.Interfaces
{
    public interface IComunesModel
    {
        bool EsAdministrador(ClaimsPrincipal User);
        string GenerarCodigo();
        string Encrypt(string texto);
        void EnviarCorreo(string destino, string asunto, string contenido);
    }
}
