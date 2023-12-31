BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO users (username, password_hash, email, role)
VALUES
  ('PotholePun', 'password123', 'potholepun@example.com', 'ROLE_USER'),
  ('JaneDoughnut', 'password456', 'janedoughnut@example.com', 'ROLE_ADMIN'),
  ('PotholePete', 'password789', 'potholepete@example.com', 'ROLE_USER'),
  ('MerryJones', 'password101', 'merryjones@example.com', 'ROLE_USER'),
  ('DavidDrill', 'password122', 'daviddrill@example.com', 'ROLE_ADMIN');

INSERT INTO potholes (pothole_id, location, description, reported_by, report_date, inspect_date, repair_date, severity, status, reported_by_id, lat, lng)
VALUES
  (1011, '123 Main St', 'Pothole near a park', 'John Doe', 'April 2, 2018', NULL, NULL, 2, 'Reported', 1, NULL, NULL),
  (200, '456 Elm St', 'Large pothole on main road', 'Jane Doe', 'May 23, 2023', 'May 27, 2023', NULL, 1, 'Inspected', 3, NULL, NULL),
  (300, '789 Oak St', 'Pothole at intersection', 'Peter Smith', 'August 12, 2018', 'August 15, 2018', 'September 12, 2018', 2, 'Repaired', 2, NULL, NULL),
  (400, '101 Maple St', 'Deep pothole on side street', 'Mary Jones', 'February 14, 2023', 'February 20, 2023', NULL, 1, 'Inspected', 3, NULL, NULL),
  (500, '222 Pine St', 'Pothole near school', 'David Brown', 'October 3, 2022', NULL, NULL, 2, 'Reported', 5, NULL, NULL),
  (20000, 'Church Street, NY, New York (t1)', 'Pothole located on the corner of the street going East', 'Charlie Yorke', 'October 19, 2000', NULL, NULL, 2, 'Reported', 5, '44.326090', '-75.910770'),
  (20001, 'East 14th Street, NY, New York (t1)', 'Pothole located at the center of the street', 'James Teller', 'August 10th, 2018', NULL, NULL, 2, 'Reported', 5, '40.732284', '-73.984863'),
  (20002, '3rd Ave, NY, New York (t1)', 'At the corner of 3rd going east. Be careful!', 'Ali Alpha', 'December 1, 2016', NULL, NULL, 2, 'Reported', 5, '40.732641', '-73.987636'),
  (20003, 'East 11th Street, NY, New York (t1)', 'At the center of East 11th', 'Bari Pool', 'January 4, 2020', NULL, NULL, 2, 'Reported', 5, '40.731397', '-73.988838'),
  (20004, 'East Houston Street, NY, New York (t1)', 'Near the sidewalk to the right on E Houston Street', 'LeBron James', 'July 4, 2010', NULL, NULL, 2, 'Reported', 5, '40.723885', '-73.991498'),
  (20005, 'Chrystie Street, NY, New York (t1)', 'Right as you turn on Chrystie Street', 'Laura Mister', 'April 20, 2009', NULL, NULL, 2, 'Reported', 5, '40.723259', '-73.991176'),
  (20006, 'Elizabeth Street, NY, New York (t1)', 'Big pothole right as you turn on the street', 'Jazz Yor', 'October 22, 2021', NULL, NULL, 2, 'Reported', 5, '40.723047', '-73.994020'),
  (20007, 'Prince Street, NY, New York (t1)', 'Located about 3 seconds after you turn on the street coming East', 'Laruen Stifler', 'September 22, 2002', NULL, NULL, 2, 'Reported', 5, '40.723478', '-73.996155'),
  (20008, 'Worth Street, NY, New York (t1)', 'Worth street has a pothole at the center of it. Be cautious!', 'Charles Yorke', 'October 19, 2000', NULL, NULL, 2, 'Reported', 5, '40.714371', '-74.000468'),
  (20009, 'Murray Street, NY, New York (t1)', 'On the side walk. Be careful when walking down Murray St', 'Richard Banks', 'November 3, 2011', NULL, NULL, 2, 'Reported', 5, '40.713159', '-74.007474'),
  (20010, 'Park Place, NY, New York (t1)', 'At the center of Park Place', 'Collin Marikawa', 'May 18, 2005', NULL, NULL, 2, 'Reported', 5, '40.713005', '-74.008775'),
  (20011, 'Vesey Street, NY, New York (t1)', 'Located about 6 seconds after you turn on the street coming East', 'Charlie Collins', 'October 10, 2022', NULL, NULL, 2, 'Reported', 5, '40.712395', '-74.010991'),
  (20012, 'Surf Ave, NY, New York (t1)', 'At the corner of Surf Ave going east. Be careful!', 'Clyde Drexler', 'February 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.575493', '-73.980086'),
  (20013, 'Bowery Street, NY, New York (t1)', 'Big pothole right as you turn on the street', 'Jodie Yonkers', 'December 19, 2016', NULL, NULL, 2, 'Reported', 5, '40.574754', '-73.980383'),
  (20014, 'West 16th Street, NY, New York (t1)', 'Right as you turn on West 16th Street', 'Chazz Lizard', 'October 10, 2000', NULL, NULL, 2, 'Reported', 5, '40.578145', '-73.984049'),
  (20015, 'West 15th Street, NY, New York (t1)', 'At the corner of West 15th going east', 'Charlie Yorke', 'October 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.577048', '-73.982631'),
  (20016, 'Neptune Ave, NY, New York (t1)', 'Located about 10 seconds after you turn on the street coming West', 'King Neptune', 'December 18, 2020', NULL, NULL, 2, 'Reported', 5, '40.578906', '-73.985227'),
  (20017, 'West 12th Street, NY, New York (t1)', 'Pothole located at the center of the street', 'Steph Curry', 'June 10, 2022', NULL, NULL, 2, 'Reported', 5, '40.575243', '-73.979618'),
  (20018, 'West 17th Street, NY, New York (t1)', 'At the center of West 17th', 'Weston Albany', 'October 20, 2014', NULL, NULL, 2, 'Reported', 5, '40.576197', '-73.984743'),
  (20019, 'West 19th Street, NY, New York (t1)', 'On the side walk. Be careful when walking down West 19th St', 'Alex Blair', 'March 3, 2011', NULL, NULL, 2, 'Reported', 5, '40.578299', '-73.986223'),
  (20020, 'West 20th Street, NY, New York (t1)', 'Right as you turn on the street. Be very cautious!', 'Evan Goldstein', 'June 21, 2019', NULL, NULL, 2, 'Reported', 5, '40.575696', '-73.986751'),
  (20021, 'West 21st Street, NY, New York (t1)', 'Cars beware, big pothole on the road!', 'Sam Pollack', 'November 22, 2020', NULL, NULL, 2, 'Reported', 5, '40.572856', '-73.987325'),
  (20022, 'West 21st Street, NY, New York (t2)', 'Right as you turn on the street ', 'Josh Kent', 'September 22, 2021', NULL, NULL, 2, 'Reported', 5, '40.572856', '-73.987325'),
  (20023, 'West 15th Street, NY, New York (t2)', 'At the corner of West 15th', 'Alex Cooper', 'December 18, 2018', NULL, NULL, 2, 'Reported', 5, '40.573886', '-73.982003'),
  (20024, 'Surf Ave, NY, New York (t2)', 'At the center of Surf Ave', 'Dylan Frank', 'August 20, 2022', NULL, NULL, 2, 'Reported', 5, '40.575484', '-73.979799'),
  (20025, 'West 12th Street, NY, New York (t2)' , 'Right as you turn onto West 12th', 'Augie Stasi', 'August 1, 2022', NULL, NULL, 2, 'Reported', 5, '40.573479', '-73.979670'),
  (20026, 'Stillwell Ave, NY, New York (t1)', '2 seconds after you turn onto Stillwell', 'Scott Cohen', 'December 7, 2015', NULL, NULL, 2, 'Reported', 5, '40.573757', '-73.980867'),
  (20027, 'Stillwell Ave, NY, New York (t2)', 'At the center of Stillwell', 'Justin Snyder', 'February 4, 2020', NULL, NULL, 2, 'Reported', 5, '40.575314', '-73.981157'),
  (20028, 'Surf Ave, NY, New York (t3)', 'At the turn to Surf Ave', 'Jordan Solemani', 'March 20, 2019', NULL, NULL, 2, 'Reported', 5, '40.573886', '-73.990011'),
  (20029, 'West 24th Street, NY, New York (t1)', 'At the center of West 24th', 'Charlie Yorke', 'October 19, 2022', NULL, NULL, 2, 'Reported', 5, '40.574291', '-73.990814'),
  (20030, 'West 23rd Street, NY, New York (t1)', 'At the turn to West 23rd', 'Brandon Cohen', 'August 3, 2020', NULL, NULL, 2, 'Reported', 5, '40.575417', '-73.989952'),
  (20031, '15 Oakwood Street, Jericho, NY, New York (t1)', 'Right on the turn', 'Clyde Yorke', '2022-10-20', NULL, NULL, 2, 'Reported', 5, '40.791407', '-73.523645'),
  (20032, 'Briar Lane, Jericho, NY, New York (t1)', 'At the center of Briar', 'Neol Blair', 'April 13, 2022', NULL, NULL, 2, 'Reported', 5, '40.791707', '-73.524922'),
  (20033, '15 Oakwood Street, Jericho, NY, New York (t2)', 'Corner of Oakwood', 'Rich Yorke', '2022-10-22', NULL, NULL, 2, 'Reported', 5, '40.790886', '-73.523205'),
  (20034, '54 Briar Lane, Jericho,  NY, New York (t2)', 'On the corner of Bounty', 'Deba Goldstein', 'May 13, 2022', NULL, NULL, 2, 'Reported', 5, '40.789949', '-73.528313'),
  (20035, 'Bounty Lane, Jericho, NY, New York (t1)', 'In front of my house!', 'Alen A.', 'January 11, 2022', NULL, NULL, 2, 'Reported', 5, '40.789820', '-73.526748'),
  (20036, 'Bounty Lane, Jericho, NY, New York (t2)', 'On the road by the corner', 'Sam Bam', 'January 13, 2022', NULL, NULL, 2, 'Reported', 5, '40.790958', '-73.524559'),
  (20037, 'Mellow Lane, Jericho, NY, New York (t1)', 'Right at the turn onto Mellow!', 'Lisa Right', 'March 1, 2022', NULL, NULL, 2, 'Reported', 5, '40.791578', '-73.524292'),
  (20038, 'Mellow Lane, Jericho, NY, New York (t2)', 'At the center of Mellow', 'Chaz Runner', 'July 25, 2022', NULL, NULL, 2, 'Reported', 5, '40.793056', '-73.527188'),
  (20039, 'Maytime Drive, Jericho, NY, New York (t1)', '2 seconds onto Maytime', 'Julian Drew', 'July 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.792520', '-73.528841'),
  (20040, 'West Street, NY, New York (t1)', 'Center of West St', 'Charlie Hello', 'October 31, 2022', NULL, NULL, 2, 'Reported', 5, '40.710931', '-74.014571'),
  (20041, 'Rector Street, NY, New York (t1)', 'On the street', 'Charlie Yorke', 'October 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.707831', '-74.013251'),
  (20042, 'Albany Street, NY, New York (t1)', 'On the turn to Albany St', 'Cooper Big', 'July 15, 2022', NULL, NULL, 2, 'Reported', 5, '40.709929', '-74.015890'),
  (20043, 'Liberty Street, NY, New York (t1)', 'At the center of Liberty St', 'Benjamin Yorke', 'July 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.709939', '-74.012243'),
  (20044, 'Pine Street, NY, New York (t1)', 'At the turn onto Pine St', 'Lisa Yo', 'May 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.707971', '-74.010719'),
  (20045, 'Little West Street, NY, New York (t1)', 'On the sidewalk on Little West St', 'Hannah Small', 'October 13, 2022', NULL, NULL, 2, 'Reported', 5, '40.706944', '-74.016541'),
  (20046, 'Beaver Street, NY, New York (t1)', 'At the center of Beaver Street', 'Mr Beaver', 'May 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.706675', '-74.011740'),
  (20047, 'New Street, NY, New York (t1)', 'At the turn onto New St', 'Charlie Yorke', 'May 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.705374', '-74.012449'),
  (20048, 'Stone Street, NY, New York (t1)', 'At the center of Stone St', 'Clyde Banner', 'August 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.704008', '-74.012985'),
  (20049, 'Bridge Street, NY, New York (t1)', 'At the turn onto Bridge St', 'Bruce Pol', 'September 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.703590', '-74.012276'),
  (20050, 'Pearl Street, NY, New York (t1)', 'On the street', 'Charlie Yorke', 'October 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.703129', '-74.014187'),
  (20051, '1st Place, NY, New York (t1)', 'Right as you turn onto 1st Place', 'Cooper Manning', 'August 21, 2022', NULL, NULL, 2, 'Reported', 5, '40.705918', '-74.017430'),
  (20052, 'Beaver Street, NY, New York (t2)', 'At the turn onto Beaver St', 'Eli Manning', 'March 20, 2022', NULL, NULL, 2, 'Reported', 5, '40.705233', '-74.008732'),
  (20053, 'Pearl Street, NY, New York (t2)', 'On the street', 'Charles Long', 'October 3, 2022', NULL, NULL, 2, 'Reported', 5, '40.704631', '-74.009204');

