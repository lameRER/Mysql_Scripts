








-- select * from (
select a.id AS a_id, at.id AS at_id, e.id AS e_id, c.id AS c_id, c.lastName, c.firstName, c.patrName, at.name, a.endDate FROM Action a
LEFT JOIN ActionType at ON at.id = a.actionType_id and at.deleted = 0 and a.status = 2
LEFT JOIN Event e ON e.id = a.event_id and e.deleted = 0
LEFT JOIN Client c ON c.id = e.client_id and c.deleted = 0
WHERE a.id = (select max(a2.id) from action a2 where a2.actionType_id = at.id and a2.event_id in (select e3.id from event e3 where e3.client_id= c.id)  group by at.id) and
c.id = (SELECT e2.client_id FROM Event e2 WHERE e2.id = 6280160) 
AND at.group_id = 61387
AND a.deleted = 0
ORDER BY a.endDate desc
-- ) as tmp 
-- where tmp. group by tmp.at_id




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







select max(e3.id) from Event e3 where e3.eventType_id = 101 GROUP by e3.client_id