select 
I.id,
O.officerId,
I.date as dateOfincident,
OF.lastName,
OF.firstName,
O.agency,
OF.dob,
OF.gender,
DATEDIFF(I.date,OF.dob)/365 as ageOnDateofIncident,
I.summary,
I.injuryLevel,
I.shotsFired,
I.shotsHit,
I.suspectsInvolved
from incidents I
inner join officerincidentmap O
On I.id = O.incidentId
INNER JOIN officers OF
ON OF.id=O.officerId
WHERE O.officerId IN
(select DISTINCT officerid from officerincidentmap
group by officerId
HAVING count(*)>1) 
AND OF.lastName NOT LIKE '%unknown%'
order by O.officerId, date ;


SELECT officerid,
Min(dateofincident) as firstIncident,
MAX(dateOfincident)as secondincident,
DATEDIFF(MAX(dateOfincident),Min(dateofincident)) as days
FROM
(select 
I.id,
O.officerId,
I.date as dateOfincident,
OF.lastName,
OF.firstName,
O.agency,
OF.dob,
OF.gender,
DATEDIFF(I.date,OF.dob)/365 as ageOnDateofIncident,
I.summary,
I.injuryLevel,
I.shotsFired,
I.shotsHit,
I.suspectsInvolved
from incidents I
inner join officerincidentmap O
On I.id = O.incidentId
INNER JOIN officers OF
ON OF.id=O.officerId
WHERE O.officerId IN
(select DISTINCT officerid from officerincidentmap
group by officerId
HAVING count(*)>1) 
AND OF.lastName NOT LIKE '%unknown%'
order by O.officerId, date  ) repeaters
GROUP BY officerid;