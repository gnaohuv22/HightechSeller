﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;
using RazorPagesLab.utils;

namespace ProjectPRN221.Pages.adminsite.customer
{
    public class IndexModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;
        private readonly IConfiguration Configuration;
        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context, IConfiguration configuration)
        {
            _context = context;
            Configuration = configuration;
        }

        public PaginatedList<Customer> Customer { get;set; } = default!;
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
            if (_context.Customers != null)
            {
                IQueryable<Customer> customersIQ = from s in _context.Customers select s;

                var pageSize = Configuration.GetValue("PageSize", 10);
                Customer = await PaginatedList<Customer>.CreateAsync(
                customersIQ.AsNoTracking(), pageIndex ?? 1, pageSize);
            }
            return Page();
        }


        public async Task OnPostAsync(int id, string action, string status, string name, int? pageIndex)
        {
            if (pageIndex == null)
            {
                pageIndex = 1;
            }
            if (_context.Customers != null)
            {

                if (action.Equals("updateStatus"))
                {
                    Customer customer = _context.Customers.FirstOrDefault(x => x.CustomerId == id);
                    customer.Status = status;
                    _context.Customers.Update(customer);
                    _context.SaveChanges();

                    IQueryable<Customer> customersIQ = from s in _context.Customers select s;

                    var pageSize = Configuration.GetValue("PageSize", 10);
                    Customer = await PaginatedList<Customer>.CreateAsync(
                    customersIQ.AsNoTracking(), pageIndex ?? 1, pageSize);
                }
                if (action.Equals("searchByName"))
                {
                    IQueryable<Customer> customersIQ = from s in _context.Customers where s.Name.Contains(name) select s;
                    var pageSize = Configuration.GetValue("PageSize", 1);
                    Customer = await PaginatedList<Customer>.CreateAsync(
                    customersIQ.AsNoTracking(), pageIndex ?? 1, pageSize);
                }
            }
        }
    }
}
