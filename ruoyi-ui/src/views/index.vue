<template>
  <div  class="app-container home" >
<!--    <img style="width: 1550px;height: 810px;" src="../assets/images/2.jpg">-->
<!--    <video autoplay="autoplay" width="100%"  height="700px" loop="loop" playsinline tabindex="-1" muted="muted">
      <source src="../assets/images/宣传片.mp4" type="video/mp4" >
    </video>-->
<!--    <img  style="height: 810px; width: 100%" src="../assets/images/plan.jpeg">-->
    <div class="h1" style="width: 600px ;font-size: 45px" >欢迎使用网上机票预订系统</div>
  </div>


</template>

<script>
export default {
  name: "Index",
  data() {
    return {

    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  background-image: url("../assets/images/plan.jpeg");
  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  width: 1510px;
  height: 736px;
  color: #676a6c;
  overflow-x: hidden;
}
.h1 {
  color: #6960ec;
  position: absolute;
  top: 80px;
  left: 450px;
}

</style>

