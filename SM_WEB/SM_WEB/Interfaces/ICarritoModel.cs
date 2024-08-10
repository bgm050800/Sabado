using SM_WEB.Entities;

namespace SM_WEB.Interfaces
{
    public interface ICarritoModel
    {
        Respuesta RegistrarCarrito(Carrito ent);

        Respuesta ConsultarCarrito();
    }
}
