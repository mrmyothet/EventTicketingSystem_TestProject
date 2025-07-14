using Microsoft.AspNetCore.Mvc;

namespace EventTicketingSystem.MVCWebApp.Controllers
{
    public class VenueController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
