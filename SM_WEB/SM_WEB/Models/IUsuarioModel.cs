using SM_WEB.Entities;

namespace SM_WEB.Models
{
    public interface IUsuarioModel
    {
        Respuesta RegistrarUsuario(Usuario ent);

        Respuesta IniciarSesion(Usuario ent);
    }
}
