<template>
  <div>
    <br>
    <h2>So You Want To Create A New Tournament</h2>
    <br>
    <h4>What is your tournament...</h4>
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
</style>