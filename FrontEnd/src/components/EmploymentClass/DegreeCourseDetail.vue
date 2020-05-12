<template>
  <div class="box">
    <div class="box-banner" style="z-index: -1">
      <img class="bg" src="/static/images/background@2x.png" alt="background">
      <img class="bc" src="/static/images/bg@2x.png" alt="bg">
      <h1>{{courseDetail.title}}</h1>
      <p>{{courseDetail.slogan}}</p>
    </div>
    <div class="box-data">
      <ul>
        <li><p>{{courseDetail.salary}}</p> <span>就业薪资</span></li>
        <i>/</i>
        <li><p>{{courseDetail.hours}}小时</p> <span>学习周期</span></li>
        <i>/</i>
        <li><p>{{courseDetail.studyNumber}}人</p> <span>学习人数</span></li>
        <i>/</i>
        <li><p>{{courseDetail.employmentRate}}%</p> <span>就业率</span></li>
      </ul>
      <button>80G Python教程限时免费领</button>
    </div>
    <div class="introduce">
      <div class="left">
        <img class="img1" :src="courseDetail.courseImage" alt="courseImage">
      </div>
      <div class="right">
        {{courseDetail.brief}}
      </div>
    </div>
    <div class="outline" style="">
      <div style="">
        <div class="course-outline" v-for="module in courseDetail.modules" :key="module.id">
          <div class="title">
            <p class="title-name">第{{module.index}}模块：{{module.title}}</p>
            <p class="title-side">
              <span class="sp1 short">全部收起</span>
              <span class="sp1 long hide">展开</span>
              <span class="num">{{module.chapters.length}}章</span>
            </p>
          </div>
          <ul class="outline-list">
            <li class="list-data" v-for="chapter in module.chapters" :key="chapter.id">
              <div class="list-data-title">
                <div class="list-name">
                  <img class="open hide" src="/static/images/jiahaobak@2x.png" alt="jiahaobak@2x">
                  <img class="us" src="/static/images/jiahao@2x.png" alt="jiahao@2x">
                  <p>第{{chapter.index}}章·{{chapter.title}}</p>
                </div>
                <div class="list-num">
                  <span class="section-num">{{chapter.sections.length}}节</span>
                </div>
              </div>
              <ul class="list-data-item">
                <li v-for="(section, index) in chapter.sections" :key="section.id">
                  <div class="data-item-name">
                    <img class="img1" src="/static/images/bofang@2x.png" alt="bofang@2x">
                    <img class="img2" src="/static/images/bofang2.png" alt="bofang2">
                    <p>{{chapter.index}}.{{index + 1}} {{section.name}}</p></div>
                  <div class="data-item-num" v-if="section.freeTrail"><span class="time">预览</span></div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="side-box" style="">
        <p class="title">
          <img src="/static/images/qushi@2x_1570514838.2565973.png" alt="qushi">
          <span>本课程精英教师</span>
        </p>
        <div class="side-content course-side">
          <section v-for="teacher in courseDetail.teachers" :key="teacher.id">
            <div class="teacher-intro">
              <div class="teacher-item">
                <div class="title">讲师介绍</div>
                <dl>
                  <dt>
                    <img alt="" :src="teacher.avatar">
                  </dt>
                  <dd>
                    <p>{{teacher.name}}</p>
                  </dd>
                </dl>
                <article>{{teacher.brief}}</article>
              </div>
            </div>
            <img class="foot left" src="/static/images/icon3.svg" alt="icon">
            <img class="foot right" src="/static/images/icon3.svg" alt="icon">
          </section>
        </div>
      </div>
    </div>
    <div class="price-box">
      <img class="bg" src="/static/images/juxing1@2x.png" alt="juxing1@2x">
      <h1>Python全栈开发中级</h1>
      <img class="jiage" src="/static/images/jiage@2x.png" alt="jiage@2x">
      <p>{{courseDetail.slogan}}</p>
      <div>
        <button>立即咨询</button>
        <button @click="buy">立即报名</button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "DegreeCourseDetail",
    data() {
      return {
        courseDetail: null,
      }
    },
    methods : {
      // 立即购买
      buy() {
        this.addShopCart();
        this.$router.push({name: 'ShoppingCar'});
      },
      // 加入购物车
      addShopCart() {
        if (window.localStorage.getItem('access_token')) {
          let goodsInfo = {
            courseId: this.$route.params.detailId,
            token: localStorage.getItem('access_token')
          };
          this.$http.shopCartAdd(goodsInfo).then(res => {
            if (res.code === 200) {
              this.$message(res.data);
            } else if (res.code === 501) {
              this.$message(res.data);
            }
          }).catch(err => {
            console.log(err);
          })
        } else {
          // 跳转登录页面
          document.getElementById("signin").click();
        }
      },
    },
    created() {
      this.$http.degreeCourseDetail(this.$route.params.detailId).then(res => {
        console.log(res);
        res.courseImage = `http://127.0.0.1:8000/${res.courseImage}`;
        for (let i = 0; i < res.teachers.length; i++) {
          res.teachers[i]['avatar'] = `http://127.0.0.1:8000/media/${res.teachers[i]['avatar']}`
        }
        this.courseDetail = res;
      }).catch(err => {
        console.log(err);
      })
    },
  }
