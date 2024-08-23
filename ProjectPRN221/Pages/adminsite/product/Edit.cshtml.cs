﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;
using ProjectPRN221.Utils;
using Microsoft.AspNetCore.SignalR;

namespace ProjectPRN221.Pages.adminsite.product
{
    public class EditModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;
        private Microsoft.AspNetCore.Hosting.IHostingEnvironment _environment;
        private readonly IHubContext<HubServer> _hubContext;

        public EditModel(ProjectPRN221.Models.ProjectPrn221Context context, Microsoft.AspNetCore.Hosting.IHostingEnvironment environment, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _environment = environment;
            _hubContext = hubContext;
        }

        [BindProperty]
        public IFormFile[] FileUploads { get; set; }

        [BindProperty]
        public Product Product { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }
            Product = product;
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName");
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName");
                ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
                return Page();
            }



            bool checkInput = true;

            if (!Validation.IsPrice(Product.ListPrice))
            {
                ModelState.AddModelError("Product.ListPrice", "Price must is number and bigger than 0");
                checkInput = false;
            }

            if (!Validation.IsDiscount(Product.Discount))
            {
                ModelState.AddModelError("Product.Discount", "Discount range 0 - 1.");
                checkInput = false;
            }

            if (checkInput == true)
            {
                // Upload file 
                string fileURL = string.Empty;
                if (FileUploads != null)
                {
                    foreach (var FileUpload in FileUploads)
                    {
                        var file = Path.Combine(_environment.ContentRootPath, "wwwroot/Images/products", FileUpload.FileName);
                        using (var fileStream = new FileStream(file, FileMode.Create))
                        {
                            await FileUpload.CopyToAsync(fileStream);
                            fileURL = "/Images/products/" + FileUpload.FileName;
                        }
                    }
                }

                // Add and save changes
                if (fileURL != string.Empty)
                {
                    Product.Image = fileURL;
                }

                _context.Attach(Product).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                    var productData = new
                    {
                        productId = Product.ProductId,
                        productName = Product.ProductName,
                        image = Product.Image,
                        listPrice = Product.ListPrice,
                        discount = Product.Discount,
                        categoryName = _context.Categories.FirstOrDefault(c => c.CategoryId == Product.CategoryId)?.CategoryName,
                        brandName = _context.Brands.FirstOrDefault(b => b.BrandId == Product.BrandId)?.BrandName,
                        status = Product.Status
                    };

                    await _hubContext.Clients.All.SendAsync("ProductUpdated", productData, false);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(Product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToPage("./Index");
            }
            else
            {
                ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName");
                ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
                return Page();
            }
        }

        private bool ProductExists(int id)
        {
            return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
