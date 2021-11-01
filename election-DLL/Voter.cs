using System;
using System.Collections.Generic;

#nullable disable

namespace election_DLL
{
    public partial class Voter
    {
        public string FullName { get; set; }
        public string Id { get; set; }
        public string IdDate { get; set; }
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string EMail { get; set; }
        public string City { get; set; }
        public string IsVoted { get; set; }
        public string VotedFor { get; set; }
    }
}
