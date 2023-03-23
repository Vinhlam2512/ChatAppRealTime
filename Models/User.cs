using System;
using System.Collections.Generic;

namespace ChatApp.Models
{
    public partial class User
    {
        public User()
        {
            GroupMembers = new HashSet<GroupMember>();
            MessageFromUserNavigations = new HashSet<Message>();
            MessageToUserNavigations = new HashSet<Message>();
        }

        public int Id { get; set; }
        public string? Img { get; set; }
        public string UserName { get; set; } = null!;
        public string PassWord { get; set; } = null!;
        public bool IsOnline { get; set; }

        public virtual ICollection<GroupMember> GroupMembers { get; set; }
        public virtual ICollection<Message> MessageFromUserNavigations { get; set; }
        public virtual ICollection<Message> MessageToUserNavigations { get; set; }
    }
}
