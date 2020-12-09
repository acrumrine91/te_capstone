<template>
  <div class="home" id="home">
    <br />
    <h1> <img src="../../public/GULOGO.png" id="pre-title" />
      Welcome to Gauntlet
    </h1>
    <img src="../../public/dark.jpg" id="home-image"/>
    <br />
    <br />
    <h5>Your one stop shop to create, organize, or join any type of tournament!</h5>
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
* {
  align-content: center !important;
}

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

#pre-title {
  height: 100px;
  width: 100px;
  margin-bottom: 7px;
}

#home-image {
  height: 250px;
  width: auto;  
}

</style>
