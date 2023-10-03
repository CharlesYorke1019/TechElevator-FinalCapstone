<template>
  <div class="activePotholes">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <div id='mapHolderForGeolocation'></div>
    <label for="userCurrentAddressInput">Input An Address To Find Active Potholes Near You!</label>
    <br>
    <br>
    <!-- <h2>Active Potholes</h2> -->
    <br>
    <!-- <table id="activePotholesContainer">
      <div class="pothole" v-for="pothole in potholes" v-bind:key="pothole.id">
        <h3 id="pHStatus">{{ pothole.status }}</h3>
        <p id="pHDescription">{{ pothole.description }}</p>
        <p id="pHLocation">{{ pothole.location }}</p>
        <p id="pHReportedBy">{{ pothole.reported_by }}</p>
        <p id="pHSeverity">{{ pothole.severity }}</p>
        <button>Update</button>
        <button>Delete</button>
      </div>
    </table> -->
     <active-potholes-google-map />
  </div>

</template>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyClOCIPevg3OyJvFPJo-tTyp2JNhr2Xx0g"></script>
<script>
import sentryServices from '../services/sentryServices.js'
import ActivePotholesGoogleMap from '../components/ActivePotholesGoogleMap.vue'


export default {
  name: 'active-potholes',
  // props: ['potholes'],
    data() {
      return {
        potholes: [
          // test data
        ],
        testPotholes: [],
        totalPotholes: []
      }
    },
    components: {
      ActivePotholesGoogleMap

    },
  methods: {
    // activePotholes(){
    //   let userCurrentAddressInput = document.getElementById('userCurrentAddressInput');
    //   sentryServices.getPotholes().then(response => {
    //     console.log(response);
    //     let arr2 = userCurrentAddressInput.value.split(',');
    //     console.log(arr2);
    //     this.totalPotholes.forEach((pothole) => {
    //       let arr = pothole.location.split(',');
    //       if (arr2.length == 3) {
    //         if (arr2[2] === arr[2]) {
    //           this.potholes.push(pothole);
    //         }
    //       } else if (arr2.length === 4) {
    //         if (arr2[3] === arr[3]) {
    //           this.potholes.push(pothole);
    //         }
    //       } 
    //     })
    //   })
          
    // },

    displayUpdateForm(id) {
      console.log(id);
      
    },
    successCallback(position) {
      console.log(position);
    },
    errorCallback(error) {
      console.log(error);
    },
    askForLocation() {
      if(confirm("Would You Like To Grant Access To Your Location?")) {
        console.log('yo');
      }
    } 
  },
  // created() {
  //   this.askForLocation();
  // }



}
</script>

<style>
/* // put pretty colors here */


/* FOR SEMI-TRANSPARENT LOGO IN WINDOW 
.logo-overlay {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 100;
  opacity: 0.6; /* Adjust opacity as needed */


* {
  text-align: center;
  font-family: 'Roboto', sans-serif;
}

.activePotholes {
  text-align: center;
  font-family: 'Roboto', sans-serif;
}

#activePotholesContainer {
  font-family: 'Roboto', sans-serif;
  border: 2px solid black;
  overflow: scroll;
  height: 200px;
  display: inline-block;
  width: 600px;
  margin-top: 30px;
  margin-bottom: 40px;
}

#activePotholesContainer div {
  font-family: 'Roboto', sans-serif;
  border: 2px solid black;
  text-align: center;
  height: 250px;

}

#userCurrentAddressInput {
  font-family: 'Roboto', sans-serif;
  border: 2px solid black;
  width: 300px;
}



</style>