using SM_WEB.Entities;

namespace SM_WEB.Interfaces
{
    public interface IUsuarioModel
    {
        Respuesta RegistrarUsuario(Usuario ent);

        Respuesta IniciarSesion(Usuario ent);

        Respuesta ConsultarUsuarios();

        Respuesta ConsultarUsuario(int Consecutivo);

        Respuesta CambiarEstadoUsuario(Usuario ent);

        Respuesta ActualizarUsuario(Usuario ent);

        Respuesta RecuperarAcceso(string Identificacion);
    }
}
