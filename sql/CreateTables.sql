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