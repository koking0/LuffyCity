<template>
  <ul class="side" id="sideShow" style="display: block;">
    <a target="_blank" href="#">
      <li>
        <img src="//hcdn2.luffycity.com/media/frontend/about_us/market-check-2.svg" alt="market-check">
        <p>监察</p>
        <span>市场<br>监察</span>
      </li>
    </a>
    <a target="_blank" href="#">
      <li>
        <img src="//hcdn1.luffycity.com/static/frontend/activity/side-feedback_1564141045.0403872.svg"
             alt="side-feedback">
        <p>反馈</p><span>意见<br>反馈</span>
      </li>
    </a>
    <a target="_blank" href="#">
      <li>
        <img src="//hcdn1.luffycity.com/static/frontend/activity/side-help_1564141045.205138.svg" alt="side-help">
        <p>帮助</p><span>帮助<br>中心</span>
      </li>
    </a>
    <li>
      <img src="//hcdn1.luffycity.com/static/frontend/activity/side-consult_1564141044.7659125.svg"
           alt="side-consult">
      <p>咨询</p> <span>在线<br>咨询</span>
    </li>
    <li>
      <img class="wechat" src="/static/images/side-wechat.svg" alt="side-wechat">
    </li>
  </ul>
</template>

<script>
    export default {
        name: "Side"
    }
</script>

<style scoped>
  #sideShow {
    width: 50px;
    height: auto;
    position: fixed;
    right: 10px;
    bottom: 50%;
    margin-bottom: -108px;
    z-index: 10;
    display: none;
  }

  #sideShow li {
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
    margin-top: 17px;
  }

  .side li span {
    display: none;
  }
</style>
