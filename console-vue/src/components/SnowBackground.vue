<!-- ParticlesBackground.vue -->
<template>
  <vue-particles
      id="tsparticles"
      @particles-loaded="particlesLoaded"
      :options="particlesOptions"
  />
</template>

<script setup>
import setPartcles from "@/utils/setPartcles";
const particlesLoaded = async (container) => {
  console.log("Particles container loaded", container);
};

// 粒子效果的配置选项
const particlesOptions = setPartcles;
</script>

<style scoped>
/* 添加样式（如果需要的话） */
</style>
