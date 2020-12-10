<template>
  <div class="preview">
    <br />
    <br />
    <h1 class="centered"><img id="name-logo" src="../../public/GULOGO.png" />{{this.tournament.name}}<img id="name-logo" src="../../public/GULOGO.png" /></h1>
    <h3 class="centered">Registration Type: {{this.tournament.registrationType}}</h3>
    <br />
    <h3 class="centered">{{this.tournament.description}}</h3>
    <br />
    <div class="container">
      <div class="row title-row">
      </div>
      <div class="row">
    <div class="col">
    <h2>Tournament Info </h2>
      <h3>Size: {{this.tournament.size}}</h3>
    <h3>Style: {{this.tournament.style}}</h3>
    <br />
    <div>
    <h2>Location Info</h2>
    <h3 v-if="inPerson">Location: In-Person</h3>
    <h3 v-else>Location: Online</h3>
    <h3 v-if="inPerson">Zip Code: {{this.tournament.zipCode}}</h3>
    <h3 v-else>Link: {{this.tournament.link}}</h3>
    <br />
    </div>
    </div>
    <div class="col right">
      <h2>Match Info</h2>
    <h3>Match Size: {{this.tournament.matchSize}}</h3>
    <h3>Match Style: {{this.tournament.matchStyle}}</h3>
    <br />
    <h2>Important Dates</h2>
    <h3>Register By: {{this.tournament.registrationClosedDate}}</h3>
    <h3>Start Date: {{this.tournament.startDate}}</h3>
      </div>
      </div>
  </div>
  </div>
</template>

<script>
export default {
  // computed: {
  //   currentTournament() {
  //     return this.$store.state.tournaments.filter(tournament => tournament.id == 1)
  //   }
  // },
  data() {
    return {
      tournaments: this.$store.state.tournaments,
    }
  },
  created() {
    const id = this.$route.params.tournamentId;
    this.tournament = this.$store.state.tournaments.find(tournament => tournament.tournamentId === id)
  }
}
</script>

<style>
.preview {
  color: #00bc8c;
}
.centered {
  text-align: center;
}
h2 {
  text-decoration: underline;
}
.row {
  text-align: center;
}
.title-row {
  font-size: 40px;
  text-align: center;
  text-decoration: underline;
}
#name-logo {
  height: 60px;
  width: 60px;
  margin:0px 20px 7px;
}
</style>