create table PATIENT (

PatientID NUMBER(9) PRIMARY KEY NOT NULL,
Last_Name  VARCHAR2(15) NOT NULL,
First_Name VARCHAR2(15) NOT NULL,
Date_Of_Birth DATE,
Gender VARCHAR2(10) NOT NULL,
AddressID NUMBER(9) NOT NULL,

Constraint PATIENT_FK FOREIGN KEY (AddressID) REFERENCES VDB_ADDRESS(AddressID)
);

INSERT into PATIENT values
(1, 
'Morgan',
'Joe',
TO_DATE('20-MAY-1989', 'DD-MON-YYYY'),
'Male',
1)
;






--drop table PATIENT;
--purge table PATIENT;