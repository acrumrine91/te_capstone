<template>
  <table>
    <thead>
      <br />
      <tr>
        <th>Name</th>
        <th>Style</th>
        <th>Location</th>
        <th>Start Date</th>
        <th>Registration Date</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(tournament, index) in tournaments" v-bind:key="tournament.tournamentId">
        <td>
          <router-link
            :to="{
              name: 'tournament-details',
              params: { tournamentId: tournament.tournamentId },
            }"
            >{{ tournament.name }}</router-link
          >
        </td>
        <td>
          {{ tournament.style }}
          <!-- This should navigate to the product details page 
          <router-link v-bind:to="{name: 'browse-tournaments', params: {productId: product.id}}">
            {{tournament.name}}
          </router-link>-->
        </td>
        <td v-if="tournament.inPerson">{{ tournament.zipCode }}</td>
        <td v-else>{{ tournament.link }}</td>
        <td>{{ tournament.startDate.substring(0,10)}}</td>
        <td>{{ tournament.registrationClosedDate.substring(0,10) }}</td>
        <td>{{ tournament.description }}</td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  name: "tournament-previews",
  computed: {
    tournaments() {
      return this.$store.state.tournaments;
    },
  },
};
</script>

<style>
table {
  color: white;
  table-layout: fixed;
  margin-right: auto;
  margin-left: auto;
}
thead th {
  color: #00bc8c;
  font-size: 14pt;
  text-align: center;
  border: 4px solid white;
  padding: 0 10px;
  border-top-width: 0px;
}
th:last-child {
  border-right-width: 0;
}
th:first-child {
  border-left-width: 0;
}
td {
  padding: 5px;
  color: white;
  border-color: #00bc8c;
  border-width: 4px;
  border-style: solid;
  border-bottom-width: 6px;
  font-weight: bold;
}
td:last-child {
  border-width: 0 0 6px 4px;
}
td:first-child {
  border-width: 0 4px 6px 0;
}
</style>