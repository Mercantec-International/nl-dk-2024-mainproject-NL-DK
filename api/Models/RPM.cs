namespace api.Models
{
    public class RPM : Common
    {
        public int Speed { get; set; }
        public String CarId { get; set; }
        public Car Car { get; set; }
    }

    public class RPMDTO
    {
        public int Speed { get; set; }
    }
}
