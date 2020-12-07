using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

//namespace Capstone.Controllers
//{
//    [Route("[controller]/create-tournament")]
//    [ApiController]
//    public class TournamentController : ControllerBase
//    {

//        [HttpPost]
//        public IActionResult CreateTournament(Tournament newTournament)
//        {
//            IActionResult result;

//            User existingUser = userDAO.GetUser(userParam.Username);
//            if (existingUser != null)
//            {
//                return Conflict(new { message = "Username already taken. Please choose a different username." });
//            }

//            User user = userDAO.AddUser(userParam.Username, userParam.Password, userParam.Role, userParam.Email);
//            if (user != null)
//            {
//                result = Created(user.Username, null); //values aren't read on client
//            }
//            else
//            {
//                result = BadRequest(new { message = "An error occurred and user was not created." });
//            }

//            return result;
//        }
//    }
//}
