using Microsoft.AspNetCore.Mvc;
using SM_WEB.Entities;
using SM_WEB.Models;
using System.Diagnostics;

namespace SM_WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel) : Controller
    {
        //Abrir vistas y son llamados que vienen de un hipervinculo
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        //Realizar las acciones de las vistas que abrimos
        [HttpPost]
        public IActionResult Index(Usuario ent)
        {
            iUsuarioModel.IniciarSesion(ent);
            return View();
        }

    }
}
