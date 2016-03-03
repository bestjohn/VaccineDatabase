create table VDB_ADDRESS (

AddressID NUMBER(9) PRIMARY KEY,
Street VARCHAR2(120) NOT NULL,
Unit_Number VARCHAR(5),
City VARCHAR2(20) NOT NULL,
State VARCHAR2(2) NOT NULL,
Country VARCHAR2(20) NOT NULL,
Zip VARCHAR2(10) NOT NULL

);

drop sequence address_seq;
CREATE SEQUENCE address_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


drop trigger address_trigger;
CREATE TRIGGER ADDRESS_TRIGGER
BEFORE INSERT ON VDB_ADDRESS
FOR EACH ROW
BEGIN SELECT address_seq.NEXTVAL INTO :NEW.AddressID FROM DUAL;
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
'42 Riverdale St',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46204'
);

INSERT into VDB_ADDRESS values
(NULL,
'150 Hancock Ct',
NULL,
'Bloomington',
'IN',
'US',
'47401'
);

INSERT into VDB_ADDRESS values
(NULL,
'23 Hunter Ave',
NULL,
'Bloomington',
'IN',
'US',
'47401'
);

INSERT into VDB_ADDRESS values
(NULL,
'270 Jeremiad Dr',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46220'
);

INSERT into VDB_ADDRESS values
(NULL,
'1100 Express Dr',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46204'
);

INSERT into VDB_ADDRESS values
(NULL,
'520 South Medical Dr',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46219'
);

INSERT into VDB_ADDRESS values
(NULL,
'190 Avril Ln',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46224'
);

INSERT into VDB_ADDRESS values
(NULL,
'77 Fortune Rd',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46224'
);

INSERT into VDB_ADDRESS values
(NULL,
'287 Opportunity St',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46224'
);
select * from vdb_address;

