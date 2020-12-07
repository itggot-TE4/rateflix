import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: "",
    failure: ""
  },
  mutations: {
    setToken(state, token) {
      state.token = token;
    },
    setFailure(state, failure) {
      state.failure = failure;
    }
  },
  actions: {
    async login({ commit }, credentials) {
      try {
        const response = await axios.post("http://localhost:3000/api/v1/login", {
          user: credentials
        });

        console.log(response.headers);

        /* TDOO: fetch user info from backend */
        commit('setToken', response.headers['authorization']);
      } catch (error) {
        commit('setFailure', error);
      }
    }
  },
  getters: {
    currentUser(state) {
      return state.token;
    },
    authFailure(state) {
      return state.failure;
    }
  }
});
