import axios from 'axios';

//const myServerURL = "https://localhost:44315/"

export default {

  createTournament(newTournament) {

    // if (newTournament.inPerson == "inPerson") {
    //   newTournament.inPerson = true;
    // } else {
    //   newTournament.inPerson = false;
    // }

    return axios.post('/create-tournament', newTournament)
  },
  getAllTournaments(){
    return axios.get('/browse')
  },
  getTournamentDetails(tournamentId) {
    return axios.get(`/${tournamentId}`)
  },

}