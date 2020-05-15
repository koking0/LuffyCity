<template>
  <div class="content" style="margin-bottom: 50px;">
    <div class="questions-box">
      <div class="user-questions">
        <div class="title">
          <p>提问（必填）</p>
        </div>
        <div class="problem">
          <p class="inp">
            <span class="important">*</span>
            <label for="title"></label>
            <input id="title" type="text" placeholder="用一句话说明你的问题（不能少于5个字符）" v-model="title">
          </p>
          <p>
            <span class="important">*</span>
            <label for="content"></label>
            <textarea id="content" cols="2" rows="6" style="OVERFLOW:hidden" v-model="content"></textarea>
          </p>
          <p class="errortip">标题不能少于5个字符！</p>
        </div>
      </div>
      <div class="problem-choose">
        <div class="environment">
          <div class="title">
            <p>环境</p>
          </div>
          <label for='other'></label>
          <input id='other' type="text" placeholder="电脑平台、Python、Linux版本等，第三方包版本信息 (必填)" v-model="environment">
          <p class="tip">说明：为了让导师快速理解问题，请备注对应的环境信息</p>
          <div class="foot">
            <label for="">紧急程度：</label>
            <select name="" id="" v-model="situation">
              <option value="2">十万火急</option>
              <option value="1">紧急</option>
              <option value="0" selected="selected">一般</option>
            </select>
            <button @click="askQuestion()">发布</button>
          </div>
        </div>
      </div>
    </div>
    <div class="tip-box">
      <div class="attention">
        <div class="title">
          <p>提问注意事项</p>
        </div>
        <p class="text">
          1、提问后，导师会在规定时间内回答。<br>
          2、为了使导师快速理解问题：《标题、补充详细》务必填写完整。<br>
          3、导师回答后会实时微信通知到您。<br>
          4、可在“我的教室—我的提问“查看提问记录和答案。
        </p>
      </div>
      <div class="specification">
        <div class="title">
          <p>提问正确范例</p></div>
        <img class="pimg" src="/static/images/study-img2.png" alt="">
      </div>
      <div class="instructions">
        <div class="title"><span></span>
          <p>提问说明</p></div>
        <ul>
          <li>
            <span>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</span>
            <span>标题的描述，不少于5个字符。</span>
          </li>
          <li>
            <span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</span>
            <span>问题详细补充: 代码、报错截图等;</span>
          </li>
          <li><span>问答分类：</span> <span>问题分类标签，最多可选3个。</span></li>
          <li><span>环境信息：</span> <span>如: python3.6.2、Django1.11.3、Win、Mac;</span></li>
          <li><span>紧急程度：</span> <span>十万火急、紧急、一般。</span></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Questions",
    data() {
      return {
        title: '',
        content: '',
        environment: '',
        situation: '',
      }
    },
    methods: {
      askQuestion() {
        let data = {
          token: localStorage.getItem('access_token'),
          title: this.title,
          content: this.content,
          environment: this.environment,
          situation: this.situation,
        };
        this.$http.questions(data).then(res => {
          console.log(res);
          this.$message(res.data);
          this.$router.push({name:"Classroom"});
        }).catch(err => {
          console.log(err);
        });
      },
    },
  }
</script>

