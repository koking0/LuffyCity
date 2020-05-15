<template>
  <div class="box">
    <div class="employment-head">
      <div id="jsi-water-line-container" class="container">
        <canvas width="1423" height="520"></canvas>
      </div>
      <div class="head-content">
        <h1>名师授课 + 1V1辅导</h1>
        <p>业内领先的 “在线1V1辅导+闯关” 学习模式，提供逐行审阅代码、 1v1名企在职<br>导师辅导答疑、 推荐就业等服务</p>
        <button>了解1000+师兄的就业去向</button>
        <ul>
          <li>
            <span>10年线下培训经验</span>
            <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
          </li>
          <li>
            <span>100+位精英讲师</span>
            <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
          </li>
          <li>
            <span>20000+毕业学员验证</span>
            <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
          </li>
          <li>95.8%就业率保证</li>
        </ul>
      </div>
    </div>
    <div class="employment-course divtest sdiv on" data-animation="on">
      <div class="title">
        <h1 class="h1">正在开班学科</h1>
        <p class="p">网红讲师 + 在线1V1名企导师辅导 + 闯关学习，逐行审阅代码、视频1v1考核等服务，助你高薪就业</p>
      </div>
      <ul class="div-3">
        <li v-for="(item, index) in courseList" :key="item.id" @click="detailHandler(item.id)">
          <a>
            <img :src="item.courseImage" alt="AI">
            <div class="course-item">
              <p class="title">{{item.slogan}}</p>
              <div class="num">
                <p>
                  <span>学习周期：{{item.hours}}小时</span>
                </p>
                <p>
                  <img src="/static/images/bofang.png" alt="bofang">
                  <span>{{item.studyNumber}}人</span>
                </p>
              </div>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <div class="why-choose divtest sdiv on" data-animation="on">
      <div class="title">
        <h1 class="h1">为什么选择路飞就业班课程？</h1>
        <p class="p">
          <span>因学员一方面渴望成长，一方面又因时间限制无法来线下全日制学习，故我们将10年教学成果精心设计，汇聚整合到线上。<br>旨在帮助有志向的年轻人通过努力学习，获得体面的工作和生活。</span>
        </p>
      </div>
      <ul class="div-3">
        <li>
          <p>
            <img src="/static/images/salary@2x.png" alt="salary@2x">
            <span></span>
          </p>
          <p>总计毕业人数（人）</p>
        </li>
        <li>
          <p>
            <img src="/static/images/95@2x.png" alt="95@2x">
            <span></span>
          </p>
          <p>就业率</p>
        </li>
        <li>
          <p>
            <img src="/static/images/12369.png" alt="12369_1570514951">
            <span></span>
          </p>
          <p>平均薪资（元）</p>
        </li>
      </ul>
    </div>
    <div class="solve-problem divtest sdiv on" data-animation="on">
      <div class="title">
        <h1 class="h1">360°全方位陪伴式教学</h1>
      </div>
      <div class="problem-content div-2">
        <img src="/static/images/Combined%20Shape@2x.png" alt="Combined">
        <img src="/static/images/bianzu8@2x.png" alt="bianzu8">
      </div>
    </div>
    <div class="nanny divtest sdiv on" data-animation="on">
      <div class="title">
        <h1 class="h1">3V1保姆式伴学</h1>
      </div>
      <ul class="nanny-content1 div-2">
        <li>
          <img src="/static/images/acon@2x.png" alt="acon">
          <p>导师</p>
        </li>
        <img class="pipe" src="/static/images/arrow@2x.png" alt="arrow">
        <li>
          <p>1V1作业批改</p>
          <p>1V1问题答疑</p>
          <p>1V1闯关视频考核</p>
          <p>1V1每周跟进学习进度</p>
        </li>
        <img class="pipe" src="/static/images/arrow@2x.png" alt="arrow">
        <li>
          <span>导师批注案例展示</span>
          <img src="/static/images/13@2x.png" alt="13">
          <a>更多导师批注详情&gt;&gt;&gt;</a>
        </li>
      </ul>
      <ul class="nanny-content2 div-3">
        <li>
          <img src="/static/images/icon1@2x.png" alt="icon1">
          <span>班主任</span>
          <p> 全程带班跟踪督导，彻底治愈你的拖延症<br>定期跟进你的学习进度，360度暖心鼓励陪伴 </p>
        </li>
        <li>
          <img src="/static/images/icon2@2x.png" alt="icon2">
          <span>讲师</span>
          <p> 甄选业界知名网红讲师，带你吃透每一个核心<br>知识点，手把手带你做企业级实战项目 </p>
        </li>
        <li>
          <img src="/static/images/icon3@2x.png" alt="icon3">
          <span>就业指导老师</span>
          <p> 一对一简历修改，一对一模拟面试<br>就业推荐，试用期辅导 </p>
        </li>
      </ul>
    </div>
    <div class="problem divtest sdiv on" data-animation="on">
      <div class="title">
        <h1 class="h1">常见问题</h1>
      </div>
      <div class="problem-list div-2">
        <img src="/static/images/Combined%20Shape@2x(1).png" alt="Combined">
        <ul>
          <li>
            <p><i></i><span>什么是就业班课程？</span></p>
            <article>
              路飞学城就业班课程是业内优先推出“在线一对一VIP辅导”的全新教学模式的课程，通过为零基础的学员制定学习计划，提供系统性课程、一对一辅导、审阅代码、闯关式学习、答疑、推荐就业等服务，有效保障学员通过学习就业班课程后具备独立完成项目与企业所需的技术水准。
            </article>
          </li>
          <li><p><i></i><span>我是零基础小白，能够上就业班课程吗？</span></p>
            <article>
              可以，无论你是对全栈开发有着浓厚兴趣的小白，想成为一个优秀的全栈工程师，还是你已经是前端或者后端开发者，打算夯实基础，拓展知识，增加涨薪机会，这门课程都非常适合你，我们的课程内容深入浅出，课程涵盖各个难度等级，能适应所有不同程度的需求。
            </article>
          </li>
          <li><p><i></i><span>我可以从就业班课程中获得什么？</span></p>
            <article>
              路飞学城真人出境全新为在线学习录制的就业课程，可让你在家随时随地都能学习到专业系统的全栈开发课程，还提供1V1讲师辅导、闯关式学习、知名网红讲师亲自授课、多个互联网企业实战开发项目、完成课程后发放高薪就业班课程学位证书，可享受推荐就业服务。
            </article>
          </li>
          <li><p><i></i><span>如果作业和阶段考核不通过怎么办？</span></p>
            <article>作业和阶段考核是为了督促你能扎实的掌握知识，如果作业成绩和考核不通过，会有讲师进行1对1辅导，答疑，针对作业和考核出现的问题给出指导和建议。</article>
          </li>
          <li>
            <p><i></i> <span>课程的学习周期是多长呢？</span></p>
            <article>
              我们的课程学习周期为6个月，如果你按照建议每周学习至少 8~10 个小时，6个月时间你就可以学完十个技术模块。在课程期间我们会对课程进行科学系统的阶段性分类，以保证大家能够高质量地完成课程。
            </article>
          </li>
          <li>
            <p><i></i><span>6个月后我还能继续观看课程吗？</span></p>
            <article>
              通过所有项目顺利毕业后，你可以反复观看课程。你可以把这当做毕业奖励！但如果超过 6
              个月你未能通过所有模块，你将不再享受的导师服务。你可能会问，如果无法在规定时间完成课程怎么办？其实不用担心，在你正式进入课程学习后，我们会有专业的导师对你的课程进行学习代码审阅、项目审核，阶段考核，还有班主任督促、学习小伙伴激励你的学习。绝大部分学生都能够在
              6 个月内完成课程。
            </article>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "EmploymentClass",
    data() {
      return {
        courseList: [],
      }
    },
    methods: {
      getCourseList() {
        this.$http.getDegreeCourse().then(res => {
          for (let i = 0; i < res.length; i++) {
            res[i]['courseImage'] = `http://127.0.0.1:8000/${res[i]['courseImage']}`;
          }
          console.log(res);
          this.courseList = res;
        }).catch(err => {
          console.log(err);
        });
      },
      detailHandler(courseId) {
        this.$router.push({
          name: "degreeCourse.detail",
          params: {
            detailId: courseId
          }
        })
      },
    },
    created() {
      this.getCourseList();
    }
  }
