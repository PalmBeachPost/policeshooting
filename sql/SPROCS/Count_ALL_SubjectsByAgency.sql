DROP PROCEDURE IF EXISTS Count_ALL_SubjectsByAgency;

CREATE PROCEDURE Count_ALL_SubjectsByAgency ()
BEGIN
	SELECT
	O.agency,
	Count(DISTINCT S.subjectId) AS subjectsShotAt
	FROM
		incidentsubjectmap S
	INNER JOIN incidents I ON I.id = S.incidentId
	INNER JOIN officerincidentmap O ON O.incidentId = I.id
	GROUP BY
		O.agency
	ORDER BY
		subjectsShotAt DESC;
END