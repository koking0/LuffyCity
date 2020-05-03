<template>
  <div class="course">
    <main>
      <div class="screening">
        <div class="ul1">
          <ul>
            <li v-for="(item, index) in categoryList" :key="item.id" :class="{this1:index===currentCategoryId}"
                @click="categoryClick(index, item.id)">
              {{item.name}}
            </li>
          </ul>
        </div>
      </div>
      <div class="course-list">
        <dl v-for="(item, index) in courseList" :key="item.id" @click="detailHandler(item.id)">
          <dt>
            <img alt=" " :src="item.course_img">
          </dt>
          <dd>
            <div class="name">
              <p>{{item.name}}</p>
              <p>
                <img src="/static/images/course-num_1564141043.723208.svg" alt="course-num">
                <span>200人已加入学习</span>
              </p>
            </div>
            <div class="teacher">
              <p>{{item.teacher_description}}</p>
              <p>共{{item.complete_numbers}}课时<span>/更新完成</span></p></div>
            <ul>
              <li v-for="(section, i) in item.free_sections" :key="section.id">
                <img class="img1" src="/static/images/course-video1_1564141044.1611981.svg">
                <img class="img2" src="/static/images/course-video2_1564141044.3260088.svg">
                <p>0{{i+1}} | {{section.name}}</p>
                <span v-if="section.free_trail">免费</span>
              </li>
            </ul>
            <div class="price">
              <p>
                <span class="discount">限时折扣</span>
                <span class="present-price">￥{{item.promotion_price}}元</span>
                <span class="original-price">原价：{{item.price}}元</span>
              </p>
              <button>立即购买</button>
            </div>
          </dd>
        </dl>
      </div>
    </main>
  </div>
</template>

<script>
  export default {
    name: "PracticalLessons",
    data() {
      return {
        // 分类列表
        categoryList: [],
        // 课程列表
        courseList: [],
        // 选中分类列表索引
        currentCategoryId: 0,
        // 获取课程列表的id
        categoryId: 0,
        // 课程列表详情数据
        courseDetail: [],
      }
    },
    methods: {
      // 处理分类列表
      getCategoryList() {
        this.$http.getContent('course_sub/category/list/?belong=0').then(res => {
          this.categoryList = res.data;
          let allItem = {id: 0, name: "全部", belong: 0, hide: false, category: 1}
          this.categoryList.unshift(allItem);
        })
      },
      // 处理分类全部课程列表
      getAllCategoryCourseList() {
        this.$http.getContent(`courses/?sub_category=${this.categoryId}&ordering=`).then(res => {
          this.courseList = res.data;
        })
      },
      // 分类点击事件
      categoryClick(index, id) {
        this.currentCategoryId = index;
        this.categoryId = id;
        this.getAllCategoryCourseList();
      },
      // 课程详情事件
      detailHandler(id){
        this.$router.push({
          name:"course.detailIntroduce",
          params:{
            detailId:id
          }
        })
      }
    },
    created() {
      this.getCategoryList();
      this.getAllCategoryCourseList();
    },
  }
</script>

