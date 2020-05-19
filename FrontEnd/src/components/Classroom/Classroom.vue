<template>
  <div class="studyHome">
    <main v-if="identity === 3">
      <div class="study-head">
        <div class="dashboard">
          <div class="mentor">
            <p class="time">
              <img src="/static/images/study-icon5.svg" alt="study-icon5">
              <span>紧急快速提问：2小时内响应</span>
              <b>如果2小时后您的导师没有响应，将有别的导师为您服务！</b>
            </p>
            <div class="teacher">
              <img src="/static/images/study-head.svg" alt="study-head">
              <p class="name">我的导师:<span>M组-冯国富</span></p>
              <p class="service">服务时间 09:00-21:00 工作日</p>
              <button>
                <img src="/static/images/study-icon6.svg" alt="study-icon6">
                <router-link :to="{name:'Questions'}">
                  <span>立即提问</span>
                </router-link>
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
              <section class="module" v-for="item in courseDetail.modules" :key="item.id">
                <p class="num">
                  <img src="/static/images/angle-of.svg" alt="angle">
                  <span>第{{item.index}}模块</span>
                </p>
                <p class="name">{{item.title}}</p>
                <p class="tips">建议时长·{{item.count}}天</p>
                <p class="theprogress">课时观看进度：<span>{{item.completeCount}} / {{item.count}}</span></p>
                <p class="function">
                  <span>
                    <a @click="detailChapterHandler(item.id)">查看章节</a>
                    <a @click="detailHomeworkHandler(item.id)">模块作业</a>
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
    <main v-if="identity === 2">
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">我的学生</h3>
        </div>
        <div class="panel-body">
          <ul>
            <li v-for="item in teacherDetailList.studentList" :key="item.id">
              <img :src='item.studentAvatar' :alt="item.studentName"
                   style="height: 100px;width: 100px;float: left;margin-left: 20px;">
            </li>
          </ul>
        </div>
      </div>
      <div class="panel panel-success">
        <div class="panel-heading">
          <h3 class="panel-title">学生问题</h3>
        </div>
        <div class="panel-body">
          <ul>
            <li v-for="item in teacherDetailList.questionList" :key="item.questionId">
              <div class="panel panel-success col-md-5" style="margin-right: 90px">
                <div class="panel-heading">
                  <h3 class="panel-title">{{item.questionTitle}}</h3>
                </div>
                <div class="panel-body">
                  <p><span style="color: red;">问题内容：</span>{{item.questionContent}}</p>
                  <p><span style="color: red;">环境：</span>{{item.questionEnvironment}}</p>
                  <p>
                    <span style="color: red;">回复：</span>
                    <label>
                      <textarea style="width: 400px; height: 200px;" :id="item.questionId"></textarea>
                    </label>
                  </p>
                  <button class="btn btn-info" style="width: 100px; height: 30px;"
                          @click="submitQuestionReply(item.questionId)">
                    提交
                  </button>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="panel panel-warning">
        <div class="panel-heading">
          <h3 class="panel-title">学生作业</h3>
        </div>
        <div class="panel-body">
          <ul>
            <li v-for="item in teacherDetailList.taskList" :key="item.taskId">
              <div class="panel panel-warning col-md-5" style="margin-right: 90px">
                <div class="panel-heading">
                  <h3 class="panel-title">{{item.taskId}}:{{item.taskTitle}}</h3>
                </div>
                <div class="panel-body">
                  <p><span style="color: red;">学生：</span>{{item.taskStudent}}</p>
                  <div class="btns">
                    <span style="color: red;">文件：</span>
                    <el-link target="_blank" :href="item.taskFilePath" :underline="false">
                      <el-button size="mini" type="warning">文件下载</el-button>
                    </el-link>
                  </div>
                </div>
                <div class="panel-heading">
                  <h3 class="panel-title">导师批改</h3>
                </div>
                <div class="panel-body">
                  <p>
                    <span style="color: red;">成绩：</span>
                    <el-rate v-model="value" show-text allow-half></el-rate>
                  </p>
                  <p>
                    <span style="color: red;">点评：</span>
                    <label>
                      <textarea style="width: 400px; height: 200px;" v-model="comment"></textarea>
                    </label>
                  </p>
                  <button class="btn btn-info" style="width: 100px; height: 30px;"
                          @click="submitForApproval(item.taskId)">
                    提交
                  </button>
                </div>
              </div>
            </li>
          </ul>
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
        value: null,
        comment: null,
        reply: null,
        courseDetail: null,
        identity: null,
        teacherDetailList: null,
      }
    },
    methods: {
      submitForApproval(taskId) {
        let data = {
          taskId: taskId,
          value: this.value * 20,
          comment: this.comment,
        };
        this.$http.submitApproval(data).then(res => {
          console.log(res);
          this.$message(res.data);
          location.reload();
        }).catch(err => {
          console.log(err);
        })
      },
      submitQuestionReply(questionId) {
        let data = {
          questionId: questionId,
          reply: document.getElementById(questionId).value,
        };
        this.$http.questionReply(data).then(res => {
          console.log(res);
          this.$message(res.data);
          location.reload();
        }).catch(err => {
          console.log(err);
        })
      },
      getCourse() {
        this.$http.classroomCourseList().then(res => {
          this.courseDetail = res;
        }).catch(err => {
          console.log(err);
        })
      },
      getTeacherDetail() {
        this.$http.getTeacherDetailList().then(result => {
          console.log(result);
          for (let i = 0; i < result.studentList.length; i++) {
            result.studentList[i]['studentAvatar'] = `http://127.0.0.1:8000/media/${result.studentList[i]['studentAvatar']}`;
          }
          for (let i = 0; i < result.taskList.length; i++) {
            result.taskList[i]['taskFilePath'] = `http://127.0.0.1:8000/api/get/file/${result.taskList[i]['taskFilePath']}`;
          }
          this.teacherDetailList = result;
        }).catch(err => {
          console.log(err);
        })
      },
      detailHomeworkHandler(id) {
        this.$router.push({
          name: "Homework.detail",
          params: {
            detailId: id
          }
        })
      },
      detailChapterHandler(id) {
        this.$router.push({
          name: "Chapters.detail",
          params: {
            detailId: id
          }
        })
      },
    },
    created() {
      this.identity = Number(localStorage.getItem('identity'));
      if (this.identity === 3) {
        this.getCourse();
      } else if (this.identity === 2) {
        this.getTeacherDetail();
      }
    },
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
    margin: 20px auto;
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
    width: 1200px;
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
  }

  .studyHome main .study-head .mentor .teacher button img {
    width: 16px;
    height: auto;
    margin-right: 70px;
    margin-top: 10px;
  }

  .studyHome main .study-head .mentor .teacher button span {
    position: absolute;
    top: 173px;
    left: 590px;
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
