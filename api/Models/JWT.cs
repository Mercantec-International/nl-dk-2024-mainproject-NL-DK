namespace api.Models
{
    public class JWT
    {
        public string RefreshToken { get; set; }
        public string UserId { get; set; }
        public User User { get; set; }
        public DateTime ExpiryDate { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
