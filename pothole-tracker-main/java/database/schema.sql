BEGIN TRANSACTION;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS insurance_claims CASCADE;
DROP TABLE IF EXISTS potholes CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Create users table
CREATE TABLE users (
  user_id SERIAL NOT NULL,
  username VARCHAR(20) NOT NULL UNIQUE,
  password_hash VARCHAR(200) NOT NULL,
  email VARCHAR(50),
  role varchar(50) NOT NULL,
  CONSTRAINT PK_user_id PRIMARY KEY (user_id)
);


-- Create potholes table
CREATE TABLE potholes (
  pothole_id serial NOT NULL,
  location varchar(200) NOT NULL UNIQUE,
  description varchar(500) NOT NULL,
  reported_by varchar(50) NOT NULL,
  status varchar(20),
  report_date varchar(20) NOT NULL,
  inspect_date varchar(20),
  repair_date varchar(20),
  reported_by_id int,
  lat varchar(200),
  lng varchar(200),
  severity int NOT NULL CHECK (severity >= 1 AND severity <= 5), -- Ensure severity is within the range 1-5
  CONSTRAINT PK_pothole_id PRIMARY KEY (pothole_id),
  CONSTRAINT FK_reported_by_id FOREIGN KEY (reported_by_id) REFERENCES users (user_id)
);


-- Create InsuranceClaims table
CREATE TABLE insurance_claims (
  insurance_claim_id SERIAL NOT NULL,
  policy_number VARCHAR(20) NOT NULL,
  cash_amount INT NOT NULL,
  insurance_company_name VARCHAR(50) NOT NULL,
  reporter_name VARCHAR(50) NOT NULL,
  reporter_id int NOT NULL,
  email VARCHAR(50),
  PRIMARY KEY (insurance_claim_id),
  CONSTRAINT fk_reporter_id FOREIGN KEY (reporter_id) REFERENCES users (user_id)
);

COMMIT TRANSACTION;
