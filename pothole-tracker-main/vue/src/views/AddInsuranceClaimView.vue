<template>
  <div>
      <the-nav />
      <add-insurance-claim />
  </div>
</template>

<script>
import AddInsuranceClaim from '../components/AddInsuranceClaim.vue'
import TheNav from '../components/TheNav.vue'
export default {
    components:{
        AddInsuranceClaim,
        TheNav
    }
}
</script>

<style>

</style>
AddInsuranceClaim