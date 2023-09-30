using ApiExchange.Helpers;
using ApiExchange.Models;
using ApiExchange.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Reflection;

namespace ApiExchange.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExchangeController : ControllerBase
    {

        private RestService _restService;
        public ExchangeController(IOptions<SettingsHelper> appSettings)
        {
            _restService = new RestService(appSettings.Value);
        }

        [HttpGet("GetLastYearCurrency")]
        public IActionResult GetLastYearCurrency([FromQuery]string currencyBase, [FromQuery]string symbols)
        {
            try
            {
                if (string.IsNullOrEmpty(currencyBase))
                    return BadRequest("INvalid Base");

                var response = _restService.LastYearCurrency(currencyBase, symbols);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
            
        }

        [HttpGet("ConvertMoney")]
        public IActionResult ConvertMoney([FromBody] ConvertModel model)
        {
            try
            {
                if (string.IsNullOrEmpty(model.CurrencyFrom))
                    return BadRequest("INvalid Base");


                if (string.IsNullOrEmpty(model.CurrencyFrom))
                    return BadRequest("INvalid Currency To");

                var response = _restService.ConvertCurrency(model);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }

        }

        [HttpGet("HistoricalRate")]
        public IActionResult HistoricalRate([FromBody] HistoricalRateModel model)
        {
            try
            {
                if (model.HistoricalDate.Year<=1900)
                    return BadRequest("INvalid Historical Date");


                if (string.IsNullOrEmpty(model.CurrencyBase))
                    return BadRequest("INvalid Currency");

                var response = _restService.HistoricalRates(model.HistoricalDate.ToString("yyyy-MM-dd"),model.CurrencyBase,model.CurrencyTo);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
