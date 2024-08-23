using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPRN221.Models;
using RazorPagesLab.utils;
using System.Configuration;

namespace ProjectPRN221.Pages.customersite.shop
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


        public PaginatedList<Product> Product { get; set; } = default!;

        public List<Category> Category { get; set; }
        public List<Brand> Brand { get; set; }

        public string isCustomerAuthenticated { get; set; } = null;
        public void checkSession()
        {
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                isCustomerAuthenticated = httpContext.Session.GetString("customer");
            }
        }
        public async Task OnGet(int? pageIndex, string service, int categoryId, int brandId, string sortBy, int? minPrice, int? maxPrice)
        {
            checkSession();
            Category = _context.Categories.ToList();
            Brand = _context.Brands.ToList();
            if (pageIndex == null)
            {
                pageIndex = 1;
            }

            if (service == null)
            {
                service = "displayAll";
            }

            IQueryable<Product> productsIQ = _context.Products.Include(n => n.Category).Include(p => p.Brand);

            if (service.Equals("displayProductbyCategory"))
            {
                productsIQ = productsIQ.Where(x => x.CategoryId == categoryId);
            }

            if (service.Equals("displayProductbyBrand"))
            {
                productsIQ = productsIQ.Where(x => x.BrandId == brandId);
            }

            switch (sortBy)
            {
                case "nameAsc":
                    productsIQ = productsIQ.OrderBy(p => p.ProductName);
                    break;
                case "nameDesc":
                    productsIQ = productsIQ.OrderByDescending(p => p.ProductName);
                    break;
                case "priceAsc":
                    productsIQ = productsIQ.OrderBy(p => p.ListPrice);
                    break;
                case "priceDesc":
                    productsIQ = productsIQ.OrderByDescending(p => p.ListPrice);
                    break;
                default:
                    break;
            }

            if (minPrice.HasValue)
            {
                productsIQ = productsIQ.Where(p => p.ListPrice >= minPrice);
            }
            if (maxPrice.HasValue)
            {
                productsIQ = productsIQ.Where(p => p.ListPrice <= maxPrice);
            }

            Product = await PaginatedList<Product>.CreateAsync(productsIQ.AsNoTracking(), pageIndex ?? 1, 6);
        }



        public async Task OnPost(int? pageIndex, string service, string productName)
        {
            checkSession();

            Category = _context.Categories.ToList();
            Brand = _context.Brands.ToList();

            if (pageIndex == null)
            {
                pageIndex = 1;
            }

            if (service.Equals("displayProductbyName"))
            {
                if (_context.Products != null)
                {
                    IQueryable<Product> productsIQ = _context.Products.Include(n => n.Category).Include(p => p.Brand).Where(x => x.ProductName.Contains(productName));
                    Product = await PaginatedList<Product>.CreateAsync(
                    productsIQ.AsNoTracking(), pageIndex ?? 1, 6);
                }
            }

        }

    }
}
