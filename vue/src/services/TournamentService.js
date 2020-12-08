import axios from 'axios';

//const myServerURL = "https://localhost:44315/"

export default {

  createTournament(newTournament) {
    return axios.post('/create-tournament', newTournament)
  }

}