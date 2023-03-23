using System;
using System.Collections.Generic;

namespace ChatApp.Models
{
    public partial class Message
    {
        public int Id { get; set; }
        public int FromUser { get; set; }
        public int? ToUser { get; set; }
        public string Message1 { get; set; } = null!;
        public DateTime CreateDate { get; set; }
        public int? GroupId { get; set; }

        public virtual User FromUserNavigation { get; set; } = null!;
        public virtual User? ToUserNavigation { get; set; }
        public virtual Group? Group { get; set; }
    }
}
