<template>
  <div>
    <div class="error" v-if="authFailure">
      {{ authFailure }}
    </div>
    <div v-if="currentUser">
      <button @click="logout">Logout</button>
    </div>
    <div v-else>
      <input v-model="email" type="text" placeholder="email" />
      <input v-model="password" type="password" placeholder="password" />
      <button @click="login">Login</button>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { mapGetters } from "vuex";

export default Vue.extend({
  name: "Login",
  data() {
    return {
      email: "",
      password: ""
    }
  },
  computed: {
    ...mapGetters({
        currentUser: 'currentUser',
        authFailure: 'authFailure'
      })
  },
  methods: {
    login() {
      this.$store.dispatch('login', {
        email: this.email,
        password: this.password
      });
    },
    logout() {
      console.log("log out!");
    }
  }
});
</script>

<style scoped>
.error {
  color: red;
}
</style>
