<template>
  <footer>
    <div class="foot-item">
      <div class="foot-left">
        <div class="foot-content">
          <p>
            <span>关于我们</span>
            <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <span>贝里小卖铺</span>
          </p>
          <p>地址：北京市昌平区顺沙路八号院汇德商厦402&nbsp;&nbsp;邮箱：customer@luffycity.com</p>
          <p>
            <span>© 2017-2020 北京路飞学城教育科技有限公司版权所有&nbsp;&nbsp;</span>
            <a class="copyright" href="http://beian.miit.gov.cn" target="_blank">
              <span>京ICP备17072161号-1</span>
            </a>
          </p>
          <p>
            <a class="report-link" target="_blank"
               href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010102002019&amp;token=1ee3034d-ba3a-4cc3-89d4-89875e2dd0b1">
              <img class="report-img" src="/static/images/TB1.png" style="float:left" alt="TB1">
              <span>京公网安备 11010102002019号</span>
            </a>
          </p>
        </div>
      </div>
      <img src="//hcdn2.luffycity.com/media/frontend/activity/qr_B0Bsv0d.png" class="code">
    </div>
  </footer>
</template>

<script>
  export default {
    name: "LuffyFooter",
  };
</script>

<style lang="css" scoped>
  footer {
    width: 100%;
    height: 140px;
    -ms-flex-direction: column;
    flex-direction: column;
    overflow: hidden;
    background: #191c25;
  }

  footer .foot-item, footer {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  footer .foot-item {
    width: 960px;
    height: 100%;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  footer .foot-item, footer {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  footer .foot-item .foot-left {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  footer .foot-item .code {
    width: 74px;
    height: auto;
    margin-right: 100px;
  }

  footer .foot-item .foot-left .foot-content p:first-child {
    color: #d0d0d0;
  }

  footer .foot-item .foot-left .foot-content p {
    margin-bottom: 10px;
    font-size: 13px;
    font-weight: 400;
    color: #d0d0d0;
  }

  footer .foot-item .foot-left .foot-content p:first-child span {
    font-size: 16px;
    font-weight: 400;
    display: inline-block;
    cursor: pointer;
  }

  footer .foot-item .foot-left .foot-content p {
    margin-bottom: 10px;
    font-size: 13px;
    font-weight: 400;
    color: #d0d0d0;
  }

  footer .foot-item .foot-left .foot-content .copyright, footer .foot-item .foot-left .foot-content .report-link, footer .foot-item .foot-left .foot-content p:first-child {
    color: #d0d0d0;
  }

  footer .foot-item .foot-left .foot-content p {
    margin-bottom: 10px;
    font-size: 13px;
    font-weight: 400;
    color: #d0d0d0;
  }

  footer .foot-item .report-img {
    display: inline-block;
    height: 20px;
    margin-right: 12px;
  }
</style>

