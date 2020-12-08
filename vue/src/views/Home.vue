<template>
  <div class="home">
    <br />
    <h1> <img src="../../public/GULOGO.png" id="preTitle" />
      Welcome to The Gulag Tournament Organizer
    </h1>
    <br />
    <h5>Feel free to browse the tournaments below</h5>
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

#preTitle {
  height: 100px;
  width: 100px;
  margin-bottom: 7px;
}
</style>
