using Microsoft.AspNetCore.Mvc;
using SM_WEB.Entities;
using SM_WEB.Models;
using System.Text.Json;

namespace SM_WEB.Controllers
{
    public class PerfilController(IUsuarioModel iUsuarioModel, IPerfilModel iPerfilModel) : Controller
    {
        [HttpGet]
        public IActionResult ActualizarPerfilUsuario()
        {
            var consecutivo = HttpContext.Session.GetInt32("CONSECUTIVO"); 
            var respuesta = iUsuarioModel.ConsultarUsuario(consecutivo!.Value);

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new Usuario());
        }

        [HttpPost]
        public IActionResult ActualizarPerfilUsuario(Usuario ent)
        {
            var respuesta = iUsuarioModel.ActualizarUsuario(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("SalirSistema", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

        [HttpGet]
        public IActionResult CambiarContrasenna() 
        {
            return View();    
        }

        [HttpPost]
        public IActionResult CambiarContrasenna(Usuario ent)
        {
            ent.Consecutivo = HttpContext.Session.GetInt32("CONSECUTIVO")!.Value;
            if (ent.Contrasenna != ent.ContrasennaConfirmar)
            {
                ViewBag.msj = "Las contraseñas ingresadas no coinciden";
                return View();
            }

            var respuesta = iPerfilModel.ActualizarContrasena(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("SalirSistema", "Home");
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

    }
}
