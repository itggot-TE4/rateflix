import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: ""
  },
  mutations: {},
  actions: {
    async login() {
      const response = await axios.post("http://localhost:3000/api/v1/login", {
        user: {
          email: "a@a.a",
          password: "123123"
        }
      });
      console.log(response.headers);
    }
  },
  modules: {}
});
