DROP PROCEDURE IF EXISTS Count_ALL_ShootingsByYearAndAgency;

CREATE PROCEDURE Count_ALL_ShootingsByYearAndAgency ()
BEGIN
	SELECT
		YEAR (I.date) AS YEAR,
		O.Agency,
		count(DISTINCT I.id) as Count
	FROM
		officerIncidentMap O
	INNER JOIN incidents I ON O.incidentId = I.id	
	GROUP BY
		YEAR,
		O.Agency
	ORDER BY
		YEAR, O.Agency;
END