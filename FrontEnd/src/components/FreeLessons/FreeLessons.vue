<template>
  <div class="course-home container">
    <div class="course-img">
      <a href="" target="_blank">
        <img alt="" src="static/images/ketang@2x_1567059626.6092663.png">
      </a>
    </div>
    <div class="course-screening">
      <ul>
        <li v-for="(category, index) in categoryList" :key="category.id" :class="{this:index===currentIndex}"
            @click="categoryClick(index, category.id)">
          {{category.name}}
        </li>
      </ul>
    </div>
    <div class="course-main">
      <section>
        <div class="name">{{categoryList[currentIndex].name}}</div>
        <div>
          <ul>
            <li v-for="(course, index) in courseDetail" :key="course.id" @click="detailHandler(course.id)">
              <div class="img-box">
                <img alt="" :src="course.course_img">
              </div>
              <div class="course-item">
                <p class="title">{{course.course_slogan}}</p>
                <div class="item-number">
                  <p class="num">
                    <img src="/static/images/bofang_1567070083.9337127.png">
                    {{course.learn_number}}人在学
                  </p>
                  <p class="time">
                    <span>{{getLevelName(course.level)}}</span>
                    <span>{{course.hours}}小时</span>
                  </p>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
  export default {
    name: "FreeLessons",
    data() {
      return {
        // 分类列表
        categoryList: [],
        // 选中分类列表索引
        currentIndex: 0,
        // 获取课程列表的id
        categoryId: 0,
        // 课程列表详情数据
        courseDetail: [],
      }
    },
    methods: {
      // 处理分类列表
      getCategoryList() {
        this.$http.getContent('free/category/').then(res => {
          this.categoryList = res.data;
          let allItem = {id: 0, name: '全部', courses: []}
          for (let i = 0; i < this.categoryList.length; i++) {
            for (let j = 0; j < this.categoryList[i].courses.length; j++) {
              allItem.courses.push(this.categoryList[i].courses[j]);
            }
          }
          this.categoryList.unshift(allItem);
          this.courseDetail = this.categoryList[this.currentIndex].courses
        })
      },
      // 处理全部课程列表
      getAllCategoryList() {
        if (this.categoryList.length) {
          this.courseDetail = this.categoryList[this.currentIndex].courses
          console.log(this.courseDetail);
        }
      },
      // 获取课程等级
      getLevelName(level) {
        let ans;
        switch (level) {
          case 0:
            ans = "入门";
            break;
          case 1:
            ans = "进阶";
            break;
          default:
            console.log(level);
            ans = "其它";
            break;
        }
        return ans
      },
      // 分类点击事件
      categoryClick(index, id) {
        this.currentIndex = index;
        this.categoryId = id;
        this.getAllCategoryList();
      },
      // 课程详情事件
      detailHandler(id) {
        this.$router.push({
          name: "course.detail",
          params: {
            detailId: id
          }
        })
      }
    },
    created() {
      this.getCategoryList();
      this.getAllCategoryList();
    },
  };
</script>

<style scoped>
  .course-home .course-img {
    cursor: pointer;
    background: #fff;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid hsla(0, 0%, 59%, .1);
    width: 100%;
    height: auto;
    display: flex;
  }

  .course-home .course-img img {
    width: 1200px;
    height: 100px;
  }

  .course-home .course-screening ul .this {
    color: #f5a623;
  }

  .course-home .course-screening {
    width: 100%;
    height: auto;
    background: #fff;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 20px;
  }

  .course-home .course-screening ul {
    width: 1200px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-home .course-screening ul li {
    color: #4a4a4a;
    font-size: 14px;
    margin-bottom: 20px;
    margin-right: 50px;
    cursor: pointer;
  }

  .course-home .course-main section .name {
    width: 1200px;
    font-size: 24px;
    color: #4a4a4a;
    margin-top: 60px;
    padding-left: 15px;
    padding-bottom: 15px;
    text-align: left;
  }

  .course-home .course-main section ul {
    width: 1200px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-bottom: 38px;
  }

  .course-home .course-main section ul li {
    width: 377px;
    height: auto;
    margin-right: 23px;
    margin-bottom: 42px;
    cursor: pointer;
  }

  .course-home .course-main section ul a {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    text-decoration: none;
  }

  .course-home .course-main section ul li .img-box {
    width: 100%;
    height: 217px;
    position: relative;
  }

  .course-home .course-main section ul li .img-box div {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: hsla(0, 0%, 100%, .2);
    display: none;
    z-index: 1;
  }

  .course-home .course-main section ul li .img-box img {
    width: 100%;
    height: 217px;
    border-radius: 4px 4px 0 0;
  }

  .course-home .course-main section ul li .course-item {
    width: 384px;
    height: 138px;
    background: #fff;
    padding-left: 22px;
    padding-right: 22px;
    box-sizing: border-box;
    border-radius: 0 0 4px 4px;
    box-shadow: 0 5px 20px 0 #e8e8e8;
  }

  .course-home .course-main section ul li .course-item .title {
    width: 340px;
    color: #5e5e5e;
    font-size: 16px;
    padding-top: 39px;
    margin-bottom: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .course-home .course-main section ul li .course-item .item-number {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .course-home .course-main section ul li .course-item .item-number .num {
    color: #9d9d9d;
    font-size: 14px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course-home .course-main section ul li .course-item .item-number .num img {
    width: 17px;
    height: 17px;
    margin-right: 7px;
  }

  .course-home .course-main section ul li .course-item .item-number .time {
    font-size: 14px;
    color: #9d9d9d;
  }

  .course-home .course-main section ul li .course-item .item-number .time span:first-of-type {
    margin-right: 22px;
  }
</style>
