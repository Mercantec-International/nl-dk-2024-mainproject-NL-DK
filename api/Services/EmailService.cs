using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;


public class EmailService
{
    private readonly IConfiguration _configuration;
    private readonly string _templatePath;
        
    public EmailService(IConfiguration configuration, IWebHostEnvironment environment)
        {
            _configuration = configuration;
            _templatePath = Path.Combine(
                environment.ContentRootPath,
                "API",
                "Templates",
                "EmailConfirmation.html"
            );
        }

        private async Task<string> GetEmailTemplate(string confirmationUrl)
        {
            var assembly = typeof(EmailService).Assembly;
            var resourceName = "api.Templates.EmailConfirmation.html";

            using var stream = assembly.GetManifestResourceStream(resourceName);
            using var reader = new StreamReader(stream);

            string template = await reader.ReadToEndAsync();
            return template.Replace("{confirmationUrl}", "google.com");
        }

        public async Task SendConfirmationEmail(string email)
        {
            try
            {
                string confirmationToken = Guid.NewGuid().ToString();
                var confirmationUrl = $"https://localhost:7183/api/Users/confirm-email?token={confirmationToken}&email={email}";
                var emailBody = await GetEmailTemplate(confirmationUrl);
            Console.WriteLine("abab");
            Console.WriteLine(_configuration["EmailService:Email"]);

            var smtpClient = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                UseDefaultCredentials = false,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(_configuration["EmailService:Email"], _configuration["EmailService:Password"])
            };

            var mailMessage = new MailMessage
            {
                From = new MailAddress("mathiasgsteenberg7@gmail.com"),
                Subject = "FAT NOGET",
                Body = emailBody,
                IsBodyHtml = true
            };
            mailMessage.To.Add(email);

            await smtpClient.SendMailAsync(mailMessage);
        }
        catch (Exception ex)
            {
                Console.WriteLine($"Email sending failed: {ex.Message}");
                throw;
            }
        }
    }
