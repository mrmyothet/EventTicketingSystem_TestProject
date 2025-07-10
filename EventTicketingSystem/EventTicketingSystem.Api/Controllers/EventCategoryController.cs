using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EventTicketingSystem.Api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class EventCategoryController : ControllerBase
{
    private readonly BL_EventCategory _bl_EventCategory;

    public EventCategoryController(BL_EventCategory bl_EventCategory)
    {
        _bl_EventCategory = bl_EventCategory;
    }

    [HttpGet()]
    public async Task<IActionResult> GetList()
    {
        var result = await _bl_EventCategory.GetList();
        if (result.IsSuccess)
        {
            return Ok(result.Data);
        }
        else
        {
            return NotFound(result);
        }
    }
}
