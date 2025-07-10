using EventTicketingSystem.Domain.Models.Features.EventCategory;

namespace EventTicketingSystem.Domain.Features.EventCategory;

public class DA_EventCategory
{
    private readonly ILogger<DA_EventCategory> _logger;
    private readonly AppDbContext _db;

    public DA_EventCategory(ILogger<DA_EventCategory> logger, AppDbContext db)
    {
        _logger = logger;
        _db = db;
    }

    public async Task<Result<EventCategoryListResponseModel>> GetList()
    {
        var model = new EventCategoryListResponseModel();

        try
        {
            var data = await _db.TblCategories.ToListAsync();
            model.EventCategories = data.Select(x => new EventCategoryModel
            {
                CategoryId = x.Categoryid,
                CategoryCode = x.Categorycode,
                CategoryName = x.Categoryname,
            }).ToList();

            return Result<EventCategoryListResponseModel>.Success(model);
        }
        catch (Exception ex)
        {
            _logger.LogExceptionError(ex);
            return Result<EventCategoryListResponseModel>.SystemError(ex.Message);
        }

    }
}
