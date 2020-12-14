﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class MatchController : Controller
    {
        private readonly IMatchDAO matchesDAO;

        public MatchController(IMatchDAO _matchesDAO)
        {
            this.matchesDAO = _matchesDAO;
        }

        [HttpGet("{tournamentId}")]
        public IActionResult GetMatches(int tournamentId)
        {
            List<Match> matches = new List<Match>();

            matches = this.matchesDAO.GetAllMatches(tournamentId);

            return Ok(matches);
        }
    }
}
