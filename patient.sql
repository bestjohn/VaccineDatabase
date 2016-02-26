Create table PATIENT(
PatientID NUMBER(9) PRIMARY KEY NOT NULL,
Last_Name  VARCHAR2(15) NOT NULL,
First_Name VARCHAR2(15) NOT NULL,
Date_Of_Birth DATE,
Gender VARCHAR2(10) NOT NULL,
AddressID NUMBER(9) NOT NULL,
Constraint PATIENT_FK FOREIGN KEY (AddressID) REFERENCES VDB_ADDRESS(AddressID) --ADDRESSID MUST BE CREATED FIRST!
);

INSERT into PATIENT values
(1, 
'Morgan',
'Joe',
TO_DATE('20-MAY-1989', 'DD-MON-YYYY'),
'Male',
1)
;

INSERT into PATIENT values
(2, 
'Kareem',
'David',
TO_DATE('01-AUGUST-1970', 'DD-MON-YYYY'),
'Male',
2)
;



drop view vw_patient;
create view vw_patient as
select p.first_name, p.last_name, a.street, a.city, a.state
from patient p, vdb_address a
where p.addressid = a.addressid
;














drop table PATIENT;
purge table PATIENT;