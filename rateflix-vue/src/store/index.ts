import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: "",
    failure: "",
    reviews: []
  },
  mutations: {
    setToken(state, token) {
      state.token = token;
    },
    setFailure(state, error) {
      if (error.response) {
        // Request made and server responded
        state.failure = error.response.data.error || "Server did a oopsie";
      } else if (error) {
        state.failure = "Couldn't connect to server."
      } else {
        state.failure = "";
      }
    },
    setReviews(state, reviews) {
      state.reviews = reviews;
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
        commit('setFailure', "");
      } catch (error) {
        commit('setFailure', error);
      }
    },
    async fetchReviews({ commit }) {
      const response = await axios.get("http://localhost:3000/api/v1/reviews");
      console.log(response);
      commit('setReviews', response.data);
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
