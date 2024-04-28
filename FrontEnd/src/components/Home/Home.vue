<template>
  <div class="luffy-city">
    <div class="block">
      <el-carousel height="400px">
        <el-carousel-item v-for="item in sliderImages" :key="item.id">
          <img :src="item.imgSrc" alt="item.id" style="width: 100%;height: 100%;">
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="home-courses">
      <div class="title">
        <h1>自学编程必备免费+实战教程</h1>
        <p>这些课程是决定你能否成为编程奇才的关键教程— 免费+实战，我们送给你了</p>
      </div>
      <div class="content">
        <div class="more">
          <router-link :to="{name:'PracticalLessons'}">
            <span>更多实战</span>
            <img src="../../../static/images/home-right.png" alt="home-right">
          </router-link>
        </div>
        <div class="courses">
          <ul class="free">
            <a target="_blank" href="https://www.luffycity.com/free/124">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="../../../static/images/PY1@2x.png">
                </div>
                <div class="course-item">
                  <p class="title">跟随Alex金角大王3周上手Python开发</p>
                  <div class="item-number">
                    <p class="num">
                      <img src="../../../static/images/bofang.png">
                      <span>784人在学</span>
                      <span>19小时 </span>
                    </p>
                    <p class="price"><span class="price1">免费</span></p>
                  </div>
                </div>
              </li>
            </a> <a target="_blank" href="https://www.luffycity.com/free/131">
            <li>
              <div class="img-box">
                <div></div>
                <img src="../../../static/images/Linux1@2x.png">
              </div>
              <div class="course-item">
                <p class="title">跟随Redhat认证专家讲师2周玩转Linux</p>
                <div class="item-number">
                  <p class="num">
                    <img src="../../../static/images/bofang.png">
                    <span>106人在学</span>
                    <span>16小时</span>
                  </p>
                  <p class="price"><span class="price1">免费</span></p>
                </div>
              </div>
            </li>
          </a>
            <a target="_blank" href="https://www.luffycity.com/free/143">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="../../../static/images/web1@2x.png">
                </div>
                <div class="course-item">
                  <p class="title">3天搞定网站开发三剑客之HTML</p>
                  <div class="item-number">
                    <p class="num">
                      <img src="../../../static/images/bofang.png">
                      <span>51人在学</span>
                      <span>8小时</span>
                    </p>
                    <p class="price">
                      <span class="price1">免费</span>
                    </p>
                  </div>
                </div>
              </li>
            </a>
          </ul>
          <ul class="combat">
            <a target="_blank" href="https://www.luffycity.com/courses/10/details-introduce">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="../../../static/images/algorithm@2x.png">
                </div>
                <div class="course-item">
                  <p class="title">轻松学好开发人员必备的数据结构及算法知识</p>
                  <div class="item-number">
                    <p class="num">
                      <img src="../../../static/images/bofang.png">
                      <span>3877人在学</span>
                      <span>20小时</span>
                    </p>
                    <p class="price">
                      <span class="price1">¥ 79.20</span>
                      <span class="price2">¥ 99.00</span>
                    </p>
                  </div>
                </div>
              </li>
            </a>
            <a target="_blank" href="https://www.luffycity.com/courses/111/details-introduce">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="../../../static/images/K8s@2x.png">
                </div>
                <div class="course-item">
                  <p class="title">2周学会当下最热门的云计算架构之k8s实战</p>
                  <div class="item-number">
                    <p class="num">
                      <img src="../../../static/images/bofang.png">
                      <span>919人在学</span>
                      <span>13小时</span>
                    </p>
                    <p class="price">
                      <span class="price1">¥ 78.97</span>
                      <span class="price2">¥ 149.00</span>
                    </p>
                  </div>
                </div>
              </li>
            </a>
            <a target="_blank" href="https://www.luffycity.com/courses/123/details-introduce">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="../../../static/images/go@2x.png">
                </div>
                <div class="course-item">
                  <p class="title">微服务这么火，还不会的是没机会进大厂了</p>
                  <div class="item-number">
                    <p class="num">
                      <img src="../../../static/images/bofang.png">
                      <span>470人在学</span>
                      <span>12小时</span>
                    </p>
                    <p class="price">
                      <span class="price1">¥ 99.00</span>
                      <span class="price2">¥ 198.00</span>
                    </p>
                  </div>
                </div>
              </li>
            </a></ul>
        </div>
      </div>
    </div>
    <div class="employment-course">
      <div class="title"><h1>官方重磅推荐1v1名师就业班课程</h1>
        <p>网红讲师+在线1V1名企导师辅导 + 闯关学习，逐行审阅代码、视频1v1考核等服务，助你高薪就业</p></div>
      <ul><a target="_blank" href="https://www.luffycity.com/micro/python-middle">
        <li>
          <img src="../../../static/images/AI@2x.png">
          <div class="course-item"><p class="title">迎上AI风口，抓住行业红利，0基础6个月炼成人工智能时代热门人才</p>
            <p class="num">
              <img src="../../../static/images/bofang.png">
              <span>1833人</span> <span>6个月</span></p></div>
        </li>
      </a> <a target="_blank" href="https://www.luffycity.com/micro/linux-middle">
        <li>
          <img src="../../../static/images/Linuxyun@2x.png">
          <div class="course-item"><p class="title">玩转Linux，不写代码也能高薪，零基础首选，年薪30万不是梦！</p>
            <p class="num">
              <img src="../../../static/images/bofang.png">
              <span>650人</span> <span>5个月</span></p></div>
        </li>
      </a></ul>
    </div>
