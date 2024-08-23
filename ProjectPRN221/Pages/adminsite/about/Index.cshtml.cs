﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;
using RazorPagesLab.utils;

namespace ProjectPRN221.Pages.adminsite.about
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPrn221Context _context;
        private readonly IConfiguration Configuration;

        public IndexModel(ProjectPrn221Context context, IConfiguration configuration)
        {
            _context = context;
            Configuration = configuration;
        }

        public PaginatedList<About> About { get;set; } = default!;

        public bool checkSession()
        {
            bool checkS = true;
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                string isCustomerAuthenticated = httpContext.Session.GetString("admin");
                if (string.IsNullOrEmpty(isCustomerAuthenticated))
                {
                    checkS = false;
                }
            }

            return checkS;
        }
        public async Task<IActionResult> OnGetAsync(int? pageIndex)
        {
            if (checkSession() == false)
            {
                return RedirectToPage("/BadRequest");
            }

            if (pageIndex == null)
            {
                pageIndex = 1;
            }

            if (_context.Abouts != null)
            {
                IQueryable<About> aboutsIQ = _context.Abouts;

                var pageSize = Configuration.GetValue("PageSize", 10);
                About = await PaginatedList<About>.CreateAsync(
                aboutsIQ.AsNoTracking(), pageIndex ?? 1, pageSize);
            }
            return Page();
        }
    }
}
