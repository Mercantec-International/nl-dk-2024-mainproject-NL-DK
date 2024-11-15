using api.Models;
using API.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.X509Certificates;

public class AppDBContext : DbContext
{
    public AppDBContext(DbContextOptions<AppDBContext> options)
        : base(options)
    {
    }

    public DbSet<RPM> RPMs { get; set; }
    public DbSet<TempHumidity> TempHumidityObjects { get; set; }
    public DbSet<Car> Cars { get; set; }

public DbSet<api.Models.User> User { get; set; } = default!;
}