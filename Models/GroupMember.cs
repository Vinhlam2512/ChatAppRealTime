using System;
using System.Collections.Generic;

namespace ChatApp.Models
{
    public partial class GroupMember
    {
        public GroupMember()
        {
            Messages = new HashSet<Message>();
        }

        public int Id { get; set; }
        public int GroupId { get; set; }
        public int UserId { get; set; }
        public DateTime JoinedAt { get; set; }

        public virtual Group Group { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual ICollection<Message> Messages { get; set; }
    }
}
