<template>
  <div class="home" id="home">
    <br />
    <h1> <img src="../../public/GULOGO.png" id="pre-title" />
      Welcome to Gauntlet
      <img src="../../public/GULOGO.png" id="pre-title" />
    </h1>
    <div > 
    <img src="../../public/dark.jpg" id="home-image"/>
    </div>
    <br />
    <br />
    <h5>Your one stop shop to create, organize, and join any type of tournament!</h5>
    <br />
    <div id="button-center">
    <router-link class="submit" tag="button" v-bind:to="{name: 'create-tournament'}">
      Create Tournament
    </router-link>
    <router-link class="submit" tag="button" v-bind:to="{name: 'browse'}">
      Browse Tournaments
    </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style>
#button-center {
  text-align: center;
}

.submit {
  display: inline-block;
  width: 160px;
  height: 50px;
  border-radius: 12px;
  background-color: #00bc8c;
  outline: none;
  font-weight: bold;
  margin: 0 20px;
}

.submit:hover {
  background-color: #1a8a6e;
}

#pre-title {
  height: 100px;
  width: 100px;
  margin-bottom: 14px;
}

#home-image {
  display: block;
  margin: 0 auto;
  height: auto;
  width: 1110px; 
  text-align: center; 
}

h1 {
  text-align: center;
  color: #00bc8c;
}
h5 {
  text-align: center;
}
</style>
