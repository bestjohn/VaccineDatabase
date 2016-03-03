create table VACCINE (

VaccineID NUMBER(9) PRIMARY KEY,
Disease VARCHAR2(30) NOT NULL,
Trade_Name VARCHAR2(20) NOT NULL,
Manufacturer VARCHAR2(30) NOT NULL,
Vac_Type VARCHAR(20),
Route VARCHAR(20),
Comments VARCHAR2(120) NULL

);

--DECODE(Route, 'IM', 'Intramuscular', 'SC', 'Subcutaneous', 'ID', 'Intradermal', 'IN', 'Intranasal', 'PO', 'oral');

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
'Anthrax',
'BioThrax',
'Emergent BioSolutions',
'Inactivated Bacterial',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Hepatitis A',
'Havrix',
'GlaxoSmithKline',
'Inactivated Viral',
'IM',
'Pain at site of injection occurs in 15% of children and half of adults'
);

INSERT into VACCINE values
(NULL, 
'Hepatitis A',
'Havrix',
'GlaxoSmithKline',
'Inactivated Viral',
'IM',
'Pain at site of injection occurs in 15% of children and half of adults'
);

INSERT into VACCINE values
(NULL, 
'Hepatitis B',
'Engerix-B',
'GlaxoSmithKline', 
'Recombinant Viral',
'IM',
'Pain at site of injection occurs in 15% of children and half of adults'
);

INSERT into VACCINE values
(NULL, 
'Herpes Zoster (Shingles)',
'Zostavax',
'Merck',
'Live Attenuated Viral',
'SC'
);

INSERT into VACCINE values
(NULL, 
'Human Papilomavirus (HPV)',
'Cervarix',
'GlaxoSmithKline',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Human Papilomavirus (HPV)',
'Gardasil',
'Merck',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Human Papilomavirus (HPV)',
'Gardasil 9',
'Merck',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Influenza',
'Afluria',
'bioCSL',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Influenza',
'Fluarix',
'GlaxoSmithKline',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Influenza',
'Flucelvax',
'Novartis',
'Inactivated Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Influenza',
'Flublok',
'Protein Sciences Corp.',
'Recombinant Viral',
'IM'
);

INSERT into VACCINE values
(NULL, 
'Influenza',
'FluMist',
'Medimmune',
'Live Attenuated Viral',
'IN'
);

INSERT into VACCINE values
(NULL, 
'Measles/Mumps/Rubella/Varicella',
'ProQuad',
'Merck',
'Live Attenuated Viral',
'SC'
);

INSERT into VACCINE values
(NULL, 
'Polio',
'Ipol',
'sanofi',
'Inactivated Viral',
'SC or IM'
);

INSERT into VACCINE values
(NULL, 
'Varicella',
'Varivax',
'Merck',
'Live Attenuated Viral',
'SC'
);

select * from vaccine;
