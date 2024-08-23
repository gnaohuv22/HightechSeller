using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.about
{
    public class DetailsModel : PageModel
    {
        private readonly ProjectPrn221Context _context;

        public DetailsModel(ProjectPrn221Context context)
        {
            _context = context;
        }

      public About About { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Abouts == null)
            {
                return NotFound();
            }

            var about = await _context.Abouts.FirstOrDefaultAsync(m => m.AId == id);
            if (about == null)
            {
                return NotFound();
            }
            else 
            {
                About = about;
            }
            return Page();
        }
    }
}