INSERT INTO insurance_claims (insurance_claim_id, policy_number, cash_amount, insurance_company_name, reporter_id, reporter_name)
VALUES
  (100, '1234567890', 1000, 'Progressive Insurance', 1, 'Jane Doe'),
  (200, '2345678901', 288, 'Geico Insurance', 2, 'Eric Johnson'),
  (300, '3456789012', 3200, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  (400, '4567890123', 400, 'Nationwide', 4, 'Dominic Perez'),
  (500, '5678901234', 5000, 'Farmers Insurance', 5, 'Lacy Greene'),
  (600, '1234567890', 125, 'AllState Insurance', 1, 'Jane Doe'),
  (700, '2345678901', 200, 'Nationwide', 2, 'Eric Johnson'),
  (800, '3456789012', 325, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  (900, '4567890123', 4000, 'Allstate Insurance', 4, 'Dominic Perez'),
  (101, '5678901234', 375, 'Farmers Insurance', 5, 'Lacy Greene'),
  (102, '1234567890', 1050, 'Progressive Insurance', 1, 'Jane Doe'),
  (201, '2345678901', 200, 'Geico Insurance', 2, 'Eric Johnson'),
  (301, '3456789012', 30, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  (401, '4567890123', 405, 'Allstate Insurance', 4, 'Dominic Perez'),
  (501, '5678901234', 500, 'Farmers Insurance', 5, 'Lacy Greene'),
  (103, '1234567890', 275, 'Progressive Insurance', 1, 'Jane Doe'),
  (202, '2345678901', 750, 'Geico Insurance', 2, 'Eric Johnson'),
  (302, '3456789012', 300, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  (402, '4567890123', 770, 'Allstate Insurance', 4, 'Dominic Perez'),
  (502, '5678901234', 50, 'Farmers Insurance', 5, 'Lacy Greene'),
  (104, '1234567890', 105, 'Progressive Insurance', 1, 'Jane Doe'),
  (203, '2345678901', 200, 'Geico Insurance', 2, 'Eric Johnson'),
  (303, '3456789012', 2500, 'State Farm Insurance', 3, 'Dylan Sprouse'),
  (403, '4567890123', 40, 'Allstate Insurance', 4, 'Dominic Perez'),
  (503, '5678901234', 505, 'Farmers Insurance', 5, 'Lacy Greene');


COMMIT TRANSACTION;
