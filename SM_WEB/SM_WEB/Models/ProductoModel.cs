﻿using Microsoft.Extensions.Configuration;
using SM_WEB.Entities;
using static System.Net.WebRequestMethods;
using System.Net.Http.Headers;

namespace SM_WEB.Models
{
    public class ProductoModel(HttpClient http, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IProductoModel
    {
        public Respuesta ConsultarProductos()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Producto/ConsultarProductos";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = http.GetAsync(url).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

    }
}
