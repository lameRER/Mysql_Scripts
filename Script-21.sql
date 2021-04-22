









select a.event_id, a.id AS a_id, at.id AS at_id, e.id AS e_id, c.id AS c_id, c.lastName, c.firstName, c.patrName, at.name, a.endDate FROM Action a
LEFT JOIN ActionType at ON AT.id = a.actionType_id and at.id = (select max(a2.id) from actiontype a2 where a2.id = a.actionType_id limit 1)
LEFT JOIN Event e ON e.id = a.event_id
LEFT JOIN Client c ON c.id = e.client_id
WHERE  
c.id = (SELECT e2.client_id FROM Event e2 WHERE e2.id = 6280160) 
AND at.group_id = 61387
AND a.deleted = 0
group by at.id
ORDER BY a.endDate DESC




SELECT a.id AS a_id, at.id AS at_id, e.id AS e_id, c.id AS c_id, c.lastName, c.firstName, c.patrName, at.name, a.endDate FROM Action a
LEFT JOIN ActionType at ON AT.id = a.actionType_id
LEFT JOIN Event e ON e.id = a.event_id
LEFT JOIN Client c ON c.id = e.client_id
WHERE 
c.id = (SELECT e2.client_id FROM Event e2 WHERE e2.id = 6280160) 
AND at.group_id = 61387
AND a.deleted = 0
ORDER BY a.endDate desc

select max(a2.id) from Action a2 where a2.actionType_id = 61385 and a2.event_id = 5810353 


select max(a2.id) from actiontype a2 where a2.id = 61385 limit 1