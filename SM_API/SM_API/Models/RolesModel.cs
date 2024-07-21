using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace SM_API.Models
{
    public class RolesModel : IRolesModel
    {
        public bool EsAdministrador(ClaimsPrincipal User)
        {
            var userRol = User.Claims.Select(Claim => new { Claim.Type, Claim.Value }).
                FirstOrDefault(x => x.Type == "IdRol")!.Value;

            return (userRol == "1" ? true : false);
        }

    }
}
