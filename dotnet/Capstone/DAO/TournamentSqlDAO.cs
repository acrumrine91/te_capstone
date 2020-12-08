using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class TournamentSqlDAO : ITournamentDAO
    {
        private readonly string connectionString;

        private string sqlCreateTournament = "INSERT INTO tournaments (user_id, name, in_person, zip_code, link, size, style, match_style, match_size, description, registration_closed_date, start_date, registration_type)" +
            "VALUES (@user_id, @name, @in_person, @zip_code, @link, @size, @style, @match_style, @match_size, @description, @registration_closed_date, @start_date, @registration_type)";

        public TournamentSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Tournament CreateTournament(Tournament newTournament, int userId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlCreateTournament, conn);
                //user_id, name, in_person, zip_code, link, size, style, match_style, match_size, 
                //description, registration_closed_date, start_date, registration_type
                cmd.Parameters.AddWithValue("@user_id", userId); // GET THE REAL USER ID
                cmd.Parameters.AddWithValue("@name", newTournament.Name);
                cmd.Parameters.AddWithValue("@in_person", newTournament.InPerson);
                cmd.Parameters.AddWithValue("@zip_code", newTournament.ZipCode);
                cmd.Parameters.AddWithValue("@link", newTournament.Link);
                cmd.Parameters.AddWithValue("@size", newTournament.Size);
                cmd.Parameters.AddWithValue("@style", newTournament.Style);
                cmd.Parameters.AddWithValue("@match_style", newTournament.MatchStyle);
                cmd.Parameters.AddWithValue("@match_size", newTournament.MatchSize);
                cmd.Parameters.AddWithValue("@description", newTournament.Description);
                cmd.Parameters.AddWithValue("@registration_closed_date", newTournament.RegistrationClosedDate);
                cmd.Parameters.AddWithValue("@start_date", newTournament.StartDate);
                cmd.Parameters.AddWithValue("@registration_type", newTournament.RegistrationType);
                cmd.ExecuteNonQuery();
            }
            return newTournament;
        }
    }
}
