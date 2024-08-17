using SM_WEB.Entities;

namespace SM_WEB.Interfaces
{
    public interface ICarritoModel
    {
        Respuesta RegistrarCarrito(Carrito ent);

        Respuesta ConsultarCarrito();

        Respuesta PagarCarrito();

        Respuesta ValidarExistencias();

        Respuesta ConsultarFacturas();

        Respuesta ConsultarDetalleFactura(int IdMaestro);

        Respuesta EliminarProductoCarrito(int IdProducto);
    }
}
