

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
    (DriverID       INT(8),
     DriverName		VARCHAR(20) NOT NULL,
     _Address		VARCHAR(50),
     PRIMARY KEY(DriverID)
    );

CREATE TABLE Car
    (License		VARCHAR(8),
     Model			VARCHAR(20),
     ProdYear		YEAR,
     PRIMARY KEY(License)
    );

CREATE TABLE Accident
    (ReportNumber	INT(10),
     AccDate		DATE,
     _Location		VARCHAR(50),
     PRIMARY KEY(ReportNumber)
    );

CREATE TABLE Owns
    (DriverID		INT(8),
     License		VARCHAR(8),
     PRIMARY KEY(DriverID, License),
     FOREIGN KEY(DriverID)      REFERENCES Person(DriverID) ON DELETE CASCADE,
     FOREIGN KEY(License)       REFERENCES Car(License) ON DELETE CASCADE
    );

CREATE TABLE Participants
    (ReportNumber	INT(10),
     License		VARCHAR(8),
     DriverID		INT(8),
     DamageAmount	DECIMAL(8,2),
     PRIMARY KEY(ReportNumber, License),
     FOREIGN KEY(ReportNumber)  REFERENCES Accident(ReportNumber) ON DELETE CASCADE,
     FOREIGN KEY(License)       REFERENCES Car(License) ON DELETE CASCADE,
     FOREIGN KEY(DriverID)      REFERENCES Person(DriverID) ON DELETE CASCADE
    );


