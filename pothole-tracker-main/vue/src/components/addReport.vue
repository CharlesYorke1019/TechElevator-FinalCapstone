<template>
  <div class="addReport">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <h2>Submit a Pothole Repair Request</h2>
        <form id="repairRequestForm" @submit.prevent="formSubmission">
            <span class="el1">(*) Required Field</span>
            <fieldset>
                <label for="gmapAutocomplete">Pothole Address (*): </label>
            </fieldset>
            <add-google-map />

            <!-- <add-google-map v-model="potholeReport.location"/> -->
            <fieldset>
                <label class="input" for="incident-date">Incident Date: (*) </label>
                <input class="input" name="incident-date" id="incident-date" type="date" v-model="potholeReport.report_date" required>
            </fieldset>
            <fieldset>
                <label  for="comments">Additional Details / Comments: (*) </label><br><br>
                <!-- <input class="input" name="comments" id="comments" type="textbox" v-model="potholeReport.description" required> -->
                <textarea  name="comments" id="comments" cols="45" rows="5" required v-model="potholeReport.description"></textarea>
            </fieldset>
            <fieldset>
                <label class="input" for="severitySelect" id="severitySelectLabel">Severity: (*) </label>
                <select class="input" id="severitySelect" name="severitySelect" v-model="potholeReport.severity">
                    <option id="placeHolderSelection" disabled>Select An Option</option>
                    <option id="severeStatus" value="1">severe</option>
                    <option id="moderateStatus" value="2">moderate</option>
                    <option id="minorStatus" value="3">minor</option>
                </select>
            </fieldset>
            <fieldset>
                <label class="input" id="reporterNameInput" for="reporterInput">Enter Your Name: (*) </label>
                <input class="input" type="text" name="reporterInput" id="reporterInput" v-model="potholeReport.reported_by" required/>
            </fieldset>
            <!-- <fieldset>
                <label id="fileInputLabel" for="fileInput">Upload A Photo Of The Pothole</label>
                <br>
                <input type="file" name="fileInput" id="fileInput" accept="image/*;capture=camera">
            </fieldset> -->
            <input class="lastEl" type="submit" value="Submit"/>
            <!-- v-on:click="formSubmission"> -->
            <!-- <button v-on:click="formSubmission">Enter</button> -->
        </form>
    </div>
</template>

<script>
import sentryServices from '../services/sentryServices.js'
import AddGoogleMap from './AddGoogleMap.vue'
export default {
    name: "add-report",
    components: {
        AddGoogleMap,
    },
    data() {
        return {
            potholeReport: {
                id: '',
                location: '',
                description: '',
                reported_by: '',
                report_date: '',
                severity: '',
            },
        }
    },
    methods: {
        clearForm() {
            let nAddress = document.getElementById("pothole-address");
            let nDate = document.getElementById('incident-date');
            let nComments = document.getElementById('comments');
            let nSeverityOptions = document.getElementById('severitySelect').getElementsByTagName('option');
            nAddress.value = '';
            nDate.value = '';
            nComments.value = '';
            nSeverityOptions.forEach((option) => {
                if (option.id === 'placeHolderSelection') {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            })

            this.potholeReport = {};
        },
        setLocation() {
            let gmapAutocomplete = document.getElementById('testGmapAuto');
            this.potholeReport.location = gmapAutocomplete.value;
        
        },
        formSubmission() {

            const submittedReport = {
                reported_by_id: Number(this.$route.params.id),
                location: localStorage.getItem('potholeReportAddress'),
                description: this.potholeReport.description,
                reportedBy: this.potholeReport.reported_by,
                reportDate: this.potholeReport.report_date.toString(),
                status: "Reported",
                severity: Number(this.potholeReport.severity),
                lat: localStorage.getItem('markerLat'),
                lng: localStorage.getItem('markerLng'),
            }

            console.log(submittedReport);

            sentryServices.addPotholeReport(submittedReport)
            .then((response) => {
                if (response.status === 201) {
                    submittedReport.pothole_id = response.data.pothole_id;
                    this.$store.state.allPotholes.push(submittedReport);
                    console.log(submittedReport)
                    this.$router.push({name: 'home'});
                }
            })
            .catch((error) => {
                this.clearForm();
                this.$router.push({name: 'home'})
                console.log('there has been an error submitting your pothole report ' + error);
            });
        },
    },
    

    
}
</script>
<style>
#repairRequestForm{
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}
#repairRequestForm > fieldset{
    border: none;
    margin: 5px;
    padding: 0px;
}
#fileInput{
    position: relative;
    left: 38px;
}
.addReport {
    font-family: 'Roboto', sans-serif;
    margin-bottom: 150px;
}
.el1 {
    margin-top:6px;
    font-size: 15px;
}
.lastEl {
    margin-bottom: 5px;
    padding: 5px 10px 5px 10px;
    background-color:#F09C24;
    border-radius: 15px;
}
.class {
    display: inline;
}
</style>