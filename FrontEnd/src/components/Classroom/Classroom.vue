<template>
  <div class="studyHome">
    <main>
      <div class="study-head">
        <ul class="study-data">
          <li>
            <img src="/static/images/study-icon1.svg" alt="study-icon1">
            <p>
              <span>今日/累计学习（课时）</span><b>0/1620</b>
            </p>
          </li>
          <li>
            <img src="/static/images/study-icon2.svg" alt="study-icon2">
            <p>
              <span>可挑战奖学金余额（贝里）</span><b>0</b>
            </p>
          </li>
          <li>
            <img src="/static/images/study-icon3.svg" alt="study-icon3">
            <p>
              <span>作业平均成绩（分）</span><b>84.42</b><br>
              <a href="#">查看作业成绩</a>
            </p>
          </li>
          <li>
            <img src="/static/images/study-icon4.svg" alt="study-icon4">
            <p>
              <span>已获得奖学金余额（贝里）</span><b>4345</b><br>
              <a href="#">查看奖惩详情</a>
            </p>
          </li>
        </ul>
        <div class="dashboard">
          <div class="mentor">
            <p class="time">
              <img src="/static/images/study-icon5_1564141054.0534444.svg" alt="study-icon5">
              <span>紧急快速提问：2小时内响应</span>
              <a>如果2小时后您的导师没有响应，将有别的导师为您服务！</a>
            </p>
            <div class="teacher">
              <img src="/static/images/study-head_1564141053.5894575.svg" alt="study-head">
              <p class="name">我的导师:<span>M组-冯国富</span></p>
              <p class="service">服务时间 09:00-21:00 工作日</p>
              <button>
                <img src="/static/images/study-icon6_1564141054.279604.svg" alt="study-icon6">
                <span>立即提问</span>
              </button>
              <p class="asof">服务截止 2020-06-12</p>
            </div>
          </div>
        </div>
      </div>
      <nav>
        <p class="color active">就业班课程</p>
      </nav>
      <div>
        <div>
          <div class="degree">
            <div class="box">
              <section class="module">
                <p class="num">
                  <img src="/static/images/angle-of.svg" alt="angle">
                  <span>第九模块</span>
                </p>
                <p class="name">项目实战二(vue &amp; 路飞学城开发)</p>
                <p class="tips">建议时长·29天&nbsp;&nbsp;已学5天</p>
                <p class="theprogress">课时观看进度：<span>95 / 188</span></p>
                <p class="function">
                  <span>
                    <a>查看章节</a>
                    <a>模块作业</a>
                  </span>
                  <button><span>继续学习</span></button>
                </p>
                <img src="/static/images/angle-of.svg" alt="angle-of" style="display: none;">
                <span class="status gray" style="display: none;">未开通</span>
                <span class="status green">正在学</span>
              </section>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
  export default {
    name: "Classroom",
    data() {
      return {
        courseSection: [],
      }
    },
    methods: {
      getCourse() {
        this.$http.classroomCourseList().then(res => {
          console.log(res);
          this.courseSection = res.data;
        }).catch(err => {
          console.log(err);
        })
      },
    },
    created() {
      this.getCourse();
    }
  }
</script>

