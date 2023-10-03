package com.techelevator.controller;

import com.techelevator.dao.JdbcPotholeDao;
import com.techelevator.dao.PotholeDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.InsuranceClaim;
import com.techelevator.model.Pothole;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class PotholeController {

    //    Add try/catch + exceptions/auth/annotations to those that need

    private PotholeDao potholeDao;

    public PotholeController(PotholeDao potholeDao){
        this.potholeDao = potholeDao;
    }

    @GetMapping("/potholes")
    public List<Pothole> getPotholes() throws InterruptedException {
        return potholeDao.getAllPotholes();
    }

    @GetMapping("/potholes/{id}")
    public Pothole getPothole(@PathVariable int id) throws InterruptedException {
        Pothole result = potholeDao.getPotholeById(id);
        if (result == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No pothole with that id.");
        } else {
            return result;
        }
    }

    @GetMapping("/potholes/{severity}")
    public List<Pothole> getPotholesSeverity(@PathVariable int severity){
        return potholeDao.getPotholesBySeverity(severity);
    }

    @PutMapping("/potholes/{id}")
    public Pothole updatePothole(@PathVariable int id, @RequestBody Pothole updatedPothole){
        updatedPothole.setPothole_id(id);
        if(potholeDao.updatePothole(updatedPothole)){
            return updatedPothole;
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Pothole not found to update.");
        }
    }

    @DeleteMapping("/potholes/{id}")
    public void deletePothole(@PathVariable int id){
        if(!potholeDao.deletePothole(id)){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Pothole not found to delete.");
        }
    }

    @PostMapping("/potholes")
    @ResponseStatus(HttpStatus.CREATED)
    public Pothole addPothole(@RequestBody Pothole newPothole){

//        RestTemplate restTemplate = new RestTemplate();
//
//        HttpHeaders httpHeaders = new HttpHeaders();
//        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
//        httpHeaders.add("Access-Control-Allow-Origin:", "*");
//        httpHeaders.setAccessControlRequestMethod(HttpMethod.POST);
//
//        HttpEntity<Pothole> entity = new HttpEntity<>(newPothole, httpHeaders);
//
//        Pothole returnedPothole = restTemplate.postForObject("http://localhost:9000/potholes", entity, Pothole.class);

        System.out.println("hello");

        return potholeDao.addPothole(newPothole.getReported_by_id(), newPothole);

    }


    @GetMapping("/insurance_claims")
    public List<InsuranceClaim> getAllClaims() throws InterruptedException{
        return potholeDao.getAllClaims();
    }

    @GetMapping("/insurance_claims/{id}")
    public InsuranceClaim getClaimById(@PathVariable int id){
        InsuranceClaim result = potholeDao.getClaimById(id);
        if (result == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No insurance claim with that id.");
        } else {
            return result;
        }
    }

    @GetMapping("/insurance_claims/{name}")
    public List<InsuranceClaim> getClaimsByName(@PathVariable String name) throws InterruptedException{
        return potholeDao.getClaimsByName(name);
    }

    @PostMapping("/insurance_claims")
    public InsuranceClaim addClaim(@RequestBody InsuranceClaim claim){
        return potholeDao.addClaim(claim);
    }

    @DeleteMapping("/insurance_claims/{id}")
    public void deleteClaim(@PathVariable int id){
        if(!potholeDao.deleteClaim(id)){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Insurance Claim not found to delete.");
        }
    }

}
