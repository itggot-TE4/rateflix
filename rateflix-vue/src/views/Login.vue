<template>
  <div>
    <button @click="login">Login</button>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Login",
  methods: {
    login() {
      this.$store.dispatch('login');
    }
  }
});
</script>