<style scoped>
  .studyHome {
    -ms-flex: 1;
    flex: 1;
    width: 100%;
    background: #fafafa;
  }

  .studyHome main {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    overflow: hidden;
  }

  .studyHome main .study-head {
    width: 100%;
    height: 255px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    margin-top: 30px;
    margin-bottom: 30px;
  }

  .studyHome main .study-head .study-data {
    width: 789px;
    height: 255px;
    background: #fff;
    box-shadow: 0 4px 8px 0 #e8e8e8;
    border-radius: 3px;
    margin-right: 20px;
    top: 20px;
    padding-left: 40px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .studyHome main .study-head .study-data li p a {
    text-decoration: none;
    font-size: 14px;
    color: #4a90e2;
    margin-top: 8px;
    cursor: pointer;
  }

  .studyHome main .study-head .study-data li {
    width: 50%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .studyHome main .study-head .study-data li img {
    width: 38px;
    height: auto;
    margin-right: 25px;
  }

  .studyHome main .study-head .study-data li p span {
    font-size: 14px;
    color: #666;
    margin-bottom: 8px;
  }

  .studyHome main .study-head .study-data li span {
    display: block;
  }

  .studyHome main .study-head .study-data li p b {
    font-weight: 400;
    font-size: 24px;
    color: #4a4a4a;
  }

  .studyHome main .study-head .dashboard {
    width: 390px;
    height: 255px;
    background: #fff;
    box-shadow: 0 4px 8px 0 #e8e8e8;
    border-radius: 4px;
    position: relative;
  }

  .studyHome main .study-head .mentor {
    padding: 15px 10px;
    text-align: center;
  }

  .studyHome main .study-head .mentor .time {
    padding-bottom: 10px;
    border-bottom: 1px dashed #e8e8e8;
    font-size: 13px;
    color: #5e5e5e;
    margin-bottom: 8px;
    text-align: center;
  }

  .studyHome main .study-head .mentor .time img {
    width: 24px;
    height: 24px;
    margin-right: 8px;
  }

  .studyHome main .study-head .mentor .time span {
    color: #fa6240;
  }

  .studyHome main .study-head .mentor .time a {
    text-decoration: none;
    display: block;
    color: #5e5e5e;
  }

  .studyHome main .study-head .mentor .teacher img {
    width: 45px;
    height: 45px;
    margin-bottom: 8px;
  }

  .studyHome main .study-head .mentor .teacher .name {

    font-size: 14px;
    color: #4a4a4a;
  }

  .studyHome main .study-head .mentor .teacher .service {
    font-size: 14px;
    color: #4a4a4a;
    margin-top: 6px;
    margin-bottom: 11px;

  }

  .studyHome main .study-head .mentor .teacher button {
    width: 132px;
    height: 32px;
    color: #fff;
    font-size: 14px;
    border-radius: 4px;
    background: #4bb6db;
    line-height: 32px;

  }

  button {
    outline: none;
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .studyHome main .study-head .mentor .teacher button img {
    width: 16px;
    height: auto;
    margin-right: 55px;
    margin-top: 10px;
  }

  .studyHome main .study-head .mentor .teacher button span {
    position: absolute;
    top: 190px;
    right: 145px;
  }

  .studyHome main .study-head .mentor .teacher img {
    width: 45px;
    height: 45px;
    margin-bottom: 8px;
  }

  .studyHome main .study-head .mentor .teacher .asof {
    font-size: 12px;
    color: #9d9d9d;
  }

  .studyHome main nav {
    width: 100%;
    height: 74px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    background: #fff;
    padding-left: 28px;
    border-bottom: 1px solid #000;
    border-bottom-color: rgba(0, 0, 0, .05);
    position: relative;
  }

  .studyHome main nav .color {
    color: #ffc210;
    border-bottom: 2px solid #ffc210;
  }

  .studyHome main nav p {
    height: 74px;
    text-align: center;
    font-size: 18px;
    color: #000;
    padding: 0 10px;
    line-height: 74px;
    margin-right: 60px;
    cursor: pointer;
  }

  .studyHome main nav p {
    height: 74px;
    text-align: center;
    font-size: 18px;
    color: #000;
    padding: 0 10px;
    line-height: 74px;
    margin-right: 60px;
    cursor: pointer;
  }

  .degree {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    overflow: hidden;
    position: relative;
  }

  .degree .options_tab .time {
    padding-top: 30px;
    padding-bottom: 20px;
    padding-left: 28px;
    font-size: 16px;
    color: #9d9d9d;
    margin-bottom: 20px;
  }

  .degree .options_tab .time span {
    font-size: 16px;
    color: #5e5e5e;
  }

  .degree .options_tab .name {
    padding-left: 20px;
    padding-right: 20px;
    box-sizing: border-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .degree .options_tab .name .this {
    border: 1px solid #ffc210;
    color: #ffc210;
  }

  .degree .options_tab .name li {
    cursor: pointer;
    padding: 5px 10px;
    border: 1px solid #dadada;
    border-radius: 4px;
    margin-right: 25px;
    margin-bottom: 30px;
  }

  .degree .box {
    overflow: hidden;
    padding-left: 5px;
    padding-top: 13px;
  }

  .degree .box section {
    float: left;
    width: 350px;
    height: auto;
    border-radius: 3px;
    margin-right: 72px;
    margin-bottom: 50px;
    padding: 37px 18px 18px;
    background: #fff;
    cursor: pointer;
    position: relative;
    box-shadow: 0 2px 4px 0 #d0d0d0;
    transition: all .2s linear;
  }

  .degree .box section:nth-of-type(3n) {
    margin-right: 0;
  }

  .degree .box section .num {
    width: 60px;
    height: 30px;
    text-align: center;
    position: absolute;
    left: -5px;
    top: -10px;
  }

  .degree .box section .num img {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
  }

  .degree .box section .num span {
    color: #fff;
    font-size: 12px;
    position: absolute;
    left: 5px;
    top: 3px;
  }

  .degree .box section .name {
    width: 270px;
    font-size: 18px;
    color: #4a4a4a;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    padding-bottom: 14px;
  }

  .degree .box section .tips {
    font-size: 13px;
    color: #666;
    padding-bottom: 7px;
  }

  .degree .box section .theprogress {
    font-size: 13px;
    color: #666;
    padding-bottom: 20px;
  }

  .degree .box section .theprogress span:first-child {
    color: #4a90e2;
  }

  .degree .box section .function {
    font-size: 12px;
    color: #4a90e2;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .degree .box section .function span a {
    color: #4a90e2;
    cursor: pointer;
    margin-right: 18px;
    text-decoration: none;
  }

  .degree .box section .function button {
    width: 76px;
    height: 28px;
    font-size: 12px;
    color: #4a90e2;
    line-height: 28px;
    border-radius: 2px;
    border: 1px solid #4a90e2;
  }

  .degree .box section .overdue, .degree .box section .through {
    width: 64px;
    height: auto;
    position: absolute;
    top: 0;
    right: 18px;
  }

  .degree .box section .gray {
    color: #9b9b9b;
  }

  .degree .box section .status {
    font-size: 14px;
    color: #9d9d9d;
    position: absolute;
    top: 10px;
    right: 18px;
  }

  .degree .box section .green {
    color: #ffc210;
  }

  .degree .box section .status {
    font-size: 14px;
    color: #9d9d9d;
    position: absolute;
    top: 10px;
    right: 18px;
  }
</style>
