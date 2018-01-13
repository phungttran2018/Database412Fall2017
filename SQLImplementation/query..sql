/*
** ------------------------------------------------------
** Author: Phung Tran
** Date: 11/29/2017
** Description: query all the tables sql
** ---------------------------------------------------------*/

/*
** ----------------------------------------------------------------------------
** Patient with Severe Condition
** For each doctor to retrieve the names and symptoms of patients who have a severe condition. 
** --------------------------------------------------------------------------*/
CREATE OR REPLACE VIEW projectPatientSevereCondition AS
SELECT P.EditPatientConditionLevel, p.names
FROM patient P
WHERE EXISTS(
    SELECT *
    FROM alterStatus A
    WHERE A.PatientDOB = P.bDate AND A.patientName = P.names AND P.EditPatientConditionLevel = 'severe')
;


/*
** ----------------------------------------------------------------------------
** Query 2: Doctor
**Receptionist Messages 	For each doctor to retrieve the receptionist's messages from November 29 at 3:00:00 
** --------------------------------------------------------------------------*/

CREATE OR REPLACE VIEW projectMessages AS

SELECT S.dnID, S.rID, S.messages, S.dateAndTime
FROM sendAndReceive S
WHERE EXISTS(
    select * 
    FROM doctorsAndNurses D
    WHERE D.dnID = S.dnID AND S.DATEANDTIME = '29-NOV-2017 03:00:00'
);

/*
** ----------------------------------------------------------------------------
** Query 4: Receptionist
** Doctor with Off-Duty Status 	Retrieve the names of the doctor who has an off-duty status.
** --------------------------------------------------------------------------*/

CREATE OR REPLACE VIEW offDutyDoctorsNurses AS
SELECT D.dnID, D.staffTitle, D.dnNames, D.staffStatus
FROM doctorsAndNurses D
WHERE EXISTS(
    SELECT * 
    FROM sendAndReceive S, receptionist R
    WHERE R.rId = S.rID AND S.dnID = D.dnID AND D.staffStatus = 'off duty'
);

/*
** ----------------------------------------------------------------------------
** Query 3: Doctor
** Doctor try to get allegic information from the patient he/she sees
** for example patient with the name of bbb
** --------------------------------------------------------------------------*/

CREATE OR REPLACE VIEW projectAllergicMedicines AS
SELECT *
FROM AllergicMedicines M
WHERE EXISTS (
    SELECT *
    FROM patient P, doctorsAndNurses D, alterStatus A
    WHERE D.dnID = A.staffID 
    AND A.PatientDOB = '01-JAN-75' AND A.PatientDOB = P.bDate 
    AND A.patientName = 'ddd' AND A.patientName = P.names 
    AND P.bDate = M.bDate AND P.names = M.names 
);