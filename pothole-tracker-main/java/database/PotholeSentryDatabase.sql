ROLLBACK;
BEGIN TRANSACTION;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS insurance_claims CASCADE;
DROP TABLE IF EXISTS potholes CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Create users table
CREATE TABLE users (
  user_id SERIAL NOT NULL,
  username VARCHAR(20) NOT NULL,
  password_hash VARCHAR(200) NOT NULL,
  email VARCHAR(50),
  role varchar(50) NOT NULL,
  CONSTRAINT PK_user_id PRIMARY KEY (user_id)
);

-- Insert sample data into users table with pun-inspired names
INSERT INTO users (username, password_hash, email, role)
VALUES
  ('PotholePun', 'password123', 'potholepun@example.com', 'ROLE_USER'),
  ('JaneDoughnut', 'password456', 'janedoughnut@example.com', 'ROLE_ADMIN'),
  ('PotholePete', 'password789', 'potholepete@example.com', 'ROLE_USER'),
  ('MerryJones', 'password101', 'merryjones@example.com', 'ROLE_USER'),
  ('DavidDrill', 'password122', 'daviddrill@example.com', 'ROLE_ADMIN');

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Create potholes table
CREATE TABLE potholes (
  pothole_id serial NOT NULL,
  location varchar(200) NOT NULL,
  description varchar(500) NOT NULL,
  reported_by varchar(20) NOT NULL,
  status varchar(20) NOT NULL,
  report_date varchar(20) NOT NULL,
  inspect_date varchar(20),
  repair_date varchar(20),
  severity int NOT NULL CHECK (severity >= 1 AND severity <= 5), -- Ensure severity is within the range 1-5
  CONSTRAINT PK_pothole_id PRIMARY KEY (pothole_id),
  CONSTRAINT FK_reported_by FOREIGN KEY (reported_by) REFERENCES users (user_id)
);

-- Insert sample data into potholes table
INSERT INTO potholes (pothole_id, location, description, reported_by, status, report_date, inspect_date, repair_date, severity, user_id)
VALUES
  (1, '123 Main St', 'Pothole near a park', 'John Doe', 'repaired', 'April 2, 2018', NULL, NULL, 3, 1),
  (2, '456 Elm St', 'Large pothole on main road', 'Jane Doe', 'pending', 'May 23, 2023', NULL, NULL, 4, 2),
  (3, '789 Oak St', 'Pothole at intersection', 'Peter Smith', 'repaired', 'August 12, 2018', NULL, NULL, 2, 3),
  (4, '101 Maple St', 'Deep pothole on side street', 'Mary Jones', 'reported', 'February 14, 2023', NULL, NULL, 5, 4),
  (5, '222 Pine St', 'Pothole near school', 'David Brown', 'pending', 'October 3, 2022', NULL, NULL, 3, 5);

-- Create InsuranceClaims table
CREATE TABLE insurance_claims (
  insurance_claim_id SERIAL NOT NULL,
  policy_number VARCHAR(20) NOT NULL,
  cash_amount INT NOT NULL,
  insurance_company_name VARCHAR(50) NOT NULL,
  user_id INT NOT NULL,
  reporter_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (insurance_claim_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Insert sample data into InsuranceClaims table
INSERT INTO insurance_claims (policy_number, cash_amount, insurance_company_name, user_id, reporter_name)
VALUES
  ('1234567890', 1000, 'Progressive Insurance', 1, 'Jane Doe'),
  ('2345678901', 2000, 'Geico Insurance', 2, 'Eric Johnson'),
  ('3456789012', 3000, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  ('4567890123', 4000, 'Allstate Insurance', 4, 'Dominic Perez'),
  ('5678901234', 5000, 'Farmers Insurance', 5, 'Lacy Greene');

COMMIT;
