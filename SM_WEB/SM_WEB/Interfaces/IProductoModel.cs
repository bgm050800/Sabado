using SM_WEB.Entities;

namespace SM_WEB.Interfaces
{
    public interface IProductoModel
    {
        Respuesta ConsultarProductos();

        Respuesta CambiarEstadoProducto(Producto ent);
    }
}
