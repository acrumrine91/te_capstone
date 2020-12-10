using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface ITournamentDAO
    {
        Tournament CreateTournament(Tournament newTournament, int userId);

        List<Tournament> GetAllTournaments();
    }
}
