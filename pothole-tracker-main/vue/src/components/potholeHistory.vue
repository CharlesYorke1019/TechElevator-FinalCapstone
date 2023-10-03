<template>
  <div class="potholeHistory">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <h2 style="font-family: 'Roboto', sans-serif;">Pothole History</h2>
    <div class="columns">
      <history-column class="columnA" title="Reported" :potholes="reportedPotholes" />
      <history-column class="columnA" title="Inspected" :potholes="inspectedPotholes" />
      <history-column class="columnA" title="Repaired" :potholes="repairedPotholes" />
    </div>
  </div>
</template>
<script>
import HistoryColumn from './HistoryColumn.vue'
export default {
  name: 'pothole-history',
  components: {
    HistoryColumn
  },
  computed: {
      reportedPotholes(){
        return this.$store.state.allPotholes.filter(
          pothole => pothole.status === "Reported"
        );
      },
      inspectedPotholes(){
        return this.$store.state.allPotholes.filter(
          pothole => pothole.status === "Inspected"
        );
      },
      repairedPotholes(){
        return this.$store.state.allPotholes.filter(
          pothole => pothole.status === "Repaired"
        );
      }
  },
}
</script>


<style scoped>
.columns {
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.columns {
  flex: 1;
  text-align: center;
}



</style>
