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

        [HttpPost]
        public ActionResult PagarCarrito()
        {
            var carritoActual = iCarritoModel.ConsultarCarrito();
            var datos = JsonSerializer.Deserialize<List<Carrito>>((JsonElement)carritoActual.Contenido!);

            var existencias = iCarritoModel.ValidarExistencias();

            if (existencias.Codigo == 1)
            {
                var respuesta = iCarritoModel.PagarCarrito();

                if (respuesta.Codigo == 1)
                {
                    if (carritoActual.Codigo == 1)
                    {

                        HttpContext.Session.SetString("SubTotal", datos!.Sum(x => x.SubTotal).ToString());
                        HttpContext.Session.SetString("Cantidad", datos!.Sum(x => x.Cantidad).ToString());
                        HttpContext.Session.SetString("Total", datos!.Sum(x => x.Total).ToString());
                    }
                    else
                    {
                        HttpContext.Session.SetString("SubTotal", "0");
                        HttpContext.Session.SetString("Cantidad", "0");
                        HttpContext.Session.SetString("Total", "0");
                    }

                    return RedirectToAction("ConsultarFacturas", "Carrito");
                }
                else
                {
                    ViewBag.msj = respuesta.Mensaje;
                    return View("ConsultarCarrito", datos);
                }
            }
            else
            {
                ViewBag.msj = existencias.Mensaje;
                return View("ConsultarCarrito", datos);
            }
        }

        [HttpGet]
        public ActionResult ConsultarFacturas()
        {
            return View();
        }

    }
}
