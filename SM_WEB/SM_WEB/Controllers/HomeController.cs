using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SM_WEB.Entities;
using SM_WEB.Interfaces;
using SM_WEB.Models;
using System.Diagnostics;
using System.Text.Json;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SM_WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel, 
                                IComunModel iComunModel, 
                                IRolesModel iRolesModel, 
                                IProductoModel iProductoModel, 
                                ICarritoModel iCarritoModel) : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);
            var respuesta = iUsuarioModel.IniciarSesion(ent);

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)respuesta.Contenido!);

                if (datos!.EsTemporal)
                {
                    if (datos!.VigenciaTemporal < DateTime.Now)
                    {
                        ViewBag.msj = "Su contraseña temporal ha caducado";
                        return View();
                    }
                }

                HttpContext.Session.SetString("TOKEN", datos!.Token!);
                HttpContext.Session.SetString("NOMBRE", datos!.Nombre!);
                HttpContext.Session.SetInt32("ROL", datos!.IdRol);
                HttpContext.Session.SetInt32("CONSECUTIVO", datos!.Consecutivo);
                return RedirectToAction("Principal", "Home");
            }
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }



        [HttpGet]
        public IActionResult RegistrarUsuario()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarUsuario(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);
            var respuesta = iUsuarioModel.RegistrarUsuario(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("Index", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }



        [HttpGet]
        public IActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RecuperarAcceso(Usuario ent)
        {
            var respuesta = iUsuarioModel.RecuperarAcceso(ent.Identificacion!);

            if (respuesta.Codigo == 1)
                return RedirectToAction("Index", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }



        [FiltroSesiones]
        [HttpGet]
        public IActionResult Principal()
        {
            var carritoActual = iCarritoModel.ConsultarCarrito();
            if (carritoActual.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Carrito>>((JsonElement)carritoActual.Contenido!);
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

            var respuesta = iProductoModel.ConsultarProductos();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new List<Producto>());
        }



        [FiltroSesiones]
        [HttpGet]
        public IActionResult SalirSistema()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }



        [FiltroSesiones]
        [HttpPost]
        public IActionResult CambiarEstadoUsuario(Usuario ent)
        {
            var respuesta = iUsuarioModel.CambiarEstadoUsuario(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarUsuarios", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }



        [FiltroSesiones]
        [HttpGet]
        public IActionResult ConsultarUsuarios()
        {
            var respuesta = iUsuarioModel.ConsultarUsuarios();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Usuario>>((JsonElement)respuesta.Contenido!);
                return View(datos!.Where(x => x.Consecutivo != HttpContext.Session.GetInt32("CONSECUTIVO")).ToList());
            }

            return View(new List<Usuario>());
        }
      


        [FiltroSesiones]
        [HttpGet]
        public IActionResult ActualizarUsuario(int q)
        {
            var respuesta = iUsuarioModel.ConsultarUsuario(q);
            CargarViewBagRoles();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new Usuario());
        }

        [FiltroSesiones]
        [HttpPost]
        public IActionResult ActualizarUsuario(Usuario ent)
        {
            var respuesta = iUsuarioModel.ActualizarUsuario(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarUsuarios", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                CargarViewBagRoles();
                return View();
            }
        }

        [FiltroSesiones]
        [HttpPost]
        public IActionResult RegistrarCarrito(int IdProducto, int Cantidad)
        {
            var ent = new Carrito();
            ent.ConsecutivoUsuario = HttpContext.Session.GetInt32("CONSECUTIVO")!.Value;
            ent.IdProducto = IdProducto;
            ent.Cantidad = Cantidad;

            iCarritoModel.RegistrarCarrito(ent);
            return Json("OK");
        }

        private void CargarViewBagRoles()
        {
            var roles = iRolesModel.ConsultarRoles();
            ViewBag.Roles = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)roles.Contenido!);
        }


    }
}
