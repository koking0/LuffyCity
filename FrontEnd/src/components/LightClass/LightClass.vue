<template>
  <div class="light-course">
    <div class="controls">
      <div class="functions btn-group">
        <div class="btn active" data-function="sin(sqrt(x^2+z^2))">sin(sqrt(x^2+z^2))</div>
        <div class="btn" data-function="cos(x)*sin(z)">cos(x)*sin(z)</div>
      </div>
      <div class="rotate btn-group">
        <div class="btn rotatex" data-rotate="x">rotatex</div>
        <div class="btn rotatey active" data-rotate="y">rotatey</div>
        <div class="btn rotatez" data-rotate="z">rotatez</div>
      </div>
    </div>
    <canvas width="2560" height="520"
            style="min-width: 1200px; width: 101%; height: 520px;position: absolute; left: -1px;z-index: 1; background: #080516"
    ></canvas>
    <div class="light-head"><h1>轻课是什么？怎么学习？</h1>
      <p>路飞学城&amp;老男孩IT打造的线下面授同步网络班，报名此课程学员无需来线<br>下，也可在线同步学习50万+年薪名师的精品前沿课程</p>
      <button><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (4)_1556593146.779957.svg">名师在讲课ing...
      </button>
      <ul>
        <li>老男孩线下班开班<img alt=""
                         src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
        </li>
        <li>讲师随堂录屏<img alt=""
                       src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
        </li>
        <li>视频上传至路飞平台<img alt=""
                          src="//hcdn1.luffycity.com/static/frontend/course/86/下载 (5)_1556593146.6907642.svg">
        </li>
        <li>线上学员同步学习</li>
      </ul>
    </div>
    <div class="discipline divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">正在上课的学科</p> <span class="p">老男孩教育50万年薪金牌名师亲自上阵授课，名师更易出高徒</span>
      </h1>
      <div class="discipline-list div-3">
        <dl>
          <dt><img src="//hcdn2.luffycity.com/media/frontend/degreecourse/web.png"></dt>
          <dd><h3>大前端-Web全栈高级进阶之路</h3> <h4>5个月全面深入学习一线大厂前端岗位必备技能</h4>
            <p>周期：5个月</p> <span>¥7999<i>面授班原价19800</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/degreecourse/18/light-wusir_1565070479.922035.png">
          </dt>
          <dd><h3>Python开发工程师</h3> <h4>大学生、小白想要进入IT行业首选课程</h4>
            <p>周期：6～10个月</p> <span>¥ 4980<i>面授班原价21800</i></span></dd>
        </dl>
        <dl>
          <dt><img src="//hcdn2.luffycity.com/media/frontend/light_course/new-media.png">
          </dt>
          <dd><h3>新媒体短视频运营</h3> <h4>2020互联网时代高薪职业，不用敲代码也能拿高薪</h4>
            <p>周期：3个月</p> <span>¥ 3980<i>面授班原价12800</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/degreecourse/18/light-Linux_1565070479.8646674.png">
          </dt>
          <dd><h3>Linux云计算工程师</h3> <h4>玩转Linux，不用写代码，也能高薪就业</h4>
            <p>周期：5～8个月</p> <span>¥ 4680<i>面授班原价19800</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/course/100/fengmian_1571642437.6300552.png">
          </dt>
          <dd><h3>Golang编程工程师</h3> <h4>程序员升职加薪必学，BAT名企求职的敲门砖</h4>
            <p>周期：4个月</p> <span>¥ 3280<i>面授班原价8999</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/degreecourse/16/data-analysis_1565834938.9009902.jpeg">
          </dt>
          <dd><h3>数据挖掘分析师</h3> <h4>0基础，挑战“蚂蚁金服-风险大脑数据分析”大赛</h4>
            <p>周期：3个月</p> <span>¥ 3280<i>面授班原价3980</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/degreecourse/18/light-网络安全_1565070479.4973476.png">
          </dt>
          <dd><h3>网络安全工程师</h3> <h4>5个月成为行业稀缺的抢手网络安全人才</h4>
            <p>周期：5个月</p> <span>¥ 5980<i>面授班原价22800</i></span></dd>
        </dl>
        <dl>
          <dt><img
            src="//hcdn1.luffycity.com/static/frontend/degreecourse/18/light-自动化_1565070479.6595635.png">
          </dt>
          <dd><h3>自动化开发工程师</h3> <h4>学会开发，如虎添翼，变身大牛！</h4>
            <p>周期：5个月</p> <span>¥ 3980<i>面授班原价12800</i></span></dd>
        </dl>
        <dl>
          <dt><img src="//hcdn2.luffycity.com/media/frontend/light_course/qingkek8s.png">
          </dt>
          <dd><h3>8周炼成K8S企业级容器云架构师</h3> <h4>云计算时代，运维人员突破30万年薪必备核心技能</h4>
            <p>周期：8周</p> <span>¥ 2999<i>面授班原价8000</i></span></dd>
        </dl>
      </div>
    </div>
    <div class="server divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">我能享受什么服务？</p> <span class="p">大量实战案例+专业导师答疑指导，全面提升学员实战能力</span>
      </h1>
      <div class="server-list div-3">
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/icon1_1556593051.3603282.svg">
          </dt>
          <dd><p>答疑</p> <span>VIP学员群，讲师、助教全天候<br>答疑解惑</span>
          </dd>
        </dl>
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/icon2_1556593051.1835215.svg">
          </dt>
          <dd><p>50万年薪名师亲授</p> <span>老男孩50万年薪金牌名师亲自授课，<br>名师方能出高徒</span>
          </dd>
        </dl>
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/icon3_1556593051.0950744.svg">
          </dt>
          <dd><p>就业</p> <span>互联网大厂HR亲自简历、面试指导，<br>名企offer唾手可得</span>
          </dd>
        </dl>
      </div>
    </div>
    <div class="advantage divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">为何选择轻课，有何优势？</p> <span class="p">联合老男孩线下资深名师，提供完整随堂录制视频，100%对接教学、教务服务，<br
      >跟线下面授班同步学习，跟随好老师，才能学到好技术。</span></h1>
    </div>
    <div class="compare divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">高性价比</p> <span class="p">线下培训学费动辄2万元起，轻课同样的内容、同样的教学服务只需线下价格的1/4</span>
      </h1>
      <div class="compare-list div-3">
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/xiazai_1556593050.9199922.svg">
            <img alt=""
                 src="//hcdn1.luffycity.com/static/frontend/course/86/xiazai2_1556593049.418374.svg"
                 style="display: none;"></dt>
          <dd><p class="this">视频随堂录制</p> <span
            class="this">配套资料与线下班100%一致</span></dd>
        </dl>
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/qunzu 2_1556593050.4315534.svg"
                   style="display: none;"> <img alt=""
                                                src="//hcdn1.luffycity.com/static/frontend/course/86/qunzu_1556593050.831918.svg">
          </dt>
          <dd><p>线下同期学员群</p> <span>共享讲师答疑、交流、作业批改</span></dd>
        </dl>
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/shizi 2_1556593048.0851936.svg"
                   style="display: none;"> <img alt=""
                                                src="//hcdn1.luffycity.com/static/frontend/course/86/shizi_1556593050.4224687.svg">
          </dt>
          <dd><p>同一师资团队</p> <span>老男孩各大学科负责人亲授课</span></dd>
        </dl>
        <dl>
          <dt><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/jiuye2_1556593047.7005115.svg"
                   style="display: none;"> <img alt=""
                                                src="//hcdn1.luffycity.com/static/frontend/course/86/jiuye_1556593050.137003.svg">
          </dt>
          <dd><p>就业指导</p> <span>资深Hr助你拿下满意offer</span></dd>
        </dl>
      </div>
      <div class="compare-item div-4">
        <ul class="item1">
          <li><p>全部学习资料开放</p> <span>一期完整全套视频，随堂录制高清视频，<br>从0基础到项目实战全覆盖；</span>
          </li>
          <li><p>讲师课堂讲义</p> <span>每日项目源码、课件、作业讲解、<br
          >练习题等；</span></li>
          <li><p>企业面试真题<i>Hot</i></p> <span>全套600+名企面试真题，名企笔试<br
          >80%+通过率</span></li>
        </ul>
        <ul class="item1 item2" style="display: none;">
          <li><p>内部VIP学习群</p> <span>资料实时共享，学习资料、实用工具<br>群内实时共享；</span>
          </li>
          <li><p>讲师、导师答疑</p> <span>群内导师、讲师全天候随时答疑解惑、<br>作业批改，技术问题有问必答；</span>
          </li>
          <li><p>结识一票有志青年</p> <span>独学而无友，互相督促、共同进化；</span></li>
        </ul>
        <ul class="item3" style="display: none;">
          <li class="mli"><img alt=""
                               src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang1_1556593054.284643.png">
            <div><p>Alex</p> <span>Python学院院长，前Nokia\<br>中金公司\汽车之家架构师；</span>
            </div>
          </li>
          <li class="mli"><img alt=""
                               src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang2_1556593054.5109637.png">
            <div><p>Wusir</p> <span>Python学科带头人，前好大夫、<br>汽车之家资深开发；</span>
            </div>
          </li>
          <li class="mli"><img alt=""
                               src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang3_1556593054.5987673.png">
            <div><p>哪吒</p> <span>Go学科负责人；<br>前搜狗高级开发；</span>
            </div>
          </li>
          <li><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang4_1556593054.781876.png">
            <div><p>老男孩</p> <span>Linux学院院长，前淘宝技术顾问，<br>17年一线Linux实战专家；</span>
            </div>
          </li>
          <li><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang5_1556593054.8802521.png">
            <div><p>李泳谊</p> <span>Linux学科负责人，某互联网<br>名企云计算架构师；</span>
            </div>
          </li>
          <li><img alt=""
                   src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang6_1556593055.059774.png">
            <div><p>超哥</p> <span>Go金牌讲师；前清华大学<br>Java技术研究实验室研究员；</span>
            </div>
          </li>
        </ul>
        <ul class="item4" style="display: none;">
          <li class="li1"><img alt=""
                               src="//hcdn1.luffycity.com/static/frontend/course/86/touxiang7_1556593051.4455705.png">
            <div><p>程老师</p> <span>老男孩就业主管/资深HR出身/<br>6年IT教育就业工作经验</span>
            </div>
          </li>
          <li class="li2"><p>课程内容包含：</p> <span>就业市场分析；职业素质指导；<br
          >企业面试分析；简历辅导视频；</span></li>
          <li class="li3"><p>课程部分视频：<i>Hot</i></p>
            <div><img alt=""
                      src="//hcdn1.luffycity.com/static/frontend/course/86/shipin_1556593047.1503592.svg">1、求职前需要做哪些功课？
            </div>
            <div><img alt=""
                      src="//hcdn1.luffycity.com/static/frontend/course/86/shipin_1556593047.1503592.svg">2、简历编辑技巧和投递？
            </div>
            <div><img alt=""
                      src="//hcdn1.luffycity.com/static/frontend/course/86/shipin_1556593047.1503592.svg">3、如何顺利度过试用期？
            </div>
          </li>
          <li class="li2 li4"><p>干货资源分享</p> <span>提供简历模板，简历修改样例</span></li>
          <li class="li2 li5"><p>模拟面试</p> <span>线下学员模拟面试，线上交流经验</span></li>
          <li class="li2"><p>推荐就业</p> <span>合作企业就业坑位推荐</span></li>
        </ul>
      </div>
    </div>
    <div class="offline divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">同步线下班录播(T+5)</p> <span class="p">线下班授课实时录制，剪辑后到上传至路飞与线下班无缝对接</span>
      </h1>
      <img class="div-3" alt=""
           src="//hcdn1.luffycity.com/static/frontend/course/86/bg3_1556593052.2800472.png"></div>
    <div class="live divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">线下班上课实景</p></h1>
      <div class="live-imgs p">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img1_1556593052.6619174.png">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img2_1556593052.9112482.png">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img3_1556593053.1130233.png">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img4_1556593053.3696542.png">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img5_1556593053.5496523.png">
        <img alt="" src="//hcdn1.luffycity.com/static/frontend/course/86/img6_1556593053.7497458.png">
      </div>
    </div>
    <div class="question divtest sdiv on" data-animation="on">
      <h1 class="title"><p class="h1">常见问题</p></h1>
      <div class="question-list p">
        <ul>
          <li><p><i></i>如何学习面授同步班？</p>
            <span>报名完成后，可以直接通过我的教室进行学习，同时加入答疑VIP班级群。学习期间随时进入VIP班级群交流问题。每天1~2个小时，循序渐进充分掌握所学知识。</span>
          </li>
          <li><p><i></i>课程有效期？</p> <span>课程有效期18个月，有效期内视频无限次观看。</span>
          </li>
          <li><p><i></i>课程答疑服务有效期多久？</p> <span>进班后会有专属1v1答疑老师，负责问题解答、作业批改，答疑老师服务周期为6个月，过期后依然可享受群答疑服务。</span>
          </li>
          <li><p><i></i>学完能达到什么水平？</p> <span>老男孩的课程设计均以实战为主、就业为导向，只要认真学完，把课程里的知识点掌握、项目能独立做出来，找相关工作都能极大加分。老男孩线就业班毕业的学员平均工资在8-12k，进阶班毕业学员平均工资在15-25k。</span>
          </li>
          <li><p><i></i>是否支持分期？</p> <span>支持花呗分期。 <img
            alt=""
            src="//hcdn1.luffycity.com/static/frontend/course/86/花呗_1556593049.8391116.svg"> </span></li>
        </ul>
      </div>
    </div> <!--v-if--> </div>
