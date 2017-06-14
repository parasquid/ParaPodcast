<template>
  <div id="app">
    <md-toolbar>
      <h1 class="md-title">Para Podcast</h1>
    </md-toolbar>
  
    <div class="container">
      <div class="row" v-for="entry in entries">
        <div class="col-xs-12 col-sm-6 col-md-3">
          {{ entry.attributes.title }}
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
          {{ entry.attributes.title }}
          <audio controls>
            <source :src="entry.attributes.enclosure_url" :type="entry.attributes.enclosure_type">
            Your browser does not support the audio tag.
          </audio>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios"

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
  }
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
