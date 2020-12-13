<template>
  <div>
    <br />
    <h1>Bracket Preview (Not Final)</h1>
    <main id="tournament">
      <ul class="round round-1">
        <div v-for="user in buildMatchups" v-bind:key="user.user_id">
          <li class="spacer">&nbsp;</li>

          <li class="game game-top" @click="declareWinner($event, user.username)" :id="user.username.username">{{ user.username.username }}</li>
          <li class="game game-spacer">&nbsp;</li>
          <li class="game game-bottom" @click="declareWinner($event, user.opponent)" :id="user.opponent.username">{{user.opponent.username}}</li>
        </div>
        <li class="spacer">&nbsp;</li>
      </ul>
      
      <ul class="round round-2">
        <div v-show="roundOneWinners.lemgth == 4" v-for="user in buildMatchupsRoundTwo" v-bind:key="user.user_id">
          <li class="spacer">&nbsp;</li>

          <li class="game game-top">{{user.username}}</li>
          <li class="game game-spacer">&nbsp;</li>
          <li class="game game-bottom">{{user.opponent}}</li>
          <li class="spacer">&nbsp;</li>
        </div>
        <div v-show="roundOneWinners.lemgth != 4" v-for="user in buildMatchupsRound2" v-bind:key="user">
          <li class="spacer">&nbsp;</li>

          <li class="game game-top"></li>
          <li class="game game-spacer">&nbsp;</li>
          <li class="game game-bottom"></li>
          <li class="spacer">&nbsp;</li>
        </div>

      </ul>
      <ul class="round round-3">
        <div v-for="user in buildMatchupsRound3" v-bind:key="user.user_id">
          <li class="spacer">&nbsp;</li>


          <li class="game game-top"></li>
          <li class="game game-spacer">&nbsp;</li>
          <li class="game game-bottom"></li>
          <li class="spacer">&nbsp;</li>

        </div>
      </ul>
      <ul class="round round-4" >
        <div>


          <li class="game game-top"></li>
        </div>
      </ul>
      <ul class="round round-5">
        <div v-show="false" v-for="user in usersInTourneyRound4" v-bind:key="user.user_id">
          <li class="game game-top">{{ user.username }}</li>
        </div>
      </ul>
    </main>
  </div>
</template>

<script>
export default {
  name: "bracket",
  data() {
    return {

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
      roundOneWinners: [],
      roundTwoWinners: [],
    };
  },
  methods: {
    declareWinner(e) {
      e.target.classList.toggle('winner');
      if (!this.roundOneWinners.includes(e.target.id)) {
        this.roundOneWinners.push(e.target.id);
        console.log("something");
      }
      else {
        for (let i = 0; i < this.roundOneWinners.length; i++ ) {
          if (this.roundOneWinners[i]) {
            console.log("hi")
          }
      }
        this.roundOneWinners.splice(this.roundOneWinners.indexOf(e.target.id),1);
        console.log("something else");
      }
    }
  },
  computed: {
    findTopUsersInMatch() {
      const topUsers= [];
      for (let i = 0; i < this.$store.state.users.length; i+=2 ) {
          topUsers.push(this.$store.state.users[i])
      }
      return topUsers;
    },
    findBottomUsersInMatch() {
      const bottomUsers= [];
      for (let i = 1; i < this.$store.state.users.length; i+=2 ) {
          bottomUsers.push(this.$store.state.users[i])
      }
      return bottomUsers;
    },
    buildMatchups() {
      const matchup= [];
      const topUsers= this.findTopUsersInMatch;
      const bottomUsers = this.findBottomUsersInMatch;
      for (let i = 0; i < topUsers.length; i++) {
        matchup[i] = {
          username: topUsers[i],
          opponent: bottomUsers[i],
        };
      }
      return matchup;
    },
    buildMatchupsRound2() {
      return [1,2];
    },
    buildMatchupsRound3() {
      return [1];
    },
    findTopUsersInRoundTwo() {
      const topUsersRoundTwo= [];
      for (let i = 0; i < this.roundOneWinners.length; i+=2 ) {
          topUsersRoundTwo.push(this.roundOneWinners[i])
      }
      return topUsersRoundTwo;
    },
    findBottomUsersInRoundTwo() {
      const bottomUsersRoundTwo= [];
      for (let i = 1; i < this.roundOneWinners.length; i+=2 ) {
          bottomUsersRoundTwo.push(this.roundOneWinners[i])
      }
      return bottomUsersRoundTwo;
    },
    buildMatchupsInRoundTwo() {
      const matchup= [];
      const topUsers= this.findTopUsersInRoundTwo;
      const bottomUsers = this.findBottomUsersInRoundTwo;
      for (let i = 0; i < topUsers.length; i++) {
        matchup[i] = {
          username: topUsers[i],
          opponent: bottomUsers[i],
        };
      }
      return matchup;
    },
    
  }
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
  min-height: 96px;
}
.round-2 li.spacer {
  min-height: 46px;
}

.round-3 li.game-spacer {
  min-height: 200px;
}

.round-4 li.game-spacer {
  min-height: 380px;
}
li.game-bottom {
  border-top: 1px solid #00bc8c;
}
</style>