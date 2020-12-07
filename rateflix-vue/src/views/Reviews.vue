<template>
  <div>
    <div>{{$store.state.reviews}}</div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Reviews",
  created() {
    this.$store.dispatch('fetchReviews')
  }
});
</script>
