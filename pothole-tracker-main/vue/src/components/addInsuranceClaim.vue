<template>
    <div class="insuranceClaimDiv">
        <h2>Report Insurance Claim</h2>
        <form id="insuranceClaimForm" @submit.prevent="claimSubmission">

            <fieldset class="input-containers">
                <div class="icon-label">
                    <img src="https://cdn-icons-png.flaticon.com/512/3177/3177440.png" alt="User Icon" width="14%" height="auto"/>
                    <h3 class="fieldset-heading">Personal Information</h3> 
                </div>
                <div class="input-group">
                    <label for="reporter-name">Full Name</label>
                    <input name="reporter-name" id="reporter-name" type="text" v-model="insurance_claim.reporterName" placeholder="First name, Last name">
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input name="email" id="email" v-model="insurance_claim.email" placeholder="email">
                </div>
            </fieldset> 

            <fieldset id="insurance-info-fieldset" class="input-containers">
                <div class="icon-label">
                    <img src="https://www.clipartmax.com/png/middle/191-1914186_home-delivered-meals-car-icon-transparent-background.png" width="14%" height="auto"/>
                    <h3 class="fieldset-heading">Insurance Information</h3>
                </div>
                <div class="input-group">
                    <label for="insurance-company">Insurance Company Name:</label>
                    <input type="text" name="insurance-company" id="insurance-company" placeholder="Insurance Company" v-model="insurance_claim.insuranceCompanyName">
                </div>
                <div class="input-group">
                    <label for="policy-number">Policy Number:</label>
                    <input type="text" name="policy-number" id="policy-number" placeholder="Policy Number" v-model="insurance_claim.policyNumber">
                </div>
                <div class="input-group">
                    <label for="cash-amount">Reimbursement Amount($):</label>
                    <input type="number" name="cash-amount" id="cash-amount" placeholder="Reimbursement Amount" v-model="insurance_claim.cashAmount">
                </div>
            </fieldset>
           
            <input type="submit" value="Submit">
            <div class="gif">
                <img src="../assets/YIgb.gif" alt="Earth Tracker">
            </div>
        </form>
    </div>
</template>

<script>
import sentryServices from '../services/sentryServices'
export default {
    name: "insurance-claim",
    data() {
        return {
            insurance_claim: {
                reporter_id: this.$route.params.id,
                reporterName: '',
                policyNumber: '',
                email: '',
                insuranceCompanyName: '',
                cashAmount: Number(''),
            }
        }
    },
    methods:{
        claimSubmission(){
            const newClaim = {
                insurance_claim_id: '',
                policyNumber: this.insurance_claim.policyNumber,
                cashAmount: this.insurance_claim.cashAmount,
                insuranceCompanyName: this.insurance_claim.insuranceCompanyName,
                reporterName: this.insurance_claim.reporterName,
                reporter_id: this.insurance_claim.reporter_id,
                email: this.insurance_claim.email
            }
        console.log(newClaim)
            sentryServices.addInsuranceClaim(newClaim).then(response => {
                if(response.status === 200){
                    alert("Report successfully submitted. Please allow for 7-10 business days to recieve an email from the city.")
                    newClaim.insurance_claim_id = response.data.insurance_claim_id;
                      console.log(newClaim)
                    this.$store.state.allInsuranceClaims.push(newClaim);
                    this.$router.push({name: 'account', params: {id: newClaim.reporter_id}})
                }
            })
            .catch((error) => {
                this.$router.push({name: 'account', params: {id: newClaim.reporter_id}})
                console.log('there has been an error submitting your insurance claim report ' + error);
            });

        }
    }
}
</script>

<style scoped>

input[type="submit"]{
    padding: 5px 10px 5px 10px;
    background-color:#F09C24;
    border-radius: 15px;
    font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

.input-group{
    display: flex;
    justify-content: center;
    gap: 0;
    margin:0px 0px 9px 0px;
    padding:0;
    width: 80%;
}

.input-group label {
    flex-grow: 1;
    padding: 0;
    margin:0px
}

img{
    display: inline-block;
    position: relative;
    margin: 0;
    padding: 0px;
    right: 10px;
    top: 7px;

}

.fieldset-heading{
    display: inline-block;
    margin:0px;
    padding:0px;
}


div.icon-label{
    position: relative;
    width: 15em;
    padding: 0px 350px 0px 40px;
    margin: 0px 0px 30px 0px;
}

form#insuranceClaimForm{
   /* background-color: #F4E0B9; */
    display: flex;
    flex-direction: column;
    align-items: center;
    row-gap: 20px;
    
}

fieldset.input-containers{
    border-style: solid;
    border-radius: 15px;
    border-color: #F09C24;
    position: relative;
    width: auto;
}

fieldset label{
    display: inline-block;
    padding: 0px;   
}

.gif {
    margin-bottom: 150px;
    margin-left: 40px;
}

</style>