<style scoped>
  .course {
    -ms-flex: 1;
    flex: 1;
    width: 100%;
    background: #f6f6f6;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    position: relative;
  }

  .course main {
    width: 1100px;
    height: auto;
    padding-top: 35px;
  }

  .course main .screening {
    width: 100%;
    height: auto;
    margin-bottom: 35px;
    padding: 10px 20px;
    background: #fff;
    border-radius: 4px;
    box-shadow: 0 2px 4px 0 #f0f0f0;
  }

  .course main .screening .ul1 {
    display: -ms-flexbox;
    display: flex;
    border-bottom-color: rgba(51, 51, 51, .05);
    padding-bottom: 18px;
  }

  .course main .screening .ul1 ul {
    -ms-flex: 1;
    flex: 1;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .course main .screening .ul1 ul li {
    margin-top: 20px;
    box-shadow: none;
    margin-left: 10px;
  }

  .course main .screening ul .this1 {
    color: #ffc210;
    padding: 6px 15px;
    box-shadow: 0 0 0 1px #ffc210 !important;
    border-radius: 30px;
  }

  .course main .screening ul li {
    padding: 6px 15px;
    line-height: 16px;
    position: relative;
    transition: all .3s ease;
    cursor: pointer;
    color: #4a4a4a;
  }

  .course main .course-list {
    width: 100%;
  }

  .course main .course-list dl {
    width: 100%;
    height: auto;
    background: #fff;
    padding: 20px 30px 20px 20px;
    display: -ms-flexbox;
    display: flex;
    margin-bottom: 35px;
    border-radius: 2px;
    cursor: pointer;
    box-shadow: 2px 3px 16px rgba(0, 0, 0, .1);
    transition: all .2s ease;
    position: relative;
  }

  .course main .course-list dl dt {
    width: 423px;
    height: 210px;
    margin-right: 30px;
  }

  .course main .course-list dl dt img {
    width: 100%;
    height: 100%;
  }

  .course main .course-list dl dd {
    -ms-flex: 1;
    flex: 1;
  }

  .course main .course-list dl dd .name {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    -ms-flex-pack: justify;
    justify-content: space-between;
    margin-bottom: 8px;
  }

  .course main .course-list dl dd .name p:first-child {
    font-size: 26px;
    color: #333;
  }

  .course main .course-list dl dd .name p:last-child {
    font-size: 14px;
    color: #9b9b9b;
  }

  .course main .course-list dl dd .name p img {
    width: 11px;
    height: auto;
    margin-right: 7px;
  }

  .course main .course-list dl dd .teacher {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    -ms-flex-pack: justify;
    justify-content: space-between;
    font-size: 14px;
    color: #9b9b9b;
    margin-bottom: 14px;
    padding-bottom: 14px;
    border-bottom: 1px solid #333;
    border-bottom-color: rgba(51, 51, 51, .05);
  }

  .course main .course-list dl dd ul {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .course main .course-list dl dd ul li {
    width: 49%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
    color: #666;
    margin-bottom: 15px;
    cursor: pointer;
  }

  .course main .course-list dl dd ul li img {
    width: 16px;
    height: 16px;
    margin-right: 6px;
  }

  .course main .course-list dl dd ul li .img2 {
    display: none;
  }

  .course main .course-list dl dd ul li img {
    width: 16px;
    height: 16px;
    margin-right: 6px;
  }

  .course main .course-list dl dd ul li p {
    max-width: 227px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }

  .course main .course-list dl dd ul li span {
    width: 34px;
    height: 20px;
    color: #fd7b4d;
    margin-left: 10px;
    border: 1px solid #fd7b4d;
    border-radius: 2px;
    text-align: center;
    font-size: 13px;
    white-space: nowrap;
  }

  .course main .course-list dl dd .price, .course main .course-list dl dd .price p:first-child {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course main .course-list dl dd .price, .course main .course-list dl dd .price p:first-child {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .course main .course-list dl dd .price p:first-child .discount {
    padding: 6px 10px;
    font-size: 16px;
    color: #fff;
    text-align: center;
    margin-right: 8px;
    background: #fa6240;
    border: 1px solid #fa6240;
    border-radius: 10px 0 10px 0;
  }

  .course main .course-list dl dd .price p:first-child .present-price {
    font-size: 24px;
    color: #fa6240;
  }

  .course main .course-list dl dd .price p:first-child .original-price {
    text-decoration: line-through;
    font-size: 14px;
    color: #9b9b9b;
    margin-left: 10px;
  }

  .course main .course-list dl dd .price button {
    width: 120px;
    height: 38px;
    right: 30px;
    position: absolute;
    background: transparent;
    color: #fa6240;
    font-size: 16px;
    border: 1px solid #fd7b4d;
    border-radius: 3px;
    transition: all .2s ease-in-out;
  }

  .side {
    width: 50px;
    height: auto;
    position: fixed;
    right: 10px;
    bottom: 50%;
    margin-bottom: -108px;
    z-index: 10;
    display: none;
  }

  .side li {
    width: 100%;
    height: 50px;
    background: #ccc;
    border-radius: 2px;
    font-size: 12px;
    color: #fff;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    margin-bottom: 4px;
    cursor: pointer;
    transition: all .2s ease-in-out;
    position: relative;
  }

  .side li img {
    width: 24px;
    height: auto;
  }

  .side li span {
    display: none;
  }
</style>
