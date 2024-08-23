using Microsoft.AspNetCore.SignalR;
using ProjectPRN221.Models;

namespace ProjectPRN221
{
    public class HubServer : Hub
    {
        public void RefreshData()
        {
            Clients.All.SendAsync("ReloadData");
        }

        public async Task NewsUpdated(News news)
        {
            try
            {
                await Clients.All.SendAsync("NewsUpdated", news);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                // Có thể thêm xử lý lỗi ở đây
            }
        }
    }
}
