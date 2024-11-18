public class AppDBContext : DbContext
{
    public AppDBContext(DbContextOptions<AppDBContext> options): base(options)
    {

    }

    public DbSet<RPM> RPMs { get; set; }
    public DbSet<TempHumidity> TempHumidityObjects { get; set; }
    public DbSet<Car> Cars { get; set; }
    public DbSet<User> User { get; set; }
    public DbSet<JWT> Token { get; set; }
}