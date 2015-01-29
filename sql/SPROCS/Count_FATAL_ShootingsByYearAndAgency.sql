DROP PROCEDURE IF EXISTS Count_FATAL_ShootingsByYearAndAgency;

CREATE PROCEDURE Count_FATAL_ShootingsByYearAndAgency ()
BEGIN
	SELECT
		YEAR (I.date) AS YEAR,
		O.Agency,
		count(DISTINCT I.id) as Count
	FROM
		officerIncidentMap O
	INNER JOIN incidents I ON O.incidentId = I.id
	WHERE
		I.injuryLevel = 'Fatal'
	GROUP BY
		YEAR,
		O.Agency
	ORDER BY
		YEAR, O.Agency;
END