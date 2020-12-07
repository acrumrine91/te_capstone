using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Tournament
    {
        public int TournamentId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public bool InPerson { get; set; }
        public int ZipCode { get; set; }
        public string Link { get; set; }
        public string Size { get; set; }
        public string Style { get; set; }
        public string MatchStyle { get; set; }
        public int MatchSize { get; set; }
        public string Description { get; set; }
        public DateTime RegistrationClosedDate { get; set; }
        public DateTime StartDate { get; set;}
        public string RegistrationType { get; set; }
    }
}
