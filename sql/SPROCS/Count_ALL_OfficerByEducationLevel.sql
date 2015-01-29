DROP PROCEDURE IF EXISTS Count_ALL_OfficerByEducationLevel;

CREATE PROCEDURE Count_ALL_OfficerByEducationLevel ()
BEGIN
	SELECT
	fdle14.codes.description,
	count(DISTINCT policeshootings.officers.Id) as officerCount
	FROM
		policeshootings.officers
	LEFT JOIN fdle14.person_data ON policeshootings.officers.FDLEID = fdle14.person_data.person_nbr
	AND YEAR (
		policeshootings.officers.dob
	) = fdle14.person_data.birth_year
	INNER JOIN fdle14.codes ON fdle14.person_data.education_level = fdle14.codes.code_value
	WHERE
		fdle14.codes.category = 'education_level'
	GROUP BY
		fdle14.codes.description;
END