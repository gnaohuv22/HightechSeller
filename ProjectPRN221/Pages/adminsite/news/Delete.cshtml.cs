using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.news
{
    public class DeleteModel : PageModel
    {
        private readonly ProjectPrn221Context _context;
        private readonly IHubContext<HubServer> _hubContext;

        public DeleteModel(ProjectPrn221Context context, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }

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
            else
            {
                News = news;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.News == null)
            {
                return NotFound();
            }
            var news = await _context.News.FindAsync(id);

            if (news != null)
            {
                News = news;
                _context.News.Remove(News);
                await _context.SaveChangesAsync();
            }

            var newsData = new
            {
                newsId = News.NewsId,
            };
            await _hubContext.Clients.All.SendAsync("NewsUpdated", newsData, true);

            // Retrieve the URL of the list page from TempData
            var listPageUrl = TempData["ListPageUrl"] as string;
            if (!string.IsNullOrEmpty(listPageUrl))
            {
                return Redirect(listPageUrl);
            }

            // Fallback to Index if the list page URL is not available
            return RedirectToPage("./Index");
        }
    }
}
