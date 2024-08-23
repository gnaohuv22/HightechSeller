using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.warranty
{
    public class DetailsModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;

        public DetailsModel(ProjectPRN221.Models.ProjectPrn221Context context)
        {
            _context = context;
        }

      public Warranty Warranty { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Warranties == null)
            {
                return NotFound();
            }

            var warranty = await _context.Warranties.FirstOrDefaultAsync(m => m.WarrantyId == id);
            if (warranty == null)
            {
                return NotFound();
            }
            else 
            {
                Warranty = warranty;
            }
            return Page();
        }
    }
}
