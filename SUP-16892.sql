use s11vm;

select r2.* from rbepicrisistemplates r 
join rbepicrisistemplates_rbepicrisissections rr on rr.id_rbEpicrisisTemplates = r.id
join rbepicrisissections_rbepicrisisproperty rr2 on rr2.id_rbEpicrisisSections = rr.id_rbEpicrisisSections 
join rbepicrisisproperty r2 on r2.id = rr2.id_rbEpicrisisProperty 
where r.id = 79
order by rr.idx, rr2.idx 



select * from rbepicrisistemplates r ;


SELECT DATE_FORMAT(a.endDate ,'%d.%m.%Y') AS 'Дата', a.endDate, at.name AS `Наименование исследования`, CONCAT( 'Ритм:  ', aps.value, '  Положение ЭОС:  ', aps1.value, '  Заключение: ', aps2.value)'Заключение'
FROM action a
LEFT JOIN actiontype at ON at.id = a.actionType_id and at.deleted = 0 and a.status = 2
LEFT JOIN event e ON e.id = a.event_id and e.deleted = 0
LEFT JOIN client c ON c.id = e.client_id and c.deleted = 0
LEFT JOIN actionproperty ap ON a.id = ap.action_id AND ap.deleted = 0
LEFT JOIN actionpropertytype apt ON ap.type_id = apt.id 
INNER JOIN actionproperty_string aps ON aps.id = ap.id AND apt.name LIKE 'Ритм%'
LEFT JOIN actionproperty ap1 ON a.id = ap1.action_id AND ap1.deleted = 0
LEFT JOIN actionpropertytype apt1 ON ap1.type_id = apt1.id 
INNER JOIN actionproperty_string aps1 ON aps1.id = ap1.id AND apt1.name LIKE 'Положение ЭОС%'
LEFT JOIN actionproperty ap2 ON a.id = ap2.action_id AND ap2.deleted = 0
LEFT JOIN actionpropertytype apt2 ON ap2.type_id = apt2.id 
INNER JOIN actionproperty_string aps2 ON aps2.id = ap2.id AND apt2.name LIKE 'ЗАКЛЮЧЕНИЕ%'
WHERE c.id = (SELECT e2.client_id FROM Event e2 WHERE e2.id = 6285192) 
AND at.group_id = 23
AND a.deleted = 0
AND ((aps.value IS NOT NULL OR aps.value != '' OR aps.value != ' ') 
OR (aps1.value IS NOT NULL OR aps1.value != '' OR aps1.value != ' ') 
OR (aps2.value IS NOT NULL OR aps2.value != '' OR aps2.value != ' '))
AND CASE 
WHEN e.eventType_id IN (SELECT ID FROM eventtype WHERE eventtype.name LIKE '%Дневно%' AND a.event_id = 6285192) then (date(a.endDate) >= (SELECT date(begDate) FROM Action WHERE actionType_id = 131 AND event_id = 6285192) AND (date(a.endDate) <= (SELECT date(endDate) FROM Action  WHERE actionType_id = 133 AND event_id = 6285192) OR date(a.endDate) IS NULL OR (SELECT date(endDate) FROM Action  WHERE actionType_id = 133 AND event_id = 6285192) IS NULL )) END
ORDER BY a.endDate, at.id, apt.idx;