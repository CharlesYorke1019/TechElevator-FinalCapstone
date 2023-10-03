package com.techelevator.dao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Pothole;
import com.techelevator.model.InsuranceClaim;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

@Component
@CrossOrigin
public class JdbcPotholeDao implements PotholeDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcPotholeDao (JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Pothole getPotholeById (int pothole_id) {
        Pothole pothole = null;
        try {
            String sql = "SELECT * FROM potholes WHERE pothole_id = ?;";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, pothole_id);

            if (results.next()) {
                pothole = mapRowToPothole(results);
            }
        }   catch (CannotGetJdbcConnectionException e) {
            throw new DataIntegrityViolationException("Cannot access data.");
        }
            return pothole;
    }

    @Override
    public Pothole addPothole(int reported_by_id, Pothole pothole) {
        Pothole newPothole = null;
        String sql = "INSERT INTO potholes (location, description, reported_by, report_date, severity, reported_by_id, status, lat, lng) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING pothole_id;";

        try {
            int newId = jdbcTemplate.queryForObject(sql, int.class, pothole.getLocation(),pothole.getDescription(), pothole.getReportedBy(), pothole.getReportDate(), pothole.getSeverity(), reported_by_id, "Reported", pothole.getLat(), pothole.getLng());
            newPothole = getPotholeById(newId);
            newPothole.setStatus("Reported");
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("unable to connect", e);
        }

        return newPothole;

//        int newId = jdbcTemplate.queryForObject(sql, int.class, pothole.getLocation(),pothole.getDescription(), pothole.getReportedBy(), pothole.getReportDate(), pothole.getStatus(), pothole.getSeverity());
//        pothole.setPothole_id(newId);
//        newPothole = getPotholeById(newId);
//        newPothole.setStatus("not done");
//        return newPothole;
    }

        @Override
        public List<Pothole> getAllPotholes () {
            List<Pothole> potholes = new ArrayList<>();
            String sql = "SELECT * FROM potholes;";
            try {
                SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
                while (results.next()) {
                    Pothole pothole = mapRowToPothole(results);
                    potholes.add(pothole);
                }
            } catch (CannotGetJdbcConnectionException e) {
                throw new DaoException("unable to connect", e);
            }
            return potholes;
        }

        @Override
        public List<Pothole> getPotholesBySeverity (int severity) {
            List<Pothole> potholes = new ArrayList<>();
            String sql = "SELECT * FROM potholes WHERE severity = ?;";
            try {
                SqlRowSet results = jdbcTemplate.queryForRowSet(sql, severity);
                while (results.next()) {
                    Pothole pothole = mapRowToPothole(results);
                    potholes.add(pothole);
                }
            }  catch (CannotGetJdbcConnectionException e) {
                throw new DaoException("Unable to connect", e);
            }
                return potholes;
            }

        @Override
        public boolean updatePothole ( Pothole pothole){
            String sql = "UPDATE potholes SET location = ?, description = ?, reported_by = ?, report_date = ?, inspect_date = ?, repair_date = ?, severity = ?, status = ?, reported_by_id = ? WHERE pothole_id= ?;";

            int count = jdbcTemplate.update(sql, pothole.getLocation(), pothole.getDescription(), pothole.getReportedBy(), pothole.getReportDate(), pothole.getInspectDate(), pothole.getRepairDate(), pothole.getSeverity(), pothole.getStatus(), pothole.getReported_by_id(), pothole.getPothole_id());

            return count == 1;
        }

        @Override
        public boolean deletePothole (int pothole_id){
            try {
                String sql = "DELETE FROM potholes WHERE pothole_id = ?;";
                int count = jdbcTemplate.update(sql, pothole_id);
                return count == 1;
            } catch (DataIntegrityViolationException e) {
                throw new DaoException("Error deleting pothole " + pothole_id, e);
            }
        };
        @Override
        public List<InsuranceClaim> getAllClaims () {
            List<InsuranceClaim> claims = new ArrayList<>();
            String sql = "SELECT insurance_claim_id, policy_number, cash_amount, insurance_company_name, reporter_name, email, reporter_id FROM insurance_claims;";
            try {
                SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
                while (results.next()) {
                    InsuranceClaim claim = mapRowToInsuranceClaim(results);
                    claims.add(claim);
                }
            } catch (CannotGetJdbcConnectionException e) {
                throw new DaoException("unable to connect", e);
            }
            return claims;
        }
    @Override
    public InsuranceClaim getClaimById (int claim_id) {
        InsuranceClaim claim = null;
        try {
            String sql = "SELECT * FROM insurance_claims WHERE insurance_claim_id = ?;";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, claim_id);

            if (results.next()) {
                claim = mapRowToInsuranceClaim(results);
            }
        }   catch (CannotGetJdbcConnectionException e) {
            throw new DataIntegrityViolationException("Cannot access data.");
        }
        return claim;
    }
    @Override
    public List<InsuranceClaim> getClaimsByName (String name) {
        List<InsuranceClaim> claims = new ArrayList<>();
        try {
            String sql = "SELECT claim_id, policy_number, cash_amount, insurance_company_name, reporter_name FROM insurance_claims WHERE reporter_name = ?;";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
            while (results.next()) {
                InsuranceClaim claim = mapRowToInsuranceClaim(results);
                claims.add(claim);
            }
        }   catch (CannotGetJdbcConnectionException e) {
            throw new DataIntegrityViolationException("Cannot access data.");
        }
        return claims;
    }
    public InsuranceClaim addClaim(InsuranceClaim insuranceclaim) {
            String sql = "INSERT INTO insurance_claims (reporter_id, policy_number, cash_amount, insurance_company_name, reporter_name, email) VALUES (?, ?, ?, ?, ?, ?) RETURNING insurance_claim_id;";
            int newId = jdbcTemplate.queryForObject(sql, int.class, insuranceclaim.getReporter_id(), insuranceclaim.getPolicyNumber(), insuranceclaim.getCashAmount(), insuranceclaim.getInsuranceCompanyName(), insuranceclaim.getReporterName(), insuranceclaim.getEmail());
            insuranceclaim.setInsuranceClaimID(newId);

            return insuranceclaim;
    }
    @Override
    public boolean updateClaim(InsuranceClaim insuranceclaim) {
        String sql = "UPDATE insurance_claims SET insurance_claim_id = ?, policy_number = ?, cash_amount = ?, insurance_company_name = ?, reporter_name = ?;";

        int count = jdbcTemplate.update(sql, insuranceclaim.getInsuranceClaimID(), insuranceclaim.getPolicyNumber(), insuranceclaim.getCashAmount(), insuranceclaim.getInsuranceCompanyName(), insuranceclaim.getReporterName());

        return count == 1;
    }
    @Override
    public boolean deleteClaim(int id) {
        try {
            String sql = "DELETE FROM insurance_claims WHERE insurance_claim_id = ?;";
            int count = jdbcTemplate.update(sql, id);
            return count == 1;
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Error deleting pothole " + id, e);
        }
    };

    private Pothole mapRowToPothole(SqlRowSet rs) {
        Pothole pothole = new Pothole();
        pothole.setPothole_id(rs.getInt("pothole_id"));
        pothole.setLocation(rs.getString("location"));
        pothole.setDescription(rs.getString("description"));
        pothole.setReportedBy(rs.getString("reported_by"));
        pothole.setReportDate(rs.getString("report_date"));
        pothole.setInspectDate(rs.getString("inspect_date"));
        pothole.setRepairDate(rs.getString("repair_date"));
        pothole.setSeverity(rs.getInt("severity"));
        pothole.setStatus(rs.getString("status"));
        pothole.setReported_by_id(rs.getInt("reported_by_id"));
        pothole.setLat(rs.getString("lat"));
        pothole.setLng(rs.getString("lng"));
        return pothole;
    }

    private InsuranceClaim mapRowToInsuranceClaim(SqlRowSet rowSet){
        InsuranceClaim claim = new InsuranceClaim();
        claim.setCashAmount(rowSet.getBigDecimal("cash_amount"));
        claim.setInsuranceClaimID(rowSet.getInt("insurance_claim_id"));
        claim.setInsuranceCompanyName(rowSet.getString("insurance_company_name"));
        claim.setPolicyNumber(rowSet.getString("policy_number"));
        claim.setReporterName(rowSet.getString("reporter_name"));
        claim.setEmail(rowSet.getString("email"));
        claim.setReporter_id(rowSet.getInt("reporter_id"));
        return claim;
    }
}
