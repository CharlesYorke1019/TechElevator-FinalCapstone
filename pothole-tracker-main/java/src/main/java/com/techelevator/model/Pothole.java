package com.techelevator.model;

import java.time.LocalDate;

public class Pothole {
    private int pothole_id;
    private String location;
    private String description;
    private String reportedBy;
    private String reportDate;
    private String inspectDate;
    private String repairDate;
    private int severity;
    private String status;
    private String lat;
    private String lng;
    private int reported_by_id;

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public int getReported_by_id() {
        return reported_by_id;
    }

    public void setReported_by_id(int reported_by_id) {
        this.reported_by_id = reported_by_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPothole_id() {
        return pothole_id;
    }

    public void setPothole_id(int pothole_id) {
        this.pothole_id = pothole_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReportedBy() {
        return reportedBy;
    }

    public void setReportedBy(String reportedBy) {
        this.reportedBy = reportedBy;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getInspectDate() {
        return inspectDate;
    }

    public void setInspectDate(String inspectDate) {
        this.inspectDate = inspectDate;
    }

    public String getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(String repairDate) {
        this.repairDate = repairDate;
    }

    public int getSeverity() {
        return severity;
    }

    public void setSeverity(int severity) {
        this.severity = severity;
    }

    @Override
    public String toString() {
        return "Pothole{" +
                "pothole_id=" + pothole_id +
                ", location='" + location + '\'' +
                ", description='" + description + '\'' +
                ", reportedBy='" + reportedBy + '\'' +
                ", reportDate='" + reportDate + '\'' +
                ", inspectDate='" + inspectDate + '\'' +
                ", repairDate='" + repairDate + '\'' +
                ", severity=" + severity + '\'' +
                ", status=" + status + '\'' +
                ", reported_by_id=" + reported_by_id + '\'' +
                ", lat=" + lat + '\'' +
                ", lng=" + lng  + '\'' +
                '}';
    }

    public Pothole(int pothole_id, String location, String description, String reportedBy, String reportDate, String inspectDate, String repairDate, int severity, String status, int reported_by_id, String lat, String lng) {
        this.pothole_id = pothole_id;
        this.location = location;
        this.description = description;
        this.reportedBy = reportedBy;
        this.reportDate = reportDate;
        this.inspectDate = inspectDate;
        this.repairDate = repairDate;
        this.severity = severity;
        this.status = status;
        this.reported_by_id = reported_by_id;
        this.lat = lat;
        this.lng = lng;
    }

    public Pothole(){}
}

