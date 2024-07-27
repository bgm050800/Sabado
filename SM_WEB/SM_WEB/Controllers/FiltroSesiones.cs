using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace SM_WEB.Controllers
{
    public class FiltroSesiones : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("TOKEN") == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "controller","Home" },
                    { "action","Index"}
                });
            }

            base.OnActionExecuting(context);
        }
    }
}
