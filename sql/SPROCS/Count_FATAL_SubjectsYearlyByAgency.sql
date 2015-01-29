DROP PROCEDURE IF EXISTS Count_FATAL_SubjectsYearlyPerAgency;

CREATE PROCEDURE Count_FATAL_SubjectsYearlyPerAgency (IN agency_var varchar(200))
BEGIN
	SELECT
	O.agency,
	Year(I.date) as Year,
	Count(DISTINCT S.subjectId) AS subjectsShotAt
	FROM
		incidentsubjectmap S
	INNER JOIN incidents I ON I.id = S.incidentId
	INNER JOIN officerincidentmap O ON O.incidentId = I.id
	WHERE O.agency = agency_var
	AND S.injuryLevel = 'Fatal'
	GROUP BY
		Year
	ORDER BY
		Year(I.date);
END