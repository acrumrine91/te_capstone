<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app" class="container"> <!-- If you start to get random styling you don't like, remove container from this div -->
    <div id="nav">
      <router-link class="nav-item" v-bind:to="{ name: 'home' }">
        <img src="../public/GULOGO.png" id="logo" />
        Home 
      </router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'register' }"
        v-if="!$store.state.token">&nbsp;|&nbsp;Register</router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'login' }"
        v-if="!$store.state.token">
        &nbsp;|&nbsp;Login
      </router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token">
        &nbsp;|&nbsp;Logout
      </router-link>
    </div>
    <router-view />
  </div>
</template>

<script>
import TournamentService from "@/services/TournamentService.js";

export default {
  created() {
    TournamentService.getAllTournaments()
      .then(response => {
        if (response.status == 200){
          this.$store.commit('TOURNAMENTS_LOADED', response.data);
        } else {
          console.log("Whatever");
        }
      })
      .catch(err => {
        console.error('Error getting data: ' + err.message);
      })
  }
}
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
* {
  cursor: url("../public/realglove3.png"),  auto;

}
 #logo {
   height: 16px;
   width: 16px;
  margin-bottom: 3px;
  margin-right: 2px;
 }

.nav-item {
  margin-top: 100px;
}

</style>