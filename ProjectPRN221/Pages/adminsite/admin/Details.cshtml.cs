﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.admin
{
    public class DetailsModel : PageModel
    {
        private readonly ProjectPrn221Context _context;

        public DetailsModel(ProjectPrn221Context context)
        {
            _context = context;
        }

      public Admin Admin { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Admins == null)
            {
                return NotFound();
            }

            var admin = await _context.Admins.FirstOrDefaultAsync(m => m.AdminId == id);
            if (admin == null)
            {
                return NotFound();
            }
            else 
            {
                Admin = admin;
            }
            return Page();
        }
    }
}
