import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')

let currentUser = null;
if ((localStorage.getItem('user') && localStorage.getItem('user') != 'undefined')) {
  currentUser = JSON.parse(localStorage.getItem('user'));
}

if(currentToken && currentToken != 'undefined') {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {}, // If a user is an admin, their user.role will be 'admin'
    tournaments: [],
    currentTournament: {},
    users: [
      {
        user_id: 3,
        username: "dim_slash",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user55@gmail.com"
      },
      {
        user_id: 4,
        username: "dim_slash_brother",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user555@gmail.com"
      },
      {
        user_id: 5,
        username: "hairiest_man",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user5@gmail.com"
      },
      {
        user_id: 6,
        username: "worthless_can_of_yeast",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "users@gmail.com"
      },
       {
         user_id: 7,
         username: "dimmest_slash",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "userslam@gmail.com"
       },
       {
         user_id: 8,
         username: "come_on_and_slam",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "spacejam@gmail.com"
       },
       {
         user_id: 9,
         username: "water_on_the_knee",
         password_hash: "operation",
         salt: "LAX77753",
         user_role: "user",
         email: "quidditch@gmail.com"
       },
      {
        user_id: 10,
        username: "Testing_another",
        password_hash: "lostname",
        salt: "stoptellingmenotaword",
        user_role: "user",
        email: "quidditch2@gmail.com"
      },
      {
        user_id: 11,
        username: "jim_flash",
        password_hash: "ham",
        salt: "LAX65465",
        user_role: "user",
        email: "uevervrev@gmail.com"
      },
      {
        user_id: 12,
        username: "jim_flash_mother",
        password_hash: "pam",
        salt: "LAXre232",
        user_role: "user",
        email: "uwvrverer@gmail.com"
      },
      {
        user_id: 13,
        username: "MattEland",
        password_hash: "revervre",
        salt: "LAX7vrerevrvervre3",
        user_role: "user",
        email: "urvevrevreverv@gmail.com"
      },
      {
        user_id: 14,
        username: "worthless_can_of_BEAST",
        password_hash: "jvrevam",
        salt: "LAX7775revrv3",
        user_role: "user",
        email: "usvrevrevers@gmail.com"
      },
       {
         user_id: 15,
         username: "Jimmest_flash",
         password_hash: "jafvfm",
         salt: "LAX777efvevef53",
         user_role: "user",
         email: "useevrevervrslam@gmail.com"
       },
       {
         user_id: 16,
         username: "come_off_and_slam",
         password_hash: "ervrvvjam",
         salt: "LAX77reververvv753",
         user_role: "user",
         email: "sparevervevcejam@gmail.com"
       },
       {
         user_id: 17,
         username: "water_on_the_pee",
         password_hash: "sloperation",
         salt: "LAX777dwwev53",
         user_role: "user",
         email: "quivervrevdditch@gmail.com"
       },
      {
        user_id: 18,
        username: "........",
        password_hash: "lostmiddlename",
        salt: "stopteevrevrevrevllingmenotaword",
        user_role: "user",
        email: "quervrevrevrevidditch2@gmail.com"
      },
      {
        user_id: 3,
        username: "dim_slash",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user55@gmail.com"
      },
      {
        user_id: 4,
        username: "dim_slash_brother",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user555@gmail.com"
      },
      {
        user_id: 5,
        username: "hairiest_man",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user5@gmail.com"
      },
      {
        user_id: 6,
        username: "worthless_can_of_yeast",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "users@gmail.com"
      },
       {
         user_id: 7,
         username: "dimmest_slash",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "userslam@gmail.com"
       },
       {
         user_id: 8,
         username: "come_on_and_slam",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "spacejam@gmail.com"
       },
       {
         user_id: 9,
         username: "water_on_the_knee",
         password_hash: "operation",
         salt: "LAX77753",
         user_role: "user",
         email: "quidditch@gmail.com"
       },
      {
        user_id: 10,
        username: "Testing_another",
        password_hash: "lostname",
        salt: "stoptellingmenotaword",
        user_role: "user",
        email: "quidditch2@gmail.com"
      },
      {
        user_id: 11,
        username: "jim_flash",
        password_hash: "ham",
        salt: "LAX65465",
        user_role: "user",
        email: "uevervrev@gmail.com"
      },
      {
        user_id: 12,
        username: "jim_flash_mother",
        password_hash: "pam",
        salt: "LAXre232",
        user_role: "user",
        email: "uwvrverer@gmail.com"
      },
      {
        user_id: 13,
        username: "MattEland",
        password_hash: "revervre",
        salt: "LAX7vrerevrvervre3",
        user_role: "user",
        email: "urvevrevreverv@gmail.com"
      },
      {
        user_id: 14,
        username: "worthless_can_of_BEAST",
        password_hash: "jvrevam",
        salt: "LAX7775revrv3",
        user_role: "user",
        email: "usvrevrevers@gmail.com"
      },
       {
         user_id: 15,
         username: "Jimmest_flash",
         password_hash: "jafvfm",
         salt: "LAX777efvevef53",
         user_role: "user",
         email: "useevrevervrslam@gmail.com"
       },
       {
         user_id: 16,
         username: "come_off_and_slam",
         password_hash: "ervrvvjam",
         salt: "LAX77reververvv753",
         user_role: "user",
         email: "sparevervevcejam@gmail.com"
       },
       {
         user_id: 17,
         username: "water_on_the_pee",
         password_hash: "sloperation",
         salt: "LAX777dwwev53",
         user_role: "user",
         email: "quivervrevdditch@gmail.com"
       },
      {
        user_id: 18,
        username: "........",
        password_hash: "lostmiddlename",
        salt: "stopteevrevrevrevllingmenotaword",
        user_role: "user",
        email: "quervrevrevrevidditch2@gmail.com"
      },
      {
        user_id: 3,
        username: "dim_slash",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user55@gmail.com"
      },
      {
        user_id: 4,
        username: "dim_slash_brother",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user555@gmail.com"
      },
      {
        user_id: 5,
        username: "hairiest_man",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user5@gmail.com"
      },
      {
        user_id: 6,
        username: "worthless_can_of_yeast",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "users@gmail.com"
      },
       {
         user_id: 7,
         username: "dimmest_slash",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "userslam@gmail.com"
       },
       {
         user_id: 8,
         username: "come_on_and_slam",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "spacejam@gmail.com"
       },
       {
         user_id: 9,
         username: "water_on_the_knee",
         password_hash: "operation",
         salt: "LAX77753",
         user_role: "user",
         email: "quidditch@gmail.com"
       },
      {
        user_id: 10,
        username: "Testing_another",
        password_hash: "lostname",
        salt: "stoptellingmenotaword",
        user_role: "user",
        email: "quidditch2@gmail.com"
      },
      {
        user_id: 11,
        username: "jim_flash",
        password_hash: "ham",
        salt: "LAX65465",
        user_role: "user",
        email: "uevervrev@gmail.com"
      },
      {
        user_id: 12,
        username: "jim_flash_mother",
        password_hash: "pam",
        salt: "LAXre232",
        user_role: "user",
        email: "uwvrverer@gmail.com"
      },
      {
        user_id: 13,
        username: "MattEland",
        password_hash: "revervre",
        salt: "LAX7vrerevrvervre3",
        user_role: "user",
        email: "urvevrevreverv@gmail.com"
      },
      {
        user_id: 14,
        username: "worthless_can_of_BEAST",
        password_hash: "jvrevam",
        salt: "LAX7775revrv3",
        user_role: "user",
        email: "usvrevrevers@gmail.com"
      },
       {
         user_id: 15,
         username: "Jimmest_flash",
         password_hash: "jafvfm",
         salt: "LAX777efvevef53",
         user_role: "user",
         email: "useevrevervrslam@gmail.com"
       },
       {
         user_id: 16,
         username: "come_off_and_slam",
         password_hash: "ervrvvjam",
         salt: "LAX77reververvv753",
         user_role: "user",
         email: "sparevervevcejam@gmail.com"
       },
       {
         user_id: 17,
         username: "water_on_the_pee",
         password_hash: "sloperation",
         salt: "LAX777dwwev53",
         user_role: "user",
         email: "quivervrevdditch@gmail.com"
       },
      {
        user_id: 18,
        username: "........",
        password_hash: "lostmiddlename",
        salt: "stopteevrevrevrevllingmenotaword",
        user_role: "user",
        email: "quervrevrevrevidditch2@gmail.com"
      },
      {
        user_id: 3,
        username: "dim_slash",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user55@gmail.com"
      },
      {
        user_id: 4,
        username: "dim_slash_brother",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user555@gmail.com"
      },
      {
        user_id: 5,
        username: "hairiest_man",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "user5@gmail.com"
      },
      {
        user_id: 6,
        username: "worthless_can_of_yeast",
        password_hash: "jam",
        salt: "LAX77753",
        user_role: "user",
        email: "users@gmail.com"
      },
       {
         user_id: 7,
         username: "dimmest_slash",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "userslam@gmail.com"
       },
       {
         user_id: 8,
         username: "come_on_and_slam",
         password_hash: "jam",
         salt: "LAX77753",
         user_role: "user",
         email: "spacejam@gmail.com"
       },
       {
         user_id: 9,
         username: "water_on_the_knee",
         password_hash: "operation",
         salt: "LAX77753",
         user_role: "user",
         email: "quidditch@gmail.com"
       },
      {
        user_id: 10,
        username: "Testing_another",
        password_hash: "lostname",
        salt: "stoptellingmenotaword",
        user_role: "user",
        email: "quidditch2@gmail.com"
      },
      {
        user_id: 11,
        username: "jim_flash",
        password_hash: "ham",
        salt: "LAX65465",
        user_role: "user",
        email: "uevervrev@gmail.com"
      },
      {
        user_id: 12,
        username: "jim_flash_mother",
        password_hash: "pam",
        salt: "LAXre232",
        user_role: "user",
        email: "uwvrverer@gmail.com"
      },
      {
        user_id: 13,
        username: "MattEland",
        password_hash: "revervre",
        salt: "LAX7vrerevrvervre3",
        user_role: "user",
        email: "urvevrevreverv@gmail.com"
      },
      {
        user_id: 14,
        username: "worthless_can_of_BEAST",
        password_hash: "jvrevam",
        salt: "LAX7775revrv3",
        user_role: "user",
        email: "usvrevrevers@gmail.com"
      },
       {
         user_id: 15,
         username: "Jimmest_flash",
         password_hash: "jafvfm",
         salt: "LAX777efvevef53",
         user_role: "user",
         email: "useevrevervrslam@gmail.com"
       },
       {
         user_id: 16,
         username: "come_off_and_slam",
         password_hash: "ervrvvjam",
         salt: "LAX77reververvv753",
         user_role: "user",
         email: "sparevervevcejam@gmail.com"
       },
       {
         user_id: 17,
         username: "water_on_the_pee",
         password_hash: "sloperation",
         salt: "LAX777dwwev53",
         user_role: "user",
         email: "quivervrevdditch@gmail.com"
       },
      {
        user_id: 18,
        username: "........",
        password_hash: "lostmiddlename",
        salt: "stopteevrevrevrevllingmenotaword",
        user_role: "user",
        email: "quervrevrevrevidditch2@gmail.com"
      },
    ]
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    ADD_TOURNAMENT(state, payload) {
      payload.userId = currentUser.userId;
      state.tournaments.push(payload);
      
    },
    TOURNAMENTS_LOADED(state, payload) {
      state.tournaments = payload;  
    }
  }
})