</script>

<style scoped>

  .course-side .teacher-intro {
    width: 100%;
    height: auto;
    border-radius: 6px;
    box-shadow: 0 2px 4px 0 #f0f0f0;
    margin-top: 18px;
    padding: 30px 31px;
    box-sizing: border-box;
    background: #fff;
  }

  .course-side .teacher-intro .teacher-item {
    width: 100%;
  }

  .course-side .teacher-intro .teacher-item .title {
    color: #000;
    font-size: 15px;
  }

  .course-side .teacher-intro .teacher-item dl {
    width: 100%;
    margin-top: 12px;
    margin-bottom: 4px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-side .teacher-intro .teacher-item dl dt {
    width: 60px;
    height: 60px;
    border: 1px solid #d0d0d0;
    box-sizing: border-box;
    border-radius: 100%;
    overflow: hidden;
    margin-right: 12px;
  }

  .course-side .teacher-intro .teacher-item dl dt img {
    width: 100%;
    height: 100%;
  }

  .course-side .teacher-intro .teacher-item dl dd {
    -ms-flex: 1;
    flex: 1;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }

  .course-side .teacher-intro .teacher-item dl dd p {
    font-size: 16px;
    color: #4a4a4a;
    margin-bottom: 4px;
  }

  .course-side .teacher-intro .teacher-item dl dd span {
    font-size: 13px;
    color: #9d9d9d;
  }

  .course-side .teacher-intro .teacher-item article {
    width: 100%;
    font-size: 14px;
    color: #5e5e5e;
    line-height: 26px;
  }
  .box {
    margin-left: 10%;
  }

  .box .box-banner {
    width: 100%;
    height: 288px;
    color: #fff;
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .box-banner .bg {
    width: 1920px;
    height: 100%;
    position: absolute;
    left: 50%;
    top: 0;
    margin-left: -960px;
    z-index: 1;
  }

  .box .box-banner .bc {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
  }

  .box .box-banner h1 {
    font-size: 40px;
    font-weight: 400;
    z-index: 2;
    margin-top: 67px;
  }

  .box .box-banner p {
    font-size: 16px;
    font-weight: 500;
    margin-top: 10px;
    z-index: 2;
  }

  .box .box-data {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    width: 1200px;
    height: 134px;
    background: #fff;
    box-shadow: 0 8px 16px 0 rgba(28, 31, 33, .1);
    border-radius: 18px;
    margin-top: -67px;
    z-index: 999999;
    padding: 0 45px 0 55px;
    box-sizing: border-box;
    justify-content: space-between;
  }

  .box .box-data ul {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .box-data ul li {
    text-align: center;
    color: #4a4a4a;
  }

  .box .box-data ul li p {
    font-size: 28px;
    font-weight: 700;
  }

  .box .box-data ul li span {
    font-size: 16px;
  }

  .box .box-data ul i {
    margin-left: 48px;
    margin-right: 48px;
    display: inline-block;
    font-size: 16px;
    color: #5e5e5e;
  }

  .box .box-data button {
    width: 240px;
    height: 50px;
    background: #ffc210;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 500;
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

  .box .introduce {
    width: 1232px;
    height: 427px;
    margin-top: 20px;
    background: url(/static/images/juxing@2x.png) no-repeat;
    background-size: 100% 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    margin-bottom: 106px;
  }

  .box .introduce .left {
    margin-right: 42px;
    margin-top: 110px;
  }

  .box .introduce .left .img1 {
    width: 268px;
    height: 151px;
    margin-bottom: 22px;
    cursor: pointer;
  }

  .box .introduce .left p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    cursor: pointer;
  }

  .box .introduce .left p img {
    width: 26px;
    height: 26px;
    margin-right: 10px;
    transition: all .4s;
  }

  .box .introduce .right {
    margin-top: 101px;
    width: 681px;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    line-height: 30px;
  }

  .box .introduce .right p:first-of-type {
    margin-bottom: 30px;
  }

  .outline {
    -ms-flex: 1;
    flex: 1;
    width: 1200px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding-bottom: 56px;
    position: relative;
  }

  .outline .course-outline {
    width: 780px;
    margin-top: 32px;
  }

  .outline .course-outline .title {
    margin-bottom: 14px;
    padding-left: 17px;
    padding-right: 20px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    -ms-flex-pack: justify;
    justify-content: space-between;
    box-sizing: border-box;
  }

  .outline .course-outline .title .title-name {
    color: #000;
    font-size: 18px;
  }

  .outline .course-outline .title .title-side {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
  }

  .outline .course-outline .title .title-side .sp1 {
    color: #2a2a2a;
    margin-right: 39px;
    cursor: pointer;
  }

  .hide {
    display: none !important;
  }

  .outline .course-outline .title .title-side .num {
    min-width: 43px;
    text-align: right;
    color: #4a4a4a;
    display: inline-block;
  }

  .outline .course-outline .title .title-side .time {
    width: 80px;
    color: #4a4a4a;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .outline .course-outline .outline-list {
    width: 100%;
    height: auto;
  }

  .outline .course-outline .outline-list .list-data {
    width: 780px;
    height: auto;
    margin-bottom: 4px;
  }

  .outline .course-outline .outline-list .list-data .list-data-title {
    height: 48px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    background: #f9f9f9;
    padding-left: 26px;
    padding-right: 20px;
    border-radius: 2px;
    box-sizing: border-box;
    margin-bottom: 1px;
    cursor: pointer;
  }

  .outline .course-outline .outline-list .list-data .list-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .outline .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .hide {
    display: none !important;
  }

  .outline .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .outline .course-outline .outline-list .list-data .list-name p {
    width: 546px;
    font-size: 15px;
    color: #5e5e5e;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .outline .course-outline .outline-list .list-data .list-num {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .outline .course-outline .outline-list .list-data .list-num span:first-of-type {
    min-width: 43px;
    text-align: right;
    color: #4a4a4a;
    display: inline-block;
  }

  .outline .course-outline .outline-list .list-data .list-num span:nth-of-type(2) {
    width: 80px;
    color: #4a4a4a;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .outline .course-outline .outline-list .list-data .list-data-item {
    width: 100%;
    height: auto;
    margin-bottom: 6px;
    border-top: 1px solid rgba(0, 0, 0, .1);
  }

  .outline .course-outline .outline-list .list-data .list-data-item li {
    cursor: pointer;
    width: 100%;
    height: 48px;
    background: #fff;
    border-radius: 2px;
    border: 1px solid #e8e8e8;
    border-top: none;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding-left: 50px;
    padding-right: 20px;
    box-sizing: border-box;
    color: #6ca4c5;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-name img {
    width: 16px;
    height: 16px;
    margin-right: 9px;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-name .img2 {
    display: none;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-name p {
    width: 430px;
    font-size: 14px;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-num {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .outline .course-outline .outline-list .list-data .list-data-item li .data-item-num .time {
    width: 80px;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .outline .side-box {
    width: 374px;
    margin-top: 32px;
  }

  .outline .side-box .title {
    width: 100%;
    height: 60px;
    color: #000;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding-left: 20px;
    border-radius: 6px;
    font-size: 18px;
    background: #f9f9f9;
    box-shadow: 0 2px 4px 0 #f3f3f3;
    border: 1px solid #e8e8e8;
  }

  .outline .side-box .title img {
    width: 24px;
    height: 24px;
    margin-right: 8px;
  }

  .outline .side-box .title span {
    margin-top: 6px;
  }

  .outline .side-box .side-content {
    width: 100%;
    height: auto;
  }

  .outline .side-box .side-content section:first-of-type {
    padding: 16px 20px 30px;
  }

  .outline .side-box .side-content section {
    width: 100%;
    height: auto;
    margin-bottom: 12px;
    border-radius: 6px;
    padding: 30px 20px;
    box-sizing: border-box;
    background: #fff;
    box-shadow: 0 2px 4px 0 #f3f3f3;
    border: 1px solid #e8e8e8;
    position: relative;
  }

  .outline .side-box .side-content section .name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 16px;
    color: #4a4a4a;
    margin-bottom: 12px;
  }

  .outline .side-box .side-content section .name i {
    font-size: 24px;
    color: #ffc210;
    margin-right: 14px;
    display: inline-block;
    font-style: italic !important;
  }

  .outline .side-box .side-content section ul {
    width: 100%;
    margin-bottom: 16px;
  }

  .outline .side-box .side-content section .t-title {
    font-size: 13px;
    color: #235f82 !important;
    margin-bottom: 8px;
  }

  .outline .side-box .side-content section ul li {
    display: -ms-flexbox;
    display: flex;
    font-size: 14px;
    line-height: 26px;
    color: #5e5e5e;
  }

  .outline .side-box .side-content section ul li span {
    color: #235f82;
    font-size: 13px;
    margin-right: 5px;
    display: inline-block;
  }

  .outline .side-box .side-content section ul li p {
    -ms-flex: 1;
    flex: 1;
  }

  .outline .side-box .side-content section ul {
    width: 100%;
    margin-bottom: 16px;
  }

  .outline .side-box .side-content section .t-title {
    font-size: 13px;
    color: #235f82 !important;
    margin-bottom: 8px;
  }

  .outline .side-box .side-content section ul li {
    display: -ms-flexbox;
    display: flex;
    font-size: 14px;
    line-height: 26px;
    color: #5e5e5e;
  }

  .outline .side-box .side-content section ul li span {
    color: #235f82;
    font-size: 13px;
    margin-right: 5px;
    display: inline-block;
  }

  .outline .side-box .side-content section .left {
    left: 20px;
  }

  .outline .side-box .side-content section .foot {
    width: 11px;
    height: auto;
    position: absolute;
    bottom: -27px;
    z-index: 1;
  }

  .outline .side-box .side-content section .right {
    right: 20px;
  }

  .box .price-box {
    width: 1230px;
    height: 415px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    position: relative;
    color: #fff;
    margin-top: 86px;
    margin-bottom: 108px;
  }

  .box .price-box .bg {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    z-index: -1;
  }

  .box .price-box h1 {
    font-size: 36px;
    font-weight: 500;
    margin-top: 53px;
  }

  .box .price-box .jiage {
    width: 307px;
    margin-top: 32px;
    margin-bottom: 24px;
  }

  .box .price-box p {
    font-size: 16px;
    line-height: 28px;
    margin-bottom: 46px;
    text-align: center;
  }

  .box .price-box button:first-of-type {
    color: #fff;
    background: #ffc210;
    margin-right: 37px;
  }

  .box .price-box button {
    width: 207px;
    height: 47px;
    border-radius: 4px;
    font-size: 18px;
    font-weight: 500;
  }

  .box .price-box button:nth-of-type(2) {
    background: #fff;
    color: #f5a623;
    border: 1px solid #ffc210;
  }
</style>
