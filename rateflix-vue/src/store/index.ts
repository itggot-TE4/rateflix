import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: ""
  },
  mutations: {
    setToken(state, token) {
      state.token = token;
    }
  },
  actions: {
    async login({ commit }, credentials) {
      const response = await axios.post("http://localhost:3000/api/v1/login", {
        user: credentials
      });

      console.log(response.headers);

      /* TDOO: fetch user info from backend */
      commit('setToken', response.headers['authorization']);
    }
  },
  getters: {
    currentUser(state) {
      return state.token;
    }
  }
});
