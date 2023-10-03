<template>
  <div class="view-container">
    <the-nav />
    <h2>Active Potholes</h2>
    <active-potholes />
  </div>
</template>

<script>
import ActivePotholes from '../components/ActivePotholes.vue'
import TheNav from '../components/TheNav.vue'

export default {
    components: {
        ActivePotholes,
        TheNav
    }
}
</script>

<style scoped>
.font-roboto {
  font-family: 'Roboto', sans-serif;
}

/* Apply flexbox layout to ensure content takes full viewport height */
.view-container {
  display: flex;
  flex-direction: column;
  min-height: 100%;
}

/* Adjust spacing for the header */
h2 {
  margin: 20px 0;
}
</style>
