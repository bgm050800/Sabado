using System.Security.Claims;

namespace SM_API.Models
{
    public interface IRolesModel
    {
        bool EsAdministrador(ClaimsPrincipal User);
    }
}
