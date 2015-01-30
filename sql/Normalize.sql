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