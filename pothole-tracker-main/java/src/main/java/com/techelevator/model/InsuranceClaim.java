package com.techelevator.model;

import java.math.BigDecimal;

public class InsuranceClaim {
    private int insuranceClaimID;
    private String policyNumber;
    private BigDecimal cashAmount;
    private String insuranceCompanyName;
    private String email;
    private String reporterName;
    private int reporter_id;

    public InsuranceClaim(int insuranceClaimID, String policyNumber, BigDecimal cashAmount, String insuranceCompanyName, String reporterName, String email, int reporter_id) {
        this.insuranceClaimID = insuranceClaimID;
        this.policyNumber = policyNumber;
        this.cashAmount = cashAmount;
        this.insuranceCompanyName = insuranceCompanyName;
        this.reporterName = reporterName;
        this.email = email;
        this.reporter_id = reporter_id;
    }
    public InsuranceClaim(){}

    public int getReporter_id() {
        return reporter_id;
    }

    public void setReporter_id(int reporter_id) {
        this.reporter_id = reporter_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getReporterName() {
        return reporterName;
    }

    public void setReporterName(String reporterName) {
        this.reporterName = reporterName;
    }

    public int getInsuranceClaimID() {
        return insuranceClaimID;
    }

    public void setInsuranceClaimID(int insuranceClaimID) {
        this.insuranceClaimID = insuranceClaimID;
    }

    public String getPolicyNumber() {
        return policyNumber;
    }

    public void setPolicyNumber(String policyNumber) {
        this.policyNumber = policyNumber;
    }

    public BigDecimal getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(BigDecimal cashAmount) {
        this.cashAmount = cashAmount;
    }

    public String getInsuranceCompanyName() {
        return insuranceCompanyName;
    }

    public void setInsuranceCompanyName(String insuranceCompanyName) {
        this.insuranceCompanyName = insuranceCompanyName;
    }

    @Override
    public String toString() {
        return "InsuranceClaim{" +
                "insuranceClaimID=" + insuranceClaimID +
                ", policyNumber='" + policyNumber + '\'' +
                ", cashAmount=" + cashAmount +
                ", insuranceCompanyName='" + insuranceCompanyName + '\'' +
                ", email='" + email + '\'' +
                ", reporter_id'" + reporter_id + '\'' +
                '}';
    }
}
