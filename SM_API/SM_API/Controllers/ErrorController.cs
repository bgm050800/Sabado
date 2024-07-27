using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

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
            return Problem(detail: context!.Error.Message, title: context.Path);
        }
    }
}