<!--    <div class="study-problem"><h1>在自学的路上，你是否也遇到了这些问题？</h1>-->
<!--      <ul>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/1@2x_1567483299.734612.png">-->
<!--          <p>自学自制力差坚持不下去</p> <span>01</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/2@2x_1567483299.815959.png">-->
<!--          <p>遇到问题不知道该问谁</p> <span>02</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/3@2x_1567483299.9631536.png">-->
<!--          <p>没有学习方向</p> <span>03</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/4@2x_1567483299.974014.png">-->
<!--          <p>浪费大量时间&amp;机会成本</p> <span>04</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/5@2x_1567483300.1571927.png">-->
<!--          <p>能看懂代码但不会写</p> <span>05</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/6@2x_1567483300.1598253.png">-->
<!--          <p>没有学习氛围 严重拖延症</p> <span>06</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/7@2x_1567483300.3511646.png">-->
<!--          <p>不知道该怎么学、学什么</p> <span>07</span></li>-->
<!--        <li><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/8@2x_1567483300.3661962.png">-->
<!--          <p>学习进度慢到窒息，慢到放弃</p> <span>08</span></li>-->
<!--      </ul>-->
<!--    </div>-->
<!--    <div class="solve-problem"><h1 class="problem-title">路飞学城帮你解决所有问题！</h1>-->
<!--      <div class="content">-->
<!--        <div class="title"><h1>更符合在线学习的“学、练、改、管、测”教学模式</h1>-->
<!--          <p>基于“输入、输出、纠正”的科学方法论，业内独创1v1辅导+闯关考核学习模式，自学失败者的救星，学好IT的正确途径</p></div>-->
<!--        <div class="content-item"><img-->
<!--          src="//hcdn1.luffycity.com/static/frontend/index/line@2x_1567483309.5746026.png">-->
<!--          <section class="item1"><img-->
<!--            src="//hcdn1.luffycity.com/static/frontend/index/study@2x_1567483310.8556564.png">-->
<!--            <p>在线视频学习</p>-->
<!--            <article>知名网红讲师真人出境，专为线上录<br>制。高清录播，重复观看，利用碎片化<br>时间系统学习，巩固复习。-->
<!--            </article>-->
<!--          </section>-->
<!--          <section class="item2"><img-->
<!--            src="//hcdn1.luffycity.com/static/frontend/index/practice@2x_1567483309.9485178.png">-->
<!--            <p>章节作业 + 阶段测试</p>-->
<!--            <article>章节结束，导师布置作业。<br>阶段结束，导师指导实战测试，根<br>据结果为学员量身定制学习计划。-->
<!--            </article>-->
<!--          </section>-->
<!--          <section class="item3"><img-->
<!--            src="//hcdn1.luffycity.com/static/frontend/index/fix@2x_1567483306.8539662.png">-->
<!--            <p>逐行代码批改</p>-->
<!--            <article>所有作业和实战，我们针对每一位学员1对1批改；<br>不是简单的打分式批改，是详细的逐行代码批改。</article>-->
<!--          </section>-->
<!--          <section class="item4"><img-->
<!--            src="//hcdn1.luffycity.com/static/frontend/index/manage@2x_1567483309.7750795.png">-->
<!--            <p>导师 + 班主任督学</p>-->
<!--            <article>导师全程陪伴式辅导，7*24h学习群答<br>疑。班主任定期跟进学习进度，彻底治<br>愈您的拖延症。-->
<!--            </article>-->
<!--          </section>-->
<!--          <section class="item5"><img-->
<!--            src="//hcdn1.luffycity.com/static/frontend/index/test@2x_1567483310.9115348.png">-->
<!--            <p>能力测验 + 就业推荐</p>-->
<!--            <article>智能题库针对知识点精准测验，<br>查漏补缺；就业老师1V1模拟面<br>试，推荐就业。</article>-->
<!--          </section>-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
<!--    <div class="know-luffy">-->
<!--      <h1>带你认识路飞学城</h1>-->
<!--      <ul class="luffy-items">-->
<!--        <li>-->
<!--          <img src="//hcdn1.luffycity.com/static/frontend/index/qiye@2x_1567483310.1013422.png">-->
<!--          <p>路飞的愿景</p>-->
<!--          <span>成为中国社会公认的最受信赖IT教育品牌</span>-->
<!--        </li>-->
<!--        <li>-->
<!--          <img src="//hcdn1.luffycity.com/static/frontend/index/diannao@2x_1567483308.2864695.png">-->
<!--          <p>路飞的使命</p>-->
<!--          <span>为学员提供高质量的IT课程和服务，帮助年轻<br>人通过努力学习获得体面的工作和生活</span>-->
<!--        </li>-->
<!--        <li>-->
<!--          <img src="//hcdn1.luffycity.com/static/frontend/index/renwu@2x_1567483310.1931462.png">-->
<!--          <p>路飞的价值观</p>-->
<!--          <span>诚实正直、追求卓越、团队精神、信守承诺<br>公平正义</span>-->
<!--        </li>-->
<!--      </ul>-->
<!--      <button data-toggle="modal" data-target="#LuffyCityVideo" data-whatever="@mdo">-->
<!--        <img class="img1" src="/static/images/bofang.png" alt="bofang">-->
<!--        <img class="img2" src="/static/images/bofang-bak14.png" alt="bofang-bak14">-->
<!--        <span>带你认识路飞学城</span>-->
<!--      </button>-->
<!--      <div class="modal fade" id="LuffyCityVideo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">-->
<!--        <div class="modal-dialog" role="document">-->
<!--          <div class="modal-content">-->
<!--            <div class="popup-content">-->
<!--              <iframe src="//player.bilibili.com/player.html?aid=24491161&bvid=BV1mW411A7vm&cid=41131694&page=1"-->
<!--                      width="750" height="500" scrolling="no" border="0" frameborder="no" framespacing="0"-->
<!--                      allowfullscreen="true"></iframe>-->
<!--            </div>-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
  </div>
