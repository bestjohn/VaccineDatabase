create table VDB_ADDRESS (

AddressID NUMBER(9) PRIMARY KEY NOT NULL,
Street VARCHAR2(120) NOT NULL,
Unit_Number VARCHAR(5),
City VARCHAR2(20) NOT NULL,
State VARCHAR2(2) NOT NULL,
Country VARCHAR2(20) NOT NULL,
Zip VARCHAR2(10) NOT NULL

);

INSERT into VDB_ADDRESS values 
(1, 
'532 South Parkway', 
'', 
'Indianapolis',
'IN', 
'US', 
'46240');