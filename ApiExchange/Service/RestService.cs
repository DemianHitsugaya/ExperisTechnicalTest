using System.Configuration;
using ApiExchange.Helpers;
using ApiExchange.Models;
using RestSharp;

namespace ApiExchange.Service
{
    public class RestService
    {
        private RestClient _client;


        public RestService(SettingsHelper settings)
        {
            _client = new RestClient(settings.URI);
            _client.AddDefaultParameter("access_key", settings.ExchangeCode);
        }

        public string LastYearCurrency(string currencyBase, string symbols)
        {
            try
            {

                var request = new RestRequest("/timeseries");
                request.AddParameter("start_date", DateTime.Now.AddYears(-1).Date.ToString("yyyy-MM-dd"));
                request.AddParameter("start_date", DateTime.Now.Date.ToString("yyyy-MM-dd"));
                request.AddParameter("base", currencyBase);
                request.AddParameter("symbols", symbols);

                var response = _client.Execute(request);

                if (response.IsSuccessStatusCode)
                    throw new Exception(response.ErrorMessage);

                if (string.IsNullOrEmpty(response.Content)) throw new Exception("No Contente foe this currencies");
                else return response.Content;
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }



        public string ConvertCurrency(ConvertModel model)
        {
            try
            {
                if(model.Amount>0)
                    throw new Exception("INvalid Amount");

                var request = new RestRequest("/convert");
                request.AddParameter("from", model.CurrencyFrom);
                request.AddParameter("To", model.CurrencyTo);
                request.AddParameter("amount", model.Amount);
                if (model.ConvertDate.HasValue && model.ConvertDate.Value.Year>1900)
                    request.AddParameter("date", model.ConvertDate.Value.Date.ToString("yyyy-MM-dd"));

                var response = _client.Execute(request);

                if (response.IsSuccessStatusCode)
                    throw new Exception(response.ErrorMessage);

                if (string.IsNullOrEmpty(response.Content)) throw new Exception("No Content for this currencies");
                else return response.Content;
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }

    }
}
