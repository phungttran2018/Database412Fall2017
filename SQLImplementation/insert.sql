/*
** ------------------------------------------------------
** Author: Phung Tran
** Date: 11/29/2017
** Description: insert datas into all the tables sql file
** ---------------------------------------------------------*/

/*
** ----------------------------------------------------------------------------
** script to insert data into the receptionist table and update the staffName.
** --------------------------------------------------------------------------*/

INSERT INTO receptionist VALUES('Justin Bieber', 'R-001'); 
INSERT INTO receptionist VALUES('Adam Levine', 'R-002');
INSERT INTO receptionist VALUES('Zac Efron', 'R-003');
INSERT INTO receptionist VALUES('Ryan Gosling', 'R-004');
INSERT INTO receptionist VALUES('Chris Hemsworth', 'R-005');

UPDATE receptionist SET STAFFNAME = 'Ryan Reynolds' WHERE RID = 'R-003';
UPDATE receptionist SET STAFFNAME = 'Johnny Depp' WHERE RID = 'R-004';

/*
** ----------------------------------------------------------------------------
** script to insert data into the patient table and update the status of the patient table
** --------------------------------------------------------------------------*/

INSERT INTO patient VALUES('aaa', 'F', 'statefarm','123123123', '01-JAN-85', 'Tempe1', 'waiting', 'light', 'R-001'); 
INSERT INTO patient VALUES('bbb', 'M', 'access', '124124124', '01-JAN-95', 'Tempe2', 'being seen', 'medium', 'R-002');
INSERT INTO patient VALUES('ccc', 'F', 'blue cross', '125125125', '01-JAN-65', 'Tempe3', 'checked out', 'severe', 'R-003');
INSERT INTO patient VALUES('ddd', 'M', 'geico', '126126126', '01-JAN-75', 'Tempe4', 'released', 'severe', 'R-004');
INSERT INTO patient VALUES('eee', 'F', 'statefarm', '127127127', '01-JAN-85', 'Tempe5', 'waiting', 'light', 'R-005');

UPDATE patient SET STATUS = 'being seen' WHERE NAMES = 'aaa';
UPDATE patient SET STATUS = 'released' WHERE NAMES = 'ccc';

/*
** ----------------------------------------------------------------------------
** script to insert data into the allergicMedicine table and update the medicines of the patient table
** --------------------------------------------------------------------------*/

INSERT INTO allergicMedicines VALUES('01-JAN-85', 'aaa', 'Tylernold');
INSERT INTO allergicMedicines VALUES('01-JAN-65', 'ccc', 'Advil');
INSERT INTO allergicMedicines VALUES('01-JAN-75', 'ddd', 'Nightquil');
INSERT INTO allergicMedicines VALUES('01-JAN-85', 'eee', 'Advil');
INSERT INTO allergicMedicines VALUES('01-JAN-95', 'bbb', 'Cough drop');

UPDATE allergicMedicines SET ALLERGICMEDICINE = 'None' WHERE NAMES = 'aaa' AND BDATE = '01-JAN-85';
UPDATE allergicMedicines SET ALLERGICMEDICINE = 'None' WHERE NAMES = 'ccc' AND BDATE = '01-JAN-65';

/*
** ----------------------------------------------------------------------------
** script to insert data into the cisitInfo table and update the symptoms of the patient in the table
** --------------------------------------------------------------------------*/

INSERT INTO visitInfo VALUES('01-JAN-85', 'aaa' ,'01-NOV-2017', 'frozen');
INSERT INTO visitInfo VALUES('01-JAN-65','ccc' ,'05-NOV-2017', 'sneezing nonstop');
INSERT INTO visitInfo VALUES('01-JAN-75','ddd' ,'07-NOV-2017', 'tummy pain');
INSERT INTO visitInfo VALUES('01-JAN-85','eee' ,'28-NOV-2017', 'diarhea');
INSERT INTO visitInfo VALUES('01-JAN-95','bbb' ,'29-NOV-2017', 'coughing');

UPDATE visitInfo SET CONDITIONSSYMPTOMS = 'High Fever' WHERE patientName = 'bbb' AND dob = '01-JAN-95';
UPDATE visitInfo SET CONDITIONSSYMPTOMS = 'low blood pressure' WHERE patientName = 'ddd' AND dob = '01-JAN-75';

/*
** ----------------------------------------------------------------------------
** script to insert data into the doctor and nurse table and update the job title it as well
** np = NURSE PRACTITIONOR, DR = doctor
** --------------------------------------------------------------------------*/

INSERT INTO doctorsAndNurses VALUES(100, 'Lady Gaga', 'DR', 'available');
INSERT INTO doctorsAndNurses VALUES(101, 'Katy Perry', 'DR', 'seeing a patient');
INSERT INTO doctorsAndNurses VALUES(102, 'Emma Watson', 'DR', 'off duty');
INSERT INTO doctorsAndNurses VALUES(103, 'Jennifer Lawrence', 'DR', 'seeing a patient');
INSERT INTO doctorsAndNurses VALUES(104, 'Taylor Swift', 'DR', 'off duty');

UPDATE doctorsAndNurses SET STAFFTITLE = 'NP' WHERE DNID = 101;
UPDATE doctorsAndNurses SET STAFFTITLE = 'NP' WHERE DNID = 103;

