DROP PROCEDURE IF EXISTS Count_ALL_SubjectsWhoShotAtCopsByRaceAgency;

CREATE PROCEDURE Count_ALL_SubjectsWhoShotAtCopsByRaceAgency ()
BEGIN
	SELECT
	officerincidentmap.agency,
	subjects.ethnicity,
	COUNT(DISTINCT subjects.Id) AS subjectcount
	FROM
		incidentsubjectmap
	INNER JOIN subjects ON incidentsubjectmap.subjectId = subjects.Id
	INNER JOIN officerincidentmap ON incidentsubjectmap.incidentId = officerincidentmap.incidentId
	WHERE
		incidentsubjectmap.shotAtPolice = TRUE
	GROUP BY
		officerincidentmap.agency,
		subjects.ethnicity
	ORDER BY
		agency;
END