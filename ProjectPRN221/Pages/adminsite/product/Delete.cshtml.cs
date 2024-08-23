using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.adminsite.product
{
    public class DeleteModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;
        private readonly IHubContext<HubServer> _hubContext;

        public DeleteModel(ProjectPRN221.Models.ProjectPrn221Context context, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }

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
            else
            {
                Product = product;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }
            var product = await _context.Products.FindAsync(id);

            if (product != null)
            {
                Product = product;
                _context.Products.Remove(Product);
                await _context.SaveChangesAsync();
                var productData = new
                {
                    productId = Product.ProductId,
                };

                await _hubContext.Clients.All.SendAsync("ProductUpdated", productData, true);
            }

            return RedirectToPage("./Index");
        }
    }
}
