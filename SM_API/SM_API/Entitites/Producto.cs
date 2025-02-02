﻿namespace SM_API.Entitites
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string? NombreProducto { get; set; }
        public string? Descripcion { get; set; }
        public decimal PrecioUnitario { get; set; }
        public int IdCategoria { get; set; }
        public string? NombreCategoria { get; set; }
        public int IdProveedor { get; set; }
        public string? NombreProveedor { get; set; }
        public int Inventario { get; set; }
        public string? Imagen { get; set; }
        public bool Estado { get; set; }
        public string? EstadoDescripcion { get; set; }

    }
}
