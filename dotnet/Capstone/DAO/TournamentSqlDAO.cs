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

        private string sqlCreateTournament = "INSERT INTO tournaments (user_id, name, in_person, zip_code, link, size, style, description, registration_closed_date, start_date, registration_type)" +
            "VALUES (@user_id, @name, @in_person, @zip_code, @link, @size, @style, @description, @registration_closed_date, @start_date, @registration_type); SELECT @@IDENTITY";

        private string sqlGetAllTournaments = "SELECT * FROM tournaments;";

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
                cmd.Parameters.AddWithValue("@description", newTournament.Description);
                cmd.Parameters.AddWithValue("@registration_closed_date", newTournament.RegistrationClosedDate);
                cmd.Parameters.AddWithValue("@start_date", newTournament.StartDate);
                cmd.Parameters.AddWithValue("@registration_type", newTournament.RegistrationType);
                newTournament.TournamentId = Convert.ToInt32(cmd.ExecuteScalar());
                newTournament.UserId = userId;

            }
            return newTournament;
        }

        public List<Tournament> GetAllTournaments()
        {
            List<Tournament> allTournaments = new List<Tournament>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetAllTournaments, conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Tournament currTourn = new Tournament();

                        currTourn.TournamentId = Convert.ToInt32(reader["tournament_id"]);
                        currTourn.UserId = Convert.ToInt32(reader["user_id"]);
                        currTourn.Name = Convert.ToString(reader["name"]);
                        currTourn.InPerson = Convert.ToBoolean(reader["in_person"]);
                        currTourn.ZipCode = Convert.ToInt32(reader["zip_code"]);
                        currTourn.Link = Convert.ToString(reader["link"]);
                        currTourn.Size = Convert.ToString(reader["size"]);
                        currTourn.Style = Convert.ToString(reader["style"]);
                        currTourn.Description = Convert.ToString(reader["description"]);
                        currTourn.RegistrationClosedDate = Convert.ToDateTime(reader["registration_closed_date"]);
                        currTourn.StartDate = Convert.ToDateTime(reader["start_date"]);
                        currTourn.RegistrationType = Convert.ToString(reader["registration_type"]);

                        allTournaments.Add(currTourn);
                    }
                }
            }
            return allTournaments;
        }
    }
}
