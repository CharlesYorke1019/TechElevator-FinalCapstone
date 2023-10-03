package com.techelevator.dao;

import com.techelevator.model.Pothole;
import com.techelevator.model.InsuranceClaim;

import java.time.LocalDate;
import java.util.List;

public interface PotholeDao {
    public Pothole getPotholeById (int pothole_id);
    public Pothole addPothole(int reported_by_id, Pothole pothole);
    public List<Pothole> getAllPotholes ();
    public List<Pothole> getPotholesBySeverity (int severity);
    public boolean updatePothole (Pothole pothole);
    public boolean deletePothole (int pothole_id);
    public List<InsuranceClaim> getAllClaims();
    public InsuranceClaim getClaimById(int id);
    public List<InsuranceClaim> getClaimsByName(String name);
    public InsuranceClaim addClaim(InsuranceClaim insuranceclaim);
    public boolean updateClaim(InsuranceClaim insuranceclaim);
    public boolean deleteClaim(int id);



}