/*
** ----------------------------------------------------------------------------
** script to insert data into the send and receive table and update the messages
** --------------------------------------------------------------------------*/

INSERT INTO sendAndReceive VALUES('R-001', 100, '29-NOV-2017 2:45:00', 'There are a few severe cases');
INSERT INTO sendAndReceive VALUES('R-003', 101, '29-NOV-2017 2:57:00', 'nooooo');
INSERT INTO sendAndReceive VALUES('R-002', 102, '29-NOV-2017 3:00:00', 'yessssss');
INSERT INTO sendAndReceive VALUES('R-003', 103, '29-NOV-2017 7:45:00', 'maybeeeee');
INSERT INTO sendAndReceive VALUES('R-005', 104, '29-NOV-2017 9:45:00', 'sureeeee');

UPDATE sendAndReceive SET MESSAGES = 'maybe Yes' WHERE RID = 'R-002';
UPDATE sendAndReceive SET MESSAGES = 'maybe NO' WHERE RID = 'R-003';

/*
** ----------------------------------------------------------------------------
** script to insert data into admins table and update admin names
** --------------------------------------------------------------------------*/

INSERT INTO admins VALUES(1, 'Phung Tran');
INSERT INTO admins VALUES(2, 'Kate Chaiyasut');
INSERT INTO admins VALUES(3, 'aaaaaaa');
INSERT INTO admins VALUES(4, 'Abdul Alarabi');
INSERT INTO admins VALUES(5, 'bbbbbbbb');

UPDATE admins SET aName = 'Seong Min Kim' WHERE aId = 3;
UPDATE admins SET aName = 'Cory Latino' WHERE aId = 5;

/*
** ------------------------------------------------------
** script to insert data to report table and update the treatment used
** ---------------------------------------------------------*/

INSERT INTO report VALUES(100, 'Lady Gaga', 'Re-01', 'aaa', 'cough drop','01-JAN-85', 1); 
INSERT INTO report VALUES(101, 'Katy Perry', 'Re-02', 'bbb', 'cough drop','01-JAN-95', 1); 
INSERT INTO report VALUES(100, 'Lady Gaga', 'Re-03', 'ccc', 'cough drop','01-JAN-65', 1); 
INSERT INTO report VALUES(102, 'Emma Watson', 'Re-04', 'ddd', 'cough drop','01-JAN-75', 1); 
INSERT INTO report VALUES(103, 'Jennifer Lawrence', 'Re-05', 'eee', 'cough drop','01-JAN-85', 1); 

UPDATE report SET treatmentUsed = 'advil' WHERE reportNO = 'Re-01';
UPDATE report SET treatmentUsed = 'Tylernold' WHERE reportNO = 'Re-02';

/*
** ------------------------------------------------------
** add data to  setBill table and update the bill amount
** ---------------------------------------------------------*/

INSERT INTO setBill VALUES('R-003', 'aaa', '01-JAN-85', 87);
INSERT INTO setBill VALUES('R-001', 'bbb', '01-JAN-95', 557);
INSERT INTO setBill VALUES('R-002', 'aaa', '01-JAN-85', 13);
INSERT INTO setBill VALUES('R-004', 'ddd', '01-JAN-75', 1);
INSERT INTO setBill VALUES('R-005', 'eee', '01-JAN-85', 55);


UPDATE setBill SET paymentAmount = 85 WHERE rStaffID = 'R-001';
UPDATE setBill SET paymentAmount = 45 WHERE rStaffID = 'R-004';

/*
** ------------------------------------------------------
** script to create an alter table to connect doctor/nurse table to patient table and update dob to its correct num
** For this table I won't do the update because both staff ID and patient dob patient name is the primary for 2 tables
** and in here there is really no used of an update table to be honest unless there is some other important messages.
** ---------------------------------------------------------*/

INSERT INTO alterStatus VALUES(100,'01-JAN-85', 'aaa'); 
INSERT INTO alterStatus VALUES(101,'01-JAN-95', 'bbb'); 
INSERT INTO alterStatus VALUES(102,'01-JAN-65', 'ccc'); 
INSERT INTO alterStatus VALUES(103,'01-JAN-75', 'ddd'); 
INSERT INTO alterStatus VALUES(104,'01-JAN-85', 'eee'); 


/*UPDATE alterStatus SET PatientDOB = '01-JAN-75' AND patientName = 'ddd' WHERE  staffID = '104';
UPDATE alterStatus SET PatientDOB = '01-JAN-65' AND patientName = 'ccc' WHERE staffID = '103';

*/


/*
** ------------------------------------------------------
** add data to create change delete table and update staff account
** ---------------------------------------------------------*/

INSERT INTO createChangeDelete VALUES('R-001', 1, 100, 'account 5');
INSERT INTO createChangeDelete VALUES('R-002', 2, 101, 'account 54');
INSERT INTO createChangeDelete VALUES('R-003', 4, 102, 'account 3');
INSERT INTO createChangeDelete VALUES('R-004', 5, 103, 'account 4');
INSERT INTO createChangeDelete VALUES('R-005', 3, 104, 'account 6');

UPDATE createChangeDelete SET staffID = NULL WHERE aStaffID = 4;
UPDATE createChangeDelete SET rStaffId = 'R-001' WHERE aStaffID = 3;



