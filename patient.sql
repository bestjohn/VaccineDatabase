create table PATIENT (

PatientID NUMBER(9) PRIMARY KEY NOT NULL,
Last_Name  VARCHAR2(15) NOT NULL,
First_Name VARCHAR2(15) NOT NULL,
Date_Of_Birth VARCHAR2(10) NOT NULL,
Gender VARCHAR2(10) NOT NULL,
AddressID NUMBER(9) NOT NULL,

Constraint PATIENT_FK FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);

INSERT into PATIENT values
(1, 'Morgan', 'Joe', '05-20-1989', 'Male', 1)
;

select date_of_birth
from patient;


--drop table PATIENT;
--purge table PATIENT;