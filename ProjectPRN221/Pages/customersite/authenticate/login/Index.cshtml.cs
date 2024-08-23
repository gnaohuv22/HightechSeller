using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;

namespace ProjectPRN221.Pages.customersite.authenticate.login
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public void OnGet()
        {
        }

        public string ErrorMess { get; set; } = default!;

        public async Task<IActionResult> OnPostAsync(string username, string password)
        {
            if (_context != null)
            {
                if (username == string.Empty || password == string.Empty)
                {
                    ErrorMess = "Username and password is not empty";
                    return Page();
                }
                else
                {
                    Console.WriteLine(Validation.HashPassword(password));
                    Customer customer = _context.Customers.FirstOrDefault(x => x.Username.Equals(username) && x.Password.Equals(Validation.HashPassword(password)));
                    if (customer != null)
                    {
                        string customerJson = JsonConvert.SerializeObject(customer);
                        HttpContext.Session.SetString("customer", customerJson);
                        return RedirectToPage("/customersite/home/Index");
                    }
                    else
                    {
                        ErrorMess = "Username or password is not correct";
                        return Page();
                    }

                }
            }
            return Page();
        }
    }
}
