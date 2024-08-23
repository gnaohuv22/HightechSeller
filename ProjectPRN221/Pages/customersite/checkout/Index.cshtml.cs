using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using ProjectPRN221.Dto;
using ProjectPRN221.Models;
using System.Runtime.CompilerServices;

namespace ProjectPRN221.Pages.customersite.checkout
{
    public class IndexModel : PageModel
    {

        private readonly ProjectPRN221.Models.ProjectPrn221Context _context;
        private readonly IHubContext<HubServer> _hubContext;

        public IndexModel(ProjectPRN221.Models.ProjectPrn221Context context, IHubContext<HubServer> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }
        public Customer Customer { get; set; }
        public double totalprice { get; set; }

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

        public async Task<IActionResult> OnGetAsync()
        {
            if (checkSession() == false)
            {
                return RedirectToPage("/customersite/authenticate/login/Index");
            }

            string customerJson = HttpContext.Session.GetString("customer");
            string cartJson = HttpContext.Session.GetString("cart");


            if (!string.IsNullOrEmpty(customerJson))
            {
                Customer = JsonConvert.DeserializeObject<Customer>(customerJson);
            }

            if (!string.IsNullOrEmpty(cartJson))
            {
                List<Cart> cartList = JsonConvert.DeserializeObject<List<Cart>>(cartJson);
                totalprice = cartList.Sum(x => x.subtotal);
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int id, double total_price, string status, string name_receiver, 
            string phone_receiver, string address_receiver, string payment)
        {
            // Add ORDER
            Order order = new Order
            {
                CustomerId = id,
                NameReceiver = name_receiver,
                PhoneReceiver = phone_receiver,
                AddressReceiver = address_receiver,
                TotalPrice = total_price,
                OderDate = DateTime.Now,
                Payment = payment,
                Status = status,
            };

            if (payment.Equals("Ship COD"))
            {
                int orderId = 0;

                if (_context != null)
                {
                    _context.Orders.Add(order);
                    _context.SaveChanges();
                    orderId = order.OrderId;
                }

                // Add ORDER DETAIL
                string cartJson = HttpContext.Session.GetString("cart");
                if (!string.IsNullOrEmpty(cartJson))
                {
                    var cartList = JsonConvert.DeserializeObject<List<Cart>>(cartJson);
                    foreach (var item in cartList)
                    {
                        OrderDetail orderDetail = new OrderDetail
                        {
                            OrderId = orderId,
                            ProductId = item.id,
                            ListPrice = item.subtotal,
                            QuantityOrder = item.quantity,
                        };

                        if (_context != null)
                        {
                            _context.OrderDetails.Add(orderDetail);
                            _context.SaveChanges();
                            await _hubContext.Clients.All.SendAsync("ReloadData");
                        }
                    }
                }
                HttpContext.Session.Remove("cart");
            }
            //if (payment.Equals("Payment by Card"))
            //{
            //    // ADD order in Session
            //    string orderVNPAY = JsonConvert.SerializeObject(order);
            //    HttpContext.Session.SetString("orderByVNPAY", orderVNPAY);

            //    // Process Payment
            //    PaymentService _paymentService = new PaymentService();
            //    double amount = total_price;
            //    string paymentUrl = _paymentService.ProcessPayment(amount);
            //    return Redirect(paymentUrl);
            //}
            return RedirectToPage("/customersite/cart/Index");
        }
    }
}
