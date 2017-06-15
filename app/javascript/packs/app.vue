<template>
  <div id="app">
    <md-toolbar>
      <h1 class="md-title">Para Podcast</h1>
    </md-toolbar>
  
    <div class="main-content">
      <md-layout md-gutter v-for="entry in entries">
        <audio-player 
          :sources="[entry.attributes.enclosure_url]"
          :imageSrc="entry.attributes.itunes_image"
          :title="entry.attributes.title"
          :summary="entry.attributes.summary"
          :preload="true"
          :html5="true"
        ></audio-player>
      </md-layout>
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
}

.clearfix:after {
  content: "";
  display: table; 
  clear: both; 
}

.main-content {
  padding: 12px;
}
</style>
