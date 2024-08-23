using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;
using System;

namespace ProjectPRN221.Pages.adminsite.authenticate.login
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }

        public string ErrorMess { get; set; } = default!;

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync(string username, string password) {
            if(_context != null)
            {
                if(username == string.Empty || password == string.Empty)
                {
                    ErrorMess = "Username and password is not empty";
                    return Page();
                }
                else
                {
                    Admin admin = _context.Admins.FirstOrDefault(x => x.Username.Equals(username) && x.Password.Equals(Validation.HashPassword(password)));
                    if(admin != null)
                    {
                        string adminJson = JsonConvert.SerializeObject(admin);
                        HttpContext.Session.SetString("admin", adminJson);
                        return RedirectToPage("/adminsite/dashboard/Index");
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