</template>

<script>
  import Side from "../Common/Side";

  export default {
    name: "Home",
    data() {
      return {
        sliderImages: [
          {
            id: 1,
            imgSrc: '/static/images/homeBanner1.png'
          },
          {
            id: 2,
            imgSrc: '/static/images/homeBanner2.png'
          },
          {
            id: 3,
            imgSrc: '/static/images/homeBanner3.png'
          }
        ]
      };
    },
    components: {
      Side,
    },
  }
</script>

<style scoped>
  a {
    text-decoration: none;
  }

  .luffy-city .home-courses {
    margin-top: 58px;
    width: 100%;
    height: auto;
    background: #fff;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .title {
    width: 100%;
    text-align: center;
  }

  .luffy-city .title h1 {
    color: #333;
    font-size: 28px;
    font-weight: 400;
  }

  .luffy-city .title p {
    margin-top: 14px;
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
  }

  .luffy-city .home-courses .content {
    width: 1200px;
  }

  .luffy-city .home-courses .content .more {
    width: 100%;
    font-size: 14px;
    margin-top: 12px;
    padding-right: 20px;
    margin-bottom: 23px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: end;
    justify-content: flex-end;
  }

  .luffy-city .home-courses .content .more a {
    color: #9d9d9d;
  }

  .luffy-city .home-courses .content .more a img {
    width: 14px;
    height: 14px;
    margin-left: 5px;
  }

  .luffy-city .home-courses .content ul {
    width: 1200px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-bottom: 38px;
  }

  .luffy-city .home-courses .content ul li {
    width: 384px;
    height: auto;
  }

  .luffy-city .home-courses .content ul li .img-box {
    width: 100%;
    height: 217px;
    position: relative;
  }

  .luffy-city .home-courses .content ul li .img-box div {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: hsla(0, 0%, 100%, .2);
    display: none;
    z-index: 1;
  }

  .luffy-city .home-courses .content ul li .img-box img {
    width: 100%;
    height: 217px;
    border-radius: 4px 4px 0 0;
  }

  .luffy-city .home-courses .content ul li .course-item {
    width: 384px;
    height: 137px;
    background: #fff;
    padding-left: 22px;
    padding-right: 22px;
    box-sizing: border-box;
    border-radius: 0 0 4px 4px;
    box-shadow: 0 5px 20px 0 #e8e8e8;
    border-top: 1px solid transparent;
  }

  .luffy-city .home-courses .content ul li .course-item .title {
    width: 340px;
    color: #5e5e5e;
    font-size: 16px;
    margin-top: 39px;
    margin-bottom: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align: left;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num {
    color: #9d9d9d;
    font-size: 14px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num img {
    width: 17px;
    height: 17px;
    margin-right: 7px;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num span:nth-of-type(2) {
    margin-left: 24px;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .price {
    font-size: 14px;
    color: #9d9d9d;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .price .price1 {
    color: #fa6240;
  }

  .luffy-city .home-courses .content ul a {
    width: 377px;
    margin-right: 23px;
  }

  .luffy-city .home-courses .content ul li {
    width: 384px;
    height: auto;
  }

  .luffy-city .home-courses .content ul li .img-box {
    width: 100%;
    height: 217px;
    position: relative;
  }

  .luffy-city .home-courses .content ul li .img-box div {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: hsla(0, 0%, 100%, .2);
    display: none;
    z-index: 1;
  }

  .luffy-city .home-courses .content ul li .img-box img {
    width: 100%;
    height: 217px;
    border-radius: 4px 4px 0 0;
  }

  .luffy-city .home-courses .content ul li .course-item {
    width: 384px;
    height: 137px;
    background: #fff;
    padding-left: 22px;
    padding-right: 22px;
    box-sizing: border-box;
    border-radius: 0 0 4px 4px;
    box-shadow: 0 5px 20px 0 #e8e8e8;
    border-top: 1px solid transparent;
  }

  .luffy-city .home-courses .content ul li .course-item .title {
    width: 340px;
    color: #5e5e5e;
    font-size: 16px;
    margin-top: 39px;
    margin-bottom: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align: left;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num {
    color: #9d9d9d;
    font-size: 14px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num img {
    width: 17px;
    height: 17px;
    margin-right: 7px;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .num span:nth-of-type(2) {
    margin-left: 24px;
  }

  .luffy-city .home-courses .content ul li .course-item .item-number .price {
    font-size: 14px;
    color: #9d9d9d;
  }

  .luffy-city .home-courses .content .combat {
    padding-bottom: 0;
  }

  .luffy-city .employment-course {
    width: 100%;
    height: auto;
    background: #fff;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 100px;
    padding-bottom: 100px;
  }

  .luffy-city .title {
    width: 100%;
    text-align: center;
  }

  .luffy-city .title p {
    margin-top: 14px;
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
  }

  .luffy-city .employment-course ul {
    width: 1200px;
    margin-top: 40px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .employment-course ul a li {
    width: 586px;
    height: auto;
  }

  .luffy-city .employment-course ul a li img {
    width: 100%;
    height: 248px;
    border-radius: 4px 4px 0 0;
  }

  .luffy-city .employment-course ul a li .course-item {
    width: 100%;
    background: #fff;
    padding: 32px 22px 34px;
    box-sizing: border-box;
    box-shadow: 0 5px 20px 0 #e8e8e8;
    border-radius: 0 0 4px 4px;
  }

  .luffy-city .employment-course ul a li .course-item .title {
    color: #5e5e5e;
    font-size: 16px;
    margin-bottom: 12px;
  }

  .luffy-city .employment-course ul a li .course-item .num {
    font-size: 14px;
    color: #9d9d9d;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .employment-course ul a li .course-item .num img {
    width: 17px;
    height: 17px;
    margin-right: 7px;
  }

  .luffy-city .employment-course ul a li .course-item .num span:nth-of-type(2) {
    margin-left: 24px;
  }

  .luffy-city .study-problem {
    width: 100%;
    height: auto;
    background: #f9f9f9;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-bottom: 70px;
  }

  .luffy-city .study-problem h1 {
    color: #333;
    font-weight: 400;
    font-size: 36px;
    margin-top: 110px;
    margin-bottom: 60px;
  }

  .luffy-city .study-problem ul {
    width: 1200px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .luffy-city .study-problem ul li {
    text-align: center;
    width: 279px;
  . luffy-city . solve-problem . content-item sectio height: 244 px;
    background: #fff;
    margin-right: 21px;
    margin-bottom: 34px;
  }

  .luffy-city .study-problem ul li img {
    width: 100px;
    height: 73px;
    margin-top: 60px;
  }

  .luffy-city .study-problem ul li p {
    font-size: 18px;
    color: #5e5e5e;
    margin-top: 12px;
    margin-bottom: 6px;
  }

  .luffy-city .study-problem ul li span {
    color: #5e5e5e;
    font-size: 18px;
  }

  .luffy-city .solve-problem {
    width: 100%;
    height: auto;
    background: #f9f9f9;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    padding-bottom: 60px;
  }

  .luffy-city .solve-problem .problem-title {
    font-weight: 400;
    text-align: center;
    line-height: 117px;
    width: 652px;
    height: 117px;
    color: #333;
    background: #fff;
    font-size: 36px;
    box-shadow: 0 10px 20px 0 #fafafa;
    z-index: 1;
  }

  .luffy-city .solve-problem .content {
    margin-top: -42px;
    width: 1200px;
    height: 818px;
    background: #fff;
    padding-top: 73px;
  }

  .luffy-city .title {
    width: 100%;
    text-align: center;
  }

  .luffy-city .solve-problem .content .title h1 {
    font-size: 24px;
  }

  .luffy-city .title p {
    margin-top: 14px;
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
  }

  .luffy-city .solve-problem .content-item {
    width: 1200px;
    margin-top: 52px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    position: relative;
    padding-bottom: 117px;
  }

  .luffy-city .solve-problem .content-item img {
    width: 498px;
    height: auto;
    margin-top: 14px;
  }

  .luffy-city .solve-problem .content-item section {
    position: absolute;
  }

  .luffy-city .solve-problem .item2 {
    right: 236px;
    top: 110px;
  }

  .luffy-city .solve-problem .item3 {
    left: 240px;
    top: 207px;
  }

  .luffy-city .solve-problem .item4 {
    right: 157px;
    bottom: 115px;
  }

  .luffy-city .solve-problem .item5 {
    left: 240px;
    bottom: 50px;
  }

  .luffy-city .home-teacher .teacher-page li {
    width: 76px;
    height: 73px;
    margin-right: 34px;
    overflow: hidden;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    cursor: pointer;
  }

  .luffy-city .home-teacher .teacher-page .this img {
    width: 72px;
    height: 65px;
    border: 2px solid #ffc210;
  }

  .luffy-city .home-teacher .teacher-page li img {
    width: 67px;
    height: 64px;
    border-radius: 8px;
    border: 2px solid #eee;
  }

  .luffy-city .solve-problem .item1 {
    left: 240px;
    top: 0;
  }

  .luffy-city .solve-problem .content-item section img {
    width: 81px;
    height: auto;
    margin-top: 0;
  }

  .luffy-city .solve-problem .content-item section p {
    font-size: 18px;
    color: #4a4a4a;
    margin-top: 3px;
  }

  .luffy-city .solve-problem .content-item section article {
    font-size: 14px;
    font-weight: 300;
    color: #9d9d9d;
    margin-top: 3px;
  }


  .luffy-city .home-teacher h1 {
    font-weight: 400;
    color: #333;
    font-size: 28px;
    margin-top: 110px;
    margin-bottom: 33px;
  }


  .luffy-city .home-teacher .teacher-wrap .left img, .luffy-city .home-teacher .teacher-wrap .right img {
    width: 100%;
    height: 100%;
  }

  .luffy-city .home-teacher .teacher-item ul {
    width: 5754px;
    height: 428px;
    display: -ms-flexbox;
    display: flex;
  }

  .luffy-city .home-teacher .teacher-item ul li {
    width: 822px;
    height: 428px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro article {
    width: 100%;
    height: 192px;
    font-size: 14px;
    font-weight: 300;
    color: #5e5e5e;
    line-height: 24px;
    margin-top: 10px;
    margin-bottom: 42px;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p {
    width: 128px;
    height: auto;
    position: relative;
    cursor: pointer;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p span {
    text-align: center;
    display: block;
    width: 100%;
    color: #9d9d9d;
    font-size: 13px;
    font-weight: 300;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .side .this, .luffy-city .learn-outcomes .outcomes-cotent .side li:hover {
    color: #d0d0d0;
    box-shadow: -2px 0 0 0 #ffc210;
    background: linear-gradient(270deg, #1b1d26, #353949);
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section ul {
    color: #fff;
    margin-top: 18px;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
    margin-bottom: 10px;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section ul li span {
    width: 100px;
    height: auto;
    font-weight: 300;
    display: inline-block;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section ul li article {
    width: 760px;
    color: #fff;
    font-size: 14px;
    font-weight: 300;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .side li {
    height: 80px;
    color: #fff;
    font-weight: 400;
    font-size: 18px;
    line-height: 80px;
    padding-left: 101px;
    cursor: pointer;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items h1 {
    margin-top: 67px;
    margin-left: 150px;
    margin-bottom: 50px;
    font-size: 36px;
    font-weight: 400;
    color: #fff;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section {
    padding-bottom: 30px;
    margin-bottom: 30px;
    border-bottom: 1px solid #65666b;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl .user-img img {
    width: 100%;
    height: 100%;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl dd {
    -ms-flex: 1;
    flex: 1;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section:nth-of-type(2) {
    border: none;
    margin-bottom: 0;
    padding-bottom: 0;
  }


  .luffy-city .know-luffy {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 100px;
  }

  .luffy-city .know-luffy h1 {
    font-size: 36px;
    font-weight: 400;
    color: #333;
  }

  .luffy-city .know-luffy .luffy-items {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    margin-top: 95px;
  }

  .luffy-city .know-luffy .luffy-items li {
    text-align: center;
  }

  .luffy-city .know-luffy .luffy-items li img {
    width: 48px;
    height: 42px;
    margin-bottom: 21px;
  }

  .luffy-city .know-luffy .luffy-items li p {
    font-size: 20px;
    margin-bottom: 6px;
    color: #333;
  }

  .luffy-city .know-luffy .luffy-items li span {
    font-size: 16px;
    font-weight: 300;
    color: #5e5e5e;
    line-height: 32px;
  }

  .luffy-city .know-luffy .luffy-items li:nth-of-type(2) {
    margin-left: 32px;
    margin-right: 32px;
  }

  .luffy-city .know-luffy .luffy-items li {
    text-align: center;
  }

  .luffy-city .know-luffy button {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    width: 321px;
    height: 48px;
    border: 1px solid #f5a623;
    margin-top: 46px;
    margin-bottom: 46px;
    font-size: 16px;
    font-weight: 400;
    color: #f5a623;
    transition: all .2s ease-in-out;
  }

  .luffy-city .know-luffy button img {
    width: 16px;
    height: 16px;
    margin-right: 8px;
    transition: all .2s ease-in-out;
  }

  .luffy-city .know-luffy button .img2 {
    display: none;
  }

  .luffy-city .know-luffy button img {
    width: 16px;
    height: 16px;
    margin-right: 8px;
    transition: all .2s ease-in-out;
  }
</style>
