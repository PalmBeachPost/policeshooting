DROP PROCEDURE IF EXISTS Count_FATAL_ShootingsByYear;

CREATE PROCEDURE Count_FATAL_ShootingsByYear ()
BEGIN
	SELECT
		YEAR (date) AS YEAR,
		count(*) AS Count
	FROM
		incidents
	WHERE
		injuryLevel = 'Fatal'
	GROUP BY 	YEAR
	ORDER BY	YEAR;
END