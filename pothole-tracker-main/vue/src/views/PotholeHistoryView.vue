<template>
  <div>
    <the-nav />
    <pothole-history />
  </div>
</template>

<script>
import PotholeHistory from '../components/PotholeHistory.vue'
import TheNav from '../components/TheNav.vue'
import sentryServices from '../services/sentryServices'


export default {
    components: {
      PotholeHistory,
        TheNav,
      },
      methods:{
        retrievePotholes(){
          sentryServices.getPotholes().then(response => {
            this.$store.commit("SET_ALL_POTHOLES", response.data); 
          })
        }
      },
    created(){
      this.retrievePotholes();
    }
}
</script>

<style>

</style>