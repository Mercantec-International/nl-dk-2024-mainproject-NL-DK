using API.Models;

namespace api.Models
{
    public class TempHumidity : Common
    {
        public int Temp { get; set; }
        public int Humidity { get; set; }
        public String CarId { get; set; }
        public Car Car { get; set; }
    }

    public class TempHumidityDTO
    {
        public int Temp { get; set; }
        public int Humidity { get; set; }
    }
}
