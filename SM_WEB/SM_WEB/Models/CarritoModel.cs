using Microsoft.Extensions.Configuration;
using SM_WEB.Entities;
using SM_WEB.Interfaces;
using System.Net.Http.Headers;
using static System.Net.WebRequestMethods;

namespace SM_WEB.Models
{
    public class CarritoModel(HttpClient http, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : ICarritoModel
    {
        public Respuesta RegistrarCarrito(Carrito ent)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Carrito/RegistrarCarrito";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            JsonContent body = JsonContent.Create(ent);

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = http.PostAsync(url, body).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta ConsultarCarrito()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Carrito/ConsultarCarrito";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = http.GetAsync(url).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta PagarCarrito()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Carrito/PagarCarrito";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = http.PostAsync(url, null).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta ValidarExistencias()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Carrito/ValidarExistencias";
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
