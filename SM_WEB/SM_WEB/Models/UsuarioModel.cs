using SM_WEB.Entities;
using System.Net.Http.Headers;

namespace SM_WEB.Models
{
    public class UsuarioModel(HttpClient http, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IUsuarioModel
    {
        public Respuesta RegistrarUsuario(Usuario ent)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/RegistrarUsuario";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta IniciarSesion(Usuario ent)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/IniciarSesion";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta ConsultarUsuarios()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/ConsultarUsuarios";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer",token);
            var result = http.GetAsync(url).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta ConsultarUsuario(int Consecutivo)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/ConsultarUsuario?Consecutivo=" + Consecutivo;
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