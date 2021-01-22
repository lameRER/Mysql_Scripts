SELECT * from ActionProperty_ArterialPressure apap 
where EXISTS (
SELECT * from ActionProperty ap 
where EXISTS
(SELECT at.name, apt.typeName, apt.* FROM ActionType at
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted = 0
WHERE at.class = 4 AND at.deleted = 0 and /*at.name regexp 'клин.*анализ.*крови' and */ap.type_id = apt.id) and apap.id = ap.id);

SELECT apt.typeName from ActionProperty ap
left join ActionProperty_ArterialPressure apap using(id)
join Action a on a.id = ap.action_id 
join ActionPropertyType apt on apt.id = ap.type_id 
join ActionType at2 on at2.id = apt.actionType_id and at2.id = a.actionType_id 
GROUP by apt.typeName 


select * from ActionPropertyType apt where EXISTS (SELECT name, ActionType.* FROM ActionType where name regexp 'клин.*анализ.*крови' and deleted = 0 and apt.actionType_id = id) and apt.deleted = 0




SELECT * FROM Action a
JOIN ActionProperty ap ON a.id = ap.action_id AND ap.type_id = 152859
WHERE a.deleted = 0;



SELECT * FROM ActionProperty ap WHERE ap.type_id = 152859;


SELECT apt.customSelect,apt.* FROM ActionPropertyType apt WHERE EXISTS (SELECT * FROM ActionType at WHERE at.name REGEXP 'осмотр.*анес.*перв' AND at.id = apt.actiontype_id) AND apt.deleted = 0 ORDER BY apt.name
;


SELECT a.id, a.createDatetime, apt.id, apt.idx, apt.name, aps.value FROM ActionProperty ap
JOIN ActionProperty_String aps USING(id)
JOIN (SELECT * FROM ActionPropertyType apt WHERE FIND_IN_SET(apt.actionType_id, (SELECT GROUP_CONCAT(at.id) FROM ActionType at WHERE at.name REGEXP 'Осмо.*карди.*кхо' AND at.deleted = 0)) ORDER BY apt.idx) apt ON  apt.id = ap.type_id
JOIN Action a ON ap.action_id = a.id 
WHERE a.deleted = 0 AND ap.deleted = 0 ORDER BY a.createDatetime, a.id, apt.idx
;


SELECT * FROM Event e 
JOIN Action a ON e.id = a.event_id AND a.deleted = 0
JOIN (SELECT at.id FROM ActionType at WHERE at.name REGEXP 'Осмо.*карди.*кхо' AND at.deleted = 0) as at1 ON a.actionType_id = at1.id
JOIN Client c ON e.client_id = c.id AND c.lastName REGEXP 'тест'
WHERE e.deleted = 0 AND e.eventType_id = 84;



SELECT a.* FROM Event e
JOIN Client c ON e.client_id = c.id AND c.lastName REGEXP 'тест'
JOIN Action a ON e.id = a.event_id AND a.deleted = 0
JOIN ActionType at ON a.actionType_id = at.id AND at.name REGEXP 'Осмо.*карди.*кхо' AND at.deleted = 0
WHERE e.deleted = 0 AND e.eventType_id = 84 ORDER BY a.createDatetime DESC
;

/*SELECT al.*, p.lastName, p.firstName, p.patrName FROM AppLock al
JOIN Person p ON al.person_id = p.id AND p.lastName REGEXP 'хирург'
WHERE al.addr REGEXP '10\.70\.10\.243' ORDER BY al.id DESC;*/

/*DELETE FROM AppLock
WHERE ID = 16690;*/





SELECT apt.customSelect, apt.* FROM ActionPropertyType apt 
WHERE EXISTS (SELECT * FROM ActionType at WHERE at.group_id = 21292 AND apt.actionType_id = at.id) AND apt.deleted = 0;