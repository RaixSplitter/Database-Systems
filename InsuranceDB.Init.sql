

CREATE DATABASE IF NOT EXISTS InsuranceDB;

USE InsuranceDB;

-- [P] Primary key, [F] Foreign key, [U] Unique key, [C] Check constraint, [I] Index
-- TABLES:
-- Person(DriverID[P], DriverName, _Address)
-- Car(License[P], Model, ProdYear)
-- Accident(ReportNumber[P], AccDate, _Location)
-- Owns(DriverID[P], License[P])
-- Partipants(ReportNumber[P], License[P], DriverID[F], DamageAmount)


-- DROP TABLES IF THEY EXIST


DROP TABLE IF EXISTS Owns;

DROP TABLE IF EXISTS Participants;

DROP TABLE IF EXISTS Accident;

DROP TABLE IF EXISTS Car;

DROP TABLE IF EXISTS Person;

-- CREATE TABLES

CREATE TABLE Person
    (DriverID       VARCHAR(8),
     DriverName		VARCHAR(20) NOT NULL,
     _Address		VARCHAR(50),
     PRIMARY KEY(DriverID)
    );

CREATE TABLE Car
    (License		CHAR(7),
     Model			VARCHAR(30),
     ProdYear		YEAR,
     PRIMARY KEY(License)
    );

CREATE TABLE Accident
    (ReportNumber	VARCHAR(10),
     AccDate		DATE,
     _Location		VARCHAR(50),
     PRIMARY KEY(ReportNumber)
    );

CREATE TABLE Owns
    (DriverID		VARCHAR(8),
     License		VARCHAR(8),
     PRIMARY KEY(DriverID, License),
     FOREIGN KEY(DriverID)      REFERENCES Person(DriverID) ON DELETE CASCADE,
     FOREIGN KEY(License)       REFERENCES Car(License) ON DELETE CASCADE
    );

CREATE TABLE Participants
    (ReportNumber	VARCHAR(10),
     License		CHAR(7),
     DriverID		VARCHAR(8),
     DamageAmount	DECIMAL(8,2),
     PRIMARY KEY(ReportNumber, License),
     FOREIGN KEY(ReportNumber)  REFERENCES Accident(ReportNumber) ON DELETE CASCADE,
     FOREIGN KEY(License)       REFERENCES Car(License) ON DELETE CASCADE,
     FOREIGN KEY(DriverID)      REFERENCES Person(DriverID) ON DELETE CASCADE
    );


-- Insert the following
-- Person(31262549, Hans Hansen, Jernbane Alle 74, 2720 Vanløse)

-- Car(JW46898, Honda Accord Aut. 2.0, 2001)

-- Accident(3004000121, 2015-06-18, 2605 Brøndby)

-- Owns(31262549, JW46898)

-- Participants(3004000121, JW46898, 31262549, 6800.00)

INSERT INTO Person VALUES (31262549, 'Hans Hansen', 'Jernbane Alle 74, 2720 Vanløse');

INSERT INTO Car VALUES ('JW46898', 'Honda Accord Aut. 2.0', 2001);

INSERT INTO Accident VALUES ('3004000121', '2015-06-18', '2605 Brøndby');

INSERT INTO Owns VALUES (31262549, 'JW46898');

INSERT INTO Participants VALUES (3004000121, 'JW46898', 31262549, 6800.00);

SELECT * FROM Person NATURAL JOIN car, owns, participants, accident;