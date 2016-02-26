create table VACCINE (

VaccineID NUMBER(9) PRIMARY KEY NOT NULL,
Disease VARCHAR2(30) NOT NULL,
Manufacturer VARCHAR2(30) NOT NULL,
Comments VARCHAR2(120)

);

INSERT into VACCINE values
(1, 
'Hepatitis A', 
'GSK Vaccines', 
'Pain at site of injection occurs in 15% of children and half of adults')
;