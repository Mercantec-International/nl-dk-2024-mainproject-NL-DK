namespace api.Services
{
    public class TokenHelper
    {
        private readonly AppDBContext _context;
        
        public async Task<string> ValidToken(string token)
        {
            return ("Valid token");
        }
    }
}
