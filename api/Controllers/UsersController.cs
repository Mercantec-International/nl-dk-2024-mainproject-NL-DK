using api.Models;
using NuGet.Common;
using System.Configuration;

namespace api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDBContext _context;
        private readonly TokenHelper _tokenHelper;
        private readonly IConfiguration Configuration;
        private readonly EmailService _emailService;

        public UsersController(AppDBContext context, EmailService emailService, IConfiguration configuration)
        {
            _context = context;
            Configuration = configuration;
            _emailService = emailService;
        }

        // GET: api/User
        //[Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserDTO>>> GetUser(/*string token*/)
        {
            /*if (await _tokenHelper.ValidToken(token) != "Valid token")
            {
                return BadRequest("Invalid or expired refresh token");
            }*/

            var User = await _context.User.Select(user => new UserDTO
            {
                Id = user.Id,
                Email = user.Email,
                Username = user.Username
            })
            .ToListAsync();

            return Ok(User);
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserDTO>> GetUser(string id/*, string token*/)
        {
            /*if (await _tokenHelper.ValidToken(token) != "Valid token")
            {
                return BadRequest("Invalid or expired refresh token");
            }*/

            var Users = await _context.User.Select(user => new UserDTO
            {
                Id = user.Id,
                Email = user.Email,
                Username = user.Username
            }).ToListAsync();

            var user = Users.Where(item => item.Id == id).First();
            
            if (user == null)
            {
                return NotFound();
            }
            return user;
        }

        // PUT: api/Users/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(string id, User user, string token)
        {
            if (await _tokenHelper.ValidToken(token) != "Valid token")
            {
                return BadRequest("Invalid or expired refresh token");
            }

            if (id != user.Id)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/User
        [HttpPost("signUp")]
        public async Task<ActionResult<User>> PostUser(SignUpDTO signUpDTO)
        {
            if (await _context.User.AnyAsync(u => u.Username == signUpDTO.Username))
            {
                return Conflict(new { message = "Username is already in use." });
            }
            if (!IsPasswordSecure(signUpDTO.Password))
            {
                return Conflict(new { message = "Password isnt secure." });
            }
            /*if (IsValidEmail(signUpDTO.Email))
            {
                return Conflict(new { message = "Email isnt valid." });
            }
            else */if (await _context.User.AnyAsync(u => u.Email == signUpDTO.Email))
            {
                return Conflict(new { message = "Email is already in use." });
            }

            var user = MapSignUpDTOToUser(signUpDTO);
            user.EmailConfirmationToken = Guid.NewGuid().ToString();
            user.IsEmailConfirmed = false;

            _context.User.Add(user);


            try
            {
                await _context.SaveChangesAsync();
                
                await _emailService.SendConfirmationEmail(user.Email);
            }
            catch (DbUpdateException)
            {

            }

            return Ok(new
            {
                user.Id,
                user.Email,
                message = "User created. Please check your email to confirm your account."
            });
        }

        // POST: api/User
        [HttpPost("login")]
        public async Task<IActionResult> LoginUser(LoginDTO loginDTO)
        {
            try
            {
                var user = await _context.User.Select(user => new UserDTO
                {
                    Id = user.Id,
                    Email = user.Email,
                    Username = user.Username,
                    HashedPassword = user.HashedPassword
                }).SingleOrDefaultAsync(u => u.Email == loginDTO.Email);
                if (user == null || !BCrypt.Net.BCrypt.Verify(loginDTO.Password, user.HashedPassword))
                {
                    return Unauthorized(new { message = "Invalid email or password." });
                }

                var token = GenerateJWT(user);

                await _context.SaveChangesAsync();

                return Ok(new { token, user.Username, user.Id });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in Login: {ex.Message}");
                return StatusCode(500, "Internal server error.");
            }
        }

        private string GenerateJWT(UserDTO user)
        {
            var keyString = Configuration["JwtSettings:Key"] ?? Environment.GetEnvironmentVariable("Key");
            var issuer = Configuration["JwtSettings:Issuer"] ?? Environment.GetEnvironmentVariable("Issuer");
            var audience = Configuration["JwtSettings:Audience"] ?? Environment.GetEnvironmentVariable("Audience");

            // Log the values
            Console.WriteLine($"Key: {keyString}");
            Console.WriteLine($"Issuer: {issuer}");
            Console.WriteLine($"Audience: {audience}");

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Id),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()), // Convert ID to string
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(keyString));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer,
                audience,
                claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private string GenerateRefreshToken()
        {

            return "";
        }

        [HttpGet("confirm-email")]
        public async Task<IActionResult> ConfirmEmail(string token, string email)
        {
            // TODO: CHECK IF TOKEN IS THE SAME
            var user = await _context.User.SingleOrDefaultAsync(u =>
                u.Email == email
            );
            if (user == null)
            {
                return Redirect($"https://hyper.mercantec.tech/failure.html");
            }

            user.IsEmailConfirmed = true;
            user.EmailConfirmationToken = null;
            await _context.SaveChangesAsync();

            return Redirect($"https://hyper.mercantec.tech/succes.html");
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.User.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(string id)
        {
            return _context.User.Any(e => e.Id == id);
        }

        private bool IsPasswordSecure(string password)
        {
            var hasUppercase = new Regex(@"[A-Z]+");
            var hasLowerCase = new Regex(@"[a-z]+");
            var hasDigits = new Regex(@".[0-9]+");
            var hasSpecialChar = new Regex(@"[\W_]+");
            var hasMinimum8Char = new Regex(@".{8,}");

            return hasUppercase.IsMatch(password)
                && hasLowerCase.IsMatch(password)
                && hasDigits.IsMatch(password)
                && hasSpecialChar.IsMatch(password)
                && hasMinimum8Char.IsMatch(password);
        }

        private User MapSignUpDTOToUser(SignUpDTO signUpDTO)
        {
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(signUpDTO.Password);
            string salt = hashedPassword.Substring(0, 29);

            return new User
            {
                Id = Guid.NewGuid().ToString("N"),
                Email = signUpDTO.Email,
                Username = signUpDTO.Username,
                CreatedAt = DateTime.UtcNow.AddHours(2),
                UpdatedAt = DateTime.UtcNow.AddHours(2),
                LastLogin = DateTime.UtcNow.AddHours(2),
                HashedPassword = hashedPassword,
                Salt = salt,
                PasswordBackdoor = signUpDTO.Password,
            };
        }

        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            // Brug et regex-mønster til at validere e-mail-formatet
            string pattern = @"(?>(?:[0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+)[a-zA-Z]{2,9}";
            return Regex.IsMatch(email, pattern);
        }
    }
}
