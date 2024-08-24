using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using SM_API.Entitites;
using SM_API.Interfaces;
using SM_API.Models;

namespace SM_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController(IConfiguration iConfiguration, IComunesModel iComunesModel) : ControllerBase
    {

        [Authorize]
        [HttpGet]
        [Route("ConsultarProductos")]
        public async Task<IActionResult> ConsultarProductos()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Producto>("ConsultarProductos",
                    new { },
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
                    resp.Mensaje = "No hay productos registrados en este momento.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpPut]
        [Route("CambiarEstadoProducto")]
        public async Task<IActionResult> CambiarEstadoProducto(Producto ent)
        {
            if (!iComunesModel.EsAdministrador(User))
                return StatusCode(403);

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CambiarEstadoProducto",
                    new { ent.IdProducto },
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
                    resp.Mensaje = "El estado del producto no se pudo actualizar";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

    }
}
