namespace ApiExchange.Models
{
    public class ConvertModel
    {
        public string CurrencyFrom { get; set; }
        public string CurrencyTo { get; set; }
        public double Amount { get; set; }
        public DateTime? ConvertDate { get; set; } = DateTime.MinValue;
        
    }
}
