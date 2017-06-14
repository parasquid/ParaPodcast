<template>
  <div id="app">
    <audio controls>
      <source src="http://rss.art19.com/episodes/e762b9e8-69b7-4951-a5cf-9f707251615f.mp3" type="audio/mpeg">
      Your browser does not support the audio tag.
    </audio>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
