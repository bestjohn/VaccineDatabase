create table VACCINE (

VaccineID NUMBER(9) PRIMARY KEY NOT NULL,
Disease VARCHAR2(30) NOT NULL,
Number_Of_Shots NUMBER(10) NOT NULL,
Manufacturer VARCHAR2(30) NOT NULL,
Comments VARCHAR2(120)

);

INSERT into VACCINE values
(1, 'Tuberculosis', 3, 'Someone', 'Always take after midnight')
;