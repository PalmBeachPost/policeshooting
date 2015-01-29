DROP PROCEDURE IF EXISTS Detailed_ALL_SubjectsToAgencyMap;

CREATE PROCEDURE Detailed_ALL_SubjectsToAgencyMap ()
BEGIN
	SELECT
		subjects.Id,		
		(
			SELECT
				GROUP_CONCAT(DISTINCT agency)
			FROM
				officerincidentmap
			WHERE
				officerincidentmap.incidentId = incidentsubjectmap.incidentId
		) AS InvolvedAgencies,
		subjects.lastName,
		subjects.firstName,
		subjects.middleName,
		subjects.dob,
		subjects.gender,
		subjects.ethnicity,
		subjects.city
	FROM
		subjects
	INNER JOIN incidentsubjectmap ON subjects.Id = incidentsubjectmap.subjectId;
END