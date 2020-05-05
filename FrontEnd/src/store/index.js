import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

let store = new Vuex.Store({
  state: {
    userInfo: {}
  },
  // 修改state的唯一方法 是提交mutations
  mutations: {
    getUserInfo(state, user) {
      state.userInfo = user;
      console.log(state.userInfo);
    }
  },
  actions: {
    getUserInfo({commit}, user) {
      commit('getUserInfo', user);
    }
  }
});
export default store;
