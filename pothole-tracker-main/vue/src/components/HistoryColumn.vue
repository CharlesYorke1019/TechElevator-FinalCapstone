<template>
  <div class="column">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
      <h2>{{ title }}</h2>
      <div class="individualColumn">
      <div v-for="pothole in potholes" v-bind:key="pothole.pothole_id" class="report" >
              <!-- image -->
            <div class="hover">
                <div class="property">
                    <p class="status"><strong>Current Status: </strong></p><p class="display">{{ pothole.status }}</p>
                </div>
                <div class="property">
                    <p class="status"><strong>Description: </strong></p><p class="display">{{ pothole.description }}</p>
                </div>
                <div class="property">
                    <p class="status"><strong>Reported by: </strong></p><p class="display">{{ pothole.reportedBy }}</p>
                </div>
                <div class="property">
                <p class="status"><strong>Severity:</strong></p><p class="display">{{ pothole.severity }}</p><br><small>(1:severe 2:moderate 3:minor)</small>
                </div>
                <div class="property">
                    <p class="status"><strong>Date reported: </strong></p><p class="display">{{pothole.reportDate}}</p><br>
                    <p class="status"><strong> Date inspected: </strong></p><p class="display">{{pothole.inspectDate}} </p><br>
                    <p class="status"><strong>Date repaired: </strong></p><p class="display">{{pothole.repairDate}}</p>
                </div>
                <div class="property">
                    <p class="status lastE"><strong>Located at: </strong></p><p class="display lastE">{{pothole.location}}</p>
                </div>
              <!-- buttons that only appear when logged in as employee to edit or delete -->
            <div class="employeeAccess" v-if="auth === 'ROLE_ADMIN'">
                <button class="updateBtn lastE"  v-on:click="editPotholeReport(pothole)" >Update Report</button>
                <button class="lastE deleteBtn" v-on:click="deleteReport(pothole.pothole_id)">Delete</button>
                <div class="modal-window-update" v-if="(visible && pothole.pothole_id) === potholeReport.pothole_id">
                    <form class="modal-content" @submit.prevent="updatePotholeReport">
                        <h3 id="window-title">Update Pothole Report</h3>
                        <p class="close" v-on:click="visible=false">&times;</p>
                        <div class="input-group">
                            <label for="status">Pothole Status:</label>
                            <select class="input-field" name="statusSelect" id="statusSelect" v-model="potholeReport.status">
                                <option id="placeHolderSelection" disabled>Select An Option</option>
                                <option id="reportedStatus" value="Reported">Reported</option>
                                <option id="inspectedStatus" value="Inspected">Inspected</option>
                                <option id="repairedStatus" value="Repaired">Repaired</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <label for="description">Pothole Description:</label>
                            <input class="input-field" name="description" type="textbox" v-model="potholeReport.description">
                        </div>
                        <div class="input-group">
                            <label for="reportedBy">Reported by:</label>
                            <input class="input-field" name="reportedBy" type="text" v-model="potholeReport.reportedBy">
                        </div>
                        <div class="input-group">
                            <label for="severity">Severity:</label>
                            <select class="input-field" id="severitySelect" name="severitySelect" v-model="potholeReport.severity" >
                                <option id="placeHolderSelection" disabled >Select An Option</option>
                                <option id="severeStatus" value="1">severe</option>
                                <option id="moderateStatus" value="2">moderate</option>
                                <option id="minorStatus" value="3">minor</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <label for="reportDate">Date Reported:</label>
                            <input  class="input-field" name="reportDate" type="date" v-model="potholeReport.reportDate">
                        </div>
                        <div class="input-group">
                            <label for="dateInspected">Date Inspected:</label>
                            <input  class="input-field" name="dateInspected" type="date" v-model="potholeReport.inspectDate">
                        </div>
                        <div class="input-group">
                            <label for="dateRepaired">Date Repaired:</label>
                            <input class="input-field" name="dateRepaired" type="date" v-model="potholeReport.repairDate"  >
                        </div>
                        <div class="input-group">
                            <label for="location">Location of pothole:</label>
                            <input class="input-field" name="location" type="text" v-model="potholeReport.location">
                        </div>
                        <input type="submit" value="Submit Update">
                    </form>
                </div>
            </div>
            </div>
        </div>
      </div>
  </div>