</template>

<script>
  export default {
    name: "LightClass"
  }
</script>

<style scoped>
  .light-course {
    width: 100%;
    height: 100%;
    position: relative;
    border: 1px solid transparent;
  }

  .light-course .controls {
    width: 500px;
    display: inline-block;
    position: absolute;
    top: 0;
    left: 0;
  }

  .light-course canvas {
    pointer-events: none;
  }

  audio, canvas, progress, video {
    display: inline-block;
    vertical-align: baseline;
  }

  .light-course .light-head {
    width: 100%;
    height: 520px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    color: #fff;
    text-align: center;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 2;
  }

  .light-course .light-head h1 {
    margin-top: 80px;

    font-size: 40px;
  }

  .light-course .light-head p {
    color: #f2f2f3;
    width: 715px;
    height: auto;
    font-size: 18px;
    line-height: 44px;
    margin: 0 auto;
    margin-top: 25px;
    margin-bottom: 32px;
    font-family: PingFangSC-Light;
  }

  .light-course .light-head button {
    margin: 0 auto;
    width: 223px;
    height: 54px;
    font-size: 18px;
    color: #f2f2f3;
    background: transparent;
    border: 1px solid #fdfdfd;
    border-radius: 7px;
    margin-bottom: 76px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    font-family: PingFangSC-Light;
  }

  .light-course .light-head button img {
    width: 23px;
    height: 23px;
    margin-right: 14px;
  }

  .light-course .light-head ul {
    margin: 0 auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .light-course .light-head ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;

    font-size: 16px;
    color: #fafafa;
  }

  .light-course .light-head ul li img {
    width: 24px;
    height: auto;
    margin-left: 36px;
    margin-right: 36px;
  }

  .light-course .discipline {
    width: 100%;
    height: 1650px;
    background: #f8f8f8;
    padding-top: 140px;
    margin-top: 520px;
  }

  .title {
    width: 100%;
    height: auto;
    text-align: center;

  }

  .sdiv.on .div-2, .sdiv.on .div-3, .sdiv.on .div-4, .sdiv.on .h1, .sdiv.on .p, .sdiv.on .span {
    transform: none;
    opacity: 1;
  }

  .sdiv.on .div-2, .sdiv.on .div-3, .sdiv.on .div-4, .sdiv.on .h1, .sdiv.on .p, .sdiv.on .span {
    transform: none;
    opacity: 1;
  }

  .light-course .discipline .discipline-list {
    width: 1080px;
    height: auto;
    margin: 0 auto;
    margin-top: 66px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
  }

  .light-course .discipline .discipline-list dl {
    width: 336px;
    height: auto;
    cursor: pointer;
    margin-bottom: 40px;
    margin-right: 24px;
    border-radius: 5px 5px 0 0;
    overflow: hidden;
  }

  .light-course .discipline .discipline-list dl dt {
    width: 344px;
    height: 230px;
  }

  .light-course .discipline .discipline-list dl dt img {
    width: 100%;
    height: 100%;
  }

  .light-course .discipline .discipline-list dl dd h3 {
    padding-left: 20px;
    font-family: PingFangSC-Medium;
    font-size: 18px;
    color: #333;
  }

  .light-course .discipline .discipline-list dl dd h4 {
    padding-left: 20px;

    font-size: 14px;
    color: #959595;
    padding-top: 8px;
    padding-bottom: 12px;
    margin-top: 0;
    margin-bottom: 0;
  }

  .light-course .discipline .discipline-list dl dd p {
    padding-left: 20px;

    font-size: 14px;
    color: #7c7c7c;
  }

  .light-course .discipline .discipline-list dl dd span {
    width: 100%;
    padding: 18px 20px;
    border-top: 1px dashed #e9e9e9;
    display: inline-block;
    position: absolute;
    left: 0;
    bottom: 0;
    font-family: PingFangSC-Medium;
    font-size: 16px;
    color: #fa6240;
  }

  .light-course .discipline .discipline-list dl dd span i {
    font-style: normal;

    font-size: 14px;
    color: #838383;
    text-decoration: line-through;
    margin-left: 12px;
  }

  .light-course .server {
    width: 1080px;
    height: 652px;
    margin: 0 auto;
    padding-top: 140px;
  }

  .title {
    width: 100%;
    height: auto;
    text-align: center;

  }

  .title p {
    font-size: 36px;
    color: #333;
  }

  .sdiv .h1 {
    transform: translateY(50px);
    transition: transform .5s, opacity .5s;
    opacity: 0;
  }

  .title span {
    display: inline-block;
    font-size: 18px;
    color: #9b9b9b;
    margin-top: 15px;
    transition-delay: .2s;
  }

  .light-course .server .server-list, .light-course .server .server-list dl {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .light-course .server .server-list {
    width: 100%;
    height: auto;
    margin-top: 60px;
    text-align: center;
  }

  .light-course .server .server-list dl {
    width: 359px;
    height: 274px;
    -ms-flex-direction: column;
    flex-direction: column;
    cursor: pointer;

  }

  .light-course .server .server-list, .light-course .server .server-list dl {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .light-course .server .server-list dl dt {
    margin-bottom: 50px;
  }

  .light-course .server .server-list dl dd p {
    font-size: 20px;
    color: #333;
    margin-bottom: 16px;
  }

  .light-course .server .server-list dl dd span {
    display: inline-block;
    font-size: 16px;
    color: #898989;
    line-height: 25px;
  }

  .light-course .advantage {
    width: 100%;
    height: 200px;
    background: url(//hcdn1.luffycity.com/static/frontend/course/100/light-home-headbg_1556603653.9273884.png) no-repeat;
    background-size: 100% 100%;
    padding-top: 80px;
  }

  .title {
    width: 100%;
    height: auto;
    text-align: center;

  }

  .light-course .advantage .title p, .light-course .advantage .title span {
    color: #fff;
  }

  .light-course .advantage .title span {
    line-height: 26px;
  }

  .light-course .compare {
    padding-top: 110px;
  }

  .title {
    width: 100%;
    height: auto;
    text-align: center;
  }

  .light-course .compare .compare-list {
    width: 1080px;
    margin: 84px auto 22px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .light-course .compare .compare-list dl {
    text-align: center;
    cursor: pointer;

  }

  .light-course .compare .compare-list dl dd {
    margin-top: 34px;
  }

  .light-course .compare .compare-list dl dd p {
    font-size: 18px;
    color: #5e5e5e;
    margin-bottom: 6px;
  }

  .light-course .compare .compare-list dl dd span {
    font-size: 16px;
    color: #9b9b9b;
  }

  .light-course .compare .compare-item {
    width: 1080px;
    margin: 0 auto;
    border-radius: 6px;
    position: relative;
    background: #f8f8f8;
    box-shadow: 0 2px 6px 2px #f3f3f3;
  }

  .light-course .compare .compare-item .item1 {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 70px 50px;
  }

  .light-course .compare .compare-item .item1 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .light-course .compare .compare-item .item1 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item1 {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 70px 50px;
  }

  .light-course .compare .compare-item .item1 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .light-course .compare .compare-item .item1 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item3 {
    padding: 60px 29px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .light-course .compare .compare-item .item3 .mli {
    margin-bottom: 90px;
  }

  .light-course .compare .compare-item .item3 li {
    width: 33.3%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;

  }

  .light-course .compare .compare-item .item3 li img {
    width: 70px;
    height: 70px;
    margin-right: 15px;
  }

  .light-course .compare .compare-item .item3 li p {
    font-size: 18px;
    color: #333;
    margin-bottom: 1px;
  }

  .light-course .compare .compare-item .item3 li span {
    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item4 {
    padding: 58px 48px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .light-course .compare .compare-item .item4 .li1 {
    display: -ms-flexbox;
    display: flex;
    margin-right: 62px;
  }

  .light-course .compare .compare-item .item4 .li1 img {
    width: 70px;
    height: 70px;
    margin-right: 15px;
  }

  .light-course .compare .compare-item .item4 .li1 p {
    font-size: 18px;
    color: #333;
    margin-bottom: 1px;
  }

  .light-course .compare .compare-item .item4 .li1 span {
    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item4 .li2 {
    margin-right: 105px;
  }

  .light-course .compare .compare-item .item4 .li2 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 7px;
  }
  .light-course .discipline .discipline-list dl dd {
    width: 100%;
    height: 212px;
    background: #fff;
    padding: 18px 0;
    position: relative;
    box-sizing: border-box;
  }

  .light-course .compare .compare-item .item4 .li2 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item4 .li3 {
    padding: 12px 24px;
    width: 292px;
    background: #fff;
    margin-bottom: 44px;
  }

  .light-course .compare .compare-item .item4 .li3 p {

    font-size: 18px;
    color: #333;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-bottom: 14px;
  }

  .light-course .compare .compare-item .item4 .li3 p i {
    color: #fa6240;
    font-style: normal;
    font-size: 12px;
    border: 1px solid #fa6240;
    border-radius: 2px;
    padding: 0 5px;
  }

  .light-course .compare .compare-item .item4 .li3 div {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;

    font-size: 16px;
    color: #9b9b9b;
    line-height: 30px;
  }

  .light-course .compare .compare-item .item4 .li3 div img {
    width: 24px;
    height: auto;
    margin-right: 10px;
  }

  .light-course .compare .compare-item .item4 .li3 div:nth-of-type(2) {
    margin-top: 16px;
    margin-bottom: 16px;
  }

  .light-course .compare .compare-item .item4 .li3 div {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;

    font-size: 16px;
    color: #9b9b9b;
    line-height: 30px;
  }

  .light-course .compare .compare-item .item4 .li3 div {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;

    font-size: 16px;
    color: #9b9b9b;
    line-height: 30px;
  }

  .light-course .compare .compare-item .item4 .li4 {
    margin-right: 151px;
  }

  .light-course .compare .compare-item .item4 .li2 {
    margin-right: 105px;
  }

  .light-course .compare .compare-item .item4 .li2 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 7px;
  }

  .light-course .compare .compare-item .item4 .li2 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item4 .li5 {
    margin-right: 92px;
  }

  .light-course .compare .compare-item .item4 .li2 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 7px;
  }

  .light-course .compare .compare-item .item4 .li2 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .compare .compare-item .item4 .li2 {
    margin-right: 105px;
  }

  .light-course .compare .compare-item .item4 .li2 p {

    font-size: 18px;
    color: #333;
    margin-bottom: 7px;
  }

  .light-course .compare .compare-item .item4 .li2 span {

    font-size: 16px;
    color: #9b9b9b;
    line-height: 24px;
  }

  .light-course .offline {
    width: 1080px;
    height: 649px;
    margin: 0 auto;
    padding-top: 130px;
  }

  .light-course .offline img {
    margin-top: 60px;
    width: 100%;
    height: auto;
  }

  .light-course .live {
    width: 1080px;
    height: auto;
    margin: 0 auto;
    padding-bottom: 126px;
  }

  .light-course .live .live-imgs {
    width: 100%;
    height: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-top: 44px;
  }

  .light-course .live .live-imgs img {
    width: 344px;
    height: 260px;
    margin-bottom: 30px;
  }

  .light-course .question {
    width: 100%;
    height: 909px;
    background: #f5f5f6;
    padding-top: 72px;
  }

  .light-course .question .question-list {
    width: 1080px;
    height: auto;
    margin: 0 auto;
    margin-top: 18px;
    padding: 70px;
    background: url(//hcdn1.luffycity.com/static/frontend/course/100/下载_1556604228.2396023.svg) no-repeat;
    background-size: 100% 100%;
  }

  .light-course .question .question-list li:first-child {
    padding-top: 0;
  }

  .light-course .question .question-list li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
    padding-bottom: 30px;
    padding-top: 30px;
    border-bottom: 1px dashed #cecece;

  }

  .light-course .question .question-list li p {
    min-width: 260px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    font-size: 20px;
    color: #333;
    margin-right: 28px;
  }

  .light-course .question .question-list li p i {
    width: 3px;
    height: 20px;
    background: #000;
    display: inline-block;
    margin-right: 13px;
  }

  .light-course .question .question-list li span {
    font-size: 17px;
    color: #333;
    line-height: 30px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }
</style>
