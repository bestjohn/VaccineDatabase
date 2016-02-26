create table VACCINE (

VaccineID NUMBER(9) PRIMARY KEY NOT NULL,
Disease VARCHAR2(30) NOT NULL,
Manufacturer VARCHAR2(30) NOT NULL,
Comments VARCHAR2(120) NULL

);

INSERT into VACCINE values
(1, 
'Hepatitis A', 
'GSK Vaccines', 
'Pain at site of injection occurs in 15% of children and half of adults'
);

INSERT into VACCINE values
(2, 
'Hepatitis B', 
'GSK Vaccines', 
'Pain at site of injection occurs in 15% of children and half of adults'
);


drop view vw_vaccine;
create view vw_vaccine as
select v.disease, v.manufacturer, vtn.route, vtn.site
from vaccine v, vaccination vtn
where v.vaccineid = vtn.vaccineid
;





--drop table VACCINE;
--purge table VACCINE;