using SM_WEB.Entities;

namespace SM_WEB.Models
{
    public class UsuarioModel(HttpClient http) : IUsuarioModel
    {
        public void RegistrarUsuario(Usuario ent)
        {
            string url = "https://localhost:7208/api/Usuario/RegistrarUsuario";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;
        }

        public void IniciarSesion(Usuario ent)
        {
            string url = "https://localhost:7208/api/Usuario/IniciarSesion";
            JsonContent body = JsonContent.Create(ent);
            var result = http.PostAsync(url, body).Result;
        }

    }
}