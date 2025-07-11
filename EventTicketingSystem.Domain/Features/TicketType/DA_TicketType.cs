using EventTicketingSystem.Domain.Features.EventCategory;

namespace EventTicketingSystem.Domain.Features.TicketType;

public class DA_TicketType
{
    private readonly ILogger<DA_TicketType> _logger;

    private readonly AppDbContext _db;

    public DA_TicketType(ILogger<DA_TicketType> logger, AppDbContext db = null)
    {
        _logger = logger;
        _db = db;
    }

}
