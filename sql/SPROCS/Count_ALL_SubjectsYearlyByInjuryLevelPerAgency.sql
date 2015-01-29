DROP PROCEDURE IF EXISTS Count_ALL_SubjectsYearlyByInjuryLevelPerAgency;

CREATE PROCEDURE Count_ALL_SubjectsYearlyByInjuryLevelPerAgency (IN agency_var varchar(200))
BEGIN
	SELECT
	O.agency,
	Year(I.date) as Year,
	S.injuryLevel,
	Count(DISTINCT S.subjectId) AS subjectsShotAt
	FROM
		incidentsubjectmap S
	INNER JOIN incidents I ON I.id = S.incidentId
	INNER JOIN officerincidentmap O ON O.incidentId = I.id
	WHERE O.agency = agency_var
	GROUP BY
		Year, S.injuryLevel
	ORDER BY
		Year(I.date);
END