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
            <img src="static/images/home-right_1567483307.3430119.png" alt="home-right">
          </router-link>
        </div>
        <div class="courses">
          <ul class="free">
            <a target="_blank" href="https://www.luffycity.com/free/124">
              <li>
                <div class="img-box">
                  <div></div>
                  <img src="static/images/PY1@2x_1566529821.1110113.png">
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
                <img src="static/images/Linux1@2x_1566529820.6731546.png">
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
                  <img src="static/images/web1@2x(1)_1566529822.6339395.png">
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
                  <img src="static/images/algorithm@2x_1567483301.520899.png">
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
                  <img src="static/images/K8s@2x_1567483309.490485.png">
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
                  <img src="static/images/go@2x_1567483307.2209833.png">
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
    <div class="study-problem"><h1>在自学的路上，你是否也遇到了这些问题？</h1>
      <ul>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/1@2x_1567483299.734612.png">
          <p>自学自制力差坚持不下去</p> <span>01</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/2@2x_1567483299.815959.png">
          <p>遇到问题不知道该问谁</p> <span>02</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/3@2x_1567483299.9631536.png">
          <p>没有学习方向</p> <span>03</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/4@2x_1567483299.974014.png">
          <p>浪费大量时间&amp;机会成本</p> <span>04</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/5@2x_1567483300.1571927.png">
          <p>能看懂代码但不会写</p> <span>05</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/6@2x_1567483300.1598253.png">
          <p>没有学习氛围 严重拖延症</p> <span>06</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/7@2x_1567483300.3511646.png">
          <p>不知道该怎么学、学什么</p> <span>07</span></li>
        <li><img
          src="//hcdn1.luffycity.com/static/frontend/index/8@2x_1567483300.3661962.png">
          <p>学习进度慢到窒息，慢到放弃</p> <span>08</span></li>
      </ul>
    </div>
    <div class="solve-problem"><h1 class="problem-title">路飞学城帮你解决所有问题！</h1>
      <div class="content">
        <div class="title"><h1>更符合在线学习的“学、练、改、管、测”教学模式</h1>
          <p>基于“输入、输出、纠正”的科学方法论，业内独创1v1辅导+闯关考核学习模式，自学失败者的救星，学好IT的正确途径</p></div>
        <div class="content-item"><img
          src="//hcdn1.luffycity.com/static/frontend/index/line@2x_1567483309.5746026.png">
          <section class="item1"><img
            src="//hcdn1.luffycity.com/static/frontend/index/study@2x_1567483310.8556564.png">
            <p>在线视频学习</p>
            <article>知名网红讲师真人出境，专为线上录<br>制。高清录播，重复观看，利用碎片化<br>时间系统学习，巩固复习。
            </article>
          </section>
          <section class="item2"><img
            src="//hcdn1.luffycity.com/static/frontend/index/practice@2x_1567483309.9485178.png">
            <p>章节作业 + 阶段测试</p>
            <article>章节结束，导师布置作业。<br>阶段结束，导师指导实战测试，根<br>据结果为学员量身定制学习计划。
            </article>
          </section>
          <section class="item3"><img
            src="//hcdn1.luffycity.com/static/frontend/index/fix@2x_1567483306.8539662.png">
            <p>逐行代码批改</p>
            <article>所有作业和实战，我们针对每一位学员1对1批改；<br>不是简单的打分式批改，是详细的逐行代码批改。</article>
          </section>
          <section class="item4"><img
            src="//hcdn1.luffycity.com/static/frontend/index/manage@2x_1567483309.7750795.png">
            <p>导师 + 班主任督学</p>
            <article>导师全程陪伴式辅导，7*24h学习群答<br>疑。班主任定期跟进学习进度，彻底治<br>愈您的拖延症。
            </article>
          </section>
          <section class="item5"><img
            src="//hcdn1.luffycity.com/static/frontend/index/test@2x_1567483310.9115348.png">
            <p>能力测验 + 就业推荐</p>
            <article>智能题库针对知识点精准测验，<br>查漏补缺；就业老师1V1模拟面<br>试，推荐就业。</article>
          </section>
        </div>
      </div>
    </div>
    <div class="home-teacher"><h1>跟随业内知名网红讲师学习牛逼的课程</h1>
      <div class="teacher-wrap">
        <div class="left"><img
          src="//hcdn1.luffycity.com/static/frontend/index/left@2x_1567483309.3167448.png">
          <!--v-if-->  </div>
        <div class="right cancl"><img
          src="//hcdn1.luffycity.com/static/frontend/index/right@2x_1567483310.2263303.png">
          <!--v-if-->  </div>
        <div class="teacher-item">
          <ul>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big1_1567483304.1961453.png">
              <div class="teacher-intro"><p class="name">Alex | 教学总监</p>
                <article> 老男孩教育CTO &amp; CO-FOUNDER；<br> 国内知名PYTHON语言推广者；<br
                > 51CTO学院2016\2017年度最受学员喜爱10大讲师之一；<br> 多款开源软件作者；<br>
                  曾任职公安部、飞信、中金公司、NOKIA中国研究院、华尔街英语、ADVENT、汽车之家等公司；
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item1_1567483307.4876392.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >Django介绍</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item2_1567483307.661028.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >软件开发目录规范</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big2_1567483304.886989.png">
              <div class="teacher-intro"><p class="name">老男孩 | 老男孩教育创始人</p>
                <article> 老男孩，北京老男孩IT教育创始人，<br>
                  拥有十多年一线大规模网站集群运维架构实战经验及教学培训经验，曾主导了从几台到上千台规模集群运维架构的扩展，运维架构实战知识体系全面；<br>
                  擅长大规模集群架构部署调优、虚拟化、云计算、大数据、MySQL数据库等技术，是IT界资深的Linux集群架构实战专家。
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item3_1567483307.8005805.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >如何才能学好Shell编程</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item4_1567483308.015547.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >Shell编程实战开篇</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big3_1567483304.996755.png">
              <div class="teacher-intro"><p class="name">Wusir | Python学科带头人</p>
                <article> 多年开发实战经验，先后任职于汽车之家、好大夫在线等多家大型互联网公司；<br> 擅长C#,Python,PHP等一大堆语言开发；<br
                > 现任某大型互联网公司高级自动化开发工程师；已精读多个开源软件源码；<br> 自行开发过改进版的Tornado WEB框架，讲课风趣幽默。
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item5_1567483308.156477.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >初识编码</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item6_1567483308.3672535.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >登录了解一下</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big4_1567483305.7660875.png">
              <div class="teacher-intro"><p class="name">林海峰 | 金牌讲师</p>
                <article> 老男孩教育Python学科金牌讲师，<br> 曾任某上市公司云计算部门主管。<br>
                  多年一线运维和开发经验，<br> 追求完美的技术分享者，<br> 被技术耽误的相声演员。
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item7_1567483308.4830608.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >面向过程编程</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item8_1567483308.5856338.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >编程范式</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big5_1567483305.5877552.png">
              <div class="teacher-intro"><p class="name">赵博士 | 金牌讲师</p>
                <article> 清华大学计算机博士，<br> 爱好研究高精尖算法，精读Python源码，<br>
                  了解Python解释器底层技术实现；<br> 擅长领域：C/C++、Python、Java、金融量化分析、机器学习与人工智能等；<br>
                  擅长将枯燥的专业知识生动形象的表达出来，深入浅出，深受学员喜爱。
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item9_1567483308.625625.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >股票基本知识和股票分类</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item10_1567483308.8588307.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >基本金融知识介绍</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big6_1567483306.210167.png">
              <div class="teacher-intro"><p class="name">苑昊 | 金牌讲师</p>
                <article> 老男孩教育金牌讲师，<br> 曾参与新加坡南洋理工大学大数据医疗相关项目，就职过多家互联网企业，<br
                > 有着多年开发经验，<br>
                  精通java,python,go等编程语言，Uric开源软件作者，致力于人工智能与大数据方向，对机器学习，深度学习等算法有深度研究。
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item11_1567483308.8585577.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >web应用程序</span></p>
                  <p><img class="img1" src="//hcdn1.luffycity.com/static/frontend/index/item12_1567483308.996621.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >Django基础介绍</span></p></div>
              </div>
            </li>
            <li><img class="teacher-img"
                     src="//hcdn1.luffycity.com/static/frontend/index/big7_1567483306.6965044.png">
              <div class="teacher-intro"><p class="name">李泳谊 | 金牌讲师</p>
                <article> 90后新兴讲师，师从业内顶级Linux专家老男孩老师，多年一线运维经验，<br> 讲课坚持以各种图形表达抽象概念。<br
                > 用简单粗暴的例子表达课上内容。<br>
                  追求讲到你懂了为止，适合零基础入门的小伙伴。曾分享录制awk数组实战分享，http原理实战分享等精品视频，受益数千人，深得网友喜爱！
                </article>
                <div class="thumbnail-box"><p><img class="img1"
                                                   src="//hcdn1.luffycity.com/static/frontend/index/item13_1567483309.090055.png">
                  <img class="play"
                       src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                  >添加用户</span></p>
                  <p><img class="img1"
                          src="//hcdn1.luffycity.com/static/frontend/index/item14_1567483309.1793697.png">
                    <img class="play"
                         src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png"> <span
                    >变量与PS1</span></p></div>
              </div>
            </li>
          </ul>
        </div>
        <ul class="teacher-page">
          <li class="this">
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small1_1567483310.3304322.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small2_1567483310.3595684.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small3_1567483310.4708838.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small4_1567483310.4806776.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small5_1567483310.6073756.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small6_1567483310.7209144.png">
            </p>
          </li>
          <li>
            <p>
              <img src="//hcdn1.luffycity.com/static/frontend/index/small7_1567483310.7275276.png">
            </p>
          </li>
        </ul>
      </div>
    </div>
    <div class="learn-outcomes">
      <div class="outcomes-cotent">
        <ul class="side">
          <li class="this">同学说</li>
          <li>Offer墙</li>
          <li>同学感言</li>
          <li>学员上课笔记</li>
          <li>作业批改</li>
        </ul>
        <div class="outcomes-items">
          <h1>路飞学员成果</h1>
          <div class="module-wrap classmate-say">
            <section key="0">
              <dl>
                <dt class="user-img">
                  <img alt="" src="//hcdn1.luffycity.com/static/frontend/head_portrait/logo@2x.png">
                </dt>
                <dd>
                  <p class="name">刘**</p>
                  <p class="intro">
                    <span>电商运营经理 | 立白集团</span>
                    <span>2020-05-01报名</span>
                  </p>
                </dd>
              </dl>
              <ul>
                <li>
                  <span>报名课程：</span>
                  <article>Python全栈开发（中级）</article>
                </li>
                <li>
                  <span>为何报此课：</span>
                  <article>
                    主要目的提升个人能力，目前主要希望学习爬虫和数据分析方面的技巧，毕竟在电商销售行业目前，复盘都是结合数据来的，但是目前个人能力还是仅限excel，个人会一些VBA，正是因为这样，也知道学好pyhton的重要性
                  </article>
                </li>
                <li>
                  <span>为何选路飞：</span>
                  <article>
                    看了Alex老师的视频，更加下决心要学好python，以前自己自学过，进度非常慢，因为大学专业不是计算机，理解一些计算机的运行方式以及相关的专业词汇很绕，感觉很浪费时间，为了提高效率，选择报班。
                  </article>
                </li>
                <li>
                  <span>你的期待：</span>
                  <article>6个月后能通过爬虫获取数据，并结合现有数据，进行数据分析，给项目运营带来有价值的参考。</article>
                </li>
              </ul>
            </section>
            <section key="1">
              <dl>
                <dt class="user-img">
                  <img alt="" src="//hcdn1.luffycity.comstatic/frontend/head_portrait/logo@2x.png">
                </dt>
                <dd>
                  <p class="name">王**</p>
                  <p class="intro">
                    <span>运维工程师 | 更美app</span>
                    <span>2020-04-28报名</span>
                  </p></dd>
              </dl>
              <ul>
                <li>
                  <span>报名课程：</span>
                  <article>Python全栈开发（中级）</article>
                </li>
                <li>
                  <span>为何报此课：</span>
                  <article>运维要会开发 提升自己。运维不会开发不行。多挣钱。还得写这么多。不会开发发展有瓶颈。</article>
                </li>
                <li>
                  <span>为何选路飞：</span>
                  <article>入行就是老男孩、从linux培训班开始的。实际运维工作已经满三年。好评。好的没话说。真的真的 。oldboy，人生导师，指路明灯</article>
                </li>
                <li>
                  <span>你的期待：</span>
                  <article>有成熟的、独立的平台开发能力。差异化发展，要做运维工程师中，开发能力最牛逼的那帮人。</article>
                </li>
              </ul>
            </section>
          </div>
          <div class="module-wrap offer-wall" style="display: none;">
            <div class="offer-wall-contain"></div>
          </div>
          <div class="module-wrap classmate-speech" style="display: none;"></div>
          <div class="module-wrap lecture-notes" style="display: none;">
            <div class="lecture-notes-contain"></div>
          </div>
          <div class="module-wrap home-homework" style="display: none;">
            <img src="//hcdn1.luffycity.com/static/frontend/index/QQ20190903-0_1567505672.220265.jpeg">
            <img src="//hcdn1.luffycity.com/static/frontend/index/QQ20190903-1_1567505672.3231828.jpeg">
            <img src="//hcdn1.luffycity.com/static/frontend/index/QQ20190903-2_1567505674.3654132.jpeg">
            <img src="//hcdn1.luffycity.com/static/frontend/index/QQ20190903-3_1567505672.7459126.jpeg">
          </div>
          <a target="_blank" class="look-more" href="https://www.luffycity.com/students">查看更多</a>
        </div>
      </div>
    </div>
    <div class="know-luffy">
      <h1>带你认识路飞学城</h1>
      <ul class="luffy-items">
        <li>
          <img src="//hcdn1.luffycity.com/static/frontend/index/qiye@2x_1567483310.1013422.png">
          <p>路飞的愿景</p>
          <span>成为中国社会公认的最受信赖IT教育品牌</span>
        </li>
        <li>
          <img src="//hcdn1.luffycity.com/static/frontend/index/diannao@2x_1567483308.2864695.png">
          <p>路飞的使命</p>
          <span>为学员提供高质量的IT课程和服务，帮助年轻<br>人通过努力学习获得体面的工作和生活</span>
        </li>
        <li>
          <img src="//hcdn1.luffycity.com/static/frontend/index/renwu@2x_1567483310.1931462.png">
          <p>路飞的价值观</p>
          <span>诚实正直、追求卓越、团队精神、信守承诺<br>公平正义</span>
        </li>
      </ul>
      <button>
        <img class="img1" src="//hcdn1.luffycity.com/static/frontend/index/bofang-2@2x_1567483306.3789.png">
        <img class="img2" src="//hcdn1.luffycity.com/static/frontend/index/bofang-bak14@2x_1567483306.550233.png">
        <span>带你认识路飞学城</span>
      </button>
    </div>
    <div class="home-img">
      <img alt="" src="" style="max-width: 1403px; max-height: 737px;">
    </div>
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
            imgSrc: 'https://hcdn2.luffycity.com/media/frontend/index/banner.png'
          },
          {
            id: 2,
            imgSrc: 'https://hcdn2.luffycity.com/media/frontend/index/%E7%94%BB%E6%9D%BF.png'
          },
          {
            id: 3,
            imgSrc: 'https://hcdn1.luffycity.com/static/frontend/index/banner@2x_1574647618.8112254.png'
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
    font-family: DIN Alternate Bold;
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

  .luffy-city .home-teacher .teacher-wrap .left, .luffy-city .home-teacher .teacher-wrap .right {
    width: 29px;
    height: 54px;
    position: absolute;
    top: 180px;
  }

  .luffy-city .home-teacher .teacher-wrap .right {
    right: 0;
  }

  .luffy-city .home-teacher .teacher-wrap .left, .luffy-city .home-teacher .teacher-wrap .right {
    width: 29px;
    height: 54px;
    position: absolute;
    top: 180px;
  }

  .luffy-city .solve-problem .item5 {
    left: 240px;
    bottom: 50px;
  }

  .luffy-city .home-teacher .teacher-page {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: end;
    align-items: flex-end;
    -ms-flex-pack: center;
    justify-content: center;
    margin-top: 50px;
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

  .luffy-city .home-teacher {
    width: 100%;
    height: auto;
    margin-bottom: 119px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .home-teacher h1 {
    font-weight: 400;
    color: #333;
    font-size: 28px;
    margin-top: 110px;
    margin-bottom: 33px;
  }

  .luffy-city .home-teacher .teacher-wrap {
    width: 1100px;
    height: auto;
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .home-teacher .teacher-wrap .left {
    left: 0;
  }

  .luffy-city .home-teacher .teacher-wrap .left img, .luffy-city .home-teacher .teacher-wrap .right img {
    width: 100%;
    height: 100%;
  }

  .luffy-city .home-teacher .teacher-wrap .cancl {
    cursor: pointer;
  }

  .luffy-city .home-teacher .teacher-wrap .right {
    right: 0;
  }

  .luffy-city .home-teacher .teacher-item {
    width: 822px;
    height: 100%;
    overflow: hidden;
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

  .luffy-city .home-teacher .teacher-item ul li .teacher-img {
    width: 503px;
    height: 428px;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro {
    width: 273px;
    height: auto;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .name {
    font-size: 18px;
    font-weight: 400;
    color: #f5a623;
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

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p {
    width: 128px;
    height: auto;
    position: relative;
    cursor: pointer;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p .img1 {
    width: 100%;
    height: 90px;
    margin-bottom: 10px;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p .play {
    width: 16px;
    height: 16px;
    position: absolute;
    left: 50%;
    top: 37px;
    margin-left: -8px;
    transition: all .3s ease-in-out;
  }

  .luffy-city .home-teacher .teacher-item ul li .teacher-intro .thumbnail-box p span {
    text-align: center;
    display: block;
    width: 100%;
    color: #9d9d9d;
    font-size: 13px;
    font-weight: 300;
  }

  .luffy-city .learn-outcomes {
    width: 100%;
    height: 784px;
    background: url(//hcdn1.luffycity.com/static/frontend/index/bg_1567483304.237666.png);
    background-size: 100% 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .luffy-city .learn-outcomes .outcomes-cotent {
    width: 1198px;
    height: auto;
    display: -ms-flexbox;
    display: flex;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .side {
    width: 282px;
    height: 784px;
    background: linear-gradient(180deg, rgba(25, 28, 36, .28), #1b1d26 43%, rgba(27, 29, 39, .21));
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    margin-right: 66px;
    -ms-flex-pack: center;
    justify-content: center;
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

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items {
    position: relative;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items h1 {
    margin-top: 67px;
    margin-left: 150px;
    margin-bottom: 50px;
    font-size: 36px;
    font-weight: 400;
    color: #fff;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .module-wrap {
    width: 850px !important;
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

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl .user-img {
    width: 44px;
    height: 44px;
    border-radius: 100%;
    overflow: hidden;
    margin-right: 13px;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl .user-img img {
    width: 100%;
    height: 100%;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl dd {
    -ms-flex: 1;
    flex: 1;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl dd .name {
    color: #fff;
    font-size: 16px;
    margin-bottom: 7px;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section dl dd .intro {
    width: 100%;
    color: #d0d0d0;
    font-size: 14px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-say section:nth-of-type(2) {
    border: none;
    margin-bottom: 0;
    padding-bottom: 0;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .offer-wall {
    height: 500px;
    overflow: hidden;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .offer-wall .offer-wall-contain {
    width: 100%;
    text-align: center;
    -webkit-column-count: 3;
    column-count: 3;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .classmate-speech {
    width: 850px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .lecture-notes {
    height: 500px;
    overflow: hidden;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .lecture-notes .lecture-notes-contain {
    width: 100%;
    text-align: center;
    -webkit-column-count: 3;
    column-count: 3;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .home-homework {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .luffy-city .learn-outcomes .outcomes-cotent .outcomes-items .look-more {
    display: block;
    margin-top: 30px;
    width: 148px;
    height: 42px;
    color: #f5a623;
    font-size: 14px;
    font-weight: 400;
    border: 1px solid #f5a623;
    line-height: 42px;
    margin-left: 186px;
    text-align: center;
    transition: all .2s ease-in-out;
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
