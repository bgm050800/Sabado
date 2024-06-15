using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SM_API.Entitites;

namespace SM_API.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ErrorController : ControllerBase
    {
        [Route("CatchException")]
        public IActionResult CatchException()
        {
            var context = HttpContext.Features.Get<IExceptionHandlerFeature>();

            return Problem(detail: "", title: "");
        }
    }
}
