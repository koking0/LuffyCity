// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import 'bootstrap'

import '../static/global/global.css'



// store的引入
import store from '../src/store'
// 全局守卫
router.beforeEach((to, from, next) => {
  if (localStorage.getItem('access_token')) {
    // 用户登录过
    let user = {
      access_token:localStorage.getItem('access_token'),
      username:localStorage.getItem('username'),
      avatar:localStorage.getItem('avatar'),
      shop_cart_num:localStorage.getItem('shop_cart_num')
    };
    store.dispatch('getUserInfo',user);
  }
  next();
})



import * as api from './restful/api'
Vue.prototype.$http=api

// 导入elementUI
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
// 注册ElementUI插件
Vue.use(ElementUI)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
