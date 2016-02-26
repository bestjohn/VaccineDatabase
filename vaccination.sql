create table VACCINATION (

VaccinationID NUMBER(9) PRIMARY KEY NOT NULL,
PatientID NUMBER(9) NOT NULL,
VaccineID NUMBER(9) NOT NULL,
VaccinatorID NUMBER(9) NOT NULL,
Date_Taken DATE,
Route VARCHAR2(20) NOT NULL,
Site VARCHAR2(20) NOT NULL,
Date_Of_Next DATE,

Constraint VACCINATION_UQ UNIQUE (PatientID, VaccineID, VaccinatorID)
);

INSERT into VACCINATION values (
1,
1,
1,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'IM',
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (
2,
2,
2,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'IM',
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (
3,
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

select first_name, disease
from vw_vaccination;

--drop table VACCINATION;
--purge table VACCINATION;