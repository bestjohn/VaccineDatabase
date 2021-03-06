create table VACCINATION (

VaccinationID NUMBER(9) PRIMARY KEY,
PatientID NUMBER(9) NOT NULL,
VaccineID NUMBER(9) NOT NULL,
VaccinatorID NUMBER(9) NOT NULL,
Date_Taken DATE,
Site VARCHAR2(20) NOT NULL,
Date_Of_Next DATE,
Reason VARCHAR2 (200),
--sample reasons include newborns, college students, traveling abroad, outbreaks, safety prevention

Constraint VACCINATION_PK PRIMARY KEY (VaccinationID),
Constraint VACCINATION_UQ UNIQUE (PatientID, VaccineID, VaccinatorID),
CHECK (VACCINATION_PK != NULL and VACCINATION_UQ != NULL)
);

--DECODE(Site, 'UA', 'Upper arm', 'RA', 'Right arm', 'LA', 'Left arm', 'RT', 'Right thigh', 'LT', 'Left thigh');

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
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (

NULL,
2,
2,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

INSERT into VACCINATION values (

NULL,
2,
1,
15,
TO_DATE('23-MAY-2005', 'DD-MON-YYYY'),
'UA',
TO_DATE('23-MAY-2020', 'DD-MON-YYYY')
);

select * from vaccination;
