<template>
  <div class="home">
    <h1>Welcome to The Gulag Tournament Organizer</h1>
    <p>You have succesfully logged in, congrats!</p>
    <router-link v-bind:to="{name: 'create-tournament'}">
      Create Tournament
    </router-link>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>
