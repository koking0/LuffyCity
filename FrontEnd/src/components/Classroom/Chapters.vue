<template>
  <div class="chapter">
    <div>
      <div class="modules" v-for="item in chaptersDetail" :key="item.id">
        <p class="p1">
          <span>
            <img src="/static/images/chapter.svg" alt="">
            {{item.title}}
          </span>
          <span>{{item.sections.length}}个课时</span>
        </p>
        <ul>
          <li v-for="(section, index) in item.sections" :key="section.id" data-toggle="modal"
              data-target="#videoModal" @click="sectionClick(item.videoUrl)">
            <div class="left">
              <img v-if="section.sectionType===1" src="/static/images/PDF2.svg" alt="" style="height: 28px">
              <img v-if="section.sectionType===2" src="/static/images/play@2x.png" alt="" style="height: 28px">
              <img v-if="section.sectionType===3" src="/static/images/document.svg" alt="" style="height: 28px">
              <span class="span1">第{{index + 1}}课时 </span>
              <span class="span2">{{section.name}}</span>
            </div>
          </li>
        </ul>
        <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="popup-content">
                <iframe src="//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1"
                        width="900" height="600" scrolling="no" border="0" frameborder="no" framespacing="0"
                        allowfullscreen="true" id="videoIframe">
                </iframe>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import $ from 'jquery';

  export default {
    name: "Chapters",
    data() {
      return {
        chaptersDetail: null,
        moduleId: null,
      }
    },
    methods: {
      sectionClick(url) {
        console.log("设置视频src");
        $('#videoIframe').src(url);
      }
    },
    created() {
      this.moduleId = this.$route.params.detailId;
      this.$http.homeworkDetail(this.$route.params.detailId).then(res => {
        this.chaptersDetail = res.modules[this.$route.params.detailId]['chapters'];
      }).catch(err => {
        console.log(err);
      })
    },
  }
</script>

<style scoped>
  #videoModal, .modal-content {
    width: 1200px;
  }

  #videoModal {
    height: 800px;
  }

  .chapter {
    width: 100%;
    height: auto;
    overflow: hidden;
    padding-bottom: 30px;
  }

  .chapter .modules {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding-left: 80px;
    cursor: pointer;
  }

  .chapter .modules .p1 {
    padding: 20px 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .chapter .modules .p1 span:first-of-type {
    font-size: 20px;
    color: #414a60;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .chapter .modules .p1 span {
    display: inline-block;
  }

  .chapter .modules .p1 span:first-of-type img {
    width: 24px;
    height: 24px;
    margin-right: 10px;
  }

  .chapter .modules .p1 span:nth-of-type(2) {
    font-size: 14px;
    color: #5e5e5e;
    padding-right: 128px;
  }

  .chapter .modules .p1 span {
    display: inline-block;
  }

  .chapter .modules ul li .left, .chapter .modules ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .chapter .modules ul li {
    width: 960px;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 10px 20px;
    background: #f6f9fe;
    margin: 6px 0 6px 32px;
    cursor: pointer;
  }

  li {
    list-style: none;
  }

  .chapter .modules ul li .left, .chapter .modules ul li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .chapter .modules ul li .left .span1 {
    font-size: 16px;
    color: #666;
    margin: 0 15px;
  }

  .chapter .modules ul li .left span {
    display: inline-block;
  }

  .chapter .modules ul li .left .span2 {
    font-size: 18px;
    color: #5e5e5e;
  }

  .chapter .modules ul li .left span {
    display: inline-block;
  }

  .chapter .modules ul li .right button {
    width: 67px;
    height: 24px;
    background: #ffc210;
    border-radius: 2px;
    font-size: 14px;
    color: #fff;
    opacity: 0;
    transition: opacity .3s linear;
    position: absolute;
    right: 0;
    top: 0;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }
</style>
