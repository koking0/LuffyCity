<template>
  <div class="course-intro">
    <div class="intro-top" style="background: rgb(88, 83, 83);">
      <router-link class="return active" :to="{name:'FreeLessons'}">
        <img src="/static/images/triangle@2x_1567043312.649715.png" alt="triangle">
        <span>返回免费课主页</span>
      </router-link>
      <div class="intro-data">
        <h1>{{courseDetail.title}}</h1>
        <p>
          <span>时长：{{courseDetail.hours}}小时</span>
          <span>{{courseDetail.studyNumber}}人在学</span>
        </p>
      </div>
    </div>
    <div class="course-intro-item">
      <div class="intro-content">
        <div class="course-item-box">
          <div class="content-item">
            <div class="title">介绍</div>
            <article>
              {{courseDetail.brief}}
            </article>
            <div class="title">你将会学到的</div>
            <ul>
              <li v-for="item in courseDetail.get" :key="item.id">
                <img src="/static/images/dui@2x_1567043311.9183662.png" alt="dui">
                <p>{{item.title}}</p>
              </li>
            </ul>
          </div>
          <div class="course-outline">
            <div class="title">
              <p class="title-name">课程大纲</p>
            </div>
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
        </div>
      </div>
      <div class="course-side">
        <div class="side-video">
          <div class="video-box">
            <img alt="" :src="courseDetail.courseImage">
          </div>
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
                <p>学员交流<br>QQ群：701031800</p>
              </li>
              <li>
                <img style="width: 18px;height: 18px" src="/static/images/answer.png" alt="answer">
                <p>导师答疑</p>
              </li>
            </ul>
            <p class="btns start-study">开始学习</p>
            <a class="btns add-team" href="https://jq.qq.com/?_wv=1027&amp;k=5XfBMXm" target="_blank">加入学霸团</a>
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
            <article>
              {{courseDetail.teacher.brief}}
            </article>
          </div>
          <div class="study-route">
            <div class="title">学习路径</div>
            <div class="route-item">
              <section>
                <p class="leave">初级</p>
                <ul>
                  <span class="pipe">
                    <i></i>
                  </span>
                  <a style="cursor: pointer;" href="#" target="_blank">Python开发21天入门</a>
                  <a style="cursor: pointer;" href="#" target="_blank">Python常用模块</a>
                  <a style="cursor: pointer;" href="#" target="_blank">面向对象编程</a>
                </ul>
              </section>
              <section>
                <p class="leave">中级</p>
                <ul>
                  <span class="pipe"><i></i></span>
                  <a style="cursor: pointer;" href="#" target="_blank">网络编程入门&amp;FTP服务开发实战</a>
                  <a style="cursor: pointer;" href="#" target="_blank">Mysql数据库从入门至进阶</a>
                  <a style="cursor: pointer;" href="#" target="_blank">Django开发实战</a>
                  <a style="cursor: pointer;" href="#" target="_blank">CRM客户关系管理系统实战开发</a>
                  <a style="cursor: pointer;" href="#" target="_blank">爬虫开发实战</a>
                </ul>
              </section>
              <section>
                <p class="leave">高级</p>
                <ul>
                  <span class="pipe"><i></i></span>
                  <a style="cursor: pointer;" href="#" target="_blank">程序员必备算法&amp;数据结构</a>
                  <a style="cursor: pointer;" href="#" target="_blank">Python数据分析与机器学习实战</a>
                </ul>
              </section>
              <section>
                <p class="leave">就业班</p>
                <ul><span class="pipe"><i></i></span>
                  <a style="cursor: pointer;" href="#" target="_blank">Python全栈开发</a>
                </ul>
              </section>
            </div>
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
        courseDetail: {},
      }
    },
    components: {
      Video,
    },
    created() {
      this.$http.courseDetail(this.$route.params.detailId).then(res => {
        res.courseImage = `http://127.0.0.1:8000/${res.courseImage}`;
        res.teacher.avatar = `http://127.0.0.1:8000/media/${res.teacher.avatar}`;
        this.courseDetail = res;
      }).catch(err => {
        console.log(err);
      })
    },
  }
</script>

