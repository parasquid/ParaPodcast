/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue'
import VueMaterial from "vue-material"
import "vue-material/dist/vue-material.css"

Vue.use(VueMaterial)
Vue.material.registerTheme({
  default: {
    primary: {
      color: 'light-green',
      hue: 700
    },
    accent: 'red'
  },
  teal: {
    primary: 'blue',
    accent: 'pink'
  },
  purple: {
    primary: 'purple',
    accent: 'orange'
  }
})


import App from './app.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue(App).$mount('app')
})
