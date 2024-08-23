using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Options;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;
using static ProjectPRN221.Utils.Mail;

namespace ProjectPRN221.Pages.adminsite.authenticate.forgotpassword
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPrn221Context _context;

        public IndexModel(ProjectPrn221Context context)
        {
            _context = context;
        }
        public string ErrorMess { get; set; }
        public void OnGet()
        {
        }
        public IActionResult OnPost(string username, string email)
        {
            bool checkInput = true;

            Admin admin = _context.Admins.FirstOrDefault(x => x.Username.Equals(username) && x.Gmail.Equals(email));

            if (admin != null)
            {
                string otp = Validation.GenerateOTP(6);
                HttpContext.Session.SetString("otp", otp);
                HttpContext.Session.SetString("username", username);

                var mailSettings = new MailSettings
                {
                    Mail = "hightech05vn@gmail.com",
                    DisplayName = "HighTech Store",
                    Password = "hhhbasicfoexmpyw",
                    Host = "smtp.gmail.com",
                    Port = 587
                };
                var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
                var logger = loggerFactory.CreateLogger<SendMailService>();
                Mail.SendMailService sendMailService = new Mail.SendMailService(Options.Create(mailSettings), logger);
                sendMailService.SendEmailAsync(email, "OTP", otp);

                return RedirectToPage("/adminsite/authenticate/otp/Index");
            }
            else
            {
                ErrorMess = "Username or Email invalid!";
                return Page();
            }
        }

    }
}
