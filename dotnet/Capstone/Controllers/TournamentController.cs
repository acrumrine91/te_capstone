using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]/tournament")]
    [ApiController]
    public class TournamentController : ControllerBase
    {
        private readonly ITournamentDAO tournamentDAO;

        public TournamentController(ITournamentDAO _tournamentDAO)
        {
            this.tournamentDAO = _tournamentDAO;
        }

        [HttpPost("/create-tournament")]
        public IActionResult CreateTournament(Tournament newTournament)
        {
            Tournament result = this.tournamentDAO.CreateTournament(newTournament);

            return Created("/" + newTournament.TournamentId.ToString(), newTournament);
        }
    }
}
