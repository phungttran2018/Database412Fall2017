/*
** ------------------------------------------------------
** Author: Phung Tran
** Date: 11/29/2017
** Description: drop all the tables sql
** ---------------------------------------------------------*/



/*
** ----------------------------------------------------------------------------
** script to drop all objects in the database
** --------------------------------------------------------------------------*/

-- Tables 
DROP TABLE receptionist CASCADE CONSTRAINTS purge;
DROP TABLE patient CASCADE CONSTRAINTS purge;
DROP TABLE doctorsAndNurses CASCADE CONSTRAINTS purge;
DROP TABLE admins CASCADE CONSTRAINTS purge;

/*DROP TABLE AllergyMedicine purge;*/
DROP TABLE allergicMedicines purge;
DROP TABLE visitInfo purge;
DROP TABLE sendAndReceive purge;
DROP TABLE report purge;
DROP TABLE alterStatus purge;
DROP TABLE setBill purge;
DROP TABLE createChangeDelete purge;


-- Views for query
DROP VIEW offDutyDoctorsNurses;
DROP VIEW projectAllergicMedicines;
DROP VIEW projectMessages;
DROP VIEW projectPatientSevereCondition;


