using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class MatchSqlDAO : IMatchDAO
    {
        private readonly string connectionString;

        private readonly string sqlGetAllMatches = "SELECT * FROM matches WHERE tournament_id = @tournament_id;";
        private readonly string sqlUpdateMatches = "UPDATE matches SET top_user_won = @top_user_won, top_user = @top_user, bottom_user = @bottom_user,  WHERE tournament_round_match_id = @tournament_round_match_id;";
        private readonly string sqlPostTournamentMatches = "INSERT INTO matches (tournament_round_match_id, tournament_id, round_id, match_id, top_user, bottom_user)" +
            "VALUES (@tournament_round_match_id, @tournament_id, @round_id, @match_id, @top_user, @bottom_user);";

        public MatchSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Match> GetAllMatches(int tournamentId)
        {
            List<Match> allMatches = new List<Match>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetAllMatches, conn);
                cmd.Parameters.AddWithValue("@tournament_id", tournamentId);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Match currMatch = new Match();

                        currMatch.TournamentId = Convert.ToInt32(reader["tournament_id"]);
                        currMatch.RoundId = Convert.ToInt32(reader["round_id"]);
                        currMatch.MatchId = Convert.ToInt32(reader["match_id"]);
                        currMatch.TopUser = Convert.ToString(reader["top_user"]);
                        currMatch.BottomUser = Convert.ToString(reader["bottom_user"]);
                        currMatch.TopUserWon = Convert.ToString(reader["top_user_won"]);
                        currMatch.Tournament_Round_MatchId = Convert.ToString(reader["tournament_round_match_id"]);

                        allMatches.Add(currMatch);
                    }
                }
            }
            return allMatches;
        }

        public int PostTournamentMatches(List<Match> matches, int tournamentId)
        {
            int rowsAffected = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // tournament_round_match_id, tournament_id, round_id, match_id, top_user, bottom_user

                foreach (Match currMatch in matches)
                {
                    SqlCommand cmd = new SqlCommand(sqlPostTournamentMatches, conn);
                    cmd.Parameters.AddWithValue("@tournament_round_match_id", $"{tournamentId}:{currMatch.RoundId}:{currMatch.MatchId}");
                    cmd.Parameters.AddWithValue("@tournament_id", tournamentId);
                    cmd.Parameters.AddWithValue("@round_id", currMatch.RoundId);
                    cmd.Parameters.AddWithValue("@match_id", currMatch.MatchId);
                    cmd.Parameters.AddWithValue("@top_user", currMatch.TopUser);
                    cmd.Parameters.AddWithValue("@bottom_user", currMatch.BottomUser);

                    rowsAffected += cmd.ExecuteNonQuery();
                }
            }
            return rowsAffected;
        }

        public int UpdateMatchResults(List<Match> matches, int tournamentId)
        {
            int rowsAffected = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // tournament_round_match_id, tournament_id, round_id, match_id, top_user, bottom_user

                foreach (Match currMatch in matches)
                {
                    if(currMatch.TopUser == "TBD" && currMatch.BottomUser == "TBD")
                    {
                        // DO NOTHING -- DON'T UPDATE THAT MATCH IF BOTH USERS ARE STILL TBD
                    }
                    else
                    {

                    SqlCommand cmd = new SqlCommand(sqlUpdateMatches, conn);
                    cmd.Parameters.AddWithValue("@tournament_round_match_id", $"{tournamentId}:{currMatch.RoundId}:{currMatch.MatchId}");
                    cmd.Parameters.AddWithValue("@top_user", currMatch.TopUser);
                    cmd.Parameters.AddWithValue("@bottom_user", currMatch.BottomUser);
                        cmd.Parameters.AddWithValue("@top_user_won", currMatch.TopUserWon);

                    rowsAffected += cmd.ExecuteNonQuery();
                    }
                }
            }
            return rowsAffected;
        }
    }
}
