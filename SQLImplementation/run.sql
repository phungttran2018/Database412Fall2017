/*
** ------------------------------------------------------
** Author: Phung Tran
** Date: 11/29/2017
** Description: create a run file to run all other sql files.
** ---------------------------------------------------------*/



-- create tables
@ddl

-- show tables
DESC receptionist;
DESC patient;
/*DESC AllergyMedicine;*/
DESC visitInfo;
DESC doctorsAndNurses;
DESC sendAndReceive;
DESC admins;
DESC report;
DESC alterStatus;
DESC setBill;
DESC createChangeDelete;
DESC allergicMedicines;

-- insert data
@insert

-- show table content
/*
** ----------------------------------------------------------------------------
** receptionist table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM receptionist;

/*
** ----------------------------------------------------------------------------
** patient table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM patient;



/*
** ----------------------------------------------------------------------------
** visitInfo table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM visitInfo;

/*
** ----------------------------------------------------------------------------
** doctorAndNurses table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM doctorsAndNurses;

/*
** ----------------------------------------------------------------------------
** sendAndReceive table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM sendAndReceive;

/*
** ----------------------------------------------------------------------------
** admins table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM admins ;

/*
** ----------------------------------------------------------------------------
** report table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM report;
/*

** ----------------------------------------------------------------------------
** alterStatus table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM alterStatus;

/*
** ----------------------------------------------------------------------------
** setBill table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM setBill;

/*
** ----------------------------------------------------------------------------
** createChangeDelete table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM createChangeDelete;

/*
** ----------------------------------------------------------------------------
** allergicMedicines table contenct
** --------------------------------------------------------------------------*/
SELECT * FROM allergicMedicines;

-- run query
/*
** ----------------------------------------------------------------------------
** Query results
** --------------------------------------------------------------------------*/
@query

-- drop tables and views
@drop