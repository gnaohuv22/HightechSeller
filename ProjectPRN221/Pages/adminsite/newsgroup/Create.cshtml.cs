using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.newsgroup
{
    public class CreateModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public CreateModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public NewsGroup NewsGroup { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.NewsGroups == null || NewsGroup == null)
            {
                return Page();
            }

            _context.NewsGroups.Add(NewsGroup);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
