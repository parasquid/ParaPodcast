<template>
  <div>
    <span>Total duration: {{ duration }} seconds</span>
    <div>
      <input type="range" 
        :value="(this.currentProgress * 100)"
        min="0" max="100" step="1"
        @input="seekTo($event.target.value)"
      >
      </input>
      <button @click="togglePlayback">{{ playing ? 'Pause' : 'Play' }}</button>
      <button @click="stop">Stop</button>
    </div>
  </div>
</template>

<script>
  import VueHowler from 'vue-howler'
 
  export default {
    data() {
      return {
        currentProgress: this.progress || 0
      }
    },
    mixins: [VueHowler],
    methods: {
      seekTo(location) {
        this.currentProgress = parseFloat(location / 100);
        this.setProgress(this.currentProgress);
      }
    }
  }
</script>

<style lang="scss">

</style>
