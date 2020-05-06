<template>
  <div id="app">
    <LuffyHeader/>
    <router-view v-if="isRouterAlive"/>
    <LuffyFooter/>
  </div>
</template>

<script>
  import LuffyHeader from "./components/Common/LuffyHeader";
  import LuffyFooter from "./components/Common/LuffyFooter";

  export default {
    name: 'App',
    components: {LuffyHeader, LuffyFooter},
    provide(){
      return {
        reload:this.reload
      }
    },
    data(){
      return {
        isRouterAlive: true
      }
    },
    methods: {
      reload(){
        this.isRouterAlive = false;
        this.$nextTick(function () {
          this.isRouterAlive = true;
        })
      }
    }
  }
</script>

<!--scoped实现组件的私有化，不对全局造成样式污染，表示当前style属性只属于当前模块-->
<style scoped>

</style>
