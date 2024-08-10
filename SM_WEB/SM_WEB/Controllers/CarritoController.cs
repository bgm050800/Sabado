using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SM_WEB.Entities;
using SM_WEB.Interfaces;
using SM_WEB.Models;
using System.Text.Json;

namespace SM_WEB.Controllers
{
    public class CarritoController(ICarritoModel iCarritoModel) : Controller
    {
        [HttpGet]
        public ActionResult ConsultarCarrito()
        {
            var respuesta = iCarritoModel.ConsultarCarrito();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Carrito>>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new List<Carrito>());
        }
    }
}
