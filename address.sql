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
NULL, 
'Indianapolis',
'IN', 
'US', 
'46240');

INSERT into VDB_ADDRESS values 
(2, 
'240 Jordan Dr', 
NULL, 
'Indianapolis',
'IN', 
'US', 
'46240');


INSERT into VDB_ADDRESS values
(15,
'1100 Express Dr',
NULL,
'INDIANAPOLIS',
'IN',
'US',
'46204'
);


drop view vw_vaccination;

create view vw_vaccination as
select p.first_name, p.last_name,
v.vaccine, 
vtr.location_name,
vnt.date_taken
from patient p, vdb_address a, vaccine v, vaccinator vtr, vaccination vcnt
where 
;






drop table VDB_ADDRESS;
purge table VDB_ADDRESS;