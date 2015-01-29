DROP PROCEDURE IF EXISTS Detailed_ALL_ShootingsPerYearAndAgency;

CREATE PROCEDURE Detailed_ALL_ShootingsPerYearAndAgency (IN year int, IN agency_var varchar(30))
BEGIN
	SELECT
	I.id,
	agency_var,
	(
		SELECT
			GROUP_CONCAT(DISTINCT agency)
		FROM
			officerincidentmap
		WHERE
			incidentId = I.id
			AND agency <> agency_var
	) AS OtherInvolvedAgencies,
	I.date,
	I.time,
	I.casenum,
	I.summary,
	I.location,
	I.city,
	I.zip,
	I.injuryLevel,	
	I.shotsfired,
	i.shotsHit,
	I.copsfired,
	I.suspectsInvolved
	FROM
	incidents I 
	WHERE
		YEAR (I.date) = year
		AND EXISTS (SELECT * FROM officerincidentmap O where incidentId = I.id and agency= agency_var)
	ORDER BY
		I.date;
END