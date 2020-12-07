import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import axios from "axios";

axios.interceptors.request.use(
  config => {
    const token = store.getters.currentUser;
    if (token) {
      config.headers["Authorization"] = token;
    }
    config.headers["Content-Type"] = "application/json";

    console.log("am i being intercepted!?");
    return config;
  },
  error => {
    Promise.reject(error);
  }
);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
