using SM_WEB.Entities;
using SM_WEB.Interfaces;
using System.Net.Http.Headers;
namespace SM_WEB.Models
{
    public class PerfilModel(HttpClient http, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IPerfilModel
    {
        public Respuesta ActualizarContrasena(Usuario ent)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Perfil/ActualizarContrasena";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent body = JsonContent.Create(ent);
            var result = http.PutAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

    }
}
