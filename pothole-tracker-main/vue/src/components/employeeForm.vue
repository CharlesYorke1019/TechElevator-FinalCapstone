<template>
  <div class="employeeForm">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <label id="potholeAddressInput" for="pothole-address-input">Enter The Address Of The Wanted Pothole</label>
    <br>
    <input name="pothole-address-input" id="pothole-address-input" placeholder="Street, city, state, zip code">
    <br>
    <br>
    <table id="filteredPotholeReportsContainer">
      <div class="filteredPotholeReports" v-for="filteredPotholeReport in filteredPotholeReports" v-bind:key="filteredPotholeReport.id">
        <h3 id="fprStatus">{{ filteredPotholeReport.status }}</h3>
        <p id="fprDescription">{{ filteredPotholeReport.description }}</p>
        <p id="fprLocation">{{ filteredPotholeReport.location }}</p>
        <p id="fprReportedBy">{{ filteredPotholeReport.reported_by }}</p>
        <p id="fprSeverity">{{ filteredPotholeReport.severity }}</p>
        <button id="updateReportFormButton" v-on:click="signalUpdateReport(filteredPotholeReport.id)">Update</button>
        <button id="deleteReportFormButton" v-on:click="signalDeleteReport(filteredPotholeReport.id)">Delete</button>
      </div>
    </table>

    <div id="updatePotholeReportForm">
      <div class="updateIndicator"></div>
      <button id="xOutOfUpdateReportForm"></button>
      <h2>Update Pothole Report</h2>
      <br>
      <label for="updateSeverity">Update Severity</label>
      <br>
      <select id="updateSeverity" name="updateSeverity">
        <option id="severeStatus" value="severeChoice">severe</option>
        <option id="moderateStatus" value="moderateChoice">moderate</option>
        <option id="minorStatus" value="minorChoice">minor</option>
      </select>
      <br>
       <label for="updateStatus">Update Status</label>
      <br>
      <select id="updateStatus" name="updateStatus">
        <option id="notDoneStatus" value="notDoneChoice">not done</option>
        <option id="inProgressStatus" value="inProgressChoice">in progress</option>
        <option id="completedStatus" value="completedChoice">completed</option>
      </select>
      <br>
      <input type="submit" value="submit" v-on:submit="updatePotholeReportSubmit">
    </div>  

    <div id="deletePotholeReportForm">
      <div class="deleteIndicator"></div>
      <h2>Delete Pothole Report</h2>
      <br>
      <button id="deletePotholeReportBttn" v-on:click="deletePotholeReportSubmit">Delete</button>
      <button id="cancelDeletePotholeReportBttn">Cancel</button>
    </div>    

  </div>
</template>

<script>
import sentryServices from '../services/sentryServices.js'

export default {
    name: 'employee-form',
    data() {
      return {
        filteredPotholeReports: []
      }
    },
    methods: {
      signalUpdateReport: function(divId) {
        // take a divId, because the divId is the id of the pothole report, so to 
        // differentiate between each, we add the id to the div id, so we can later
        // capture the full id, then alter the string if needed
        let updatePotholeReportForm = document.getElementById('updatePotholeReportForm');
        updatePotholeReportForm.style.display = 'block';
        let indicatorDiv = document.querySelector('indicatorUpdate');
        indicatorDiv.id += "_" + divId;
      },
      signalDeleteReport: function(divId) {
        // take a divId, because the divId is the id of the pothole report, so to 
        // differentiate between each, we add the id to the div id, so we can later
        // capture the full id, then alter the string if needed
        let deletePotholeReportForm = document.getElementById('deletePotholeReportForm');
        deletePotholeReportForm.style.display = 'block';
        let indicatorDiv = document.querySelector('indicatorDelete');
        indicatorDiv.id += "_" + divId;

      },
      updatePotholeReportSubmit: function() {
        // this is where we would need to update the specific pothole report
        // depending on what specific report is being targeted
        // and this update/change must occur basically everywhere in our application
        // (JAVA, VUE, DB)

        // can target the id of the div (which is also the id of the report) in order 
        // to send requests regarding specific reports
        // to do this: 


        let updatePotholeReportForm = document.getElementById('updatePotholeReportForm');
        let updatePotholeFormIndicator = updatePotholeReportForm.querySelector('indicatorUpdate')
        let slicedId = updatePotholeFormIndicator.id.substring(updatePotholeFormIndicator.id.indexOf("_", 1));
        console.log(slicedId);


        
        // send an http request
        // on status = ok ---> hide the update report form
        // and add whatever funcionality is needed.

        sentryServices.updatePotholeReport()
        
      },
      deletePotholeReportSubmit: function() {
        // this is where we would need to delete the specific pothole report
        // depending on what specific report is being targeted
        // and this delete/change must occur basically everywhere in our application
        // (JAVA, VUE, DB)

        // can target the id of the div (which is also the id of the report) in order 
        // to send requests regarding specific reports
        // to do this: 

        let deletePotholeReportForm = document.getElementById('deletePotholeReportForm');
        let deletePotholeFormIndicator = deletePotholeReportForm.querySelector('indicatorDelete');
        let slicedId = deletePotholeFormIndicator.id.substring(deletePotholeFormIndicator.id.indexOf("_", 1));


        // maybe do an http request to delete report info
        // this will then be the id of the pothole that is being targeted
        // OR / AND
        // delete the div from the employee list
        let searchedPotholeList = document.getElementById('searchedPotholeList');
        let searchedPotholeListDivs = searchedPotholeList.getElementsByTagName('div');
        searchedPotholeListDivs.forEach((el) => {
          if (el.id === slicedId) {
            searchedPotholeList.removeChild(el)
          }
        })

        // send an http request
        // on status = ok ---> hide the update report form
        // and add whatever funcionality is needed.

      },

    }
  }
  
  
  
</script>

<style>
.font-roboto {
  font-family: 'Roboto', sans-serif;}
  
#updatePotholeReportForm {
  display: none;
  font-family: 'Roboto', sans-serif;
}

#deletePotholeReportForm {
  display: none;
  font-family: 'Roboto', sans-serif;
}

</style>