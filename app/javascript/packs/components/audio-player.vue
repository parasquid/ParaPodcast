<template>
  <div class="card-holder">
    <md-card>
      <md-card-header>
        <md-card-header-text>
          <div class="md-title">{{ title }}</div>
          <div class="md-subhead"><span>Total duration: {{ duration }} seconds</span></div>
        </md-card-header-text>

        <md-card-media>
          <img :src="this.imageSrc" alt="podcast image">
        </md-card-media>
      </md-card-header>

      <md-card-actions>
        <input type="range" class="progress-slider"
          :value="currentProgress"
          min="0" max="1" step="0.01"
          @change="seekTo($event.target.value)"
          @input="userAction = true"
        >
        <button @click="loadAndTogglePlayback" class="round-button md-button md-raised md-fab md-primary md-theme-default">
          <md-ink-ripple></md-ink-ripple>
          <md-spinner class="md-accent" v-if="!playing && loading" md-indeterminate></md-spinner>
          <md-icon v-if="!playing && !loading">play_arrow</md-icon>
          <md-icon v-if="playing">pause</md-icon>
        </button>
        <button @click="stopAndReset" class="round-button md-button md-fab md-warn md-theme-default">
          <md-icon>stop</md-icon>
        </button>
      </md-card-actions>
    
      <md-card-content>{{ summary }}</md-card-content>
    </md-card>

  </div>
</template>

<script>
  import VueHowler from 'vue-howler'
 
  export default {
    data() {
      return {
        loading: false,
        userAction: false,
        currentProgress: 0
      }
    },
    watch: {
      progress() {
        if(this.progress == 0) {
          this.loading = false;
        } else {
          if(this.userAction == false) {
            this.currentProgress = this.progress;
          }
        }
      }
    },
    mixins: [VueHowler],
    methods: {
      seekTo(location) {
        this.userAction = false;
        this.setProgress(parseFloat(location));
      },
      stopAndReset() {
        this.loading = false;
        this.currentProgress = 0;
        this.stop();
      },
      loadAndTogglePlayback() {
        this.loading = !this.loading;
        this.play();
        this.togglePlayback();
      }
    },
    props: [
      "imageSrc",
      "title",
      "summary"
    ]
  }
</script>

<style lang="scss">
  .card-holder {
    width: 100%;
    margin: 0 4px 16px;
    display: inline-block;
    vertical-align: top;
    .progress-slider {
      width: 100%;
      margin: 15px;
    }
    .round-button.md-button.md-fab {
      min-width: 56px;
      min-height: 56px;
    }
  }
</style>
