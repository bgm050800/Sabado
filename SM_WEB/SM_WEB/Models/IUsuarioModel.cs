using SM_WEB.Entities;

namespace SM_WEB.Models
{
    public interface IUsuarioModel
    {
        void RegistrarUsuario(Usuario ent);

        void IniciarSesion(Usuario ent);
    }
}
