using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SM_WEB.Entities;
using SM_WEB.Models;
using System.Diagnostics;
using System.Text.Json;

namespace SM_WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel, IComunModel iComunModel, IRolesModel iRolesModel) : Controller
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



        [FiltroSesiones]
        [HttpGet]
        public IActionResult Principal()
        {
            return View();
        }



        [FiltroSesiones]
        [HttpGet]
        public IActionResult SalirSistema()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index","Home");
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
            var roles = iRolesModel.ConsultarRoles();

            ViewBag.Roles = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)roles.Contenido!);

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)respuesta.Contenido!);
                return View(datos);
            }

            return View(new Usuario());
        }


    }
}
