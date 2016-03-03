create table VACCINATOR (

VaccinatorID NUMBER(9) PRIMARY KEY NOT NULL,
Location_Name VARCHAR2(100) NOT NULL,
AddressID NUMBER(9) NOT NULL,


Constraint VACCINATOR_FK FOREIGN KEY (AddressID) REFERENCES VDB_ADDRESS(AddressID) --needs address id created first
);

CREATE SEQUENCE vaccinator_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TRIGGER VACCINATOR_TRIGGER
BEFORE INSERT ON VACCINATOR
FOR EACH ROW
BEGIN SELECT VACCINATOR_SEQ.NEXTVAL INTO :NEW.VACCINATORID FROM DUAL;
END;

INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'General Hospital',15)
;

INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'IU Health Methodist Hospital', address_seq.NEXTVAL)
;

INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'Community Hospital North', address_seq.NEXTVAL)
;
INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'Med Check Urgent Care', address_seq.NEXTVAL)
;
INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'Peyton Manning Childrens Hospital', address_seq.NEXTVAL)
;
INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'Riley Hospital for Children at Indiana University Health', address_seq.NEXTVAL)
;
INSERT into VACCINATOR (Location_Name, AddressID)
values (NULL,'St. Vincent Womens Hospital', address_seq.NEXTVAL)
;

select * from vaccinator;