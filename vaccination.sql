create table VACCINATION (

VaccinationID NUMBER(9) PRIMARY KEY,
PatientID NUMBER(9) NOT NULL,
VaccineID NUMBER(9) NOT NULL,
VaccinatorID NUMBER(9) NOT NULL,
Date_Taken DATE,
Route VARCHAR2(20) NOT NULL,
Site VARCHAR2(20) NOT NULL,
Date_Of_Next DATE,

Constraint VACCINATION_UQ UNIQUE (PatientID, VaccineID, VaccinatorID)
);

CREATE SEQUENCE SEQ_VACCINATION
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TRIGGER VACCINATION_TRIGGER
BEFORE INSERT ON VACCINATION
FOR EACH ROW
BEGIN SELECT SEQ_VACCINATION.NEXTVAL INTO :NEW.VaccinationID FROM DUAL;
end;

INSERT into VACCINATION values (

NULL,
1,
1,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'IM',
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (

NULL,
2,
2,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'IM',
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (

NULL,
2,
1,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'IM',
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

drop view vw_vaccination;
create view vw_vaccination as
select first_name, last_name, disease, date_taken, route, site, date_of_next
from patient p, vaccine v, vaccination vtn
where p.patientid = vtn.patientid AND vtn.vaccineid = v.vaccineid
;

select last_name, first_name, disease, date_taken, date_of_next, MONTHS_BETWEEN(DATE_OF_NEXT, DATE_TAKEN) as months
from vw_vaccination;

drop table VACCINATION;
purge table VACCINATION;