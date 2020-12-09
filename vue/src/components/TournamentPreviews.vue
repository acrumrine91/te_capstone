<template>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Registration Type</th>
        <th>Registration Date</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="tournament in tournaments" v-bind:key="tournament.name">
        <td>{{tournament.name}}</td>
        <td>{{tournament.name}}
          <!-- This should navigate to the product details page 
          <router-link v-bind:to="{name: 'browse-tournaments', params: {productId: product.id}}">
            {{tournament.name}}
          </router-link>-->
        </td>
        <td>{{tournament.description}}</td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  name: "tournament-previews",
  computed:{
     tournaments() {
    return this.$store.state.tournaments;
     }
  }
};
</script>

<style>
</style>