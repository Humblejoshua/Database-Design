-- Active: 1728836407333@@127.0.0.1@3306@bus
-- Active: 1728836407333@@127.0.0.1@3306@bus
CREATE DATABASE Bus;
CREATE TABLE PASSENGER (
    Passenger_ID INT,
    First_Name VARCHAR(45),
    Last_Name VARCHAR(45),
    Gender VARCHAR(45),
    Age INT,
    Phone_Number INT,
    Email VARCHAR(45)
);

CREATE TABLE TICKET (
    Ticket_ID INT,
    Travel_Date VARCHAR(45),
    Departure_Time VARCHAR(45),
    Arrival_Time VARCHAR(45),
    Ticket_Payment VARCHAR(45)
);

 CREATE TABLE CARGO (
    Cargo_ID INT,
    Weigh VARCHAR(45),
    Cargo_Payment VARCHAR(45),
    Cargo_Type VARCHAR(45)
 );   

 CREATE TABLE DRIVER (
    Driver_ID INT,
    First_Name VARCHAR(45),
    Last_Name VARCHAR(45),
    Number_Plate VARCHAR(45)
 );

 CREATE TABLE ROUTE (
    Route_ID INT,
    Route_Name VARCHAR(45),
    Departure_Station VARCHAR(45),
    Arrival_Station VARCHAR(45)
 );

 SHOW TABLES;

ALTER TABLE passenger
ADD PRIMARY KEY (Passenger_ID);

ALTER TABLE ticket
ADD PRIMARY KEY (Ticket_ID);

ALTER TABLE cargo
ADD PRIMARY KEY (Cargo_ID);

ALTER TABLE driver
ADD PRIMARY KEY (Driver_ID);

ALTER TABLE route
ADD PRIMARY KEY (Route_ID);

SHOW TABLES;

INSERT INTO ticket (`Ticket_ID`, `Travel_Date`, `Departure_Time`, `Arrival_Time`, `Ticket_Payment`) VALUES ('16', '12/12/2023', '15:00', '20:00', 'shs.30000');

DELETE FROM ticket WHERE `Ticket_ID`='16';

SELECT Passenger_ID FROM passenger;

SELECT Driver_ID FROM driver WHERE First_Name = 'Lukaya';