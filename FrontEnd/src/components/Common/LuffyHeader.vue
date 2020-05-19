<template>
  <header>
    <div class="header-top">
      <p>老男孩IT教育 | 帮助有志向的年轻人通过努力学习获得体面的工作和生活</p>
    </div>
    <div class="header">
      <div class="header-cont">
        <div class="left">
          <router-link :to="{ name:'Home' }">
            <img class="oldboy" src="/static/images/head-logo.svg" alt="head-logo">
          </router-link>
        </div>
        <nav class="nav">
          <router-link v-for="(list, _) in headerList" :key="list.id" :to="{ name:list.name }" v-if="list.id !== 1"
                       :class="{active:urlPath===list.name}">
            <li :class="{active:urlPath===list.name}">{{ list.title }}</li>
          </router-link>
        </nav>
        <div class="header-right-box">
          <div class="search">
            <label for="Input"></label>
            <input type="text" id="Input" placeholder="请输入想搜索的课程" style="display: none;">
            <ul>
              <span>Python</span>
              <span>Linux</span>
            </ul>
            <p>
              <img class="icon" src="/static/images/sousuo1.png" alt="搜索1">
              <img class="icon" src="/static/images/sousuo2.png" style="display: none;" alt="搜索2">
              <img class="new" src="/static/images/new.png" alt="NEW">
            </p>
          </div>
          <router-link class="shop-car" :to="{name:'ShoppingCar'}">
            <img src="/static/images/shopcart@2x.png" alt="shopcart">
            <span>购物车</span>
          </router-link>
          <div v-if="!isUserLogin" class="register">
            <Login/>
            <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <Register/>
          </div>
          <div v-if="isUserLogin" class="nav-right-box" @mouseenter='enterHandler' @mouseleave='leaveHandler'>
            <div class="nav-right">
              <div v-if="identity !== 1" class="nav-study">
                <router-link :to="{ name:'Classroom' }">
                  我的教室
                </router-link>
              </div>
              <div v-if="identity === 1" class="nav-study">
                <a href="http://127.0.0.1:8000/index/" style="text-decoration: none;">后台管理</a>
              </div>
              <div class="nav-img">
                <img alt="avatar" :src="avatar">
              </div>
              <ul class="home-my-account" v-show='isShow'>
                <li>我的账户<img src="/static/images/back.svg" alt="back"></li>
                <li>我的订单<img src="/static/images/back.svg" alt="back"></li>
                <li>贝里小卖铺<img src="/static/images/back.svg" alt="back"></li>
                <li>我的优惠券<img src="/static/images/back.svg" alt="back"></li>
                <li @click="logoutHandler">退出<img src="/static/images/back.svg" alt="back"></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
  import Login from "./Login";
  import Register from "./Register";

  export default {
    name: "LuffyHeader",
    data() {
      return {
        headerList: [
          {id: 1, name: 'Home', title: '首页'},
          {id: 2, name: 'FreeLessons', title: '免费课'},
          {id: 3, name: 'PracticalLessons', title: '实战课'},
          {id: 4, name: 'LightClass', title: '轻课'},
          {id: 5, name: 'EmploymentClass', title: '就业班'},
          {id: 6, name: 'QuestionBank', title: '题库'},
          {id: 7, name: 'StudentAchievement', title: '学员成果'},
        ],
        isShow: false,
        currentUrl: null,
        isLogin: false,
        username: null,
        identity: null,
        avatar: null,
        shop_cart_num: null,
        notice_num: null,
      }
    },
    components: {
      Login,
      Register,
    },
    created() {
      this.identity = Number(localStorage.getItem('identity'));
      let access_token = localStorage.getItem('access_token');
      if (access_token) {
        this.username = localStorage.getItem('username');
        this.avatar = localStorage.getItem('avatar');
        this.shop_cart_num = localStorage.getItem('shop_cart_num');
        this.notice_num = localStorage.getItem('notice_num');
      }
    },
    computed: {
      urlPath: function () {
        this.currentUrl = this.$route.name;
        return this.currentUrl;
      },
      isUserLogin(){
        return this.username;
      },
    },
    methods: {
      enterHandler() {
        this.isShow = true;
      },
      leaveHandler() {
        this.isShow = false;
      },
      logoutHandler(){
        localStorage.clear();
        this.$http.userLogout().then(res=>{
          this.$message(res.data);
          window.location.href = 'http://localhost:8080/home';
        }).catch(err=>{
          console.log(err);
        })
      },
    },
  };
</script>

