using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]/create-tournament")]
    [ApiController]
    public class TournamentController : ControllerBase
    {
        private readonly ITournamentDAO tournamentDAO;

        public TournamentController(ITournamentDAO _tournamentDAO)
        {
            tournamentDAO = _tournamentDAO;
        }

        [HttpPost]
        public ActionResult<Tournament> CreateTournament(Tournament newTournament)
        {
            Tournament result = this.tournamentDAO.CreateTournament(newTournament);

            return Created("/" + newTournament.TournamentId.ToString(), newTournament);
        }
       
    }
}
