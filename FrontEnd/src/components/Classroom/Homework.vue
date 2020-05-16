<template>
  <div class="box" style="">
    <div class="item_cont_box">
      <div class="itemcont" v-for="(item, index) in homeworkDetail" :key="item.id">
        <h3 class="homework-tit">第{{moduleId}}模块：{{item.title}}</h3>
        <div class="homework-data">
          <p>
            <b class="prefix">我的成绩：</b>
            <span>未提交</span>
          </p>
          <p>
            <b class="prefix"><i>最</i><i>高</i><i>奖</i><i>学</i><i>金</i><i>：</i></b>
            <span>{{item.homeworkPrice}}贝里</span>
          </p>
          <p>
            <b class="prefix">作业题目：</b>
            <span class="text">{{item.homeworkTitle}}</span>
          </p>
          <p>
            <b class="prefix">作业截止时间：</b>
            <span class="text">2020-05-19 23:59</span>
          </p>
        </div>
        <ul class="side-main-cont">
          <li>
            <p class="demand">作业需求:</p>
            <pre class="article">
              {{item.homeworkContent}}
            </pre>
          </li>
          <li>
            <p class="demand">踩分点:</p>
            <pre class="article">满分100分，按照实现的需求以及代码的规范程度来进行评分</pre>
          </li>
          <li>
            <p class="demand">导师点评:</p>
            <pre class="article">暂无导师点评</pre>
          </li>
          <li>
            <div class="empty" id="empty" style="">
              <img src="/static/images/no-com.png" alt="">
              <span>空空如也，您还未提交作业</span>
            </div>
            <div class="dropzonebox" style="">
              <el-upload class="upload-demo" drag :action='item.action' multiple>
                <i class="el-icon-upload"></i>
                <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
              </el-upload>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Homework",
    data() {
      return {
        homeworkDetail: null,
        moduleId: null,
      }
    },
    created() {
      this.moduleId = this.$route.params.detailId;
      this.$http.homeworkDetail(this.$route.params.detailId).then(res => {
        this.homeworkDetail = res.modules[this.$route.params.detailId]['chapters'];
        for (let i = 0; i < this.homeworkDetail.length; i++) {
          this.homeworkDetail[i]['action'] = `http://127.0.0.1:8000/api/homework/homeworkDetail/${this.homeworkDetail[i]['id']}?token=${localStorage.getItem('access_token')}`;
        }
        console.log(res.modules[this.$route.params.detailId]['chapters'])
      }).catch(err => {
        console.log(err);
      })
    },
  };
</script>

