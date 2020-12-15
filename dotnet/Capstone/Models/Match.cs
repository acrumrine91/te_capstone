using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Match
    {
        public int TournamentId { get; set; } = 0;
        public int RoundId { get; set; } = 0;
        public int MatchId { get; set; } = 0;
        public string TopUser { get; set; }
        public string BottomUser { get; set; }
        public bool TopUserWon { get; set; }
        public string Tournament_Round_MatchId {
            get
            {
                return $"{TournamentId}:{RoundId}:{MatchId}";
            }
            set 
            { 

            }
        }
    }
}
