create table VDB_ADDRESS (

AddressID NUMBER(9) PRIMARY KEY,
Street VARCHAR2(120) NOT NULL,
Unit_Number VARCHAR(5),
City VARCHAR2(20) NOT NULL,
State VARCHAR2(2) NOT NULL,
Country VARCHAR2(20) NOT NULL,
Zip VARCHAR2(10) NOT NULL

);

drop sequence seq_id;
CREATE SEQUENCE SEQ_ID
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


drop trigger address_trigger;
CREATE TRIGGER ADDRESS_TRIGGER
BEFORE INSERT ON VDB_ADDRESS
FOR EACH ROW
BEGIN SELECT SEQ_ID.NEXTVAL INTO :NEW.AddressID FROM DUAL;
END;

INSERT into VDB_ADDRESS values 
(NULL, 
'532 South Parkway', 
NULL, 
'Indianapolis',
'IN', 
'US', 
'46240');

INSERT into VDB_ADDRESS values 
(NULL, 
'240 Jordan Dr', 
NULL, 
'Indianapolis',
'IN', 
'US', 
'46240');

INSERT into VDB_ADDRESS values
(NULL,
'1100 Express Dr',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46204'
);

select * from vdb_address;






drop table VDB_ADDRESS;
purge table VDB_ADDRESS;