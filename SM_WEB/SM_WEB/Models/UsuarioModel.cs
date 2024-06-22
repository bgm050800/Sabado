using SM_WEB.Entities;

namespace SM_WEB.Models
{
    public class UsuarioModel(HttpClient http, IConfiguration iConfiguration) : IUsuarioModel
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

    }
}