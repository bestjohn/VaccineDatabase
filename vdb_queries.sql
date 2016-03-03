---five views
drop view vw_patient;
create view vw_patient as
select first_name, last_name, date_of_birth, gender
from patient;

select * from vw_patient;

drop view vw_address;
create view vw_address as
select street, unit_number, city, state, country, zip
from address;

drop view vw_vaccine;
create view vw_vaccine as
select disease, trade_name, manufacturer, vac_type, route
from vaccine;

drop view vw_vaccinator;
create view vw_vaccinator as
select v.location_name, a.street, a.city, a.state, a.country, a.zip
from vaccinator v, address a
where v.addressid = a.addressid;

drop view vw_vaccination;
create view vw_vaccination as
select first_name, last_name, disease, date_taken, route, site, date_of_next
from patient p, vaccine v, vaccination vtn
where p.patientid = vtn.patientid AND vtn.vaccineid = v.vaccineid;

--two string functions (RPAD, )
select RPAD(disease,10,'.') as disease, (route || ', ' || site) as Administration 
from vw_vaccine;


--two number functions (MIN, MAX, NVL)
select last_name, first_name, disease, 
MIN(date_of_next) as Most_Recent, MAX(date_of_next) as Most_Distant
from vw_vaccination
group by last_name, first_name, disease;

select disease, NVL(site, UA) as site
from vw_vaccine;

--two date functions (TO_DATE, MONTHS_BETWEEN)
INSERT into PATIENT values
(NULL, 'Morgan','Joe',TO_DATE('20-MAY-1989', 'DD-MON-YYYY'),'Male',1)
;
select last_name, first_name, 
disease, date_taken, date_of_next, 
MONTHS_BETWEEN(DATE_OF_NEXT, DATE_TAKEN)/12 as years
from vw_vaccination;

--decode function (if, then)
select disease, vac_type, 
DECODE(Route, 
'IM', 'Intramuscular', 
'SC', 'Subcutaneous', 
'ID', 'Intradermal', 
'IN', 'Intranasal', 
'PO', 'oral') as Route
from vaccine
order by disease;


--groupby and having
select disease, COUNT(*), trade_name, manufacturer
from vaccine
group by disease, trade_name, manufacturer
having count(*) > 2;

--subqueries
select v.disease, v.trade_name, v.manufacturer, vtr.location_name, vtn.date_taken, vtn.reason
from vaccine v, vaccinator vtr, vaccination vtn
where vtn.date_taken =
(select EXTRACT(year FROM date_taken)
from vaccination
where EXTRACT(year FROM date_taken) = 2005)
AND vtn.diseaseid =
(select diseaseid, COUNT(*)
from vaccination
where COUNT(*) > 1)
;

--join and outer join



--queries to insert, delete, or update data using savepoints






--'insert all...when...else' and 'insert first...when...else'


--update with embedded select



--merge

--unique and check constraint
--Constraint VACCINATION_PK PRIMARY KEY (VaccinationID),
--Constraint VACCINATION_UQ UNIQUE (PatientID, VaccineID, VaccinatorID),
--CHECK (VACCINATION_PK != NULL and VACCINATION_UQ != NULL)


--table from another table
drop table patient_vaccination_record;
create table patient_vaccination_record as
select p.first_name, p.last_name, 
v.disease, v.trade_name, v.manufacturer, 
vtr.location_name, vtn.date_taken, 
v.route, vtn.site, vtn.date_of_next
from patient p, vaccine v, vaccinator vtr, vaccination vtn
where p.patientid = vtn.patientid 
AND vtn.vaccineid = v.vaccineid 
AND vtn.vaccinatorid = vtr.vaccinatorid
;


--index
create unique index V$DISEASE_TRADE_MANUFACTURER_LOCATION_DATE_TAKEN
  on vw_vaccination(Disease, Trade_Name, Manufacturer);

--sequence
drop sequence address_seq;
CREATE SEQUENCE address_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;



--table drops

drop sequence seq_id;
drop trigger address_trigger;
drop table VDB_ADDRESS;
purge table VDB_ADDRESS;

drop sequence seq_patient;
drop trigger trigger_id;
drop table PATIENT;
purge table PATIENT;

drop sequence seq_vaccine;
drop trigger vaccine_trigger;
drop table VACCINE;
purge table VACCINE;

drop sequence vaccinator_seq;
drop trigger vaccinator_trigger;
drop table VACCINATOR;
purge table VACCINATOR;

drop sequence SEQ_VACCINATION;
drop trigger VACCINATION_TRIGGER;
drop table VACCINATION;
purge table VACCINATION;


