<template>
  <div>
    <br>
    <h2 id="thisTitle">So You Want To Create A New Tournament</h2>
    <br>
    <h4 id="subtitle">What is your tournament...</h4>
    <br>
    <form>
      <tournament-form />
    </form>

  </div>
</template>

<script>
import TournamentForm from "../components/TournamentForm.vue";


export default {
  name: "create-tournament",
  components: { TournamentForm },
};
</script>

<style>

h2#thisTitle {
  color: #00bc8c;
}

h4#subtitle {
    color: #00bc8c;
}

</style>