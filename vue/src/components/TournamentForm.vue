<template>
  <div class="form-group">
    <input required type="text" placeholder=" Name?" class="form-control" />

    <div class="btncontainer">
      <input type="radio" class="btn" @change="isChecked" name="IRL" />
      <label>Online</label>
      <input type="radio" class="btn" @change="isChecked" name="IRL" checked />
      <label>In-Person</label>
    </div>

    <input
      type="text"
      placeholder=" Link?"
      class="form-control"
      v-show="online"
    />
    <input
      type="text"
      placeholder=" Zip Code?"
      class="form-control"
      v-show="inPerson"
    />
    <br />
    <div class="form-inline" id="backgroundline">
      <div class="dates">
      <input required
        type="date"
        placeholder="Official Start Date:"
        class="registrationDate"
        :min="todaysDate"
      />
      <input required
        type="time"
        placeholder="Start Date:"
        class="Time"
      />
      </div>
      <div class="dates">
      <input required
        type="date"
        placeholder="Registration Date:"
        class="registrationDate"
        :min="todaysDate"
      />
      <input required
        type="time"
        placeholder="Start Date:"
        class="Time"
      />
      </div>
    </div>
    <br />
    <select class="form-control" required>
      <option disabled selected hidden value="">Size?</option>
      <option value="Small">Small (8 or less)</option>
      <option value="Medium">Medium (9 to 32)</option>
      <option value="Large">Large (33 to 64)</option>
      <option value="Massive">Massive (65+)</option>
    </select>
    <br />

    <select class="form-control" required>
      <option disabled selected hidden value="">Style?</option>
      <option value="Solo">Solo</option>
      <option value="Teams">Teams</option>
    </select>
    <br />
    <select class="form-control" required>
      <option disabled selected hidden value="">Match Style?</option>
      <option value="1v1">1v1 (Team vs. Team)</option>
      <option value="FFA">Free for All</option>
    </select>
    <br />
    <input required
      type="number"
      placeholder=" Match Size?"
      class="form-control"
      min="2"
    />
    <br />
    <textarea required
      type="text"
      style="height: 150px"
      placeholder=" Description?"
      class="form-control"
    />
    <br />
    <input type="button" class="right" id="submit" value="Create Tournament" />
  </div>
</template>

<script>
export default {
  methods: {
    isChecked() {
      this.online = !this.online;
      this.inPerson = !this.inPerson;
    },
  },
  data() {
    return {
      online: false,
      inPerson: true,
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