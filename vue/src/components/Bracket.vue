<template>
  <div>
    <br />
    <h1>Bracket Preview (Not Final)</h1>
    <main id="tournament">
      <ul class="round round-1">
        <div v-for="match in roundOneMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinner(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <li class="game game-spacer">&nbsp;</li>
          <li
            class="game game-bottom actual-game"
            v-bind:class="{ winner: match.topUserWon == 'false' }"
            @click="declareWinner(match, match.bottomUser)"
          >
            {{ match.bottomUser }}
          </li>
        </div>
        <li class="spacer">&nbsp;</li>
      </ul>
      <ul class="round round-2">
        <div v-for="match in roundTwoMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>

          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinnerRoundTwo(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundOneMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false' }"
              @click="declareWinnerRoundTwo(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-3">
        <div v-for="match in roundThreeMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>

          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinnerRoundThree(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundTwoMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false' }"
              @click="declareWinnerRoundThree(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-4">
        <div v-for="match in roundFourMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinnerRoundFour(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundThreeMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false' }"
              @click="declareWinnerRoundFour(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer">&nbsp;</li>
          </div>
        </div>
      </ul>
      <ul class="round round-5">
        <div v-for="match in roundFiveMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinnerRoundFive(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFourMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false' }"
              @click="declareWinnerRoundFive(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
    
            <li class="spacer">&nbsp;</li>
          </div>
        </div>
      </ul>
      <!-- <ul class="round round-6">
        <div v-for="match in roundSixMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{ winner: match.topUserWon == 'true' }"
            @click="declareWinnerRoundSix(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFiveMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{ winner: match.topUserWon == 'false' }"
              @click="declareWinnerRoundSix(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
    
            <li class="spacer">&nbsp;</li>
          </div>
        </div>
      </ul> 
      Finish the logic for round 6 and finish round 7!!!
      -->
    </main>
  </div>
</template>

<script>
export default {
  name: "bracket",
  data() {
    return {
      matchOver: false,
      usersInTourney: this.$store.state.users,
      usersInTourneyRound2: this.$store.state.users.filter(
        (user) => user.user_id % 2 == 0
      ),
      usersInTourneyRound3: this.$store.state.users.filter(
        (user) => user.user_id % 4 == 0
      ),
      usersInTourneyRound4: this.$store.state.users.filter(
        (user) => user.user_id == 5
      ),
      roundOneMatches: [],
      roundTwoMatches: [],
      roundThreeMatches: [],
      roundFourMatches: [],
      roundFiveMatches: [],
    };
  },
  created() {
    this.roundOneMatches = this.buildOfficialMatchups();
    this.roundTwoMatches = this.buildBlankMatchups(2);
    this.roundThreeMatches = this.buildBlankMatchups(4);
    this.roundFourMatches = this.buildBlankMatchups(8);
    this.roundFiveMatches = this.buildBlankMatchups(16);
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
    buildBlankMatchups(input) {
      const matchup = [];
      for (let i = 0; i < this.usersInTourney.length / (input * 2); i++) {
        matchup[i] = {
          matchId: i,
          topUser: "tbd",
          bottomUser: "tbd",
          topUserWon: "",
        };
      }
      return matchup;
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
        };
      }
      console.log("test");
      return matchup;
    },
  },

  computed: {
    // findTopUsersInMatch() {
    //   const topUsers= [];
    //   for (let i = 0; i < this.$store.state.users.length; i+=2 ) {
    //       topUsers.push(this.$store.state.users[i])
    //   }
    //   return topUsers;
    // },
    // findBottomUsersInMatch() {
    //   const bottomUsers= [];
    //   for (let i = 1; i < this.$store.state.users.length; i+=2 ) {
    //       bottomUsers.push(this.$store.state.users[i])
    //   }
    //   return bottomUsers;
    // },
    // buildMatchups() {
    //   const matchup= [];
    //   const topUsers= this.findTopUsersInMatch;
    //   const bottomUsers = this.findBottomUsersInMatch;
    //   for (let i = 0; i < (topUsers.length); i++) {
    //     matchup[i] = {
    //       username: topUsers[i],
    //       opponent: bottomUsers[i],
    //     };
    //   }
    //   return matchup;
    // },

    buildMatchupsRound2() {
      return [1, 2];
    },
    buildMatchupsRound3() {
      return [1];
    },
    findTopUsersInRoundTwo() {
      const topUsersRoundTwo = [];
      for (let i = 0; i < this.roundOneWinners.length; i += 2) {
        topUsersRoundTwo.push(this.roundOneWinners[i]);
      }
      return topUsersRoundTwo;
    },
    findBottomUsersInRoundTwo() {
      const bottomUsersRoundTwo = [];
      for (let i = 1; i < this.roundOneWinners.length; i += 2) {
        bottomUsersRoundTwo.push(this.roundOneWinners[i]);
      }
      return bottomUsersRoundTwo;
    },
    buildMatchupsRoundTwo() {
      const matchup = [];
      const topUsers = this.findTopUsersInRoundTwo;
      const bottomUsers = this.findBottomUsersInRoundTwo;
      for (let i = 0; i < topUsers.length; i++) {
        matchup[i] = {
          username: topUsers[i],
          opponent: bottomUsers[i],
        };
      }
      return matchup;
    },
    findTopUsersInRoundThree() {
      const topUsersRoundThree = [];
      for (let i = 0; i < this.roundTwoWinners.length; i += 2) {
        topUsersRoundThree.push(this.roundTwoWinners[i]);
      }
      return topUsersRoundThree;
    },
    findBottomUsersInRoundThree() {
      const bottomUsersRoundThree = [];
      for (let i = 1; i < this.roundTwoWinners.length; i += 2) {
        bottomUsersRoundThree.push(this.roundTwoWinners[i]);
      }
      return bottomUsersRoundThree;
    },
    buildMatchupsRoundThree() {
      const matchup = [];
      const topUsers = this.findTopUsersInRoundThree;
      const bottomUsers = this.findBottomUsersInRoundThree;
      for (let i = 0; i < topUsers.length; i++) {
        matchup[i] = {
          username: topUsers[i],
          opponent: bottomUsers[i],
        };
      }
      return matchup;
    },
    findWinner() {
      return this.roundThreeWinners;
    },
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
  color: red;
  text-decoration: none !important;
}
li.game span {
  float: right;
  margin-right: 5px;
}

li.game-top {
  border-bottom: 1px solid #00bc8c;
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
li.game-bottom {
  border-top: 1px solid #00bc8c;
}
div.loser .actual-game {
  text-decoration: line-through;
}
main#tournament:first-child {
  background-color: purple !important;
}
</style>