<style scoped>
  #content {
    width: 97%;
    height: 354px;
    font-size: 14px;
    color: #4a4a4a;
    border: 1px solid #e4e8eb;
    border-radius: 3px;
  }

  .content {
    width: 1200px;
    height: auto;
    margin: 10px auto;
  }

  .content .questions-box {
    float: left;
    width: 840px;
    height: auto;
    background: #fff;
    box-shadow: 0 4px 8px 0 #e8e8e8;
    border-radius: 4px;
    margin-right: 36px;
    padding: 30px 30px 50px;
    box-sizing: border-box;
  }

  .content .questions-box .user-questions {
    margin-bottom: 30px;
  }

  .ask-questions .title {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .ask-questions .title span {
    width: 4px;
    height: 23px;
    display: block;
    background: #000;
    margin-right: 12px;
  }

  .ask-questions .title p {
    font-size: 18px;
    color: #5e5e5e;
  }

  .content .questions-box .user-questions .problem {
    width: 100%;
    height: auto;
    margin-top: 20px;
    color: #4a4a4a;
  }

  .content .questions-box .user-questions .problem .inp {
    width: 100%;
    height: 54px;
    display: -ms-flexbox;
    display: flex;
  }

  .content .questions-box .important {
    font-size: 18px;
    margin-right: 8px;
    color: #fa6240;
    transition: all .3s ease-in-out;
  }

  .content .questions-box .user-questions .problem .inp input {
    width: 100%;
    height: 54px;
    font-size: 14px;
    text-indent: 10px;
    color: #4a4a4a;
    border: 1px solid #e4e8eb;
    border-radius: 3px;
    transition: all .3s ease-in-out;
  }

  .content .questions-box .user-questions .problem .errortip {
    font-size: 14px;
    color: #fa6240;
    margin-left: 20px;
    padding: 6px 0;
    opacity: 0;
    transition: all .3s ease-in-out;
  }

  .content .questions-box .user-questions .editorerror {
    font-size: 14px;
    color: #fa6240;
    margin-left: 20px;
    padding: 6px 0;
    opacity: 0;
    transition: all .3s ease-in-out;
  }

  .content .questions-box .problem-choose .environment {
    margin-left: 19px;
  }

  .ask-questions .title p {
    font-size: 18px;
    color: #5e5e5e;
  }

  .content .questions-box .problem-choose .environment input {
    width: 100%;
    height: 54px;
    margin: 10px 0;
    text-indent: 10px;
    border: 1px solid #e4e8eb;
    border-radius: 3px;
  }

  .content .questions-box .problem-choose .environment .tip {
    font-size: 14px;
    color: #9b9b9b;
    margin-bottom: 30px;
  }

  .content .questions-box .problem-choose .environment .foot {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .content .questions-box .problem-choose .environment .foot select {
    width: 120px;
    height: 42px;
    background: #fff;
    border: 1px solid #e4e8eb;
    border-radius: 3px;
    margin-right: 20px;
    cursor: pointer;
  }

  .content .questions-box .problem-choose .environment .foot button {
    width: 120px;
    height: 42px;
    background: #01b4e4;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .content .tip-box {
    float: right;
    width: 320px;
    height: auto;
    background: hsla(0, 0%, 100%, .95);
    box-shadow: 0 2px 4px 0 #e8e8e8;
    padding: 30px 20px;
    box-sizing: border-box;
  }

  .ask-questions .title {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .ask-questions .title span {
    width: 4px;
    height: 23px;
    display: block;
    background: #000;
    margin-right: 12px;
  }

  .ask-questions .title p {
    font-size: 18px;
    color: #5e5e5e;
  }

  .content .tip-box .specification {
    text-align: center;
  }

  .ask-questions .title {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .ask-questions .title span {
    width: 4px;
    height: 23px;
    display: block;
    background: #000;
    margin-right: 12px;
  }

  .ask-questions .title p {
    font-size: 18px;
    color: #5e5e5e;
  }

  .content .tip-box .specification img {
    width: 100%;
    height: auto;
    cursor: zoom-in;
    margin-top: 20px;
    margin-bottom: 16px;
  }

  .ask-questions .title {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .ask-questions .title span {
    width: 4px;
    height: 23px;
    display: block;
    background: #000;
    margin-right: 12px;
  }

  .ask-questions .title p {
    font-size: 18px;
    color: #5e5e5e;
  }

  .content .tip-box .instructions ul {
    margin-top: 20px;
  }

  .content .tip-box .instructions ul li {
    display: -ms-flexbox;
    display: flex;
    line-height: 28px;
  }

  .content .tip-box .instructions ul li span:first-of-type {
    font-size: 14px;
    color: #9b9b9b;
  }

  .content .tip-box .instructions ul li span:nth-of-type(2) {
    width: 210px;
    height: auto;
    display: inline-block;
    font-size: 14px;
    color: #666;
  }
</style>
