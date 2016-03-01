---five views
drop view vw_patient;
create view vw_patient as
select p.first_name, p.last_name, a.street, a.city, a.state
from patient p, vdb_address a
where p.addressid = a.addressid
;

drop view vw_vaccine;
create view vw_vaccine as
select v.disease, v.manufacturer, vtn.route, vtn.site
from vaccine v, vaccination vtn
where v.vaccineid = vtn.vaccineid
;

drop view vw_vaccinator;
create view vw_vaccinator as
select vtr.location_name, a.street, a.city, a.state, a.country, a.zip
from vaccinator vtr, vdb_address a
where vtr.addressid = a.addressid
;

drop view vw_vaccination;
create view vw_vaccination as
select first_name, last_name, disease, date_taken, route, site, date_of_next
from patient p, vaccine v, vaccination vtn
where p.patientid = vtn.patientid AND vtn.vaccineid = v.vaccineid
;


--two string functions
--RPAD function
select disease, CONCAT(route, site) as Administration
from vw_vaccine;

--two number functions
--select MIN/MAX date_of_next for each vaccine of a patient
select patient, disease, MIN(date_of_next), MAX(date_of_next);
select disease, NVL(route, IM) as route, NVL(site, UA) as site
from vw_vaccine;

--two date functions
--to_date function, months_between function (+ round func)

--decode function


--advanced queries using
--groupby and having,subqueries,decode,join and outer join

--queries to insert, delete, or update data using
--savepoints

--'insert all...when...else' and 'insert first...when...else'

--update with embedded select

--merge

--unique and check constraint

--table from another table

--index

--sequence
