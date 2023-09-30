using ApiExchange.Helpers;
using ApiExchange.Models;
using ApiExchange.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

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

        [HttpGet]
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

        [HttpGet]
        public IActionResult ConverMoney([FromBody] ConvertModel model)
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
    }
}
