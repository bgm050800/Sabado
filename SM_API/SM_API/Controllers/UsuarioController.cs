using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SM_API.Entitites;

namespace SM_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        [HttpPost]
        [Route("RegistrarUsuario")]
        public async Task<IActionResult> RegistrarUsuario(Usuario ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection("Server=EDUARDO; Database=SABADO_BD; Trusted_Connection=True; TrustServerCertificate=True;"))
            {
                var result = await context.ExecuteAsync("RegistrarUsuario", 
                    new { ent.Identificacion, ent.Correo, ent.Contrasenna, ent.Nombre }, 
                    commandType: System.Data.CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "La información del usuario ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPost]
        [Route("IniciarSesion")]
        public async Task<IActionResult> IniciarSesion(Usuario ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection("Server=EDUARDO; Database=SABADO_BD; Trusted_Connection=True; TrustServerCertificate=True;"))
            {
                var result = await context.QueryAsync<Usuario>("IniciarSesion",
                    new { ent.Correo, ent.Contrasenna },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "La información del usuario no se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

    }
}
