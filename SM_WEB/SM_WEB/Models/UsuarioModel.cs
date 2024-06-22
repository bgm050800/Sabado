using SM_WEB.Entities;

namespace SM_WEB.Models
{
    public class UsuarioModel(HttpClient http) : IUsuarioModel
    {
        public Respuesta RegistrarUsuario(Usuario ent)
        {
            string url = "https://localhost:7208/api/Usuario/RegistrarUsuario";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta IniciarSesion(Usuario ent)
        {
            string url = "https://localhost:7208/api/Usuario/IniciarSesion";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

    }
}