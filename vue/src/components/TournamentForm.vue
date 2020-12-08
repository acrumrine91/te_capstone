<template>
  <div class="form-group">
    <input required type="text" placeholder=" Name?" class="form-control" v-model='newTournament.name'/>

    <div class="btncontainer">
      <input type="radio" class="btn" @change="isChecked" name="IRL" :value="false" v-model='newTournament.inPerson'/>
      <label>Online</label>
      <input type="radio" class="btn" @change="isChecked" name="IRL" :value="true" v-model='newTournament.inPerson' checked />
      <label>In-Person</label>
    </div>

    <input
      type="text"
      placeholder=" Link?"
      class="form-control"
      v-show="online"
      v-model='newTournament.link'
    />
    <input
      type="text"
      placeholder=" Zip Code?"
      class="form-control"
      v-show="inPerson"
      v-model='newTournament.zipCode'
    />
    <br />
    <div class="form-inline" id="backgroundline">
      <div class="dates">
        <input
          required
          type="date"
          placeholder="Official Start Date:"
          class="registrationDate"
          :min="todaysDate"
          v-model="startDay"
          @input="startDateCalc"
        /> <!-- WE CANNOT FIGURE OUT HOW TO BIND THIS VALUE TO ANOTHER -->
        <input required type="time" placeholder="Start Date:" class="Time" value='' v-model="startTime" @input="startDateCalc"/>
      </div>
      <div class="dates">
        <input
          required
          type="date"
          placeholder="Registration Date:"
          class="registrationDate"
          :min="todaysDate"
          v-model="registrationDay"
          @input="registrationDateCalc"
        /> <!-- WE CANNOT FIGURE OUT HOW TO BIND THIS VALUE TO ANOTHER -->
       <input required type="time" placeholder="Start Date:" class="Time" v-model="registrationTime" @input="registrationDateCalc"/>
      </div>
    </div>
    <br />
    <div>
      <select class="form-control" required v-model='newTournament.registrationType'>
        <option disabled selected hidden value="">Registration Type?</option>
        <option value="Open">Open</option>
        <option value="Invite Only">Invite Only</option>
        <option value="Upon Request">Upon Request</option>
        <option value="Invite or Request">Invite or Request</option>
      </select>
    </div>
    <br />
    <select class="form-control" required v-model='newTournament.size'>
      <option disabled selected hidden value="">Size?</option>
      <option value="Small">Small (8 or less)</option>
      <option value="Medium">Medium (9 to 32)</option>
      <option value="Large">Large (33 to 64)</option>
      <option value="Massive">Massive (65+)</option>
    </select>
    <br />

    <select class="form-control" required v-model='newTournament.style'>
      <option disabled selected hidden value="">Style?</option>
      <option value="Solo">Solo</option>
      <option value="Teams">Teams</option>
    </select>
    <br />
    <select class="form-control" required v-model='newTournament.matchStyle'>
      <option disabled selected hidden value="">Match Style?</option>
      <option value="1v1">1v1 (Team vs. Team)</option>
      <option value="FFA">Free for All</option>
    </select>
    <br />
    <input
      required
      type="number"
      placeholder=" Match Size?"
      class="form-control"
      min="2"
      v-model='newTournament.matchSize'
    />
    <br />
    <textarea
      required
      type="text"
      style="height: 150px"
      placeholder=" Description?"
      class="form-control"
      v-model='newTournament.description'
    />
    <br />
    <input type="button" class="right" id="submit" value="Create Tournament" @click.prevent="addTournament()"/>
  </div>
</template>

<script>
import tournamentService from "@/services/TournamentService.js";

export default {
  methods: {
    registrationDateCalc() {
      this.newTournament.registrationDate = this.registrationDay + "T" + this.registrationTime;
    },
    startDateCalc() {
      this.newTournament.startDate = this.startDay + "T" + this.startTime;
    },
    isChecked() {
      this.online = !this.online;
      this.inPerson = !this.inPerson;
    },
    addTournament() {
      const toAdd = {
        name: this.newTournament.name,
        inPerson: this.newTournament.inPerson,
        zipCode: this.newTournament.zipCode,
        link: this.newTournament.link,
        registrationType: this.newTournament.registrationType,
        size: this.newTournament.size,
        style: this.newTournament.style,
        matchSize: this.newTournament.matchSize,
        matchStyle: this.newTournament.matchStyle,
        description: this.newTournament.description,
        registrationDate: this.newTournament.registrationDate,
        startDate: this.newTournament.startDate,
        userId: 0, // TODO: REFERENCE THE ACTIVE USER'S ID
      };
      tournamentService.createTournament(toAdd)
      .then(response => {
        if (response.status === 201) {
          this.newTournament.name = "";
        this.newTournament.inPerson = true;
        this.newTournament.zipCode = "";
        this.newTournament.link = "";
        this.newTournament.registrationType = "";
        this.newTournament.size = "";
        this.newTournament.style = "";
        this.newTournament.matchSize = "";
        this.newTournament.matchStyle = "";
        this.newTournament.description = "";
        this.newTournament.userId = 0;
        this.newTournament.startDate = "";
        this.newTournament.registrationDate = "";

        this.$store.commit('ADD_TOURNAMENT', response.data);

        this.$router.push({name: 'home'});
      }
      })
      .catch(error => {
        console.error("There was an error adding this tournament: " + error.message);
      })
    },
  },
  data() {
    return {
      online: false,
      inPerson: true,
      startDay: "",
      startTime: "",
      registrationDay: "",
      registrationTime: "",
      newTournament: {
        name: "",
        inPerson: true,
        zipCode: "",
        link: "",
        registrationType: "",
        size: "",
        style: "",
        matchSize: "",
        matchStyle: "",
        description: "",
        userId: 0,
        registrationDate: "",
        startDate: "",
      },
    };
  },
  computed: {
    todaysDate() {
      let today = new Date();
      let dd = String(today.getDate()).padStart(2, "0");
      let mm = String(today.getMonth() + 1).padStart(2, "0");
      let yyyy = today.getFullYear();
      today = yyyy + "/" + mm + "/" + dd;
      return today;
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
  margin-right: 8px;
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

input.right {
  float: right;
}

select:required:invalid {
  color: grey !important;
}

option {
  color: black !important;
}

input[type="date"]:before {
  content: attr(placeholder) !important;
  color: #aaa;
  margin-right: 0.5em;
}
input[type="date"]:focus:before,
input[type="date"]:valid:before {
  content: "";
}

#backgroundline {
  background-color: #222;
  justify-content: center;
}
.dates {
  margin-bottom: 0.5rem;
  margin-top: 0.5rem;
}
.Time {
  margin-right: 20px;
}
</style>