<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <br />
      <h1 id="signIn" class="h3 mb-3 font-weight-normal">Who dares to brave the Gauntlet?</h1>
      <br />
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>

      <div class="alert alert-danger" role="alert" v-if="networkError">
        Network error!
      </div>

      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-group">
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus />
      </div>
      <div class="form-group">
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required />
      </div>
      <div class="form-group">
        <router-link class="magenta" :to="{ name: 'register' }">Need an Account? | </router-link>
        <router-link class="magenta" :to="{ name: 'home' }">Browse as a Guest</router-link>
      </div>
      <button class="btn" id="submit" type="submit">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
      networkError: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push({ name: "home" });
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response == null || response.status === 500) {
            this.networkError = true;
          }

          else if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style>

.btncontainer {
  margin: 15px auto 10px;
}

.btn {
  margin-left: 25px;
  margin-right: 25px;
}

#submit {
  display: inline-block;
  width: 110px;
  height: 50px;
  border-radius: 12px;
  background-color: #00bc8c;
  color: black;
  outline: none;
  font-weight: bold;
}

#submit:hover {
  background-color: #1a8a6e;
}

#signIn {
  text-decoration: none;
}

.magenta {
  color: #bc0077 !important;
}

</style>
