DROP PROCEDURE IF EXISTS Detailed_ALL_ShootingsPerYear;

CREATE PROCEDURE Detailed_ALL_ShootingsPerYear (IN year int)
BEGIN
	SELECT
	I.id,
	I.date,
	I.time,
	I.casenum,
	I.summary,
	I.location,
	I.city,
	I.zip,
	I.injuryLevel,
	(
		SELECT
			GROUP_CONCAT(DISTINCT agency)
		FROM
			officerincidentmap
		WHERE
			incidentId = I.id
	) AS InvolvedAgencies,
	I.shotsfired,
	i.shotsHit,
	I.copsfired,
	I.suspectsInvolved
	FROM
		incidents I
	WHERE
		YEAR (I.date) = year
	ORDER BY
		I.date;
END