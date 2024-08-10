namespace SM_WEB.Entities
{
    public class Carrito
    {
        public int ConsecutivoUsuario { get; set; }
        public int IdProducto { get; set; }
        public int Cantidad { get; set; }
        public DateTime FechaCarrito { get; set; }
        public string? Nombre { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Impuesto { get; set; }
        public decimal Total { get; set; }
    }
}
