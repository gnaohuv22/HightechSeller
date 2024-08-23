using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using System.IO;
using ProjectPRN221.Models;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;

namespace ProjectPRN221.Pages.adminsite.news
{
    public class EditModel : PageModel
    {
        private readonly ProjectPrn221Context _context;
        private IWebHostEnvironment _environment;
        private readonly IHubContext<HubServer> _hubContext;
        public EditModel(ProjectPrn221Context context, IWebHostEnvironment environment, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _environment = environment;
            _hubContext = hubContext;
        }


        [BindProperty]
        public IFormFile[] FileUploads { get; set; } = Array.Empty<IFormFile>();

        [BindProperty]
        public News News { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            TempData["ListPageUrl"] = Request.Headers["Referer"].ToString();
            if (id == null || _context.News == null)
            {
                return NotFound();
            }

            var news = await _context.News.FirstOrDefaultAsync(m => m.NewsId == id);
            if (news == null)
            {
                return NotFound();
            }
            News = news;
            ViewData["NewsgroupId"] = new SelectList(_context.NewsGroups, "NewsgroupId", "NewsgroupName");
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {

            if (!ModelState.IsValid)
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

            _context.Attach(News).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
                Admin? admin = null;
                string? adminJson = HttpContext.Session.GetString("admin");
                if (!string.IsNullOrEmpty(adminJson))
                {
                    admin = JsonConvert.DeserializeObject<Admin>(adminJson);
                }
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
                    createdByNavigation = admin?.Name,
                    newsGroup = _context.NewsGroups.FirstOrDefault(n => n.NewsgroupId == News.NewsgroupId)?.NewsgroupName
                };
                await _hubContext.Clients.All.SendAsync("NewsUpdated", newsData, false);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NewsExists(News.NewsId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            // Retrieve the URL of the list page from TempData
            var listPageUrl = TempData["ListPageUrl"] as string;
            if (!string.IsNullOrEmpty(listPageUrl))
            {
                return Redirect(listPageUrl);
            }

            return RedirectToPage("./Index");
        }

        private bool NewsExists(int id)
        {
            return (_context.News?.Any(e => e.NewsId == id)).GetValueOrDefault();
        }
    }
}
