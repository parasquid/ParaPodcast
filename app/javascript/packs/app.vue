<template>
  <div id="app">
    <md-toolbar>
      <h1 class="md-title">Para Podcast</h1>
    </md-toolbar>
  
    <div class="container">
      <div class="row" v-for="entry in entries">
        <div class="col-xs-12 col-sm-6 col-md-6">
          {{ entry.attributes.title }}
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
          <audio-player :sources="[entry.attributes.enclosure_url]" html5></audio-player>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios"
import AudioPlayer from './components/audio-player.vue'

export default {
  data: function () {
    return {
      entries: []
    }
  },
  created() {
    this.fetchEntries();
  },
  methods: {
    fetchEntries() {
      axios.get("/app/feed")
        .then((response) => {
          console.log(response);
          this.entries = response.data
        })
    }
  },
  components: { AudioPlayer }
}
</script>

<style lang="scss">
body {
  font-family: Roboto, Noto Sans, Noto, sans-serif;
  
  audio {
    display: block;
    margin: 12px 0;
  }
}

.clearfix:after {
  content: "";
  display: table; 
  clear: both; 
}
</style>
