drop view vw_patient;
create view vw_patient as
select p.first_name, p.last_name, a.street, a.city, a.state
from patient p, vdb_address a
where p.addressid = a.addressid
;

