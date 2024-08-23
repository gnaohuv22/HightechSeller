using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;

namespace ProjectPRN221.Pages.adminsite.profile
{
    public class ChangesPasswordModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public ChangesPasswordModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public string Mess { get; set; }

        public Admin Admin { get; set; }

        public bool checkSession()
        {
            bool checkS = true;
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                string isCustomerAuthenticated = httpContext.Session.GetString("admin");
                if (string.IsNullOrEmpty(isCustomerAuthenticated))
                {
                    checkS = false;
                }
            }
            return checkS;
        }

        public IActionResult OnGet()
        {
            if (checkSession() == false)
            {
                return RedirectToPage("/BadRequest");
            }

            string Json = HttpContext.Session.GetString("admin");
            Admin admin = JsonConvert.DeserializeObject<Admin>(Json);
            Admin = _context.Admins.FirstOrDefault(x => x.AdminId == admin.AdminId);

            return Page();
        }

        public IActionResult OnPost(string spass, string respass)
        {
            string Json = HttpContext.Session.GetString("admin");
            Admin admin = JsonConvert.DeserializeObject<Admin>(Json);
            if (spass.Equals(respass))
            {
                Admin = _context.Admins.FirstOrDefault(x => x.AdminId == admin.AdminId);
                admin.Password = Validation.HashPassword(spass);
                _context.Admins.Update(Admin);
                _context.SaveChanges();
                return RedirectToPage("/adminsite/dashboard/Index");
            }
            else
            {
                Mess = "Password and Re-Password is not the same!";
                return Page();
            }
        }
    }
}
