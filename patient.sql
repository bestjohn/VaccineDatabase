Create table PATIENT(
PatientID NUMBER(9) PRIMARY KEY,
Last_Name  VARCHAR2(15) NOT NULL,
First_Name VARCHAR2(15) NOT NULL,
Date_Of_Birth DATE,
Gender VARCHAR2(10) NOT NULL,
AddressID NUMBER(9) NOT NULL,
Constraint PATIENT_FK 
FOREIGN KEY (AddressID) 
REFERENCES VDB_ADDRESS(AddressID) 
ON DELETE CASCADE --ADDRESSID MUST BE CREATED FIRST!
);


CREATE SEQUENCE SEQ_PATIENT
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TRIGGER TRIGGER_ID
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN SELECT SEQ_PATIENT.NEXTVAL INTO :NEW.PatientID FROM DUAL;
END;


INSERT into PATIENT values
(NULL, 
'Morgan',
'Joe',
TO_DATE('20-MAY-1989', 'DD-MON-YYYY'),
'Male',
1)
;

INSERT into PATIENT values
(NULL, 
'Kareem',
'David',
TO_DATE('01-AUGUST-1970', 'DD-MON-YYYY'),
'Male',
2)
;

select * from PATIENT;

drop view vw_patient;
create view vw_patient as
select p.first_name, p.last_name, a.street, a.city, a.state
from patient p, vdb_address a
where p.addressid = a.addressid
;

select * from vw_patient;












drop table PATIENT;
purge table PATIENT;
drop sequence seq_patient;
drop trigger trigger_id;