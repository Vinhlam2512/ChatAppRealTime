using System;
using System.Collections.Generic;

namespace ChatApp.Models
{
    public partial class Group
    {
        public Group()
        {
            GroupMembers = new HashSet<GroupMember>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }

        public virtual ICollection<GroupMember> GroupMembers { get; set; }
    }
}
