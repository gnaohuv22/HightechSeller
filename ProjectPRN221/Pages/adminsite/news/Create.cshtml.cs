using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.news
{
    public class CreateModel : PageModel
    {
        private readonly ProjectPrn221Context _context;
        private IWebHostEnvironment _environment;
        private readonly IHubContext<HubServer> _hubContext;

        public CreateModel(ProjectPrn221Context context, IWebHostEnvironment environment, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _environment = environment;
            _hubContext = hubContext;
        }


        [BindProperty]
        public IFormFile[] FileUploads { get; set; }


        [BindProperty]
        public News News { get; set; } = default!;

        public IActionResult OnGet()
        {
            ViewData["NewsgroupId"] = new SelectList(_context.NewsGroups, "NewsgroupId", "NewsgroupName");
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid || _context.News == null || News == null)
            {
                ViewData["NewsgroupId"] = new SelectList(_context.NewsGroups, "NewsgroupId", "NewsgroupName");
                return Page();
            }

            // Upload file 
            string fileURL = string.Empty;
            if (FileUploads != null)
            {
                foreach (var FileUpload in FileUploads)
                {
                    var file = Path.Combine(_environment.ContentRootPath, "wwwroot/Images/news",
                    FileUpload.FileName);
                    using (var fileStream = new FileStream(file, FileMode.Create))
                    {
                        await FileUpload.CopyToAsync(fileStream);
                        fileURL = "/Images/news/" + FileUpload.FileName;
                    }
                }
            }

            // Add and save changes
            if (fileURL != string.Empty)
            {
                News.Image = fileURL;
            }

            Admin admin = null;
            string adminJson = HttpContext.Session.GetString("admin");
            if (!string.IsNullOrEmpty(adminJson))
            {
                admin = JsonConvert.DeserializeObject<Admin>(adminJson);
            }

            News.Createdby = admin.AdminId;
            News.CreatedDate = DateTime.Now;
            News.Status = "Active";

            _context.News.Add(News);
            await _context.SaveChangesAsync();
            var newsData = new
            {
                newsId = News.NewsId,
                title = News.Title,
                image = News.Image,
                content = News.Content,
                createdDate = News.CreatedDate,
                status = News.Status,
                newsgroupId = News.NewsgroupId,
                createdby = News.Createdby,
                createdByNavigation = admin.Name,
                newsGroup = _context.NewsGroups.FirstOrDefault(n => n.NewsgroupId == News.NewsgroupId).NewsgroupName
            };
            await _hubContext.Clients.All.SendAsync("NewsUpdated", newsData, false);

            return RedirectToPage("./Index");
        }
    }
}
