/*
** ------------------------------------------------------
** Author: Phung Tran
** Date: 11/29/2017
** Description: create all the table and alter 1 table
** ---------------------------------------------------------*/




/*
** ------------------------------------------------------
** script to create receptionist table
** ---------------------------------------------------------*/

CREATE TABLE receptionist(
    staffName VARCHAR2(30) NOT NULL,
    rId CHAR(5) NOT NULL,
    PRIMARY KEY(rId)
);

SHOW ERRORS;

/*
** ------------------------------------------------------
** script to create the PATIENT table 
** ---------------------------------------------------------*/

CREATE TABLE patient(
    names VARCHAR2(30) NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender = 'F' OR gender = 'M'),
    insurance VARCHAR2(50) NOT NULL,
    ssn VARCHAR2(9) NOT NULL,
    bDate DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    status VARCHAR2(13) NOT NULL CHECK(status IN('waiting', 'being seen', 'checked out', 'released')),
    EditPatientConditionLevel VARCHAR(50) NOT NULL CHECK(EditPatientConditionLevel IN('severe', 'medium', 'light')),
    rStaffID  CHAR(5),
    PRIMARY KEY(names, bDate),
    FOREIGN KEY(rStaffID) REFERENCES receptionist(rId) ON DELETE CASCADE
);

SHOW ERRORS;

/*
** ------------------------------------------------------
** script to create the allergy multi-valued table
** ---------------------------------------------------------*/

CREATE TABLE AllergyMedicine(
    bDate DATE NOT NULL,
    names VARCHAR2(30) NOT NULL,
    allergicMedicine VARCHAR2(70) NOT NULL,
    
    PRIMARY KEY (bDate, names, allergicMedicine),
    FOREIGN KEY (bDate, names) REFERENCES patient(bDate, names) ON DELETE CASCADE
);

SHOW ERRORS;

/*
** ------------------------------------------------------
** script to create a VisitInfo table in which it is weak relation to patient table
** ---------------------------------------------------------*/

CREATE TABLE visitInfo(
    dob DATE NOT NULL,
    patientName VARCHAR2(30) NOT NULL,
    dateOfVisit Date NOT NULL,
    conditionsSymptoms VARCHAR2(70),
    
    PRIMARY KEY(dob, patientName, dateOfVisit),
    FOREIGN KEY (dob, patientName) REFERENCES patient(bDate, names) ON DELETE CASCADE
);

SHOW ERRORS;


/*
** ------------------------------------------------------
** script to create doctor/nurse table
** ---------------------------------------------------------*/

CREATE TABLE doctorsAndNurses(
    dnID INTEGER,
    dnNames VARCHAR2(30) NOT NULL, 
    staffTitle VARCHAR2(2) NOT NULL CHECK (staffTitle = 'NP' OR staffTitle = 'DR'),
    staffStatus VARCHAR(16) NOT NULL CHECK (staffStatus IN ('available', 'seeing a patient', 'off duty')),
    PRIMARY KEY(dnID)
);

SHOW ERRORS;

/*
** ------------------------------------------------------
** script to create send/receive table to connect receptionist and doctor/nurse table
** ---------------------------------------------------------*/

CREATE TABLE sendAndReceive(
    rID CHAR(5),
    dnID INTEGER NOT NULL,
    dateAndTime TIMESTAMP WITH LOCAL TIME ZONE,
    messages VARCHAR2(200),
    PRIMARY KEY(rID, dnID),
    FOREIGN KEY(rID) REFERENCES receptionist(rId) ON DELETE CASCADE,
    FOREIGN KEY(dnID) REFERENCES doctorsAndNurses(dnID) ON DELETE CASCADE
);

SHOW ERRORS;

/*
** ------------------------------------------------------
** script to create an admin table
** ---------------------------------------------------------*/

CREATE TABLE admins(
    aId INTEGER PRIMARY KEY,
    aName VARCHAR2(30)
);

SHOW ERRORS;
/*
** ------------------------------------------------------
** script to create report table 
** ---------------------------------------------------------*/

CREATE TABLE report(
    staffID INTEGER,
    staffName VARCHAR2(30),
    reportNO VARCHAR(5),
    patientName VARCHAR2(30),
    treatmentUsed VARCHAR(30) NOT NULL,
    patientdob DATE,
    askAID INTEGER,
    PRIMARY KEY(reportNO),
    FOREIGN KEY(staffID) REFERENCES doctorsAndNurses(dnID) ON DELETE CASCADE,
    FOREIGN KEY(patientName, patientdob) REFERENCES patient(names, bDate) ON DELETE CASCADE,
    FOREIGN KEY(askAID) REFERENCES admins(aId) ON DELETE CASCADE
);

SHOW ERRORS;


/*
** ------------------------------------------------------
** script to create an alter table to connect doctor/nurse table to patient table
** ---------------------------------------------------------*/
CREATE TABLE alterStatus(
    staffID INTEGER,
    PatientDOB DATE,
    patientName VARCHAR2(30),
    PRIMARY KEY(staffID),
    FOREIGN KEY(staffID) REFERENCES doctorsAndNurses(dnID) ON DELETE CASCADE,
    FOREIGN KEY(patientName, patientDOB) REFERENCES patient(names, bDate) ON DELETE CASCADE
);

SHOW ERRORS;


/*
** ------------------------------------------------------
** script to create setBill table to set bill to patient from receptionist table
** ---------------------------------------------------------*/
CREATE TABLE setBill(
    rStaffID  CHAR(5),
    patientName VARCHAR2(30),
    patientDOB DATE,
    paymentAmount INTEGER NOT NULL CHECK(paymentAmount >= 0),
    PRIMARY KEY(rStaffID),
    FOREIGN KEY(rStaffID) REFERENCES receptionist(rId) ON DELETE CASCADE,
    FOREIGN KEY(patientName, patientDOB) REFERENCES patient(names, bDate) ON DELETE CASCADE
);

SHOW ERRORS;
    
/*
** ------------------------------------------------------
** script to create CREATE/CHANGE/DELETE table that contain accounts for the staff
** ---------------------------------------------------------*/
CREATE TABLE createChangeDelete(
    rStaffId CHAR(5),
    aStaffId INTEGER,
    staffId  INTEGER,
    accounts VARCHAR2(50),
    PRIMARY KEY(aStaffId),
    FOREIGN KEY(rStaffId) REFERENCES receptionist(rId) ON DELETE CASCADE,
    FOREIGN KEY(staffId) REFERENCES doctorsAndNurses(dnID) ON DELETE CASCADE,
    FOREIGN KEY(aStaffId) REFERENCES admins(aId) ON DELETE CASCADE
);

SHOW ERRORS;

/*
** ----------------------------------------------------------------------------
** Rename table allergyMedicine to AllergicMedicines using ALTER TABLE STATEMENT  
** --------------------------------------------------------------------------*/

ALTER TABLE allergyMedicine
    RENAME TO allergicMedicines;
    
SHOW ERRORS;


