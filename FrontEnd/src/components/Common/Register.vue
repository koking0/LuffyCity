<template>
  <div>
    <button id="signup" type="button" class="signup" data-toggle="modal" data-target="#signupModal" data-whatever="@mdo">
      注册
    </button>
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="popup-content">
            <div class="close-btn" data-dismiss="modal"></div>
            <div class="signup">
              <div class="username inputcontain">
                <img alt="shouji" src="/static/images/shouji@1x_1560849098.2282765.svg">
                <label for="usernameInput"></label>
                <input type="text" id="usernameInput" placeholder="用户名" maxlength="20" v-model="username">
              </div>
              <div class="password inputcontain">
                <img alt="password" src="/static/images/mima-4@1x_1560849097.9023619.svg">
                <label for="passwordInput"></label>
                <input type="password" id="passwordInput" placeholder="密码" maxlength="20" v-model="password">
              </div>
              <div class="password inputcontain">
                <img alt="password" src="/static/images/mima-4@1x_1560849097.9023619.svg">
                <label for="confirm_passwordInput"></label>
                <input type="password" id="confirm_passwordInput" placeholder="确认密码" maxlength="20">
              </div>
              <button id="confirmbtn" @click="registerHandler">注册</button>
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
    name: 'Register',
    data(){
      return {
        username: "",
        password: "",
      }
    },
    methods: {
      registerHandler(){
        let params = {
          username: this.username,
          password: this.password,
        };
        this.$http.userLogin(params).then(res=>{

        }).catch(err=>{
          console.log(err);
        });
      },
    },
  };
</script>

<style lang="css" scoped>
  .signup {
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

  .popup-content .signup {
    width: 100%;
    height: auto;
  }

  .popup-content .signup ul {
    width: 330px;
    display: -ms-flexbox;
    display: flex;
  }

  .popup-content .signup ul li {
    font-size: 18px;
    font-weight: 500;
    color: #999;
    margin-right: 50px;
    cursor: pointer;
    padding-bottom: 20px;
  }

  .popup-content .signup ul li {
    font-size: 18px;
    font-weight: 500;
    color: #999;
    margin-right: 50px;
    cursor: pointer;
    padding-bottom: 20px;
  }

  .popup-content .signup .username {
    border: 1px solid #ddd;
    padding-left: 15px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 40px;
    position: relative;
  }

  .popup-content .signup .username img {
    width: 14px;
  }

  .popup-content .signup .username input {
    -ms-flex: 1;
    flex: 1;
    margin-left: 12px;
    font-size: 14px;
    color: #282828;
    height: 34px;
    border: none;
  }

  .popup-content .signup .password {
    border: 1px solid #ddd;
    padding-left: 15px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 40px;
    position: relative;
  }

  .popup-content .signup .password img {
    width: 14px;
  }

  .popup-content .signup .password input {
    -ms-flex: 1;
    flex: 1;
    margin-left: 12px;
    font-size: 14px;
    color: #282828;
    height: 34px;
    border: none;
  }

  .popup-content .signup .password .eye {
    width: 18px !important;
    display: inline-block;
    float: right !important;
    margin-right: 15px;
    margin-left: 15px;
    cursor: pointer;
  }

  .popup-content .signup .password .eye img {
    width: 100% !important;
  }

  .popup-content .signup .password img {
    width: 14px;
  }

  .popup-content .signup .password .eye {
    width: 18px !important;
    display: inline-block;
    float: right !important;
    margin-right: 15px;
    margin-left: 15px;
    cursor: pointer;
  }

  .popup-content .signup .password .eye img {
    width: 100% !important;
  }

  .popup-content .signup .password img {
    width: 14px;
  }

  #embed-captcha {
    display: none;
    width: 100%;
  }

  #notice, #wait {
    display: none;
  }

  .popup-content .signup button {
    width: 400px;
    height: 42px;
    background: #050505;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    margin-top: 40px;

  }

  .popup-content .signup .otherway {
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

  .popup-content .signup .otherway span {
    font-size: 14px;
    font-weight: 500;
    color: #aaa;
  }

  .popup-content .signup .otherway span {
    font-size: 14px;
    font-weight: 500;
    color: #aaa;
  }

  .popup-content .signup .link-btn {
    color: #ffc220 !important;
    cursor: pointer;
  }
</style>
