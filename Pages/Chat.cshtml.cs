using System.Security.Claims;
using System.Text.Json;

using ChatApp.Hubs;
using ChatApp.Models;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace ChatApp.Pages
{
    public class ChatModel : PageModel
    {
        private readonly ChatAppContext db;
        private readonly IHubContext<MessageHub> hub;

        public ChatModel(ChatAppContext _db, IHubContext<MessageHub> _hub)
        {
            db = _db;
            hub = _hub;
        }

        public List<User> users;
        public User user;
        public User toUser;
        public List<Message> historyMessage = new List<Message>();
        public List<Message> historyMessageBetweenUser;

        public void OnGet(int? toUserId)
        {
            user = JsonSerializer.Deserialize<User>(User.FindFirstValue("User"));

            users = db.Users.Where(x => x.Id != user.Id).ToList();

            foreach (User u in users)
            {
                Message m = db.Messages.Where(x => x.FromUser == u.Id || x.ToUser == u.Id).OrderByDescending(x => x.CreateDate).FirstOrDefault();
                if (m != null)
                {
                    m.ToUserNavigation = u;
                    historyMessage.Add(m);
                }
            }
  

            if (toUserId != null)
            {
                toUser = db.Users.FirstOrDefault(x => x.Id == toUserId);
                historyMessageBetweenUser = db.Messages.Where(x => 
                (x.ToUser == toUserId && x.FromUser == user.Id) || (x.FromUser == toUserId && x.ToUser == user.Id))
                    .ToList();
            }
        }

        public async Task<IActionResult> OnPostSendMessage(string message, int idCurrentUser, int toUserId)
        {
            Message mess = new Message()
            {
                FromUser = idCurrentUser,
                ToUser = toUserId,
                Message1 = message,
                CreateDate = DateTime.Now
            };
            db.Add(mess);
            db.SaveChanges();
            await hub.Clients.All.SendAsync("ReloadDocuments");

            return Redirect($"./Chat?toUserId={toUserId}");
        }
    }
}
