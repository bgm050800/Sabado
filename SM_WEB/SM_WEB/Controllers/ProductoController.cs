using Microsoft.AspNetCore.Mvc;
using SM_WEB.Entities;
using SM_WEB.Interfaces;
using SM_WEB.Models;
using System.Text.Json;

namespace SM_WEB.Controllers
{
    [FiltroSesiones]
    public class ProductoController(IProductoModel iProductoModel) : Controller
    {
        [HttpGet]
        public IActionResult ConsultarProductos()
        {
            var respuesta = iProductoModel.ConsultarProductos();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new List<Producto>());
        }



        [HttpPost]
        public IActionResult CambiarEstadoProducto(Producto ent)
        {
            var respuesta = iProductoModel.CambiarEstadoProducto(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarProductos", "Producto");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }


    }
}
