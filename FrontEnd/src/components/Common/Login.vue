<template>
  <div>
    <button id="signin" type="button" class="signin" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
      登录
    </button>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="popup-content">
            <div class="close-btn" data-dismiss="modal"></div>
            <div class="signin">
              <ul>
                <li class="item_active">密码登录</li>
                <li>短信登录</li>
              </ul>
              <hr>
              <div class="username inputcontain">
                <img alt="shouji" src="/static/images/shouji@1x.svg">
                <label for="usernameInput"></label>
                <input type="text" id="usernameInput" placeholder="手机号" maxlength="20" v-model="username">
              </div>
              <div class="password inputcontain">
                <img alt="password" src="/static/images/mima-4@1x.svg">
                <label for="passwordInput"></label>
                <input type="password" id="passwordInput" placeholder="密码" maxlength="20" v-model="password">
                <a class="eye" style="display: none;">
                  <img alt="yanjing" src="/static/images/yanjing@1x_1560849097.8918953.svg">
                </a>
                <a class="eye">
                  <img alt="眼睛关闭" src="/static/images/眼睛关闭@1x_1560849097.5098064.svg">
                </a>
              </div>
              <div>
                <div id="embed-captcha"></div>
                <p id="wait" style="display: none;">验证码加载中...</p>
                <p id="notice" style="display: none;">请先拖动验证码到相应位置</p>
              </div>
              <button id="confirmbtn" @click="loginHandler">登录</button>
              <div class="otherway">
                <div class="oauth-box">
                  <div class="oauth-bg">
                    <img src="/static/images/dengluweixin.svg" alt="dengluweixin">
                    <span>微信登录</span>
                  </div>
                </div>
                <div>
                  <span>没有账号，</span>
                  <span class="link-btn">立即注册</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  $('#exampleModal').on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget);
    const recipient = button.data('whatever');
    const modal = $(this);
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)
  });
  export default {
    name: 'Login',
    data(){
      return {
        username: "",
        password: "",
      }
    },
    methods: {
      loginHandler(){
        let params = {
          username: this.username,
          password: this.password,
        };
        this.$http.userLogin(params).then(res=>{
          console.log(res);
          if (res.code === 200){
            this.$message(res.data.message);
          } else {
            this.$message('Login Failure！');
          }
          if (!res.error) {
            location.reload();
            localStorage.setItem("access_token", res.data.access_token);
            localStorage.setItem("username", res.data.username);
            localStorage.setItem("identity", res.data.identity);
            localStorage.setItem("avatar", res.data.avatar);
            localStorage.setItem("shop_cart_num", res.data.shop_cart_num);
            localStorage.setItem("notice_num", res.data.notice_num);

            this.$store.dispatch("getUserInfo", res.data);
          }
        }).catch(err=>{
          console.log(err);
          this.$http.userLogout().then(res=>{
            console.log(res);
            location.reload();
          }).catch(err=>{
            console.log(err);
          })
        });
      },
    },
  };
</script>

<style lang="css" scoped>
  .signin {
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

  .popup-content {
    height: auto;
    background: #fff;
    border-radius: 4px;
    text-align: center;
    padding: 38px 38px 58px;
    box-sizing: border-box;
    position: relative;
  }

  .close-btn {
    width: 26px;
    height: 26px;
    position: absolute;
    right: 10px;
    top: 10px;
    cursor: pointer;
  }

  .close-btn:before {
    content: "";
    display: block;
    background-color: #000;
  }

  .close-btn:before {
    border-top: 1px solid #000;
    border-bottom: 1px solid #000;
    height: 0;
    width: 20px;
    position: absolute;
    left: 50%;
    top: 50%;
    margin-top: -1px;
    margin-left: -10px;
  }

  .close-btn:before {
    transform: rotate(45deg);
  }

  .close-btn:after {
    border-left: 1px solid #000;
    border-right: 1px solid #000;
    height: 20px;
    width: 0;
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -1px;
    margin-top: -10px;
  }

  .close-btn:after, .singin-popup .close-btn:before {
    content: "";
    display: block;
    background-color: #000;
  }

  .close-btn:after, .singin-popup .close-btn:before {
    transform: rotate(45deg);
  }

  .popup-content .signin {
    width: 100%;
    height: auto;
  }

  .popup-content .signin ul {
    width: 330px;
    display: -ms-flexbox;
    display: flex;
  }

  .popup-content .signin ul li {
    font-size: 18px;
    font-weight: 500;
    color: #999;
    margin-right: 50px;
    cursor: pointer;
    padding-bottom: 20px;
  }

  .popup-content .signin ul li {
    font-size: 18px;
    font-weight: 500;
    color: #999;
    margin-right: 50px;
    cursor: pointer;
    padding-bottom: 20px;
  }

  .popup-content .signin .username {
    border: 1px solid #ddd;
    padding-left: 15px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 40px;
    position: relative;
  }

  .popup-content .signin .username img {
    width: 14px;
  }

  .popup-content .signin .username input {
    -ms-flex: 1;
    flex: 1;
    margin-left: 12px;
    font-size: 14px;
    color: #282828;
    height: 34px;
    border: none;
  }

  .popup-content .signin .password {
    border: 1px solid #ddd;
    padding-left: 15px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 40px;
    position: relative;
  }

  .popup-content .signin .password img {
    width: 14px;
  }

  .popup-content .signin .password input {
    -ms-flex: 1;
    flex: 1;
    margin-left: 12px;
    font-size: 14px;
    color: #282828;
    height: 34px;
    border: none;
  }

  .popup-content .signin .password .eye {
    width: 18px !important;
    display: inline-block;
    float: right !important;
    margin-right: 15px;
    margin-left: 15px;
    cursor: pointer;
  }

  .popup-content .signin .password .eye img {
    width: 100% !important;
  }

  .popup-content .signin .password img {
    width: 14px;
  }

  .popup-content .signin .password .eye {
    width: 18px !important;
    display: inline-block;
    float: right !important;
    margin-right: 15px;
    margin-left: 15px;
    cursor: pointer;
  }

  .popup-content .signin .password .eye img {
    width: 100% !important;
  }

  .popup-content .signin .password img {
    width: 14px;
  }

  #embed-captcha {
    display: none;
    width: 100%;
  }

  #notice, #wait {
    display: none;
  }

  .popup-content .signin button {
    width: 400px;
    height: 42px;
    background: #050505;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    margin-top: 40px;

  }

  .popup-content .signin .otherway {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    margin-top: 15px;
  }

  .oauth-box {
    width: 100px;
    cursor: pointer;
  }

  .oauth-box img {
    width: 24px;
  }

  .oauth-box span {
    font-size: 14px;
    font-weight: 400;
    color: #aaa;
    padding-left: 6px;
  }

  .popup-content .signin .otherway span {
    font-size: 14px;
    font-weight: 500;
    color: #aaa;
  }

  .popup-content .signin .otherway span {
    font-size: 14px;
    font-weight: 500;
    color: #aaa;
  }

  .popup-content .signin .link-btn {
    color: #ffc220 !important;
    cursor: pointer;
  }
</style>
