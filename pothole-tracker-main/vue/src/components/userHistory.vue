<template>
  <div class="userHistory">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <div class="scrollingColumn">
    <h2>Report History</h2>
    <div id="reportHistoryContainer">
      <div id="reportHistoryList" v-for="pothole in potholesArr" v-bind:key="pothole.pothole_id">
        <div class="displayedProperty">
        <p class="status"><strong>Current Status: </strong></p> <p class="status">{{ pothole.status }}</p>
        </div>

        <div class="displayedProperty">
        <p class="location"><strong>Located at: </strong></p>  <p class="location">{{pothole.location}}</p>
        </div>

        <div class="displayedProperty">
        <p class="description"><strong>Description: </strong></p><p class="description">{{ pothole.description }}</p>
        </div>

        <div class="displayedProperty">
        <p class="name"><strong>Reported by: </strong></p><p class="name">{{ pothole.reportedBy }}</p>
        </div>

        <div class="displayedProperty">
        <p class="severity"><strong>Severity:</strong></p><p class="severity">{{ pothole.severity }}</p><br><small>(1:severe 2:moderate 3:minor):</small>
        </div>

        <div class="displayedProperty">
        <p class="dates"><strong>Date reported: </strong></p><p class="dates">{{pothole.reportDate}}</p><br>
        <p class="dates"><strong> Date inspected: </strong></p><p class="dates">{{pothole.inspectDate}} </p><br>
        <p class="dates, lastElement"><strong>Date repaired: </strong></p><p class="dates, lastElement">{{pothole.repairDate}}</p>
        </div>
        
      </div>
    </div>
    </div>
    <div class="scrollingColumn">
    <h2>Claim History</h2>
    <div id="claimHistoryContainer">
      <div id="claimHistoryList" v-for="claim in insuranceClaimsArr" v-bind:key="claim.insurance_claim_id">

        <div class="displayedProperty">
        <p class="policy"><strong>Policy Number: </strong></p><p class="policy">{{ claim.policyNumber }}</p>  
        </div>

        <div class="displayedProperty"> 
        <p class="cash"><strong>Amount Reimbursed($): </strong></p><p class="cash">$ {{ claim.cashAmount }}</p>
        </div>

        <div class="displayedProperty">
        <p class="company"><strong>Insurance Company: </strong></p><p class="company">{{ claim.insuranceCompanyName }}</p>
        </div>

        <div class="displayedProperty">
        <p class="reporter, lastElement"><strong>Report made by: </strong></p><p class="reporter, lastElement">{{ claim.reporterName }}</p>
        </div>
      </div>
    </div>
    </div>
  </div>
</template>

<script>
import sentryServices from '../services/sentryServices.js'

export default {
  name: 'user-history',

  data() {
    return {
      potholesArr: [],
      insuranceClaimsArr: []
    }
  },
  created() {
    sentryServices.getPotholes().then((response) => {
      response.data.forEach((el) => {
        if (el.reported_by_id === Number(this.$route.params.id)) {
          this.potholesArr.push(el);
        }
      })
    })
    sentryServices.getInsuranceClaims().then((response) => {
      response.data.forEach((el2) => {

        if (el2.reporter_id === Number(this.$route.params.id)) {
          this.insuranceClaimsArr.push(el2);
        }
      })
      
    })
  }
};
</script>

<style>
.userHistory {
  display: flex;
  
}

.scrollingColumn {
  align-items: center;
  width: 100%;
  margin-bottom: 60px;
  margin-left: 10px;
  margin-right: 10px;
  min-height: 80vh;
  max-height: 80vh;
}

h2 {
  font-family: 'Roboto', sans-serif;
  background-color: #F09D25;
  border-radius: 10px;
  
}

#reportHistoryContainer, #claimHistoryContainer {
  border: 2px solid black;
  border-radius: 10px;
  height: 370px;
  overflow: scroll;
  height: 90%;

}

#reportHistoryList:hover, #claimHistoryList:hover {
  background-color: #F09D25;
  /* transition: 0.3s ease-in-out; */
  transition: background-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
}

#reportHistoryList, #claimHistoryList {
  background-color: lightgrey;
  border: 2px solid black;
  border-radius: 10px;
  margin: 10px;
}


.section-title {
  font-family: 'Roboto', sans-serif;
  margin-bottom: 10px;
}

.history-list {
  list-style: none;
  padding: 0;
  margin: 0;
}


.status, .location, .description, .name, .severity, .dates, .policy, .cash, .company, .reporter, .claimId {
  display: inline-block;
  margin-left: 20px;
  margin-right: 15px;
  margin-bottom: 2px;
  margin-top: 15px;
  overflow: wrap;
  max-width: 220px;
  vertical-align: text-top;
}


.lastElement {
  margin-bottom: 20px;
  display: inline-block;
  margin-left: 20px;
  margin-right: 20px;
  margin-top: 15px;
  overflow: wrap;
}

</style>
