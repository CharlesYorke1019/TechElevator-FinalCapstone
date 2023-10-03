<template>
  <div>
    <the-nav />
      <!-- if employee, toggle employeeForm component -->
    <user-history />
    <!-- <employee-form /> -->
  </div>
</template>

<script>
// import EmployeeForm from '../components/EmployeeForm.vue'
import UserHistory from '../components/UserHistory.vue'
import TheNav from '../components/TheNav.vue'
import sentryServices from '../services/sentryServices';


export default {
  components: {
    // EmployeeForm,
    UserHistory,
    TheNav
  },
  methods:{
    retrieveClaims(){
      sentryServices.getInsuranceClaims().then(response => {
        this.$store.commit("SET_ALL_INSURANCE_CLAIMS", response.data);
      })
      sentryServices.getPotholes().then((response) => {
        this.$store.commit("SET_ALL_POTHOLES", response.data);
      })
    }
  },
  created(){
    this.retrieveClaims();
  }
}
</script>

<style>
.font-roboto {
  font-family: 'Roboto', sans-serif;}
</style>