</template>
<script>
import sentryServices from '../services/sentryServices';
export default {
    name: 'history-column',
    props: {
        title: String,
        potholes: []
    },
    data(){
        return {
            visible: false,
            potholeReport: {
                pothole_id: '',
                location: '',
                description: '',
                reportedBy: '',
                reportDate: '',
                inspectDate: '',
                repairDate: '',
                severity: '',
                status: '',
                reported_by_id: ''
            },
            auth: false
        }
    },
    methods:{
        deleteReport(potholeId){
            if(confirm("Are you sure you want to delete this pothole report? This action cannot be undone.")){
              sentryServices.deletePotholeReport(potholeId).then(response => {
                    if(response.status === 200){
                        alert("Report successfully deleted");
                        this.$store.commit('DELETE_REPORT', potholeId)
                        //does not re-push to history screen (have to refresh page to see the deleted report disappear)
                        this.$router.push("/")
                    }
                })
            }
        },
        updatePotholeReport(){
            const updatedReport = {
                pothole_id: this.potholeReport.pothole_id,
                location: this.potholeReport.location,
                description: this.potholeReport.description,
                reportedBy: this.potholeReport.reportedBy,
                reportDate: this.potholeReport.reportDate,
                inspectDate: this.potholeReport.inspectDate,
                repairDate: this.potholeReport.repairDate,
                severity: this.potholeReport.severity,
                status: this.potholeReport.status,
                reported_by_id: this.potholeReport.reported_by_id
            }
            console.log(updatedReport)
            sentryServices.updatePotholeReport(updatedReport).then(response => {
                if(response.status === 200) {
                    console.log("this is in response status")
                    //clear form and close it
                    this.$router.push("/")
                }
            })
        },
        editPotholeReport(pothole){
            this.visible = true;
            this.potholeReport = {
                pothole_id: pothole.pothole_id,
                location: pothole.location,
                description: pothole.description,
                reportedBy: pothole.reportedBy,
                reportDate: pothole.reportDate,
                inspectDate: pothole.inspectDate,
                repairDate: pothole.repairDate,
                severity: pothole.severity,
                status: pothole.status,
                reported_by_id: pothole.reported_by_id
            };
        }
    },
    created() {
        let userAuthObj = this.$store.state.user.authorities;
        for (let i = 0; i < userAuthObj.length; i++) {
            this.auth = userAuthObj[i].name;
            // console.log(userAuthObj[i].name);
        }
    }
}
</script>
<style scoped>
*{
    font: 'Roboto';
}

.report {
    background-color: lightgrey;
    border: 2px solid black;
    border-radius: 10px;
    margin: 10px;
}
.column {
    border: none;
}
.hover:hover {
     background-color: #F09D25;
    transition: background-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
}
.individualColumn {
    border: 2px solid black;
    overflow: scroll;
    height: 700px;
    border-radius: 10px;
    margin-bottom: 150px;
}
.status, .display {
    display: inline-block;
    margin-left: 20px;
    margin-right: 20px;
    margin-bottom: 2px;
    margin-top: 15px;
    overflow: wrap;
    min-width: 225px;
    max-width: 225px;
    vertical-align: text-top;
}
div.modal-window-update{
    position: fixed;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    top: 0vh;
    right: 0vw;
    margin: 0px;
    padding:0px;
}
#window-title{
    font: 'Roboto';
    display: inline-block;
    padding:0;
    margin: 15px 0px 15px 0px;
}
form.modal-content{
    font: 'Roboto';
    display: flex;
    position: relative;
    flex-direction: column;
    align-items: center;
    border: 2px solid black;
    border-radius: 15px;
    background-color: #F7D8A9;
    margin-left: auto;
    margin-right: auto;
    margin-top: 15%;
    padding: 0px;
    width: 600px;
    row-gap: 15px;
}
div.input-group{
    display: flex;
    width: 70%;
}
div.input-group label{
    text-align: left;
    flex-grow: 1;
    width: auto;
}
p.close{
    position: absolute;
    right: 4%;
    font-size: 3rem;
    padding:0px;
    margin: 0;
    cursor: pointer;
}
.input-field{
    box-sizing: border-box;
    margin:0;
    padding:0;
    width: 50%;
}
input[type="submit"]{
    padding: 5px 10px 5px 10px;
    background-color:#F09C24;
    margin: 15px 0px 15px 0px;
    border-radius: 15px;
    font-family:'Roboto' sans-serif, 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}
.lastE {
    margin-bottom:15px;
}
.updateBtn, .deleteBtn {
    padding: 5px 10px 5px 10px;
    background-color:lightslategrey;
    border-radius: 15px;
    font-family:'Roboto' sans-serif, 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

/* Desktop layout */
.columns {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* Display 3 columns */
  gap: 20px;
}

small {
    margin-right: 245px;
}

.updateBtn {
    margin-right: 7.5px;
}

/* @media query for mobile screens */
@media (max-width: 768px) {
  .columns {
    grid-template-columns: repeat(1, 1fr); /* Display 1 column */
  }
}
</style>