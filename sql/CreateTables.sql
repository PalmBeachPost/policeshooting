DROP TABLE IF EXISTS `rawincidents`;
CREATE TABLE `rawincidents` (
  `Timestamp` varchar(255) DEFAULT NULL,
  `Incident ID` varchar(255) NOT NULL,
  `Police case number` varchar(255) DEFAULT NULL,
  `Summary of incident` text,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ZIP code` varchar(255) DEFAULT NULL,
  `Injury level` varchar(255) DEFAULT NULL,
  `Manner of death` varchar(255) DEFAULT NULL,
  `Total shots fired by police` int DEFAULT NULL,
  `Total shots that hit suspect` int DEFAULT NULL,
  `Number of cops who fired` int DEFAULT NULL,
  `Number of suspects shot or shot at` int DEFAULT NULL,
  `Source of initial contact` varchar(255) DEFAULT NULL,
  `Call type` varchar(255) DEFAULT NULL,
  `Domestic dispute?` varchar(255) DEFAULT NULL,
  `Less-lethal force?` varchar(255) DEFAULT NULL,
  `Suicide by cop?` varchar(255) DEFAULT NULL,
  `Shots fired into vehicle?` varchar(255) DEFAULT NULL,
  `Accidental discharge?` varchar(255) DEFAULT NULL,
  `Foot pursuit?` varchar(255) DEFAULT NULL,
  `Car pursuit?` varchar(255) DEFAULT NULL,
  `Physical struggle?` varchar(255) DEFAULT NULL,
  `Lawsuit filed?` varchar(255) DEFAULT NULL,
  `Discrepancies?` varchar(255) DEFAULT NULL,
  `Model case?` varchar(255) DEFAULT NULL,
  `Notes` text,
  `Review board?` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Other officer(s) injured?` int DEFAULT NULL,
  PRIMARY KEY (`Incident ID`)
);

