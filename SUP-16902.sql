use s11vm;

select r2.* from rbepicrisistemplates r 
join rbepicrisistemplates_rbepicrisissections rr on rr.id_rbEpicrisisTemplates = r.id
join rbepicrisissections_rbepicrisisproperty rr2 on rr2.id_rbEpicrisisSections = rr.id_rbEpicrisisSections 
join rbepicrisisproperty r2 on r2.id = rr2.id_rbEpicrisisProperty 
where r.id = 79
order by rr.idx, rr2.idx 



select * from rbepicrisistemplates r ;



SELECT CONCAT(DATE_FORMAT(a.endDate ,'%d.%m.%Y'),' ', at.name) AS 'Дата/Наименование', apt.name AS Поле, aps.value AS Значение
FROM action a
LEFT JOIN actiontype at ON at.id = a.actionType_id and at.deleted = 0 and a.status = 2
LEFT JOIN event e ON e.id = a.event_id and e.deleted = 0
LEFT JOIN client c ON c.id = e.client_id and c.deleted = 0
LEFT JOIN actionproperty ap ON a.id = ap.action_id AND ap.deleted = 0
LEFT JOIN actionpropertytype apt ON ap.type_id = apt.id
LEFT JOIN actionproperty_string aps ON aps.id = ap.id
WHERE c.id = (SELECT e2.client_id FROM Event e2 WHERE e2.id = 6287117) 
AND at.group_id = 61387
AND a.deleted = 0
AND apt.name = 'ЗАКЛЮЧЕНИЕ:'
AND (aps.value IS NOT NULL OR aps.value != '' OR aps.value != ' ')
AND CASE 
WHEN e.eventType_id IN (SELECT eventtype.id FROM eventtype WHERE eventtype.name LIKE '%Дневно%' AND a.event_id = 6287117) 
THEN (DATE_SUB(e.execDate, INTERVAL 6 MONTH) >= date(a.endDate)) 
ELSE (date(a.endDate) >= (SELECT date(Action.begDate) FROM Action WHERE actionType_id = 131 AND event_id = 6287117 AND deleted = 0) 
AND (date(a.endDate) <= (SELECT date(Action.endDate) FROM Action  WHERE actionType_id = 133 AND event_id = 6287117 AND deleted = 0) 
OR date(a.endDate) IS NULL OR (SELECT date(Action.endDate) FROM Action  WHERE actionType_id = 133 AND event_id = 6287117 AND deleted = 0) IS NULL )) END
ORDER BY a.endDate, at.id, apt.idx;


select * from actiontype a where a.id in(131,133);

select * from event e where client_id = 2033802;


select * from action a where a.event_id = 6287117


SELECT DATE_SUB("2017-06-15", INTERVAL 6 MONTH);



select * from actiontype a where a.group_id = 61387;