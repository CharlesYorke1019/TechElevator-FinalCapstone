<template>
  <div id="app">
    <div class="header">
    <the-header />
    </div>
    <div class="body">
    <router-view />
    </div>
    <div class="footer">
    <the-footer />
    </div>
  </div>
</template>

<script>
import TheFooter from './components/TheFooter.vue'
import TheHeader from './components/TheHeader.vue'

export default {
  components: {
    TheHeader,
    TheFooter,
  }
}
</script>

<style scoped>
/* Define a flex container for the app */
#app {
  /* display: flex;
  flex-direction: column; */
  min-height: 100vh; /* Ensure the app takes up at least the full viewport height */
  position: relative;
}

/* Add flex-grow to router-view to push footer to the bottom */
router-view {
  flex-grow: 1;
}

.body {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.footer {
  position: absolute;
  bottom:0;
  margin-top: auto;
  left:4.5%;  
}
</style>
