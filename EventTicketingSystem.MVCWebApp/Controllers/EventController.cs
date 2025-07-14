using Microsoft.AspNetCore.Mvc;

namespace EventTicketingSystem.MVCWebApp.Controllers
{
    public class EventController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
