create table VACCINATOR (

Location_Name VARCHAR2(100) NOT NULL,
AddressID NUMBER(9) NOT NULL,

Constraint VACCINATOR_PK PRIMARY KEY (Location_Name, AddressID),
Constraint VACCINATOR_FK FOREIGN KEY (AddressID) REFERENCES VDB_ADDRESS(AddressID)
);

INSERT into VACCINATOR values
('General Hospital', 1)
;