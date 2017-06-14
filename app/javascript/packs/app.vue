<template>
  <div id="app">
    <md-toolbar>
      <h1 class="md-title">Para Podcast</h1>
    </md-toolbar>
  
    <div>
      <audio controls>
        <source src="http://rss.art19.com/episodes/e762b9e8-69b7-4951-a5cf-9f707251615f.mp3" type="audio/mpeg">
        Your browser does not support the audio tag.
      </audio>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      urls: []
    }
  },
  created() {

  }
}
</script>

<style>
body {
  font-family: Roboto, Noto Sans, Noto, sans-serif;
}
</style>
