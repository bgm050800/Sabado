using Microsoft.Extensions.Configuration;
using SM_WEB.Entities;
using static System.Net.WebRequestMethods;
using System.Net.Http.Headers;
using SM_WEB.Interfaces;
namespace SM_WEB.Models
{
    public class RolesModel(HttpClient http, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IRolesModel
    {
        public Respuesta ConsultarRoles()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Rol/ConsultarRoles";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = http.GetAsync(url).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

    }
}
