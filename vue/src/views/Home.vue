<template>
  <div class="home">
    <br />
    <h1>Welcome to The Gulag Tournament Organizer</h1>
    <br />
    <h5>You have succesfully logged in, congrats!</h5>
    <br />
    <router-link id="submit" tag="button" v-bind:to="{name: 'create-tournament'}">
      Create Tournament
    </router-link>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style>
#submit {
  display: inline-block;
  width: 160px;
  height: 50px;
  border-radius: 12px;
  background-color: #00bc8c;
  outline: none;
  font-weight: bold;
}

#submit:hover {
  background-color: #1a8a6e;
}
</style>
