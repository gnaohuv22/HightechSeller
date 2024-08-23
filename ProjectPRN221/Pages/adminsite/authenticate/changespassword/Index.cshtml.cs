using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;

namespace ProjectPRN221.Pages.adminsite.authenticate.changespassword
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public string Mess { get; set; }
        public void OnGet()
        {

        }
        public IActionResult OnPost(string spass, string respass)
        {
            string username = HttpContext.Session.GetString("username");
            if (spass.Equals(respass))
            {
                Admin admin = _context.Admins.FirstOrDefault(x => x.Username.Equals(username));
                admin.Password = Validation.HashPassword(spass);
                _context.Admins.Update(admin);
                _context.SaveChanges();

                HttpContext.Session.Remove("username");
                HttpContext.Session.Remove("otp");
                return RedirectToPage("/adminsite/authenticate/login/Index");
            }
            else
            {
                Mess = "Password and Re-Password is not the same!";
                return Page();
            }
        }

    }
}
