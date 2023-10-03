<template>
  <div>
      <the-nav />
      <add-report />
  </div>
</template>

<script>
import AddReport from '../components/AddReport.vue'
import TheNav from '../components/TheNav.vue'

export default {
    name: 'addPotholeReportView',
    components:{
        AddReport,
        TheNav
    }

}
</script>

<style>

</style>