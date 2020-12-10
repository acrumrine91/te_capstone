<template>
  <div>
    <h1 class="centered">----------Preview----------</h1>
    <h1 class="centered" v-if="this.newTournament.name"><img id="name-logo" src="../../public/GULOGO.png" />{{this.newTournament.name}}<img id="name-logo" src="../../public/GULOGO.png" /></h1>
    <h3 class="centered" v-show="this.newTournament.registrationType">Registration Type: {{this.newTournament.registrationType}}</h3>
    <br />
    <h3 class="centered">{{this.newTournament.description}}</h3>
    <br />
    <div class="container">
      <div class="row title-row">
      </div>
      <div class="row">
    <div class="col">
    <h2 v-show="sizeOrStyle">Tournament Info </h2>
      <h3 v-show="this.newTournament.size">Size: {{this.newTournament.size}}</h3>
    <h3 v-show="this.newTournament.style">Style: {{this.newTournament.style}}</h3>
    <br />
    <div v-show="showLocationHeader">
    <h2>Location Info</h2>
    <h3 v-if="inPerson">Location: In-Person</h3>
    <h3 v-else>Location: Online</h3>
    <h3 v-if="inPerson">Zip Code: {{this.newTournament.zipCode}}</h3>
    <h3 v-else>Link: {{this.newTournament.link}}</h3>
    </div>
    </div>
    <div class="col right">
      <h2 v-show="matchSizeOrStyle">Match Info</h2>
    <h3 v-show="this.newTournament.matchSize">Match Size: {{this.newTournament.matchSize}}</h3>
    <h3 v-show="this.newTournament.matchStyle">Match Style: {{this.newTournament.matchStyle}}</h3>
    <br />
    <!-- <h2 v-show="registrationDateOrStartDate">Important Dates</h2>
    <h3 v-show="this.newTournament.registrationDate">Register By: {{this.registrationDay}}</h3>
    <h3 v-show="this.newTournament.registrationDate">{{this.registrationTimeDisplay}}</h3>
    <h3 v-show="this.newTournament.startDate">Start Date: {{this.startDay}}</h3>
    <h3 v-show="this.newTournament.startDate">{{this.startTimeDisplay}}</h3> -->
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
  props: ['newTournament']
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