using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ProjectPRN221.Dto;
using ProjectPRN221.Models;

namespace ProjectPRN221.Pages.customersite.warranty
{
    public class CreateModel : PageModel
    {
        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;
        private Microsoft.AspNetCore.Hosting.IHostingEnvironment _environment;
        private readonly IHubContext<HubServer> _hubContext;

        public CreateModel(ProjectPRN221.Models.ProjectPrn221Context context, Microsoft.AspNetCore.Hosting.IHostingEnvironment environment, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _environment = environment;
            _hubContext = hubContext;
        }
        public Customer Customer { get; set; }
        public OrderWarranty Warranty { get; set; }

        [BindProperty]
        public IFormFile[] FileUploads { get; set; }

        public bool checkSession()
        {
            bool checkS = true;
            var httpContext = HttpContext;
            if (httpContext != null && httpContext.Session != null)
            {
                string isCustomerAuthenticated = httpContext.Session.GetString("customer");
                if (string.IsNullOrEmpty(isCustomerAuthenticated))
                {
                    checkS = false;
                }
            }

            return checkS;
        }

        public IActionResult OnGet(int id)
        {
            if (checkSession() == false)
            {
                return RedirectToPage("/customersite/authenticate/login/Index");
            }

            string customerJson = HttpContext.Session.GetString("customer");
            if (!string.IsNullOrEmpty(customerJson))
            {
                Customer = JsonConvert.DeserializeObject<Customer>(customerJson);
            }
            Warranty = GetOrderDetailWarranty(id);

            return Page();
        }
        public OrderWarranty GetOrderDetailWarranty(int id)
        {
            var ow = (from od in _context.OrderDetails
                      join o in _context.Orders on od.OrderId equals o.OrderId
                      where od.OrderdetailId == id
                      select new OrderWarranty
                      {
                          Orderdetail_id = od.OrderdetailId,
                          Customer_id = o.CustomerId,
                          Product_id = (int)od.ProductId,
                          Product_name = od.Product.ProductName,
                          Image = od.Product.Image,
                          Quantity_order = (int)od.QuantityOrder,
                          Order_date = (DateTime)o.OderDate
                      }).FirstOrDefault();

            return ow;
        }


        public async Task<IActionResult> OnPostAsync(int customer_id, int product_id, int orderdetail_id,
            string status, string product_status, int quantity, DateTime order_date)
        {
            DateTime warranty_date = DateTime.Now;
            string warranty_status = "Expire";

            if ((warranty_date - order_date).TotalDays < 365)
            {
                warranty_status = "Still Valid";
            }

            Warranty warranty = new Warranty
            {
                OrderdetailId = orderdetail_id,
                ProductId = product_id,
                CustomerId = customer_id,
                ProductStatus = product_status,
                WarrantyQuantity = quantity,
                Status = status,
                WarrantyDate = warranty_date,
                WarrantyStatus = warranty_status
            };

            // Upload file 
            string fileURL = string.Empty;
            if (FileUploads != null)
            {
                foreach (var FileUpload in FileUploads)
                {
                    var file = Path.Combine(_environment.ContentRootPath, "wwwroot/Images/warranties", FileUpload.FileName);
                    using (var fileStream = new FileStream(file, FileMode.Create))
                    {
                        await FileUpload.CopyToAsync(fileStream);
                        fileURL = "/Images/warranties/" + FileUpload.FileName;
                    }
                }
            }

            // Add and save changes
            if (fileURL != string.Empty)
            {
                warranty.ImageProduct = fileURL;
            }

            _context.Warranties.Add(warranty);
            await _context.SaveChangesAsync();
            await _hubContext.Clients.All.SendAsync("ReloadData");
            return RedirectToPage("./Index");
        }
    }
}