<style scoped>
  .course-intro .intro-top, .course-intro {
    width: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-intro .intro-top {
    height: 300px;
    position: relative;
  }

  .course-intro .intro-top .return {
    color: #fff;
    width: 1200px;
    font-size: 16px;
    font-weight: 500;
    margin-top: 30px;
    margin-bottom: 38px;
    display: -ms-flexbox;
    display: flex;
    cursor: pointer;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-intro .intro-top .return img {
    width: 6px;
    height: 11px;
    margin-right: 6px;
  }

  .course-intro .intro-top .intro-data {
    width: 1200px;
    padding-left: 23px;
    margin-top: 20px;
  }

  .course-intro .intro-top .intro-data h1 {
    width: 780px;
    font-size: 36px;
    color: #fff;
    font-weight: 400;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .course-intro .intro-top .intro-data p {
    width: 780px;
    color: #fff;
    font-size: 16px;
    margin-top: 8px;
  }

  .course-intro .intro-top .intro-data p span {
    margin-right: 26px;
  }

  .course-intro .intro-top .course-nav {
    width: 100%;
    height: 72px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-direction: column;
    flex-direction: column;
    position: absolute;
    left: 0;
    top: 228px;
  }

  .course-intro .intro-top .course-nav ul {
    width: 1200px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding-left: 23px;
    box-sizing: border-box;
  }

  .course-intro .intro-top .course-nav ul li {
    font-size: 16px;
    color: #e9e9e9;
    margin-top: 34px;
    margin-right: 26px;
    display: -ms-flexbox;
    display: flex;
    cursor: pointer;
    box-sizing: border-box;
  }

  .course-intro .intro-top .course-nav ul .this {
    color: #fff;
    font-weight: 500;
  }

  .course-intro .intro-top .course-nav ul .this p {
    box-shadow: 0 2px 0 0 #fff;
  }

  .course-intro .intro-top .course-nav ul li p, .course-intro .intro-top .course-nav ul li span {
    padding-bottom: 4px;
  }

  .course-intro .course-intro-item {
    width: 1200px;
    margin-top: 24px;
  }

  .course-intro .course-intro-item .intro-content {
    width: 780px;
    float: left;
  }

  .course-intro .course-intro-item .intro-content .course-item-box {
    width: 100%;
    height: auto;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item {
    width: 100%;
    height: auto;
    border-radius: 4px;
    padding: 30px 20px 15px;
    background: #f3f3f3;
    box-sizing: border-box;
    box-shadow: 0 2px 4px 0 #f3f3f3;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item .title {
    color: #000;
    font-size: 22px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item article {
    font-size: 14px;
    color: #5e5e5e;
    margin-top: 10px;
    line-height: 28px;
    margin-bottom: 50px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item .title {
    color: #000;
    font-size: 22px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item ul {
    width: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-top: 17px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-right: 37px;
    margin-bottom: 15px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item ul li img {
    width: 18px;
    height: 18px;
    margin-right: 12px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .content-item ul li p {
    width: 303px;
    font-size: 14px;
    color: #5e5e5e;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline {
    width: 100%;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title {
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

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title .title-name {
    color: #000;
    font-size: 22px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title .title-side {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title .title-side span:first-of-type {
    color: #2a2a2a;
    margin-right: 39px;
    cursor: pointer;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title .title-side span:nth-of-type(2) {
    min-width: 43px;
    text-align: right;
    color: #4a4a4a;
    display: inline-block;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .title .title-side span:nth-of-type(3) {
    width: 80px;
    color: #4a4a4a;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list {
    width: 100%;
    height: auto;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data {
    width: 780px;
    height: auto;
    margin-bottom: 2px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-title {
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

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-name img {
    width: 10px;
    height: auto;
    margin-right: 15px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-name p {
    width: 546px;
    font-size: 15px;
    color: #5e5e5e;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item {
    width: 100%;
    height: auto;
    margin-bottom: 4px;
    border-top: 1px solid #dadada;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li {
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

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-name img {
    width: 16px;
    height: 16px;
    margin-right: 9px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-name .img2 {
    display: none;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-name p {
    width: 430px;
    font-size: 14px;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-num .type {
    min-width: 43px;
    text-align: right;
    display: inline-block;
  }

  .course-intro .course-intro-item .intro-content .course-item-box .course-outline .outline-list .list-data .list-data-item li .data-item-num .time {
    width: 80px;
    margin-left: 17px;
    text-align: right;
    display: inline-block;
  }

  .course-intro .course-intro-item .course-side {
    width: 374px;
    height: auto;
    margin-top: -260px;
    float: right;
    z-index: 2;
    position: relative;
  }

  .course-intro .course-intro-item .course-side .side-video {
    width: 100%;
    height: auto;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0 2px 4px 0 #f3f3f3;
    border: 1px solid #e8e8e8;
  }

  .course-intro .course-intro-item .course-side .side-video .video-box {
    width: 100%;
    height: auto;
    position: relative;
    padding: 5px 4px 27px;
    box-sizing: border-box;
    cursor: pointer;
  }

  .course-intro .course-intro-item .course-side .side-video .video-box img {
    width: 100%;
    height: auto;
  }

  .course-intro .course-intro-item .course-side .side-video .video-box p {
    width: 104px;
    height: 104px;
    border-radius: 100%;
    background: hsla(0, 0%, 100%, .2);
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -52px;
    margin-top: -62px;
    text-align: center;
    line-height: 104px;
  }

  .course-intro .course-intro-item .course-side .side-video .video-box p img {
    width: 46px;
    height: 46px;
    margin-left: 20px;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower {
    padding: 0 31px 30px;
    box-sizing: border-box;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower .title {
    color: #000;
    font-size: 15px;
    font-weight: 400;
    margin-bottom: 20px;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower ul {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower ul li:first-of-type, .course-intro .course-intro-item .course-side .side-video .student-prower ul li:nth-of-type(2) {
    margin-bottom: 18px;
    width: 147px;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower ul li img {
    margin-right: 9px;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower ul li p {
    width: 120px;
    font-size: 12px;
    color: #4a4a4a;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    float: right;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower .start-study {
    color: #fff;
    margin-top: 27px;
    margin-bottom: 12px;
    background: #ffc210;
  }

  .course-intro .course-intro-item .course-side .side-video .student-prower .btns {
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

  .course-intro .course-intro-item .course-side .side-video .student-prower .add-team {
    color: #f5a623;
    border: 1px solid #f5a623;
    box-sizing: border-box;
  }

  .course-intro .course-intro-item .course-side .teacher-intro {
    width: 100%;
    height: auto;
    border-radius: 6px;
    box-shadow: 0 2px 4px 0 #f3f3f3;
    border: 1px solid #e8e8e8;
    margin-top: 18px;
    padding: 30px 31px;
    box-sizing: border-box;
    background: #fff;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item {
    width: 100%;
    padding-bottom: 24px;
    border-bottom: 1px dashed #d0d0d0;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item .title {
    color: #000;
    font-size: 15px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl {
    width: 100%;
    margin-top: 12px;
    margin-bottom: 4px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl dt {
    width: 60px;
    height: 60px;
    border: 1px solid #d0d0d0;
    box-sizing: border-box;
    border-radius: 100%;
    overflow: hidden;
    margin-right: 12px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl dt img {
    width: 100%;
    height: 100%;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl dd {
    -ms-flex: 1;
    flex: 1;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl dd p {
    font-size: 16px;
    color: #4a4a4a;
    margin-bottom: 4px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item dl dd span {
    font-size: 13px;
    color: #9d9d9d;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .teacher-item article {
    width: 100%;
    font-size: 14px;
    color: #5e5e5e;
    line-height: 26px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route {
    width: 100%;
    height: auto;
    margin-top: 30px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .title {
    font-size: 15px;
    color: #4a4a4a;
    margin-bottom: 23px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item {
    width: 100%;
    box-sizing: border-box;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item section {
    width: 100%;
    display: flex;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item section .leave {
    width: 44px;
    white-space: nowrap;
    font-size: 14px;
    color: #9d9d9d;
    text-align: right;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item section ul {
    -ms-flex: 1;
    flex: 1;
    padding-bottom: 14px;
    position: relative;
    margin-left: 17px;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item section ul .pipe {
    position: absolute;
    left: 0;
    top: 6px;
    width: 1px;
    height: 100%;
    display: inline-block;
    border: .5px dashed #ffc6a0;
    box-sizing: border-box;
  }

  .course-intro .course-intro-item .course-side .teacher-intro .study-route .route-item section ul a {
    display: inline-block;
    text-decoration: none;
    width: 100%;
    font-size: 14px;
    padding-left: 27px;
    color: #5e5e5e;
    margin-bottom: 10px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    cursor: pointer;
  }

  .beyond {
    overflow-y: scroll !important;
    -ms-flex-pack: start !important;
    justify-content: flex-start !important;
    padding-top: 20px;
    padding-bottom: 20px;
  }

  .preview-video .content {
    width: 732px;
    height: auto;
    background: #000;
  }

  .preview-video .content .title {
    width: 100%;
    height: 68px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    background: #29303b;
    padding-left: 20px;
    padding-right: 20px;
  }

  .preview-video .content .title h1 {
    font-weight: 400;
    width: 600px;
    color: #fff;
    font-size: 18px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .preview-video .content .title .close {
    width: 20px;
    height: 20px;
  }

  .preview-video .content .title .close img {
    width: 100%;
    height: 100%;
    cursor: pointer;
  }

  .preview-video .content .video {
    width: 100%;
    height: 460px;
    background: #000;
  }

  .preview-video .content ul {
    width: 100%;
    height: auto;
  }

  .preview-video .content ul li {
    height: 98px;
    padding: 10px 20px;
    box-sizing: border-box;
    background: #29303b;
    color: #e9e9e9;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    cursor: pointer;
    border-bottom: 1px solid #686f7a;
  }

  .preview-video .content ul li img:first-of-type {
    width: 139px;
    height: 78px;
    margin-right: 20px;
  }

  .preview-video .content ul li img:nth-of-type(2) {
    width: 16px;
    height: 16px;
    margin-right: 10px;
  }
</style>
