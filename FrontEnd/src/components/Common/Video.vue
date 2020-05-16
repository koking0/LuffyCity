<template>
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
</template>

<script>
  export default {
    name: "Video"
  }
</script>

<style scoped>
  #videoModal, .modal-content {
    width: 1200px;
  }

  #videoModal {
    height: 800px;
  }
</style>
