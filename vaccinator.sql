create table VACCINATOR (

Location_Name VARCHAR2(100) NOT NULL,
AddressID NUMBER(9) NOT NULL,

Constraint VACCINATOR_PK PRIMARY KEY (Location_Name, AddressID),
Constraint VACCINATOR_FK FOREIGN KEY (AddressID) REFERENCES VDB_ADDRESS(AddressID) --needs address id created first
);

INSERT into VACCINATOR values
('General Hospital', 15)
;


drop view vw_vaccinator;
create view vw_vaccinator as
select vtr.location_name, a.street, a.city, a.state, a.country, a.zip
from vaccinator vtr, vdb_address a
where vtr.addressid = a.addressid
;







drop table VACCINATOR;
purge table VACCINATOR;