DROP PROCEDURE IF EXISTS Count_ALL_ShootingsByYear;

CREATE PROCEDURE Count_ALL_ShootingsByYear ()
BEGIN
	SELECT
		YEAR (date) AS YEAR,
		count(*) AS Count
	FROM
		incidents
	GROUP BY 	YEAR
	ORDER BY	YEAR;
END