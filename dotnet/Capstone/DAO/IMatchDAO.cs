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

        int UpdateMatchResults(List<Match> matches, int tournamentId);
        int PostTournamentMatches(List<Match> matches, int tournamentId);


    }
}
