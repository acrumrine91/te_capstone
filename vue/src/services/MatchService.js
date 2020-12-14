import axios from 'axios';

//const myServerURL = "https://localhost:44315"

export default {

    PostTournamentMatches(matches, tournament_id) {
        return axios.post(`/Match/${tournament_id}`, tournament_id);
    },
    getAllMatches(tournament_id) {
        return axios.get(`/Match/${tournament_id}`);
    },
    updateMatchResults(tournament_round_matchId) {
        return axios.put(`/Match/${tournament_round_matchId}`);
    },

}