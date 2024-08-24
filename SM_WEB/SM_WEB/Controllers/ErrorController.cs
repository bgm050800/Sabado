using Microsoft.AspNetCore.Mvc;

namespace SM_WEB.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult MostrarError()
        {
            return View("Error");
        }
    }
}