DROP TABLE IF EXISTS `rawsubjects`;
CREATE TABLE `rawsubjects` (
  `Timestamp` varchar(255) DEFAULT NULL,
  `Incident ID` varchar(255) DEFAULT NULL,
  `Subject last name` varchar(255) DEFAULT NULL,
  `First name` varchar(255) DEFAULT NULL,
  `Middle name or initial` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Ethnicity` varchar(255) DEFAULT NULL,
  `Injury level` varchar(255) DEFAULT NULL,
  `City of residence` varchar(255) DEFAULT NULL,
  `Subject weapon(s)` varchar(255) DEFAULT NULL,
  `Did subject shoot at police?` varchar(255) DEFAULT NULL,
  `Was subject behaving suicidal?` varchar(255) DEFAULT NULL,
  `History of mental illness?` varchar(255) DEFAULT NULL,
  `Arrest history?` varchar(255) DEFAULT NULL,
  `Toxicology (D)` varchar(255) DEFAULT NULL,
  `Toxicology (S)` varchar(255) DEFAULT NULL,
  `Charges?` varchar(255) DEFAULT NULL,
  `Crime charged with?` varchar(255) DEFAULT NULL,
  `Crime disposition` varchar(255) DEFAULT NULL,
  `Self-shooting?` varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS `rawofficers`;
CREATE TABLE `rawofficers` (
  `Timestamp` varchar(255) DEFAULT NULL,
  `Incident ID` varchar(255) DEFAULT NULL,
  `Officer last name` varchar(255) DEFAULT NULL,
  `First name` varchar(255) DEFAULT NULL,
  `Middle name or initial` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Ethnicity` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `FDLE ID number` varchar(255) DEFAULT NULL,
  `Agency` varchar(255) DEFAULT NULL,
  `Agency ID number` varchar(255) DEFAULT NULL,
  `Officer's assignment` varchar(255) DEFAULT NULL,
  `PBSO District` varchar(255) DEFAULT NULL,
  `Number of shots fired by officer` varchar(255) DEFAULT NULL,
  `Officer weapon` varchar(255) DEFAULT NULL,
  `Officer injuries?` varchar(255) DEFAULT NULL,
  `Did officer die?` varchar(255) DEFAULT NULL,
  `Discipline?` varchar(255) DEFAULT NULL,
  `Rank` varchar(255) DEFAULT NULL,
  `Off-duty?` varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS incidents;
CREATE TABLE incidents (
  id varchar(255) PRIMARY KEY,
  caseNum varchar(255) DEFAULT NULL,
  summary text,
  date date DEFAULT NULL,
  time time DEFAULT NULL,
  location varchar(255) DEFAULT NULL,  
  city varchar(255) DEFAULT NULL,
  zip varchar(255) DEFAULT NULL,
  injuryLevel varchar(255) DEFAULT NULL,
  manner varchar(255) DEFAULT NULL,
  shotsFired int DEFAULT NULL,
  shotsHit int DEFAULT NULL,
  copsFired int DEFAULT NULL,
  suspectsInvolved varchar(255) DEFAULT NULL,
  initialContact varchar(255) DEFAULT NULL,
  callType varchar(255) DEFAULT NULL,
  isDomesticDispute boolean DEFAULT NULL,
  lessLethalForceUsed varchar(255) DEFAULT NULL,
  isSuicideByCop boolean DEFAULT NULL,
  shotIntoVehicle boolean DEFAULT NULL,
  isAccidental boolean DEFAULT NULL,
  footPursuit boolean DEFAULT NULL,
  carPursuit boolean DEFAULT NULL,
  physicalStruggle boolean DEFAULT NULL,
  lawsuitFiled boolean DEFAULT NULL,
  hasDiscrepancies boolean DEFAULT NULL,
  isModelCase boolean DEFAULT NULL,
  notes text,
  reviewBoard boolean DEFAULT NULL,
  otherOfficersInjured int DEFAULT NULL
);

INSERT INTO incidents
(
  id,
  caseNum,
  summary,
  date,
  time,
  location,  
  city,
  zip,
  injuryLevel,
  manner,
  shotsFired,
  shotsHit,
  copsFired,
  suspectsInvolved,
  initialContact,
  callType,
  isDomesticDispute,
  lessLethalForceUsed,
  isSuicideByCop,
  shotIntoVehicle,
  isAccidental,
  footPursuit,
  carPursuit,
  physicalStruggle,
  lawsuitFiled,
  hasDiscrepancies,
  isModelCase,
  notes,
  reviewBoard,
  otherOfficersInjured
)
SELECT
  `Incident ID`,
  `Police case number`,
  `Summary of incident`,
  Date,
  Time,
  Location,
  City,
  `ZIP code`,
  `Injury level`,
  `Manner of death`,
  `Total shots fired by police`,
  `Total shots that hit suspect`,
  `Number of cops who fired`,
  `Number of suspects shot or shot at`,
  `Source of initial contact`,
  `Call type`,
  CASE `Domestic dispute?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   `Less-lethal force?`,
   CASE `Suicide by cop?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Shots fired into vehicle?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Accidental discharge?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Foot pursuit?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Car pursuit?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Physical struggle?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Lawsuit filed?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Discrepancies?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   CASE `Model case?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
   Notes,
   CASE `Review board?`
  WHEN 'Yes' THEN
    TRUE
  ELSE
    FALSE
  END,
 `Other officer(s) injured?`
 FROM
  rawincidents;

UPDATE incidents
SET injuryLevel = 'Non-Fatal'
WHERE
  injuryLevel = 'injury';


DROP TABLE IF EXISTS subjects;

CREATE TABLE subjects (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  lastName VARCHAR (255) DEFAULT NULL,
  firstName VARCHAR (255) DEFAULT NULL,
  middleName VARCHAR (255) DEFAULT NULL,
  dob date DEFAULT NULL,
  gender VARCHAR (255) DEFAULT NULL,
  ethnicity VARCHAR (255) DEFAULT NULL,
  city VARCHAR (255) DEFAULT NULL
);

DROP TABLE IF EXISTS incidentSubjectMap;

CREATE TABLE incidentSubjectMap (
  incidentId VARCHAR (255) NOT NULL,
  subjectId INT NOT NULL,
  injuryLevel VARCHAR (255) DEFAULT NULL,
  weapons VARCHAR (255) DEFAULT NULL,
  shotAtPolice VARCHAR (255) DEFAULT NULL,
  wasSuicidal VARCHAR (255) DEFAULT NULL,
  mentalIllness boolean DEFAULT NULL,
  shotSelf boolean DEFAULT NULL,
  arrestHistory boolean DEFAULT NULL,
  toxicologyD VARCHAR (255) DEFAULT NULL,
  toxicologyS VARCHAR (255) DEFAULT NULL,
  charges VARCHAR (255) DEFAULT NULL,
  disposition VARCHAR (255) DEFAULT NULL
);

INSERT INTO subjects (
  lastName,
  firstName,
  middleName,
  dob,
  gender,
  ethnicity,
  city
) SELECT DISTINCT
  `Subject last name`,
  `First name`,
  `Middle name or initial`,
  DOB,
  Gender,
  Ethnicity,
  `City of residence`
FROM
  rawsubjects
where `Subject last name` <> 'NA' or `First name` <> 'NA';

INSERT INTO incidentSubjectMap
(
  incidentId,
  subjectId,
  injuryLevel,
  weapons,
  shotAtPolice,
  wasSuicidal,
  mentalIllness,
  shotSelf,
  arrestHistory,
  toxicologyD,
  toxicologyS,
  charges,
  disposition
)
SELECT
  `Incident ID`,
  S.id,
  R.`Injury level`,
  R.`Subject weapon(s)`,
  CASE R.`Did subject shoot at police?`
WHEN 'Yes' THEN
  TRUE
ELSE
  FALSE
END,
 CASE R.`Was subject behaving suicidal?`
WHEN 'Yes' THEN
  TRUE
ELSE
  FALSE
END,
 CASE R.`History of mental illness?`
WHEN 'Yes' THEN
  TRUE
ELSE
  FALSE
END,
 CASE R.`Self-shooting?`
WHEN 'Yes' THEN
  TRUE
ELSE
  FALSE
END,
 CASE R.`Arrest history?`
WHEN 'Yes' THEN
  TRUE
ELSE
  FALSE
END,
 R.`Toxicology (D)`,
 R.`Toxicology (S)`,
 R.`Crime charged with?`,
 R.`Crime disposition`
FROM
  rawsubjects R
INNER JOIN subjects S ON 
R.`Subject last name` = S.lastName
AND ((R.`First name` is null AND S.firstName is null) OR R.`First name` = S.firstName)
AND ((R.DOB is null AND S.dob is null) OR R.DOB = S.dob);

DROP TABLE IF EXISTS officers;
CREATE TABLE officers (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  lastName varchar(255) DEFAULT NULL,
  firstName varchar(255) DEFAULT NULL,
  middleName varchar(255) DEFAULT NULL,
  dob date DEFAULT NULL,  
  ethnicity varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  FDLEID varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS officerIncidentMap;
CREATE TABLE officerIncidentMap (
   incidentId varchar(255) NOT NULL,
   officerId INT NOT NULL,
   agency varchar(255) DEFAULT NULL,
   agencyId varchar(255) DEFAULT NULL,
   officerAssignment varchar(255) DEFAULT NULL,
   PBSODistrict varchar(255) DEFAULT NULL,
   shotsfired varchar(255) DEFAULT NULL,
   weapon varchar(255) DEFAULT NULL,
   injuries varchar(255) DEFAULT NULL,
   DisciplinaryAction varchar(255) DEFAULT NULL,
   rank varchar(255) DEFAULT NULL,
   wasOffDuty boolean DEFAULT NULL
);

INSERT INTO officers
(
lastName,
firstName,
middleName,
dob,
ethnicity,
gender,
FDLEId
)
SELECT
`Officer last name`,
`First name`,
MAX(`Middle name or initial`),
DOB,
Ethnicity,
Gender,
`FDLE ID number`
from rawofficers
GROUP BY
`Officer last name`,
DOB,
Gender,
Ethnicity,
`FDLE ID number`;

INSERT INTO officerIncidentMap
(
  incidentId,
   officerId,
   agency,
   agencyId,
   officerAssignment,
   PBSODistrict,
   shotsfired,
   weapon,
   injuries,
   DisciplinaryAction,
   rank,
   wasOffDuty
)
SELECT 
R.`Incident ID`,
O.id,
R.Agency,
R.`Agency ID number`,
R.`Officer's assignment`,
R.`PBSO District`,
R.`Number of shots fired by officer`,
R.`Officer weapon`,
R.`Officer injuries?`,
R.`Discipline?`,
R.Rank,
CASE R.`Off-duty?`
  WHEN 'Yes' THEN TRUE
  ELSE FALSE
END
FROM rawofficers R
INNER JOIN officers O ON
R.`Officer last name`=O.lastName
AND ((R.dob is null AND O.dob is null) OR R.dob= O.dob)
AND ((R.Gender is null AND O.Gender is null) OR R.Gender=O.gender)
AND ((R.Ethnicity is null AND O.Ethnicity is null) OR R.Ethnicity=O.ethnicity)
AND ((R.`FDLE ID number` is null AND O.FDLEID is null) OR R.`FDLE ID number`=O.FDLEID);