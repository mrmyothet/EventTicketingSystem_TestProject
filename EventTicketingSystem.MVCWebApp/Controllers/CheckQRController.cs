using Microsoft.AspNetCore.Mvc;

namespace EventTicketingSystem.MVCWebApp.Controllers
{
    public class CheckQRController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
