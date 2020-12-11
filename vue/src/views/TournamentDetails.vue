<template>
<div>
  <tournament-display-main/>
  <bracket/>
  </div>
</template>

<script>

import TournamentDisplayMain from '../components/TournamentDisplayMain.vue'
import Bracket from '../components/Bracket.vue'

export default {
  components: { TournamentDisplayMain, Bracket },
  

}
</script>

<style>

</style>