<template>
  <div class="courseitem">
    <div class="head-wrap">
      <div class="head-video">
        <img :src="courseDetail.courseImage" alt="image">
        <div class="item" style="padding-top: 120px;">
          <p class="name">{{courseDetail.title}}</p>
          <p class="data">
            <span>{{courseDetail.studyNumber}}人在学</span>
            <span>课程小节：{{courseDetail.number}}小节</span>
            <span>时长：{{courseDetail.hours}}小时</span>
          </p>
          <p class="price bac preferential">
            <span>限时折扣</span>
            <span>活动价</span>
            <span class="sp1">¥{{courseDetail.price}}</span>
            <span class="sp2">¥1{{courseDetail.price}}</span>
          </p>
          <div v-if="!courseDetail.isBuy" class="bottom">
            <p class="btns">
              <button class="btn1" @click="addShopCart">立即购买</button>
              <button class="btn2">免费试学</button>
            </p>
            <p v-if="!courseDetail.isBuy" class="add" @click="addShopCart">
              <img src="/static/images/course-shop_1564141044.099814.svg" alt="course-shop">
              <span>加入购物车</span>
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="tab">
      <ul>
        <li class="this active">课程大纲 <span>(试学)</span></li>
      </ul>
    </div>
    <div class="item"
         style="flex: 1; background: #FAFAFA;overflow:hidden;padding-bottom: 40px">
      <div class="course-outline">
        <ul class="outline-list">
          <li v-for="(item, _) in courseDetail.chapter" class="list-data" :key="item.id">
            <div class="list-data-title">
              <div class="list-name">
                <img src="/static/images/jiahao@2x_1567043312.082176.png" alt="加号">
                <img src="/static/images/jiahaobak@2x_1567043312.1160207.png" alt="减号">
                <p>{{item.title}}</p>
              </div>
            </div>
            <ul class="list-data-item">
              <li v-for="(section, _) in item.section" :class="{preview:section.freeTrail}"
                  :key="section.id" data-toggle="modal" data-target="#videoModal">
                <div class="data-item-name">
                  <img class="img1" src="/static/images/bofang@2x_1567043311.5421314.png" alt="播放按钮">
                  <p>{{section.name}}</p>
                </div>
                <div class="data-item-num">
                  <span v-if="section.freeTrail" class="type">预览</span>
                </div>
              </li>
            </ul>
          </li>
        </ul>
        <Video/>
      </div>
      <div class="course-side">
        <div class="side-video">
          <div class="student-prower">
            <div class="title">学霸团专属权益</div>
            <ul>
              <li>
                <img style="width: 18px;height: 20px" src="/static/images/ziliao.png" alt="ziliao">
                <p>课件下载</p>
              </li>
              <li>
                <img style="width: 17px;height: 17px" src="/static/images/gongkaike.png" alt="gongkaike">
                <p>定期公开课</p>
              </li>
              <li>
                <img style="width: 21px;height: 18px" src="/static/images/jiaoliu.png" alt="jiaoliu">
                <p>学员交流<br>QQ群：{{courseDetail.qqGroup}}</p>
              </li>
              <li>
                <img style="width: 18px;height: 18px" src="/static/images/answer.png" alt="answer">
                <p>导师答疑</p>
              </li>
            </ul>
            <a class="btns add-team" target="_blank" href="https://jq.qq.com/?_wv=1027&amp;k=5XfBMXm">加入学霸团</a>
          </div>
        </div>
        <div class="teacher-intro">
          <div class="teacher-item">
            <div class="title">讲师介绍</div>
            <dl>
              <dt>
                <img alt="" :src="courseDetail.teacher.avatar">
              </dt>
              <dd>
                <p>{{courseDetail.teacher.name}}</p>
              </dd>
            </dl>
            <article>{{courseDetail.teacher.brief}}</article>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Video from "../Common/Video";

  export default {
    name: "CourseDetail",
    data() {
      return {
        // 课程详情数据
        courseDetail: [],
      }
    },
    components: {
      Video,
    },
    methods: {
      // 加入购物车
      addShopCart() {
        if (window.localStorage.getItem('access_token')) {
          let goodsInfo = {
            courseId: this.$route.params.detailId,
            token: localStorage.getItem('access_token')
          };
          this.$http.shopCart(goodsInfo).then(res => {
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
      getCourseDetail() {
        this.$http.practicalCourseDetail(this.$route.params.detailId).then(res => {
          res.teacher.avatar = `http://127.0.0.1:8000/media/${res.teacher.avatar}`;
          res.courseImage = `http://127.0.0.1:8000/${res.courseImage}`;
          console.log(res);
          this.courseDetail = res;
        }).catch(err => {
          console.log(err);
        });
      }
    },
    created() {
      this.getCourseDetail();
    }
  }
</script>

<style scoped>
  .course-outline {
    width: 780px;
    float: left;
  }

  .course-outline .title {
    margin-top: 50px;
    margin-bottom: 13px;
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

  .course-outline .title .title-name {
    color: #000;
    font-size: 22px;
  }

  .course-outline .title .title-side {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
  }

  .course-outline .title .title-side span:first-of-type {
    color: #2a2a2a;
    margin-right: 39px;
    cursor: pointer;
  }

  .course-outline .title .title-side span:nth-of-type(2) {
    min-width: 43px;
    text-align: right;
    color: #4a4a4a;
    display: inline-block;
  }

  .course-outline .title .title-side span:nth-of-type(3) {
    width: 80px;
    color: #4a4a4a;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .course-outline .outline-list {
    width: 100%;
    height: auto;
  }

  .course-outline .outline-list .list-data {
    width: 780px;
    height: auto;
    margin-bottom: 2px;
  }

  .course-outline .outline-list .list-data .list-data-title {
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

  .course-outline .outline-list .list-data .list-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .course-outline .outline-list .list-data .list-name p {
    width: 546px;
    font-size: 15px;
    color: #5e5e5e;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .course-outline .outline-list .list-data .list-data-item {
    width: 100%;
    height: auto;
    margin-bottom: 4px;
    border-top: 1px solid #dadada;
  }

  .course-outline .outline-list .list-data .list-data-item li {
    cursor: pointer;
    width: 100%;
    height: 48px;
    background: #fff;
    border-radius: 2px;
    border: 1px solid #dadada;
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

  .course-outline .outline-list .list-data .list-data-item li .data-item-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-outline .outline-list .list-data .list-data-item li .data-item-name img {
    width: 16px;
    height: 16px;
    margin-right: 9px;
  }

  .course-outline .outline-list .list-data .list-data-item li .data-item-name .img2 {
    display: none;
  }

  .course-outline .outline-list .list-data .list-data-item li .data-item-name p {
    width: 430px;
    font-size: 14px;
  }

  .course-outline .outline-list .list-data .list-data-item li .data-item-num .type {
    min-width: 43px;
    text-align: right;
    display: inline-block;
  }

  .course-outline .outline-list .list-data .list-data-item li .data-item-num .time {
    width: 80px;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }
  .courseitem {
    -ms-flex: 1;
    flex: 1;
    width: 100%;
    background: #fafafa;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
  }

  .courseitem .head-wrap {
    width: 100%;
    height: auto;
    background: #fff;
    padding-top: 30px;
  }

  .courseitem .head-wrap .head-video {
    width: 1200px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    margin: 0 auto;
  }

  .prism-player .prism-ErrorMessage .prism-error-content p {
    text-align: center;
    font-size: 12px;
    color: #fff;
  }

  .prism-player .prism-ErrorMessage .prism-error-operation a {
    width: 80px;
    height: 32px;
    line-height: 32px;
    vertical-align: top;
    display: inline-block;
    margin-left: 10px;
  }

  .head-video img {
    width: 690px;
    height: 388px;
  }

  .prism-player .prism-ErrorMessage .prism-detect-info p {
    padding: 0 5px;
    word-break: break-all;
    margin: 0 0 4px;
  }

  .prism-player .prism-thumbnail span {
    font-size: 12px;
    color: #fff;
    line-height: 20px;
    background: rgba(0, 0, 0, .8);
    text-align: center;
    text-shadow: 1px 1px 4px #373d41;
    padding-left: 5px;
    padding-right: 5px;
    display: inline-block;
    position: absolute;
    bottom: 0;
    left: 33%;
  }

  .prism-player .prism-liveshift-progress .prism-progress-cursor img, .prism-player .prism-progress .prism-progress-cursor img {
    width: 14px;
    height: 14px;
    position: absolute;
    top: 50%;
    left: 50%;
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
  }

  .rate-list li {
    text-align: center;
    width: 70px;
    line-height: 30px;
    background-color: rgba(0, 0, 0, 0.6);
    cursor: pointer;
  }

  .rate-list li + li {
    border-top: 1px solid rgba(78, 78, 78, 0.3);
  }

  .courseitem .head-wrap .head-video .item {
    -ms-flex: 1;
    flex: 1;
    background: #fff;
    position: relative;
  }

  .courseitem .head-wrap .head-video .item .name {
    font-size: 20px;
    color: #333;
    padding: 10px 23px;
  }

  .courseitem .head-wrap .head-video .item .data {
    padding-left: 23px;
    padding-right: 23px;
    padding-bottom: 16px;
    font-size: 14px;
    color: #9b9b9b;
  }

  .courseitem .head-wrap .head-video .item .data span {
    margin-right: 20px;
  }

  .courseitem .head-wrap .head-video .item .preferential {
    width: 90%;
    height: 30px;
    background: #fa6240;
    font-size: 14px;
    color: #4a4a4a;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 10px 23px;
  }

  .courseitem .head-wrap .head-video .item .preferential p:first-of-type {
    font-size: 16px;
    color: #fff;
  }

  .courseitem .head-wrap .head-video .item .preferential p:nth-of-type(2) {
    font-size: 14px;
    color: #fff;
  }

  .courseitem .head-wrap .head-video .item .preferential p:nth-of-type(2) span {
    width: 24px;
    height: auto;
    display: inline-block;
    background: #fafafa;
    color: #5e5e5e;
    padding: 6px 0;
    text-align: center;
  }

  .courseitem .head-wrap .head-video .item .bac {
    background: #fff;
  }

  .courseitem .head-wrap .head-video .item .price {
    width: 90%;
    height: auto;
    background: #f9f1e7;
    font-size: 14px;
    color: #4a4a4a;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    padding: 10px 23px;
  }

  .courseitem .head-wrap .head-video .item .price .sp1 {
    font-size: 26px;
    color: #fa6240;
    margin-left: 10px;
    display: inline-block;
    margin-bottom: -5px;
  }

  .courseitem .head-wrap .head-video .item .price .sp2 {
    font-size: 14px;
    color: #9b9b9b;
    margin-left: 10px;
    text-decoration: line-through;
  }

  .courseitem .head-wrap .head-video .item .bottom .btns, .courseitem .head-wrap .head-video .item .bottom {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .courseitem .head-wrap .head-video .item .bottom {
    position: absolute;
    left: 0;
    top: 330px;
    width: 100%;
    height: auto;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding-left: 23px;
    padding-right: 23px;
  }

  .courseitem .head-wrap .head-video .item .bottom .btns, .courseitem .head-wrap .head-video .item .bottom {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .courseitem .head-wrap .head-video .item .bottom .btns button {
    width: 125px;
    height: 40px;
    background: #ffc210;
    border-radius: 4px;
    color: #fff;
    cursor: pointer;
    margin-right: 15px;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .courseitem .head-wrap .head-video .item .bottom .btns .btn2 {
    background: #fff;
    color: #ffc210;
    border: 1px solid #ffc210;
  }

  .courseitem .head-wrap .head-video .item .bottom .btns button {
    width: 125px;
    height: 40px;
    background: #ffc210;
    border-radius: 4px;
    color: #fff;
    cursor: pointer;
    margin-right: 15px;
  }

  .courseitem .head-wrap .head-video .item .bottom .add {
    font-size: 14px;
    color: #ffc210;
    margin-right: 50px;
    text-align: center;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    cursor: pointer;
  }

  .courseitem .head-wrap .head-video .item .bottom .add img {
    width: 20px;
    height: auto;
    margin-right: 7px;
  }

  .courseitem .tab ul {
    width: 1200px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin: 0 auto;
    color: #4a4a4a;
  }

  .courseitem .tab ul li {
    margin-right: 15px;
    padding: 26px 20px 16px;
    font-size: 17px;
    cursor: pointer;
  }

  .courseitem .this {
    color: #ffc210;
    border-bottom: 2px solid #ffc210;
  }

  .courseitem .tab ul li {
    margin-right: 15px;
    padding: 26px 20px 16px;
    font-size: 17px;
    cursor: pointer;
  }

  .courseitem .tab ul li span {
    color: #fb7c55;
  }

  .item {
    width: 1200px;
    height: auto;
    margin: 0 auto;
  }

  .item section[_v-5aa3986d] {
    width: 795px;
    height: auto;
    padding: 20px;
    background: #fff;
    border-radius: 6px;
    float: left;
    box-sizing: border-box;
    overflow: hidden;
    position: relative;
    box-shadow: 0 2px 4px 0 #f0f0f0;
  }

  .course-side {
    width: 374px;
    height: auto;
    float: right;
    z-index: 2;
    position: relative;
  }

  .course-side .side-video {
    width: 100%;
    height: auto;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0 2px 4px 0 #f0f0f0;
  }

  .course-side .side-video .student-prower {
    padding: 20px 30px;
    box-sizing: border-box;
  }

  .course-side .side-video .student-prower .title {
    color: #000;
    font-size: 15px;
    font-weight: 400;
    margin-bottom: 20px;
  }

  .course-side .side-video .student-prower ul {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .course-side .side-video .student-prower ul li:first-of-type, .course-side .side-video .student-prower ul li:nth-of-type(2) {
    margin-bottom: 18px;
  }

  .course-side .side-video .student-prower ul li {
    display: -ms-flexbox;
    display: flex;
    width: 45%;
    -ms-flex-align: center;
    align-items: center;
    margin-right: 14px;
    font-size: 12px;
  }

  .course-side .side-video .student-prower ul li img {
    margin-right: 9px;
  }

  .course-side .side-video .student-prower ul li:nth-of-type(2n) {
    margin-right: 0;
  }

  .course-side .side-video .student-prower ul li:nth-of-type(2) {
    margin-bottom: 18px;
  }

  .course-side .side-video .student-prower ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-right: 14px;
  }

  .course-side .side-video .student-prower ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-right: 14px;
  }

  .course-side .side-video .student-prower ul li:nth-of-type(2n) {
    margin-right: 0;
  }

  .course-side .side-video .student-prower .add-team {
    color: #f5a623;
    margin-top: 27px;
    margin-bottom: 12px;
    border: 1px solid #f5a623;
    box-sizing: border-box;
  }

  .course-side .side-video .student-prower .btns {
    width: 100%;
    height: 52px;
    line-height: 52px;
    border-radius: 2px;
    font-size: 18px;
    font-weight: 500;
    padding-left: 111px;
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    text-decoration: none;
  }

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

  .item section {
    width: 795px;
    height: auto;
    padding: 20px;
    background: #fff;
    border-radius: 6px;
    float: left;
    box-sizing: border-box;
    overflow: hidden;
    position: relative;
    box-shadow: 0 2px 4px 0 #f0f0f0;
  }
</style>
