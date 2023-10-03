import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
  });

export default {
    getPotholes(){
        return http.get(`/potholes`);
    },

    getPothole(potholeId){
        return http.get(`/potholes/${potholeId}`)
    },

    getUsersPotholes(userId){
        return http.get(`/potholes/${userId}`)
    },

    getInsuranceClaims(){
        return http.get(`/insurance_claims`)
    },

    // need to add getPotholeById method

    addPotholeReport(report){
        return http.post(`/potholes`, report);
    },

    addInsuranceClaim(claim){
        return http.post(`/insurance_claims`, claim)
    },

    updatePotholeReport(report){
        return http.put(`/potholes/${report.pothole_id}`, report)
    },

    deletePotholeReport(reportId){
        return http.delete(`/potholes/${reportId}`)
    },

    deleteInsuranceClaim(claimId){
        return http.delete(`/insurance_claims/${claimId}`)
    }




}