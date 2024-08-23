using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;

namespace ProjectPRN221.Pages.customersite.authenticate.changespassword
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public string isCustomerAuthenticated { get; set; } = null;
        public string Mess { get; set; }

        public void checkSession()
        {
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                isCustomerAuthenticated = httpContext.Session.GetString("customer");
            }
        }
        public void OnGet()
        {
            checkSession();
        }

        public IActionResult OnPost(string spass, string respass)
        {
            string username = HttpContext.Session.GetString("customer");
            if (spass.Equals(respass))
            {
                Customer customer = _context.Customers.FirstOrDefault(x => x.Username.Equals(username));
                customer.Password = Validation.HashPassword(spass);
                _context.Customers.Update(customer);
                _context.SaveChanges();

                HttpContext.Session.Remove("username");
                HttpContext.Session.Remove("otp");
                return RedirectToPage("/customersite/authenticate/login/Index");
            }
            else
            {
                Mess = "Password and Re-Password is not the same!";
                return Page();
            }
        }

    }
}
