<template>
  <div style="padding: 0 15px; display: flex">
    <img
      src="../../assets/logo/svg.png"
      @click="toggleClick"
      :class="{ 'is-active': isActive }"
      class="hamburger"
    />
    <div class="nabar-title">机票预订管理系统</div>
  </div>
</template>

<script>
export default {
  name: 'Hamburger',
  props: {
    isActive: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    toggleClick() {
      this.$emit('toggleClick')
    }
  }
}
</script>

<style scoped>
.hamburger {
  display: inline-block;
  vertical-align: middle;
  margin-top: 18px;
  width: 16px;
  color: #e60012;
  height: 16px;
  margin-left: 6px;
}

.hamburger.is-active {
  transform: rotate(180deg);
}
.nabar-title {
  margin-left: 18px;
  height: 100%;
  width: 200px;
  line-height: 54px;
  color: #e60012;
  font-weight: 600;
  vertical-align: middle;
}
</style>
