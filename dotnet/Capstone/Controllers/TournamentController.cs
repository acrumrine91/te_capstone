using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("[controller]/tournament")]
    [ApiController]
    [Authorize]
    public class TournamentController : ControllerBase
    {
        private readonly ITournamentDAO tournamentDAO;

        public TournamentController(ITournamentDAO _tournamentDAO)
        {
            this.tournamentDAO = _tournamentDAO;
        }

        [HttpPost("/create-tournament")]
        [Authorize]
        public IActionResult CreateTournament(Tournament newTournament)
        {
            int userId = int.Parse(User.FindFirst("sub").Value);

            Tournament result = this.tournamentDAO.CreateTournament(newTournament, userId);

            return Created("/" + newTournament.TournamentId.ToString(), newTournament);
        }

        [HttpGet("/browse")]
        [AllowAnonymous]
        public IActionResult GetAllTournaments()
        {
            List<Tournament> result = new List<Tournament>();

            result = this.tournamentDAO.GetAllTournaments();

            return Ok(result);


        }
    }
}