</script>

<style scoped>
  a {
    text-decoration: none;
  }

  .box {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .employment-head {
    width: 100%;
    height: 520px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    position: relative;
  }

  .box .employment-head .container {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    margin: 0;
    padding: 0;
    background-color: #000;
  }

  audio, canvas, progress, video {
    display: inline-block;
    vertical-align: baseline;
  }

  .box .employment-head .head-content {
    width: 1200px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    position: absolute;
    left: 50%;
    top: 84px;
    margin-left: -600px;
  }

  .box .employment-head .head-content h1 {
    color: #fff;
    font-size: 40px;
    font-weight: 400;
  }

  .box .employment-head .head-content p {
    text-align: center;
    width: 690px;
    color: #fff;
    font-size: 20px;
    font-weight: 300;
    line-height: 44px;
    margin-top: 25px;
    margin-bottom: 33px;
  }

  .box .employment-head .head-content button {
    width: 297px;
    height: 54px;
    color: #fff;
    font-size: 20px;
    font-weight: 300;
    border-radius: 7px;
    margin-bottom: 77px;
    border: 1px solid #fdfdfd;
  }

  .box .employment-head .head-content ul {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .box .employment-head .head-content ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 16px;
    color: #fafafa;
  }

  .box .employment-head .head-content ul li img {
    width: 24px;
    height: auto;
    margin-left: 36px;
    margin-right: 36px;
  }

  .box .employment-course {
    width: 100%;
    height: 1000px;
    background: #f8f8f8;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 120px;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .box .title p {
    font-size: 18px;
    color: #9b9b9b;
    font-weight: 400;
    margin-top: 15px;
    line-height: 30px;
    display: inline-block;
  }

  .box .employment-course ul {
    width: 1200px;
    margin-top: 40px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .box .employment-course ul li {
    width: 586px;
    height: auto;
    margin-bottom: 30px;
  }

  .box .employment-course ul li a .course-item .num img {
    width: 17px;
    height: 17px;
    margin-right: 4px;
  }

  .box .employment-course ul li a img {
    width: 100%;
    height: 248px;
    border-radius: 4px 4px 0 0;
  }

  .box .employment-course ul li a .course-item {
    width: 100%;
    background: #fff;
    padding: 32px 22px 34px;
    box-sizing: border-box;
    box-shadow: 0 5px 20px 0 #e8e8e8;
    border-radius: 0 0 4px 4px;
  }

  .box .employment-course ul li a .course-item .title {
    color: #5e5e5e;
    font-size: 16px;
    margin-bottom: 12px;
  }

  .box .employment-course ul li a .course-item .num, .box .employment-course ul li a .course-item .num p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .employment-course ul li a .course-item .num {
    width: 100%;
    font-size: 14px;
    color: #9d9d9d;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .box .employment-course ul li a .course-item .num, .box .employment-course ul li a .course-item .title {
    width: 100%;
    text-align: left;
  }

  .box .employment-course ul li a .course-item .num, .box .employment-course ul li a .course-item .num p {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .employment-course ul li a .course-item .num p:first-of-type span:nth-of-type(2) {
    margin-left: 20px;
  }

  .box .why-choose, .box .why-choose ul {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .why-choose {
    width: 1200px;
    height: 450px;
    margin-top: 143px;
    -ms-flex-direction: column;
    flex-direction: column;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .sdiv.on .div-2, .sdiv.on .div-3, .sdiv.on .div-4, .sdiv.on .h1, .sdiv.on .p, .sdiv.on .span {
    transform: none;
    opacity: 1;
  }

  .sdiv .h1 {
    transform: translateY(50px);
    transition: transform .5s, opacity .5s;
    opacity: 0;
  }

  .h1, h1 {
    font-size: 36px;
  }

  .box .title p {
    font-size: 18px;
    color: #9b9b9b;
    font-weight: 400;
    margin-top: 15px;
    line-height: 30px;
    display: inline-block;
  }

  .box .why-choose ul {
    margin-top: 70px;
  }

  .box .why-choose ul {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .why-choose ul li {
    text-align: center;
  }

  .box .why-choose ul li img {
    width: auto;
    height: 40px;
  }

  .box .why-choose ul li p:first-of-type span {
    width: 120%;
    display: block;
    height: 3px;
    background: #f5a623;
    margin-left: -10%;
  }

  .box .why-choose ul li p:nth-of-type(2) {
    margin-top: 8px;
    font-size: 16px;
    color: #9d9d9d;
  }

  .box .solve-problem {
    width: 100%;
    height: 1013px;
    background: #f8f8f8;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 100px;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .box .solve-problem .problem-content {
    width: 1079px;
    height: 712px;
    margin-top: 32px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    position: relative;
  }

  .box .solve-problem .problem-content img:first-of-type {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
  }

  .box .solve-problem .problem-content img:nth-of-type(2) {
    width: 801px;
    height: 582px;
    position: absolute;
    left: 139px;
    top: 65px;
  }

  .box .nanny {
    width: 1200px;
    height: 809px;
    padding-top: 100px;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .box .nanny .nanny-content1 {
    width: 1200px;
    height: 274px;
    margin-top: 40px;
    background: #fffdf8;
    border-radius: 0 0 100px 0;
    border: 1px solid #ffc210;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .box .nanny .nanny-content1 li:first-of-type {
    margin-right: 100px;
    margin-left: 182px;
  }

  .box .nanny .nanny-content1 li {
    text-align: center;
  }

  .box .nanny .nanny-content1 li:first-of-type img {
    width: 86px;
    height: auto;
  }

  .box .nanny .nanny-content1 li:first-of-type p {
    color: #333;
    font-size: 24px;
    margin-top: 24px;
  }

  .box .nanny .nanny-content1 .pipe {
    width: 81px;
    height: 15px;
  }

  .box .nanny .nanny-content1 li:nth-of-type(2) {
    margin-left: 62px;
    margin-right: 85px;
  }

  .box .nanny .nanny-content1 li {
    text-align: center;
  }

  .box .nanny .nanny-content1 .pipe {
    width: 81px;
    height: 15px;
  }

  .box .nanny .nanny-content1 li:nth-of-type(3) {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    margin-left: 30px;
  }

  .box .nanny .nanny-content1 li {
    text-align: center;
  }

  .box .nanny .nanny-content1 li:nth-of-type(3) span {
    font-size: 16px;
    color: #333;
  }

  .box .nanny .nanny-content1 li:nth-of-type(3) img {
    width: 230px;
    height: 144px;
    margin-top: 13px;
    margin-bottom: 13px;
  }

  .box .nanny .nanny-content1 li:nth-of-type(3) a {
    font-size: 16px;
    font-weight: 500;
    color: #4a90e2;
    cursor: pointer;
  }

  .box .nanny .nanny-content2 {
    width: 1200px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding-left: 64px;
    padding-right: 111px;
    margin-top: 46px;
  }

  .box .nanny .nanny-content2 li {
    text-align: center;
  }

  .box .nanny .nanny-content2 li img {
    width: auto;
    height: 65px;
    margin-bottom: 23px;
  }

  .box .nanny .nanny-content2 li span {
    font-size: 20px;
    color: #4a4a4a;
    margin-bottom: 13px;
    display: block;
  }

  .box .nanny .nanny-content2 li p {
    font-size: 16px;
    color: #9d9d9d;
    line-height: 28px;
  }

  .box .student {
    width: 100%;
    height: 600px;
    background: #f8f8f8;
    padding-top: 125px;
  }

  .box .problem {
    width: 1200px;
    height: 1100px;
    padding-top: 115px;
  }

  .box .student .title {
    color: #333;
    font-size: 36px;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .box .student ul {
    margin-top: 68px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .box .student ul li {
    text-align: center;
  }

  .box .student ul li div {
    width: 386px;
    height: 218px;
    position: relative;
    cursor: pointer;
    margin-bottom: 27px;
  }

  .box .student ul li div .img1 {
    width: 100%;
    height: 100%;
  }

  .box .student ul li div .img2 {
    width: 28px;
    height: 28px;
    position: absolute;
    left: 24px;
    bottom: 22px;
    transition: all .4s;
  }

  .box .student ul li p:first-of-type {
    font-size: 16px;
    color: #9d9d9d;
  }

  .box .student ul li p:nth-of-type(2) {
    color: #000;
    font-size: 20px;
    margin-top: 13px;
    margin-bottom: 13px;
  }

  .box .student ul li p:nth-of-type(3) {
    font-size: 16px;
    color: #9d9d9d;
  }

  .box .student ul li:nth-of-type(2) {
    margin-left: 22px;
    margin-right: 22px;
  }

  .box .student ul li {
    text-align: center;
  }

  .box .student ul li div {
    width: 386px;
    height: 218px;
    position: relative;
    cursor: pointer;
    margin-bottom: 27px;
  }

  .box .problem {
    width: 1200px;
    height: 1231px;
    padding-top: 115px;
  }

  .box .problem .title {
    font-size: 28px;
    color: #4a4a4a;
    margin-bottom: 17px;
  }

  .box .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .box .title h1 {
    color: #333;
    font-size: 36px;
    font-weight: 400;
  }

  .box .problem .problem-list {
    width: 100%;
    height: 960px;
    position: relative;
  }

  .box .problem .problem-list img {
    width: 1200px;
    height: 960px;
    position: absolute;
    left: 0;
    top: 0;
  }

  .box .problem .problem-list ul {
    position: absolute;
    left: 0;
    top: 0;
    padding-top: 20px;
  }

  .box .problem .problem-list ul li {
    margin: 0 38px;
    display: -ms-flexbox;
    display: flex;
    padding-top: 28px;
    padding-bottom: 28px;
    border-bottom: 1px dashed #ccc;
  }

  .box .problem .problem-list ul li p {
    width: 340px;
    display: -ms-flexbox;
    display: flex;
    margin-right: 38px;
  }

  .box .problem .problem-list ul li p i {
    width: 3px;
    height: 20px;
    background: #000;
    display: inline-block;
    margin-right: 16px;
    margin-top: 4px;
  }

  .box .problem .problem-list ul li p span {
    -ms-flex: 1;
    flex: 1;
    font-size: 20px;
    color: #333;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .box .problem .problem-list ul li article {
    -ms-flex: 1;
    flex: 1;
    color: #333;
    font-size: 17px;
    font-weight: 400;
    line-height: 30px;
  }
</style>
