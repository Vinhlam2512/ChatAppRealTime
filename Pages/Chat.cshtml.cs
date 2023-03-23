using System.Security.Claims;
using System.Text.Json;

using ChatApp.Hubs;
using ChatApp.Models;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace ChatApp.Pages
{
    [Authorize]
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
        public Group toGroup;

        public List<Message> historyMessage = new List<Message>();
        public List<Message> historyMessageBetweenUser;
        public List<Group> groups = new List<Group>();


        public void OnGet(int? toUserId, int? toGroupId)
        {
            user = JsonSerializer.Deserialize<User>(User.FindFirstValue("User"));

            users = db.Users.Where(x => x.Id != user.Id).ToList();
            
            List<int> groupId = db.GroupMembers.Where(x => x.UserId == user.Id).Select(x => x.GroupId).ToList();

            for(int i = 0; i < groupId.Count; i++)
            {
                groups.Add(db.Groups.FirstOrDefault(x => x.Id == groupId[i]));
            }

            foreach (User u in users)
            {
                Message m = db.Messages.Where(x => (x.FromUser == u.Id && x.ToUser == user.Id) || (x.FromUser == user.Id && x.ToUser == u.Id)).OrderByDescending(x => x.CreateDate).FirstOrDefault();
                if (m != null)
                {
                    m.ToUserNavigation = u;
                    historyMessage.Add(m);
                }

                //if (historyMessage.Count == 0)
                //{
                //    Message m = db.Messages.Where(x => (x.FromUser == u.Id && x.ToUser == user.Id) || (x.FromUser == user.Id && x.ToUser == u.Id)).OrderByDescending(x => x.CreateDate).FirstOrDefault();
                //    if (m != null)
                //    {
                //        m.ToUserNavigation = u;
                //        historyMessage.Add(m);
                //    }
                //}
                //else
                //{
                //    for (int i = 0; i <= historyMessage.Count; i++)
                //    {
                //        Message m = db.Messages.Where(x => (x.FromUser == u.Id && x.ToUser == user.Id) || (x.FromUser == user.Id && x.ToUser == u.Id)).OrderByDescending(x => x.CreateDate).FirstOrDefault();
                //        if (m != null)
                //        {
                //            m.ToUserNavigation = u;
                //            historyMessage.Add(m);
                //            break;
                //        }
                //    }
                //}
            }
  

            if (toUserId != null)
            {
                toUser = db.Users.FirstOrDefault(x => x.Id == toUserId);
                historyMessageBetweenUser = db.Messages.Where(x => 
                (x.ToUser == toUserId && x.FromUser == user.Id) || (x.FromUser == toUserId && x.ToUser == user.Id))
                    .ToList();
            }

            if(toGroupId != null)
            {
                toGroup = db.Groups.FirstOrDefault(x => x.Id == toGroupId);
                historyMessageBetweenUser = db.Messages.Where(x => x.GroupId == toGroupId).ToList();
            }
        }

        public async Task<IActionResult> OnPostSendMessage(string message, int idCurrentUser, int? toUserId, int? toGroupId)
        {
            Message mess = new Message()
            {
                FromUser = idCurrentUser,
                ToUser = toUserId,
                GroupId = toGroupId,
                Message1 = message,
                CreateDate = DateTime.Now
            };
            db.Add(mess);
            db.SaveChanges();
            await hub.Clients.All.SendAsync("ReloadDocuments");

            return toUserId != null ? Redirect($"./Chat?toUserId={toUserId}") : Redirect($"./Chat?toGroupId={toGroupId}");
        }

        public async Task<IActionResult> OnPostCreateNewMess(int[] users, string message,int idCurrentUser)
        {
            for(int i = 0; i  <users.Length; i++)
            {
                Message mess = new Message()
                {
                    FromUser = idCurrentUser,
                    ToUser = users[i],
                    Message1 = message,
                    CreateDate = DateTime.Now
                };
                db.Add(mess);
            }
            db.SaveChanges();
            await hub.Clients.All.SendAsync("ReloadDocuments");
            return Redirect($"./Chat");
        }


        public async Task<IActionResult> OnPostCreateGroup(int[] users,int idCurrentUser, string name)
        {
            Group gr = new Group()
            {
                Name = name,
                CreatedAt = DateTime.Now,
                CreatedBy = idCurrentUser
            };
            db.Groups.Add(gr);
            db.SaveChanges();

            GroupMember grMem = new GroupMember()
            {
                GroupId = gr.Id,
                UserId = idCurrentUser,
                JoinedAt = DateTime.Now,
            };
            db.Add(grMem);
            for (int i = 0; i < users.Length; i++)
            {
                GroupMember groupMember = new GroupMember()
                {
                    GroupId = gr.Id,
                    UserId = users[i],
                    JoinedAt = DateTime.Now,
                };
                db.Add(groupMember);
            }
            db.SaveChanges();
            await hub.Clients.All.SendAsync("ReloadDocuments");
            return Redirect($"./Chat");
        }

        
    }
}
