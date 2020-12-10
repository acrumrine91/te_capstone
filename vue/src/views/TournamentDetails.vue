<template>
<div>
    <h1>hello</h1>
  <tournament-display-main v-bind:tournamentDetails="tournament" />
  </div>
</template>

<script>

import TournamentDisplayMain from '../components/TournamentDisplayMain.vue'

export default {
  components: { TournamentDisplayMain },

}
</script>

<style>

</style>