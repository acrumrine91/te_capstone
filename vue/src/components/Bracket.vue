<template>
  <div>
    <br />
    <h1>Bracket Preview (Not Final)</h1>
    <br/>
    <input class="btn submit" type="button" @click.prevent="submitMatches" value="Save Changes" /> 
    <main id="tournament">
      <ul class="round round-1">
        <div v-for="match in roundOneMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinner(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <li class="game game-spacer">&nbsp;</li>
          <li
            class="game game-bottom actual-game"
            v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
            @click="declareWinner(match, match.bottomUser)"
          >
            {{ match.bottomUser }}
          </li>
        </div>
        <li class="spacer">&nbsp;</li>
      </ul>
      <ul class="round round-2">
        <div v-for="match in roundTwoMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundOneMatches.length != 1">&nbsp;</li>

          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundTwo(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundOneMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundTwo(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer" v-show="roundOneMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-3" v-show="usersInTourney.length > 3">
        <div v-for="match in roundThreeMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundTwoMatches.length != 1">&nbsp;</li>

          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundThree(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundTwoMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundThree(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer" v-show="roundTwoMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-4" v-show="usersInTourney.length > 7">
        <div v-for="match in roundFourMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundThreeMatches.length != 1">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundFour(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundThreeMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundFour(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer" v-show="roundThreeMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-5" v-show="usersInTourney.length > 15">
        <div v-for="match in roundFiveMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundFourMatches.length != 1">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundFive(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFourMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundFive(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
    
            <li class="spacer" v-show="roundFourMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-6" v-show="usersInTourney.length > 31">
        <div v-for="match in roundSixMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundFiveMatches.length != 1">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundSix(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFiveMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundSix(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>    
            <li class="spacer" v-show="roundFiveMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul> 
      <ul class="round round-7" v-show="usersInTourney.length > 63">
        <div v-for="match in roundSevenMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundSixMatches.length != 1">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true', loser: match.topUserWon == 'false' }"
            @click="declareWinnerRoundSeven(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundSixMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false', loser: match.topUserWon == 'true' }"
              @click="declareWinnerRoundSeven(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>    
            <li class="spacer" v-show="roundSixMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul> 
    </main>
    <input class="btn submit" type="button" @click.prevent="submitMatches" value="Save Changes" /> 
  </div>
</template>

<script>

import matchService from "@/services/MatchService.js";

export default {
  name: "bracket",
  data() {
    return {
      usersInTourney: this.$store.state.users,
      roundOneMatches: [],
      roundTwoMatches: [],
      roundThreeMatches: [],
      roundFourMatches: [],
      roundFiveMatches: [],
      roundSixMatches: [],
      roundSevenMatches: [],
    };
  },
  created() {
    this.roundOneMatches = this.buildOfficialMatchups();
    this.roundTwoMatches = this.buildBlankMatchups(2);
    this.roundThreeMatches = this.buildBlankMatchups(4);
    this.roundFourMatches = this.buildBlankMatchups(8);
    this.roundFiveMatches = this.buildBlankMatchups(16);
    this.roundSixMatches = this.buildBlankMatchups(32);
    this.roundSevenMatches = this.buildBlankMatchups(64);
  },
  methods: {
    declareWinner(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundTwoMatches[match.matchId].topUser = winner;
        } else {
          this.roundTwoMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundTwoMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundTwoMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    declareWinnerRoundTwo(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundThreeMatches[match.matchId].topUser = winner;
        } else {
          this.roundThreeMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundThreeMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundThreeMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    declareWinnerRoundThree(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundFourMatches[match.matchId].topUser = winner;
        } else {
          this.roundFourMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundFourMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundFourMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    declareWinnerRoundFour(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundFiveMatches[match.matchId].topUser = winner;
        } else {
          this.roundFiveMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundFiveMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundFiveMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    declareWinnerRoundFive(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundSixMatches[match.matchId].topUser = winner;
        } else {
          this.roundSixMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundSixMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundSixMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    declareWinnerRoundSix(match, winner) {
      if (winner == match.topUser) {
        match.topUserWon = "true";
      } else {
        match.topUserWon = "false";
      }
      if (match.matchId == 0 || match.matchId == 1) {
        if (match.matchId % 2 == 0) {
          this.roundSevenMatches[match.matchId].topUser = winner;
        } else {
          this.roundSevenMatches[match.matchId - 1].bottomUser = winner;
        }
      } else {
        if (match.matchId % 2 == 0) {
          this.roundSevenMatches[match.matchId / 2].topUser = winner;
        } else {
          this.roundSevenMatches[(match.matchId - 1) / 2].bottomUser = winner;
        }
      }
    },
    buildBlankMatchups(input) {
      const matchup = [];
      for (let i = 0; i < this.usersInTourney.length / (input * 2); i++) {
        matchup[i] = {
          matchId: i,
          topUser: "TBD",
          bottomUser: "TBD",
          topUserWon: "",
          roundId: this.calculateRound(input, 0),
        };
      }
      return matchup;
    },
    calculateRound(input, roundNum) {
      let test = input;
      test /= 2;
      if (test > 1){
        roundNum++;
        return this.calculateRound(test, roundNum);
      }
      else {
        return roundNum + 1;
      }
    },

    buildOfficialMatchups() {
      const matchup = [];
      const topUsers = [];
      for (let i = 0; i < this.$store.state.users.length; i += 2) {
        topUsers.push(this.$store.state.users[i]);
      }
      const bottomUsers = [];
      for (let i = 1; i < this.$store.state.users.length; i += 2) {
        bottomUsers.push(this.$store.state.users[i]);
      }
      for (let i = 0; i < topUsers.length; i++) {
        matchup[i] = {
          matchId: i,
          topUser: topUsers[i].username,
          bottomUser: bottomUsers[i].username,
          topUserWon: "",
          roundId: 0
        };
      }
      console.log("test");
      return matchup;
    },
    submitMatches() {
      let matchesToSubmit = [
        this.roundOneMatches,
        this.roundTwoMatches,
        this.roundThreeMatches,
        this.roundFourMatches,
        this.roundFiveMatches,
        this.roundSixMatches,
        this.roundSevenMatches,
      ];
        matchesToSubmit = matchesToSubmit.filter(round => round.length != 0);

        matchService.updateMatchResults(matchesToSubmit, this.$route.params.tournamentId)
        .then(response => {
          if (response.status === 200){
            this.$store.commit('POST_TOURNAMENT_MATCHES', response.data);
            // Get all matches from DB
            this.$router.push({name: 'tournament-details'})
          }
        })
        .catch(e => {
          console.log("Error updating bracket! " + e.message)
        })
    }
  },
};
</script>

<style>
main {
  display: flex;
  flex-direction: row;
}
.round {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 200px;
  list-style: none;
  padding: 0;
}
.round .spacer {
  flex-grow: 1;
}
.round-2 .spacer {
  line-height: 35px;
}
.round .spacer:first-child,
.round .spacer:last-child {
  flex-grow: 0.5;
}

.round .game-spacer {
  flex-grow: 1;
}

/*
 *  General Styles
*/
body {
  font-family: sans-serif;
  font-size: small;
  padding: 10px;
  line-height: 1.4em;
}

li.game {
  padding-left: 20px;
}

li.game.winner {
  font-weight: bolder;
  color: #00bc8c;
  text-decoration: none !important;
}
li.game span {
  float: right;
  margin-right: 5px;
}

li.game-top {
  border-bottom: 1px solid #00bc8c;
  cursor:pointer;
}

li.game-spacer {
  border-right: 1px solid #00bc8c;
  min-height: 40px;
}

.round-2 li.game-spacer {
  min-height: 97px;
}
.round-2 li.spacer {
  height: 29px;
}

.round-3 li.spacer {
  height: 75px;
}
.round-3 li.game-spacer {
  min-height: 195px;
}
.round-4 li.spacer {
  height: 175px;
}
.round-4 li.game-spacer {
  min-height: 380px;
}
.round-5 li.spacer {
  height: 360px;
}
.round-5 li.game-spacer {
  min-height: 780px;
}
.round-6 li.spacer {
  height: 360px;
}
.round-6 li.game-spacer {
  min-height: 1550px;
}
.round-7 li.spacer {
  height: 0;
}

li.game-bottom {
  border-top: 1px solid #00bc8c;
  cursor: pointer;
}
 li.game.loser {
  text-decoration: line-through;
  color: orangered;
 }
.btn.submit {
  float: right;
}

</style>