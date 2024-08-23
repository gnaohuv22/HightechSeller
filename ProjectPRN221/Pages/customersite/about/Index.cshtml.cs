using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Dto;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;

namespace ProjectPRN221.Pages.customersite.about
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }
        public string isCustomerAuthenticated { get; set; } = null;
        public About About { get; set; }
        public List<NewsView> News { get; set; }
        public void checkSession()
        {
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                isCustomerAuthenticated = httpContext.Session.GetString("customer");
            }
        }
        public void OnGet(int id)
        {
            checkSession();

            About = _context.Abouts.FirstOrDefault(x => x.AId == id);

            News = (from s in _context.News
                    join ng in _context.NewsGroups on s.NewsgroupId equals ng.NewsgroupId
                    orderby s.CreatedDate descending
                    select new NewsView
                    {
                        news_id = s.NewsId,
                        newsgroup_name = ng.NewsgroupName,
                        image = s.Image,
                        title = s.Title,
                        content = s.Content,
                        day = s.CreatedDate.Value.Day.ToString(),
                        month = s.CreatedDate.Value.Month.ToString(),
                        year = s.CreatedDate.Value.Year.ToString()
                    })
                        .Take(3)
                        .ToList();

            foreach (NewsView s in News)
            {
                s.month = Validation.ConvertMonthNumberToName(s.month);
            }
        }
    }
}
