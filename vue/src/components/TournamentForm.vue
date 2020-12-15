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
      v-show="!inPerson"
      v-model='newTournament.link'
    />
    <input
      type="text"
      placeholder=" Zip Code?"
      class="form-control"
      v-show="inPerson"
      v-model.number='newTournament.zipCode'
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
      <option value="Small (Up to 8)">Small (Up to 8)</option>
      <option value="Medium (Up to 16)">Medium (Up to 16)</option>
      <option value="Large (Up to 32)">Large (Up to 32)</option>
      <option value="Massive (Up to 64)">Massive (Up to 64)</option>
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
      placeholder=" Match Size? (Players/Teams per match)"
      class="form-control"
      min="2"
      v-model.number='newTournament.matchSize'
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
  <br />
  <br />
  <br />
  <br />
  <div class="preview">
    <h1 class="centered">----------Preview----------</h1>
    <h1 class="centered" v-if="this.newTournament.name"><img id="name-logo" src="../../public/GULOGO.png" />{{this.newTournament.name}}<img id="name-logo" src="../../public/GULOGO.png" /></h1>
    <h3 class="centered" v-show="this.newTournament.registrationType">Registration Type: {{this.newTournament.registrationType}}</h3>
    <br />
    <h3 class="centered">{{this.newTournament.description}}</h3>
    <br />
    <div class="container">
      <div class="row title-row">
      </div>
      <div class="row">
    <div class="col">
    <h2 v-show="sizeOrStyle">Tournament Info </h2>
      <h3 v-show="this.newTournament.size">Size: {{this.newTournament.size}}</h3>
    <h3 v-show="this.newTournament.style">Style: {{this.newTournament.style}}</h3>
    <br />
    <div v-show="showLocationHeader">
    <h2>Location Info</h2>
    <h3 v-if="inPerson">Location: In-Person</h3>
    <h3 v-else>Location: Online</h3>
    <h3 v-if="inPerson">Zip Code: {{this.newTournament.zipCode}}</h3>
    <h3 v-else>Link: {{this.newTournament.link}}</h3>
    </div>
    </div>
    <div class="col right">
      <h2 v-show="matchSizeOrStyle">Match Info</h2>
    <h3 v-show="this.newTournament.matchSize">Match Size: {{this.newTournament.matchSize}}</h3>
    <h3 v-show="this.newTournament.matchStyle">Match Style: {{this.newTournament.matchStyle}}</h3>
    <br />
    <h2 v-show="registrationDateOrStartDate">Important Dates</h2>
    <h3 v-show="this.newTournament.registrationDate">Register By: {{this.registrationDay}}</h3>
    <h3 v-show="this.newTournament.registrationDate">{{this.registrationTimeDisplay}}</h3>
    <h3 v-show="this.newTournament.startDate">Start Date: {{this.startDay}}</h3>
    <h3 v-show="this.newTournament.startDate">{{this.startTimeDisplay}}</h3>
      </div>
      </div>
  </div>
  </div>
  <br />
  <br />
  <br />
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

      this.inPerson = !this.inPerson;
    },
    addTournament() {
      let toAdd = {
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
        registrationClosedDate: this.newTournament.registrationDate, // These need to be in "yyyy-mm-dd hh:mi:ss" format
        startDate: this.newTournament.startDate,
        userId: 0, // TODO: REFERENCE THE ACTIVE USER'S ID
      };
      
      if (!toAdd.zipCode) {
        toAdd.zipCode = 0;
      }

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

        this.$router.push({name: 'browse'});
      }
      })
      .catch(error => {
        console.error("There was an error adding this tournament: " + error.message);
      })
    },
  },
  data() {
    return {

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
    sizeOrStyle() {
      if (this.newTournament.size || this.newTournament.style || this.newTournament.registrationType) {
        return true;
      }
        return false;
    },
    showLocationHeader() {
      if (this.newTournament.zipCode || this.newTournament.link) {
        return true;
      }
      return false;
    },
    matchSizeOrStyle() {
      if (this.newTournament.matchSize || this.newTournament.matchStyle){
        return true;
      }
      return false;
    },
    registrationDateOrStartDate() {
      if (this.newTournament.registrationDate || this.newTournament.startDate) {
        return true;
      }
      return false;
    },
    registrationTimeDisplay() {
      let registrationHours = this.registrationTime.substring(0,2);
      let registrationMinutes = this.registrationTime.split(":");
      if (registrationHours > 12) {
        registrationHours -= 12;
        if (registrationHours < 10) {

          registrationHours = "0" + registrationHours.toString();
        }
        registrationMinutes[1] += "pm";
      } else {
        registrationMinutes[1] += "am";
      }
      return "@ " + registrationHours + ":" + registrationMinutes[1];
    },
        startTimeDisplay() {
      let startHours = this.startTime.substring(0,2);
      let startMinutes = this.startTime.split(":");
      if (startHours > 12) {
        startHours -= 12;
        if (startHours < 10) {

          startHours = "0" + startHours.toString();
        }
        startMinutes[1] += "pm";
      } else {
        startMinutes[1] += "am";
      }
      return "@ " + startHours + ":" + startMinutes[1];
    }
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
.preview {
  color: #00bc8c;

}
.centered {
  text-align: center;
}
h2 {
  text-decoration: underline;
}
.row {
  text-align: center;
}
.title-row {
  font-size: 40px;
  text-align: center;
  text-decoration: underline;
}
#name-logo {
  height: 60px;
  width: 60px;
  margin:0px 20px 7px;
}
</style>