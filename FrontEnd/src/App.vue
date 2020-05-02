<template>
  <div id="app">
    <LuffyHeader/>
    <router-view/>
    <LuffyFooter/>
  </div>
</template>

<script>
  import LuffyHeader from "./components/Common/LuffyHeader";
  import LuffyFooter from "./components/Common/LuffyFooter";

  export default {
    name: 'App',
    components: {LuffyHeader, LuffyFooter},
  }
</script>

<!--scoped实现组件的私有化，不对全局造成样式污染，表示当前style属性只属于当前模块-->
<style scoped>

</style>
