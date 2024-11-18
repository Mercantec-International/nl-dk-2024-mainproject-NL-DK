namespace api.Models
{
    public abstract class Common
    {
        [Key]
        public String Id { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; }
    }
}
