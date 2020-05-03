<template>
  <div class="question_box">
    <div class="head_count">
      <div class="top_cont">
        <div class="top_cont1">
          <div class="user_info">
            <img alt="" src="//hcdn1.luffycity.com/static/frontend/head_portrait/qYBYXa4JqwH8OtUp5xq7RBdp.png">
            <div><p class="name"></p>
              <p class="ranking">班级排名：第<span>&nbsp;84&nbsp;</span>名</p></div>
          </div>
          <div class="more_choice"><p class="switch_cls">选择班级:</p> <span
            class="choose" key="0">Python全栈中级开发</span><span key="1">能力等级测试</span>
             </div>
        </div>
        <div class="top_cont2">
          <div class="Chart_Box">
            <div id="myChart" class="myChart"
                 style="width: 1440px; height: 757px; -webkit-tap-highlight-color: transparent; user-select: none; background: transparent;">
              <div
                style="position: relative; overflow: hidden; width: 150px; height: 150px; padding: 0px; margin: 0px; border-width: 0px;">
                <canvas width="150" height="150" data-zr-dom-id="zr_0"
                        style="position: absolute; left: 0px; top: 0px; width: 150px; height: 150px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
              </div>
            </div>
            <p class="num"><span>2%</span><br><span
            >已掌握知识点</span></p></div>
          <div class="data_item">
            <div><p><b>22</b><span>累计答题</span></p></div>
            <div><p><b>68%</b><span>正确率</span></p></div>
            <div><p><b>19</b><span>已掌握知识点</span></p></div>
            <div><p><b>7%</b><span>超越小伙伴</span></p></div>
          </div>
        </div>
      </div>
    </div>
    <div class="main">
      <header> 智能题库 <p>水平怎样， 一测便知！</p></header>
      <div class="loading" style="display: none;"><img
        src="//hcdn1.luffycity.com/static/frontend/activity/loading-tiku_1564127715.6831748.gif">
      </div>
      <main style="">
        <section class="mask_box" key="0"> <!--v-if-->
          <div class="imgbac"><img alt=""
                                   src="//hcdn1.luffycity.com/static/frontend/index/luffyX_1524209193.9734485.svg">
          </div>
          <p class="hoverp">章节测验</p>
          <p class="hoverp">练习到: 数据类型&amp;文件操作</p></section>
        <section class="mask_box" key="1"> <!--v-if-->
          <div class="imgbac"><img alt=""
                                   src="//hcdn1.luffycity.com/static/frontend/index/Xspecial_1524209320.755423.svg">
          </div>
          <p class="hoverp">专项练习</p>
          <p class="hoverp">专项能力掌握提高</p></section>
        <section class="mask_box" key="2"> <!--v-if-->
          <div class="imgbac"><img alt=""
                                   src="//hcdn1.luffycity.com/static/frontend/index/历史练习_1524196647.2628436.svg">
          </div>
          <p class="hoverp">历史练习</p>
          <p class="hoverp">一共进行1次历史练习</p></section>
        <section class="mask_box" key="3"> <!--v-if-->
          <div class="imgbac"><img alt=""
                                   src="//hcdn1.luffycity.com/static/frontend/index/错题本_1524198512.8152263.svg">
          </div>
          <p class="hoverp">我的错题本</p>
          <p class="hoverp">近30天: 新增错题0道, 待复习0道</p></section>
        <section class="mask_box">
          <div class="imgbac forthcoming"><img
            src="//hcdn1.luffycity.com/static/frontend/activity/icon5_1564141064.267903.svg">
          </div>
          <p>即将推出</p>
          <p>智能测试</p></section>
      </main>
      <div class="maskbox" style="display: none;">
        <div class="box"><p class="p1"><img
          src="//hcdn1.luffycity.com/static/frontend/activity/remind_1564141051.7423315.svg">
          你确定开始测试么？</p>
          <p class="p2">题目：</p>
          <p class="p3">时间：00分钟</p>
          <button>取消</button>
          <button>确定</button>
        </div>
        <img class="closes"
             src="//hcdn1.luffycity.com/static/frontend/activity/close_1564141047.6293037.svg"></div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "QuestionBank"
  }
