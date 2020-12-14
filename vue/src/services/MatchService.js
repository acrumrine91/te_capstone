import axios from 'axios';

//const myServerURL = "https://localhost:44315"

export default {

    PostTournamentMatches(matches, tournament_id) {
        return axios.post(`/Match/${tournament_id}`, matches);
    },
    getAllMatches(tournament_id) {
        return axios.get(`/Match/${tournament_id}`);
    },
    updateMatchResults(matches, tournament_id) {
        return axios.put(`/Match/${tournament_id}`, matches);
    },

}