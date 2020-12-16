<template>
  <div>
    <div class="center">
      <input
        type="button"
        class="btn submit centered"
        value="Join Tournament"
        @click.prevent="joinUserToTournament"
      />
    </div>
    <br />
    <h1>Bracket Preview (Not Final)</h1>
    <br />
    <input
      v-if="
        this.$store.state.currentTournament.userId ==
        this.$store.state.user.userId
      "
      class="btn submit"
      type="button"
      @click.prevent="submitMatches"
      value="Save Changes"
    />
    <input
      v-else
      class="btn submit locked"
      type="button"
      value="Save Changes"
    />
    <main id="tournament">
      <ul class="round round-1">
        <div v-for="match in roundOneMatches" v-bind:key="match.matchId">
          <li class="spacer">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{
              winner: match.topUserWon == 'true',
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinner(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <li class="game game-spacer">&nbsp;</li>
          <li
            class="game game-bottom actual-game"
            v-bind:class="{
              winner: match.topUserWon == 'false',
              loser: match.topUserWon == 'true',
            }"
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
            v-bind:class="{
              winner: match.topUserWon == 'true',
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinnerRoundTwo(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundOneMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
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
            v-bind:class="{
              winner: match.topUserWon == 'true',
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinnerRoundThree(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundTwoMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
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
            v-bind:class="{
              winner: match.topUserWon == 'true' || (roundThreeMatches.length == 1 && match.topUser != 'TBD'),
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinnerRoundFour(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundThreeMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
              @click="declareWinnerRoundFour(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer" v-show="roundThreeMatches.length != 1">
              &nbsp;
            </li>
          </div>
        </div>
      </ul>
      <ul class="round round-5" v-show="usersInTourney.length > 15">
        <div v-for="match in roundFiveMatches" v-bind:key="match.matchId">
          <li class="spacer" v-show="roundFourMatches.length != 1">&nbsp;</li>
          <li
            class="game game-top actual-game"
            v-bind:class="{
              winner: match.topUserWon == 'true' || (roundFourMatches.length == 1 && match.topUser != 'TBD'),
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinnerRoundFive(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFourMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
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
            v-bind:class="{
              winner: match.topUserWon == 'true' || (roundFiveMatches.length == 1 && match.topUser != 'TBD'),
              loser: match.topUserWon == 'false',
            }"
            @click="declareWinnerRoundSix(match, match.topUser)"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundFiveMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
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
            v-bind:class="{
              winner: match.topUserWon == 'true' || (roundSixMatches.length == 1 && match.topUser != 'TBD'),
              loser: match.topUserWon == 'false',
            }"
          >
            {{ match.topUser }}
          </li>
          <div v-show="roundSixMatches.length != 1">
            <li class="game game-spacer">&nbsp;</li>
            <li
              class="game game-bottom actual-game"
              v-bind:class="{
                winner: match.topUserWon == 'false',
                loser: match.topUserWon == 'true',
              }"
              @click="declareWinnerRoundSeven(match, match.bottomUser)"
            >
              {{ match.bottomUser }}
            </li>
            <li class="spacer" v-show="roundSixMatches.length != 1">&nbsp;</li>
          </div>
        </div>
      </ul>
    </main>
    <input
      v-if="
        this.$store.state.currentTournament.userId ==
        this.$store.state.user.userId
      "
      class="btn submit"
      type="button"
      @click.prevent="submitMatches"
      value="Save Changes"
    />
    <input
      v-else
      class="btn submit locked"
      type="button"
      value="Save Changes"
    />
  </div>
</template>

<script>
import matchService from "@/services/MatchService.js";
import TournamentService from "@/services/TournamentService.js";

export default {
  name: "bracket",
  data() {
    return {
      usersInTourney: [],
      roundOneMatches: [],
      roundTwoMatches: [],
      roundThreeMatches: [],
      roundFourMatches: [],
      roundFiveMatches: [],
      roundSixMatches: [],
      roundSevenMatches: [],
      allRounds: [],
      allMatches: [],
    };
  },
  created() {
    this.setInitialUsers();
  },
  methods: {
    joinUserToTournament() {
      if (!this.$store.state.user.username) {
        this.$router.push({ name: "login" });
      } else if (
        this.usersInTourney.includes(this.$store.state.user.username)
      ) {
        console.log("You are already in this tournament!");
      } else {
        this.usersInTourney[
          this.usersInTourney.indexOf("TBD")
        ] = this.$store.state.user.username;
        this.roundOneMatches = this.buildOfficialMatchups();

        this.consolidateAllRounds();
        this.consolidateAllMatches();

       matchService
        .updateMatchResults(this.allMatches, this.$route.params.tournamentId)
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("UPDATE_TOURNAMENT_MATCHES", this.allMatches);
          }
        })
        .catch((e) => {
          console.log("Error updating bracket! " + e.message);
        });
        // matchService
        //     .getAllMatches(this.$route.params.tournamentId)
        //     .then((response) => {
        //       if (response.status == 200) {
        //         console.log(response.data);
        //         if (response.data.length > 0) {
        //           response.data.forEach((match) => {
        //             if (!this.usersInTourney.includes(match.TopUser)) {
        //               this.usersInTourney[this.usersInTourney.indexOf(match)] =
        //                 match.topUser;
        //             }
        //             if (!this.usersInTourney.includes(match.BottomUser)) {
        //               this.usersInTourney[this.usersInTourney.indexOf(match)] =
        //                 match.topUser;
        //             }
        //           });
        //           this.roundOneMatches = this.buildOfficialMatchups();
        //           this.roundTwoMatches = this.buildBlankMatchups(2);
        //           this.roundThreeMatches = this.buildBlankMatchups(4);
        //           this.roundFourMatches = this.buildBlankMatchups(8);
        //           this.roundFiveMatches = this.buildBlankMatchups(16);
        //           this.roundSixMatches = this.buildBlankMatchups(32);
        //           this.roundSevenMatches = this.buildBlankMatchups(64);
        //           console.log("help");
        //         } else {
        //           this.roundOneMatches = this.buildOfficialMatchups();
        //           this.roundTwoMatches = this.buildBlankMatchups(2);
        //           this.roundThreeMatches = this.buildBlankMatchups(4);
        //           this.roundFourMatches = this.buildBlankMatchups(8);
        //           this.roundFiveMatches = this.buildBlankMatchups(16);
        //           this.roundSixMatches = this.buildBlankMatchups(32);
        //           this.roundSevenMatches = this.buildBlankMatchups(64);
        //           this.consolidateAllRounds();
        //           this.consolidateAllMatches();
        //           console.log("darkwood is good game");
        //           matchService
        //             .PostTournamentMatches(
        //               this.allMatches,
        //               this.$store.state.currentTournament.tournamentId
        //             )
        //             .then((response) => {
        //               if (response.status === 201) {
        //                 this.$store.commit(
        //                   "POST_TOURNAMENT_MATCHES",
        //                   response.data
        //                 );
        //               }
        //             });
        //         }
        //       }
        //     })
        // .catch((e) => {
        //   console.log(e);
        // });
      }
    },
    consolidateAllRounds() {
      this.allRounds = [
        this.roundOneMatches,
        this.roundTwoMatches,
        this.roundThreeMatches,
        this.roundFourMatches,
        this.roundFiveMatches,
        this.roundSixMatches,
        this.roundSevenMatches,
      ];
    },
    consolidateAllMatches() {
      let tempMatchHolder = [];
      this.allRounds.forEach((round) => {
        round.forEach((match) => {
          tempMatchHolder.push(match);
        });
      });
      this.allMatches = tempMatchHolder;
    },
    setInitialUsers() { //This method is failing to update the users from the database
      TournamentService.getAllTournaments()
        .then((response) => {
          if (response.status == 200) {
            this.$store.state.tournaments = response.data;
          }
          console.log("Filling initial bracket... ");
          let maxUsers = 0;
          this.$store.state.currentTournament = this.$store.state.tournaments.find(
            (tournament) =>
              tournament.tournamentId == this.$route.params.tournamentId
          );
          console.log(this.$store.state.currentTournament);
          if (this.$store.state.currentTournament.size == "Small (Up to 8)") {
            maxUsers = 8;
          } else if (
            this.$store.state.currentTournament.size == "Medium (Up to 16)"
          ) {
            maxUsers = 16;
          } else if (
            this.$store.state.currentTournament.size == "Large (Up to 32)"
          ) {
            maxUsers = 32;
          } else {
            maxUsers = 64;
          }
          for (let i = 0; i < maxUsers; i++) {
            const newUser = "TBD";
            // const newUser = "UserNumber " + (Math.floor(Math.random() * 100)).toString()

            this.usersInTourney.push(newUser);
          }
          matchService
            .getAllMatches(this.$route.params.tournamentId)
            .then((response) => {
              if (response.status == 200) {
                console.log(response.data);
                if (response.data.length > 0) {
                  response.data.forEach((match) => {
                    if (match.roundId == 0) {

                      if (!this.usersInTourney.includes(match.TopUser)) {
                        this.usersInTourney[this.usersInTourney.indexOf("TBD")] =
                        match.topUser;
                    }
                    if (!this.usersInTourney.includes(match.BottomUser)) {
                      this.usersInTourney[this.usersInTourney.indexOf("TBD")] =
                        match.bottomUser;
                    }
                      }
                  });
                  this.roundTwoMatches = this.buildBlankMatchups(2);
                  this.roundThreeMatches = this.buildBlankMatchups(4);
                  this.roundFourMatches = this.buildBlankMatchups(8);
                  this.roundFiveMatches = this.buildBlankMatchups(16);
                  this.roundSixMatches = this.buildBlankMatchups(32);
                  this.roundSevenMatches = this.buildBlankMatchups(64);
                  this.updateLocalMatchInfo(response.data);
                  this.roundOneMatches = this.buildOfficialMatchups();
                } else {
                  this.roundOneMatches = this.buildOfficialMatchups();
                  this.roundTwoMatches = this.buildBlankMatchups(2);
                  this.roundThreeMatches = this.buildBlankMatchups(4);
                  this.roundFourMatches = this.buildBlankMatchups(8);
                  this.roundFiveMatches = this.buildBlankMatchups(16);
                  this.roundSixMatches = this.buildBlankMatchups(32);
                  this.roundSevenMatches = this.buildBlankMatchups(64);
                  this.consolidateAllRounds();
                  this.consolidateAllMatches();
                  console.log("darkwood is good game");
                  matchService
                    .PostTournamentMatches(
                      this.allMatches,
                      this.$store.state.currentTournament.tournamentId
                    )
                    .then((response) => {
                      if (response.status === 201) {
                        this.$store.commit(
                          "POST_TOURNAMENT_MATCHES",
                          response.data
                        );
                      }
                    });
                }
              }
            });
        })
        .catch((e) => {
          console.log(e);
        });
    },
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
      if (test > 1) {
        roundNum++;
        return this.calculateRound(test, roundNum);
      } else {
        return roundNum + 1;
      }
    },

    buildOfficialMatchups() {
      const matchup = [];
      const topUsers = [];
      for (let i = 0; i < this.usersInTourney.length; i += 2) {
        topUsers.push(this.usersInTourney[i]);
      }
      const bottomUsers = [];
      for (let i = 1; i < this.usersInTourney.length; i += 2) {
        bottomUsers.push(this.usersInTourney[i]);
      }
      for (let i = 0; i < topUsers.length; i++) {
       let topUserHasWon = "";
        this.roundTwoMatches.forEach(match => {
          if ((match.topUser == topUsers[i] || match.bottomUser == topUsers[i]) && topUserHasWon == "" && topUsers[i] != "TBD") {
            topUserHasWon = "true";
          } else if ((match.topUser == bottomUsers[i] || match.bottomUser == bottomUsers[i]) && topUserHasWon == "" && bottomUsers[i] != "TBD") {
            topUserHasWon = "false";
          }
          }
        )   
       matchup[i] = {
          matchId: i,
          topUser: topUsers[i],
          bottomUser: bottomUsers[i],
          topUserWon: topUserHasWon,
          roundId: 0,
        };
      }
      return matchup;
    },

    submitMatches() {
      let tempMatchHolder = [
        this.roundOneMatches,
        this.roundTwoMatches,
        this.roundThreeMatches,
        this.roundFourMatches,
        this.roundFiveMatches,
        this.roundSixMatches,
        this.roundSevenMatches,
      ];

      let matchesToSubmit = [];
      tempMatchHolder.forEach((round) => {
        round.forEach((match) => {
          matchesToSubmit.push(match);
        });
      });

      matchesToSubmit = matchesToSubmit.filter((round) => round.length != 0);

      matchService
        .updateMatchResults(matchesToSubmit, this.$route.params.tournamentId)
        .then((response) => {
          console.log("Did it make it before the if");
          if (response.status === 200) {
            console.log("Yes it did");
            this.$store.commit("UPDATE_TOURNAMENT_MATCHES", response.data);
          }
        })
        .catch((e) => {
          console.log("Error updating bracket! " + e.message);
        });
    },

    updateLocalMatchInfo(dBMatches) {
      this.roundTwoMatches = dBMatches.filter(match => match.roundId == 1);
      this.roundThreeMatches = dBMatches.filter(match => match.roundId == 2);
      this.roundFourMatches = dBMatches.filter(match => match.roundId == 3);
      this.roundFiveMatches = dBMatches.filter(match => match.roundId == 4);
      this.roundSixMatches = dBMatches.filter(match => match.roundId == 5);
      this.roundSevenMatches = dBMatches.filter(match => match.roundId == 6);
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
  color: #00bc8c !important;
  text-decoration: none !important;
}
li.game span {
  float: right;
  margin-right: 5px;
}

li.game-top {
  border-bottom: 1px solid #00bc8c;
  cursor: pointer;
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
  color: #bc0077;
}
.btn.submit {
  float: right;
}

.btn.submit.centered {
  float: none;
  display: inline-block;
  background-color: #bc0077;
  border-color: black;
}

.btn.submit.centered:hover {
  background-color: #96206b;
}

div.center {
  text-align: center;
}

.locked {
  background-color: grey !important;
}
</style>