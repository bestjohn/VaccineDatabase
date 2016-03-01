create table VACCINE (

VaccineID NUMBER(9) PRIMARY KEY,
Disease VARCHAR2(30) NOT NULL,
Manufacturer VARCHAR2(30) NOT NULL,
Comments VARCHAR2(120) NULL

);

CREATE SEQUENCE SEQ_VACCINE
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TRIGGER VACCINE_TRIGGER
BEFORE INSERT ON VACCINE
FOR EACH ROW
BEGIN SELECT SEQ_VACCINE.NEXTVAL INTO :NEW.VaccineID FROM DUAL;
END;

INSERT into VACCINE values
(NULL, 
'Hepatitis A', 
'GSK Vaccines', 
'Pain at site of injection occurs in 15% of children and half of adults'
);

INSERT into VACCINE values
(NULL, 
'Hepatitis B', 
'GSK Vaccines', 
'Pain at site of injection occurs in 15% of children and half of adults'
);

--More Diseases:
--Tuberculosis
--PID
--Polio
--Mumps
--Measles
--Small Pox
--Zika virus (fingers crossed!)

drop view vw_vaccine;
create view vw_vaccine as
select v.disease, v.manufacturer, vtn.route, vtn.site
from vaccine v, vaccination vtn
where v.vaccineid = vtn.vaccineid
;

select RPAD(disease,10,'.') as disease, route, site 
from vw_vaccine;





drop table VACCINE;
purge table VACCINE;
