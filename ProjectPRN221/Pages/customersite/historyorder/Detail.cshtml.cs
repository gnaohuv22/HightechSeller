using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ProjectPRN221.Models;
using System.Diagnostics;
using System.Threading.Channels;
using static NuGet.Packaging.PackagingConstants;

namespace ProjectPRN221.Pages.customersite.historyorder
{
    public class DetailModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public DetailModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public List<OrderDetail> OrderDetails { get; set; }

        public bool checkSession()
        {
            bool checkS = true;
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                string isCustomerAuthenticated = httpContext.Session.GetString("customer");
                if (string.IsNullOrEmpty(isCustomerAuthenticated))
                {
                    checkS = false;
                }
            }

            return checkS;
        }
        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (checkSession() == false)
            {
                return RedirectToPage("/customersite/authenticate/login/Index");
            }
            if (_context != null)
            {
                OrderDetails = _context.OrderDetails.Include(x => x.Order).Include(x => x.Product)
                .Where(x => x.OrderId == id).ToList();
            }

            return Page();
        }
    }
}
