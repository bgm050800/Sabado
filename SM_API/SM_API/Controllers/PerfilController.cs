using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SM_API.Entitites;
using SM_API.Interfaces;

namespace SM_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PerfilController(IConfiguration iConfiguration, IComunesModel iComunesModel) : ControllerBase
    {

        [HttpPut]
        [Route("ActualizarContrasena")]
        public async Task<IActionResult> ActualizarContrasena(Usuario ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var Contrasenna = iComunesModel.Encrypt(ent.Contrasenna!);
                var EsTemporal = false;
                var VigenciaTemporal = DateTime.Now;

                await context.ExecuteAsync("ActualizarContrasenna",
                new { ent.Consecutivo, Contrasenna, EsTemporal, VigenciaTemporal },
                commandType: System.Data.CommandType.StoredProcedure);

                resp.Codigo = 1;
                resp.Mensaje = "OK";
                resp.Contenido = true;
                return Ok(resp);
            }
        }

    }
}