<style scoped>
  .box {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    overflow: hidden;
  }

  .item_cont_box {
    width: 1200px;
    height: auto;
    position: relative;
  }

  .itemcont {
    width: 1200px;
    background: #fff;
    padding-right: 30px;
    padding-bottom: 35px;
  }

  .homework-tit {
    padding: 25px 35px;
    font-size: 20px;
    color: #333;
    margin-right: -30px;
    border-bottom: 1px solid #eaeaea;
  }

  .homework-data, .homework-data p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .homework-data {
    width: 100%;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding: 30px 0 0 35px;
  }

  .homework-data p {
    width: 50%;
    margin-bottom: 30px;
    font-size: 16px;
    color: #333;
  }

  .homework-data, .homework-data p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .homework-data p b {
    font-weight: 400;
  }

  .prefix {
    font-size: 16px;
    color: #333;
  }

  .homework-data p:first-of-type span {
    font-size: 24px;
    color: #fa6240;
  }

  .homework-data p span {
    margin-left: 8px;
  }

  .homework-data p:nth-of-type(2) {
    padding-left: 140px;
  }

  .homework-data p:nth-of-type(2) b {
    width: 112px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .homework-data p b {
    font-weight: 400;
  }

  .prefix {
    font-size: 16px;
    color: #333;
  }

  .homework-data p:nth-of-type(2) span {
    font-size: 16px;
    color: #fa6240;
  }

  .homework-data p span {
    margin-left: 8px;
  }

  .homework-data p:nth-of-type(3), .homework-data p:nth-of-type(4) {
    margin-bottom: 0;
  }

  .homework-data p b {
    font-weight: 400;
  }

  .homework-data .text {
    font-size: 16px;
    color: #575757;
  }

  .homework-data p span {
    margin-left: 8px;
  }

  .homework-data p:nth-of-type(3), .homework-data p:nth-of-type(4) {
    margin-bottom: 0;
  }

  .homework-data p:nth-of-type(4) {
    padding-left: 140px;
  }

  .homework-data p {
    width: 50%;
    margin-bottom: 30px;
    font-size: 16px;
    color: #333;
  }

  .homework-data, .homework-data p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .homework-data p b {
    font-weight: 400;
  }

  .prefix {
    font-size: 16px;
    color: #333;
  }

  .homework-data .text {
    font-size: 16px;
    color: #575757;
  }

  .homework-data p span {
    margin-left: 8px;
  }

  li {
    list-style: none;
  }

  .demand {
    font-size: 16px;
    color: #333;
    margin-top: 30px;
    margin-bottom: 15px;
    margin-left: 35px;
  }

  .article {
    font-size: 14px;
    line-height: 35px;
    color: #4a4a4a;
    margin-left: 35px;
    padding: 20px 15px;
    white-space: pre-wrap;
    word-wrap: break-word;
    background: #f7f7f7;
    border: 1px solid #d3d3d3;
  }

  .empty {
    padding-top: 30px;
    padding-left: 35px;
    padding-right: 35px;
    font-size: 14px;
    color: #888;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .empty img {
    width: 20px;
    height: 20px;
    margin-top: -5px;
  }

  .empty span {
    margin-left: 10px;
    font-family: PingFangSC-Medium;
  }

  .dropzonebox {
    overflow: hidden;
    margin-left: 35px;
    border-radius: 3px;
    border: 1px dashed #4a90e2;
    margin-bottom: 35px;
    margin-top: 30px;
  }

  .dropzone.dz-clickable {
    cursor: pointer;
  }

  .dropzone {
    min-height: 160px;
    background: #fff;
    padding: 0 !important;
    padding-left: 15px !important;
    padding-right: 15px !important;
  }

  .dropzone, .dropzone {
    box-sizing: border-box;
  }

  .dropzone.dz-clickable, .dropzone.dz-clickable .dz-message, .dropzone.dz-clickable .dz-message span {
    cursor: pointer;
  }

  .dropzone {
    border: 1px solid rgba(0, 0, 0, .03);
    border-radius: 3px;
    background: rgba(0, 0, 0, .03);
    padding: 23px;
  }

  .dropzone {
    position: relative;
    border: 1px solid rgba(0, 0, 0, .08);
    background: rgba(0, 0, 0, .02);
    padding: 1em;
  }

  .dropzone.dz-clickable .dz-message, .dropzone.dz-clickable .dz-message {
    cursor: pointer;
  }

  .dropzonebox .dropzone .dz-message {
    font-weight: 400;
    font-size: 18px;
    color: #333;
  }

  .dropzone .dz-message {
    padding-top: 50px;
    padding-bottom: 50px;
  }

  .dropzone .dz-message {
    text-align: left;
  }

  .dropzone, .dropzone {
    box-sizing: border-box;
  }

  .dropzone .dz-message {
    opacity: 1;
    -ms-filter: none;
    filter: none;
  }

  .dropzone.dz-clickable .dz-message {
    cursor: pointer;
  }

  .dropzone .dz-message .note {
    font-size: 14px;
    color: #9b9b9b;
    font-weight: 200;
    display: block;
    margin-top: 16px;
  }

  .dropzone {
    box-sizing: border-box;
  }

  .dropzone .dz-message .note strong {
    color: #fa6240;
  }
</style>