<style lang="css" scoped>
  li {
    list-style: none;
  }

  header {
    min-width: 1200px;
    z-index: 100;
    box-shadow: 0 4px 8px 0 hsla(0, 0%, 59%, .1);
  }

  .header-top {
    width: 100%;
    height: 40px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    background: #fafafa;
  }

  .header-top p {
    width: 1200px;
    font-size: 12px;
    cursor: pointer;
    color: #9d9d9d;
  }

  .header {
    width: 100%;
    height: 60px;
    background: #fff;
    margin: 0 auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    border-bottom: 1px solid hsla(0, 0%, 59%, .1);
  }

  .header .header-cont {
    width: 1200px;
    height: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    position: relative;
  }

  .header .header-cont .left {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    position: absolute;
    left: 0;
    top: 12px;
  }

  .header .header-cont .oldboy {
    width: 118px;
    height: auto;
    cursor: pointer;
    margin-right: 50px;
  }

  .header .header-cont .nav {
    width: auto;
    height: 36px;
    display: -ms-flexbox;
    display: flex;
    line-height: 36px;
    margin-left: 160px;
  }

  .header .header-cont .nav a {
    height: 36px;
    display: inline-block;
    text-decoration: none;
    margin-right: 30px;
  }

  .header .header-cont .nav a li {
    font-size: 15px;
    font-weight: 400;
    cursor: pointer;
    color: #4a4a4a;
  }

  .header .header-cont .header-right-box {
    height: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 15px;
    color: #4a4a4a;
    position: absolute;
    right: 0;
    top: 0;
  }

  .header .header-cont .header-right-box .search {
    height: auto;
    display: -ms-flexbox;
    display: flex;
  }

  .header .header-cont .header-right-box .search input {
    width: 185px;
    height: 26px;
    font-size: 14px;
    color: #4a4a4a;
    border-bottom: 1px solid #ffc210;
  }

  .header .header-cont .header-right-box .search ul {
    width: 185px;
    height: 26px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding-bottom: 3px;
    border-bottom: 1px solid hsla(0, 0%, 59%, .25);
    cursor: text;
  }

  .header .header-cont .nav .active, .header .header-cont .nav a:hover {
    border-bottom: 2px solid #f5a623;
    color: #f5a623;
  }

  .header .header-cont .header-right-box .register {
    height: 36px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    line-height: 36px;
  }

  .header .header-cont .header-right-box .register .signin, .header .header-cont .header-right-box .register .signup {
    font-size: 14px;
    color: #5e5e5e;
    white-space: nowrap;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .header .header-cont .header-right-box .search ul span {
    color: #545c63;
    font-size: 12px;
    padding: 3px 12px;
    background: #eeeeef;
    cursor: pointer;
    margin-right: 3px;
    border-radius: 11px;
  }

  .header .header-cont .header-right-box .search p {
    position: relative;
    margin-right: 20px;
    margin-left: 4px;
    margin-top: 7px;
  }

  .header .header-cont .header-right-box .search p .icon {
    width: 16px;
    height: 16px;
    cursor: pointer;
  }

  .header .header-cont .header-right-box .search p .new {
    width: 18px;
    height: 10px;
    position: absolute;
    left: 15px;
    top: 0;
  }

  .header .header-cont .header-right-box .shop-car {
    width: 99px;
    height: 28px;
    border-radius: 15px;
    margin-right: 20px;
    background: #f7f7f7;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    position: relative;
    cursor: pointer;
  }

  .header .header-cont .header-right-box .shop-car img {
    width: 20px;
    height: 20px;
    margin-right: 7px;
  }

  .header .header-cont .header-right-box .shop-car span {
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
  }

  #app > header > div.header > div > div.header-right-box > div.nav-right-box > div > div.nav-study > a {
    color: #5e5e5e;
  }

  .header .header-cont .header-right-box .nav-right-box {
    position: relative;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right {
    float: right;
    display: -ms-flexbox;
    display: flex;
    height: 100%;
    line-height: 60px;
    position: relative;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right div:first-child {
    padding-left: 0;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right div {
    line-height: 60px;
    cursor: pointer;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right .nav-img img {
    width: 26px;
    height: 26px;
    border-radius: 50%;
    display: inline-block;
    border: 1px solid #f3f3f3;
    margin-left: 10px;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right .home-my-account {
    display: block;
    position: absolute;
    right: 0;
    top: 60px;
    z-index: 101;
    width: 190px;
    height: auto;
    background: #fff;
    border-radius: 4px;
    box-shadow: 0 4px 8px 0 #d0d0d0;
  }

  .header .header-cont .header-right-box .nav-right-box .nav-right .home-my-account li {
    display: block;
    height: 40px;
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
    padding-left: 20px;
    padding-right: 20px;
    cursor: pointer;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    box-sizing: border-box;
  }
</style>

