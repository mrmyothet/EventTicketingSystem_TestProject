using EventTicketingSystem.Domain.Models.Features.EventCategory;

namespace EventTicketingSystem.Domain.Features.EventCategory;

public class BL_EventCategory
{
    private readonly DA_EventCategory _da_EventCategory;

    public BL_EventCategory(DA_EventCategory daEventCategory)
    {
        _da_EventCategory = daEventCategory;
    }

    public async Task<Result<EventCategoryListResponseModel>> GetList()
    {
        return await _da_EventCategory.GetList();
    }
}
