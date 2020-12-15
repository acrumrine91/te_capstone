using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IMatchDAO
    {
        List<Match> GetAllMatches(int tournamentId);

        void UpdateMatchResults(string tournament_round_matchId, string top_user_won);
        int PostTournamentMatches(List<Match> matches, int tournamentId);


    }
}
