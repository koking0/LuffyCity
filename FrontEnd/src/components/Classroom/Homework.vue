<template>
  <div class="box" style="">
    <div class="item_cont_box">
      <div class="itemcont" id="30">
        <h3 class="homework-tit">第九模块：项目实战二(vue &amp;路飞学城开发)·第4章Vue基础和高级知识点（旧）</h3>
        <div class="homework-data">
          <p>
            <b class="prefix">我的成绩：</b>
            <span>未提交</span>
          </p>
          <p>
            <b class="prefix"><i>最</i><i>高</i><i>奖</i><i>学</i><i>金</i><i>：</i></b>
            <span>2000贝里</span>
          </p>
          <p>
            <b class="prefix">作业题目：</b>
            <span class="text">路飞学城开发</span>
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
            基础需求：85%
            1. 前后端完全分离，前端基于Vue框架，后端使用Django, 用restful API交互
            2. 前端展示课程，允许用户购买
            3. 为学员、导师、管理员分别设计3个平台，互不影响
            4. 学员角色功能：
                4.1 注册、登录、购买课程、支付宝接入
                4.2 在线视频播放、评价、提问题、交作业
            5. 导师角色功能（可参照crm中的实现方式）：
                5.1 对学员进行跟进、上传批改作业过程、回复学员问题
            6. 管理员角色功能（可参照crm中的实现方式）：
                6.1 查看用户注册趋势图、订单量报表
                6.2 增删改查课程
                6.3 为学员分配导师
                6.4 创建、管理资讯文章
                6.5 追踪学员学习进度
                6.6 导师跟进管理
                6.7 订单管理
            7. 为主要的功能开发单元测试

            编码规范需求：15%
            1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)
            2. 函数有相应的注释
            3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）
            4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果
            5. 程序设计的流程图：
            (可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)
            </pre>
          </li>
          <li>
            <p class="demand">踩分点:</p>
            <pre class="article">满分100分，按照实现的需求以及代码的规范程度来进行评分</pre>
          </li>
          <li>
            <p class="demand">注意点:</p>
            <pre class="article"></pre>
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
              <form id="myAwesomeDropzone" class="dropzone needsclick dz-clickable">
                <div class="dz-message needsclick">
                  点击这里提交作业，也可以直接拖拽到这里(仅支持ZIP)<br>
                  <span class="note needsclick">
                    (每个作业最多提交<strong>2次</strong>.第一次不通过的作业有一次补交机会,补交的作业最高分为60分)
                  </span>
                </div>
              </form>
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
    created() {
      this.$http.homeworkDetail(this.$route.params.detailId).then(res => {
        console.log(res);
      }).catch(err => {
        console.log(err);
      })
    },
  }
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
