select * from rbPrintTemplate rpt where rpt.name REGEXP 'договор';


SELECT e.client_id, a.* FROM  Event e INNER JOIN Action a ON e.id = a.event_id
WHERE e.eventType_id = 29 
AND a.person_id = 1924 AND a.directionDate LIKE '%2021-05-07%';