</script>

<style scoped>
  .question_box {
    width: 100%;
    height: auto;
    background: #f7f7f7;
  }

  .question_box .head_count {
    width: 100%;
    height: 432px;
    background: url(//hcdn1.luffycity.com/static/frontend/activity/banner_1564127714.8960876.jpeg) no-repeat;
    background-size: 100% 100%;
  }

  .question_box .head_count .top_cont {
    width: 900px;
    height: auto;
    margin: 0 auto;
    color: #fff;
    padding-top: 80px;
    padding-bottom: 64px;
  }

  .question_box .head_count .top_cont .top_cont1 {
    margin-bottom: 10px;
    overflow: hidden;
  }

  .question_box .head_count .top_cont .top_cont1 .user_info {
    color: #fff;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    float: left;
  }

  .question_box .head_count .top_cont .top_cont1 .user_info img {
    width: 100px;
    height: 100px;
    border-radius: 100%;
    margin-right: 25px;
  }

  .question_box .head_count .top_cont .top_cont1 .user_info .name {
    font-size: 30px;
    margin-bottom: 20px;
  }

  .question_box .head_count .top_cont .top_cont1 .user_info .ranking {
    font-size: 15px;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice {
    width: auto;
    height: 20px;
    font-size: 15px;
    color: #e9e9e9;
    text-align: right;
    padding: 30px;
    float: right;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice .switch_cls {
    display: inline;
    padding-right: 15px;
    font-size: 18px;
    color: #fff;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice .choose {
    color: #fff;
    border: 2px solid #fff;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice span {
    cursor: pointer;
    display: inline-block;
    margin-right: 20px;
    margin-bottom: 20px;
    border-radius: 30px;
    padding: 15px 15px;
    border: 1px solid #e9e9e9;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice span:last-child {
    margin-right: 0;
  }

  .question_box .head_count .top_cont .top_cont1 .more_choice span {
    cursor: pointer;
    display: inline-block;
    margin-right: .2rem;
    margin-bottom: .2rem;
    border-radius: .3rem;
    padding: .03rem .12rem;
    border: 1px solid #e9e9e9;
  }

  .question_box .head_count .top_cont .top_cont2 {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .question_box .head_count .top_cont .top_cont2 .Chart_Box {
    width: 2rem;
    height: 2rem;
    margin-left: -.3rem;
    position: relative;
  }

  .question_box .head_count .top_cont .top_cont2 .Chart_Box .myChart {
    width: 2rem !important;
    height: 2rem !important;
  }

  .question_box .head_count .top_cont .top_cont2 .Chart_Box .num {
    width: 1.8rem;
    height: 1.8rem;
    margin-top: .46rem;
    margin-left: -.9rem;
    text-align: center;
    font-size: 10px;
    position: absolute;
    left: 50%;
    top: 0;
  }

  .question_box .head_count .top_cont .top_cont2 .Chart_Box .num > span:first-of-type {
    font-size: .4rem;
  }

  .question_box .head_count .top_cont .top_cont2 .data_item {
    display: -ms-flexbox;
    display: flex;
    text-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-top: .3rem;
  }

  .question_box .head_count .top_cont .top_cont2 .data_item div {
    width: 1.51rem;
    height: 1.43rem;
    background: hsla(0, 0%, 100%, .25);
    margin-right: .2rem;
  }

  audio, canvas, progress, video {
    display: inline-block;
    vertical-align: baseline;
  }

  .question_box .head_count .top_cont .top_cont2 .data_item div p {
    margin-top: .28rem;
  }

  .question_box .head_count .top_cont .top_cont2 .data_item div p b {
    display: block;
    font-size: .4rem;
    font-weight: 400;
    margin-bottom: .05rem;
  }

  .question_box .head_count .top_cont .top_cont2 .data_item div p span {
    font-size: .12rem;
  }

  .question_box .main {
    padding-top: 1rem;
    padding-bottom: 1rem;
  }

  .question_box .main header {
    text-align: center;
    font-size: 28px;
    color: #4a4a4a;
    margin-bottom: .6rem;
  }

  .question_box .main header p {
    font-size: .18rem;
    margin-bottom: .04rem;
  }

  .question_box .main .loading {
    text-align: center;
    padding: .4rem 0;
  }

  .question_box .main .loading img {
    width: 15px;
    height: 15px;
  }

  .question_box .main main {
    width: 1200px;
    margin: 0 auto;
    overflow: hidden;
  }

  .question_box .main main .mask_box:first-of-type, .question_box .main main .mask_box:nth-of-type(4) {
    margin-left: 300px;
  }

  .question_box .main main .mask_box {
    width: 300px;
    height: 300px;
    background: #fff;
    border-radius: 2px;
    margin: 30px 59px;
    float: left;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-direction: column;
    flex-direction: column;
    overflow: hidden;
    cursor: pointer;
    position: relative;
  }

  .question_box .main main .mask_box .imgbac {
    width: 85px;
    height: 85px;
    border-radius: 100%;
    background: #56cbc4;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    margin-top: 62px;
  }

  .question_box .main main .mask_box .imgbac img {
    width: 40%;
    height: auto;
  }

  .question_box .main main .mask_box p:first-of-type {
    font-size: .18rem;
    color: #4a4a4a;
    padding-top: 18px;
    padding-bottom: 10px;
  }

  .question_box .main main .hoverp {
    padding: 0 3px;
    box-sizing: border-box;
  }

  .question_box .main main .mask_box p:nth-of-type(2) {
    font-size: 16px;
    color: #5d6870;
  }

  .question_box .main main .hoverp {
    padding: 0 3px;
    box-sizing: border-box;
  }

  .question_box .main main .mask_box:first-of-type, .question_box .main main .mask_box:nth-of-type(4) {
    margin-left: 3px;
  }

  .question_box .maskbox {
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, .5);
    position: fixed;
    left: 0;
    top: 0;
  }

  .question_box .maskbox .box {
    width: 4.8rem;
    height: auto;
    background: #fff;
    box-shadow: 0 2px 8px 0 rgba(0, 0, 0, .2);
    border-radius: 4px;
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -2.4rem;
    margin-top: -1rem;
    color: #666;
    padding: .5rem;
    box-sizing: border-box;
    animation: x0ppop .45s ease;
  }

  .question_box .maskbox .box .p1 {
    font-size: .2rem;
    font-family: PingFangSC-Medium;
    padding-bottom: .1rem;
  }

  .question_box .maskbox .box img {
    width: .24rem;
    height: .24rem;
    margin-right: .16rem;
  }

  .question_box .maskbox .box .p2, .question_box .maskbox .box .p3 {
    font-size: .18rem;
    margin-left: .4rem;
    margin-bottom: .1rem;
  }

  .question_box .maskbox .box button {
    width: 1rem;
    height: .34rem;
    border: 1px solid #979797;
    border-radius: .03rem;
    text-align: center;
    line-height: .34rem;
    font-size: .14rem;
    color: #5e5e5e;
    margin-left: .66rem;
    margin-top: .25rem;
  }

  .question_box .maskbox .box button:nth-of-type(2) {
    margin-left: .16rem;
  }

  .question_box .maskbox .box button {
    width: 1rem;
    height: .34rem;
    border: 1px solid #979797;
    border-radius: .03rem;
    text-align: center;
    line-height: .34rem;
    font-size: .14rem;
    color: #5e5e5e;
    margin-left: .66rem;
    margin-top: .25rem;
  }

  .question_box .maskbox .closes {
    width: .24rem;
    height: .24rem;
    position: absolute;
    right: 6.9rem;
    top: 50%;
    margin-top: -1.3rem;
    cursor: pointer;
  }
</style>
