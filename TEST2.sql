#creating database
CREATE DATABASE Ugand;
USE Ugand;

#Creating the district table
CREATE TABLE DISTRICT (
    DistrictCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(15) UNIQUE NOT NULL,
    Region VARCHAR(15),
    Population INT
);

#Creating the citizen table
CREATE TABLE CITIZEN (
    NIN INT PRIMARY KEY CHECK (NIN >= 10000000000),
    Fname VARCHAR(3) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    DistrictCode VARCHAR(10),
    FOREIGN KEY (DistrictCode) REFERENCES DISTRICT(DistrictCode) ON DELETE CASCADE
);

#viewing tables
SHOW TABLES;
DESCRIBE DISTRICT;
DESCRIBE CITIZEN;

#viewing data 
SELECT * FROM DISTRICT;
SELECT * FROM CITIZEN;

#Inserting records into the district table
INSERT INTO DISTRICT (DistrictCode, Name, Region, Population) VALUES
('D001', 'District A', 'Northern', 100000),
('D002', 'District B', 'Southern', 150000);
SELECT * FROM DISTRICT;

#Insert records into the citizen table
INSERT INTO CITIZEN (NIN, Fname, Lname, Gender, DistrictCode) VALUES
(12345678901, 'John', 'Doe', 'Male', 'D001'),
(12345678902, 'Jane', 'Smith', 'Female', 'D002');
SELECT * FROM CITIZEN;

#Creating view1 to display the total number of districts
CREATE VIEW view1 AS
SELECT COUNT(*) AS TotalDistricts FROM DISTRICT;
SELECT * FROM view1;

#Creating view2 to retrieve the full names of the citizens
CREATE VIEW view2 AS
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM CITIZEN;
SELECT * FROM view2;

#Creating view3 to retrieve details of citizens from the northern region
CREATE VIEW view3 AS
SELECT C.* 
FROM CITIZEN C
JOIN DISTRICT D ON C.DistrictCode = D.DistrictCode
WHERE D.Region = 'Northern';
SELECT * FROM view3;

#Creating view4 to retrieve all districts whose names begin with letter 'A'
CREATE VIEW view4 AS
SELECT * FROM DISTRICT
WHERE Name LIKE 'A%';
SELECT * FROM view4;

#Creating view5 to display the total population
CREATE VIEW view5 AS
SELECT SUM(Population) AS TotalPopulation FROM DISTRICT;
SELECT * FROM view5;

#Creating view6 to display the district with the highest population
CREATE VIEW view6 AS
SELECT * FROM DISTRICT
WHERE Population = (SELECT MAX(Population) FROM DISTRICT);
SELECT * FROM view6;

#viewing the created views
SHOW FULL TABLES IN Ugand WHERE TABLE_TYPE LIKE 'VIEW';
