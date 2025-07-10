```
EVENT TICKETING SYSTEM
```

```
Right Click Database > Open in Terminal

dotnet ef dbcontext scaffold "Server=192.168.1.233;port=5432;Database=event_ticketing_system;User Id=postgres;Password=sasa@123;TrustServerCertificate=True;" Npgsql.EntityFrameworkCore.PostgreSQL -o AppDbContext -c AppDbContext -f
```
