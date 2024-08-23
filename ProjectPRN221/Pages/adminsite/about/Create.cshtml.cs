﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.about
{
    public class CreateModel : PageModel
    {
        private readonly ProjectPrn221Context _context;

        public CreateModel(ProjectPrn221Context context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public About About { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Abouts == null || About == null)
            {
                return Page();
            }

            _context.Abouts.Add(About);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
