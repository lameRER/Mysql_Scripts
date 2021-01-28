select ret.name,ret.code, retres.id, retres.idx, res.name, rep.* from rbEpicrisisTemplates ret
join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.name REGEXP 'пред' and ret.code = '5'
-- group by rep.id
order by retres.idx, resrep.idx;



select * from ActionType at2 where at2.name REGEXP 'Дневник.*кхо';

explain
select apt.typeName from ActionProperty ap 
join Action a on a.id - ap.action_id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionPropertyType apt on apt.id = ap.type_id and at2.id = apt.actionType_id and apt.deleted = 0
group by apt.id order by apt.idx 



SELECT at.name, c2.id, a.deleted, a.status, CONCAT_WS(' ', c2.lastName, c2.firstName, c2.patrName), a.event_id, apt.name, aps.value FROM Event e
JOIN Action a ON e.id = a.event_id -- AND a.deleted=0 -- AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.code = '145-124-1_1' AND at.deleted=0
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name REGEXP 'Жалобы|^Анамнез заболевания$' AND apt.deleted=0
JOIN ActionProperty_String aps ON ap.id = aps.id
join Event e2 on e2.id = a.event_id 
join Client c2 on c2.id = e2.client_id and c2.id = 8306
-- WHERE e.id=%s 
ORDER BY a.createDatetime 
-- LIMIT 1;



SELECT apt.name, aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.code = '145-124-1_1' AND at.deleted=0
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name = 'Анамнез заболевания' 
AND apt.deleted=0
JOIN ActionProperty_String aps ON ap.id = aps.id
-- WHERE e.id=%s ORDER BY a.createDatetime LIMIT 1;



SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.code = '145-124-1_1' AND at.deleted=0
LEFT JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name REGEXP 'Жалобы' AND apt.deleted=0
LEFT JOIN ActionProperty_String aps ON ap.id = aps.id
-- WHERE e.id=%s ORDER BY a.createDatetime 
-- LIMIT 1;


select * from Client c where c.lastName = 'Тестап';

select * from ActionType at2 where at2.name REGEXP 'перв.*кхо';



Локальный статус
Дыхание
Тоны сердца
Шумы
Шум на сонных артериях
Пульсация на периферических сосудах

select * from Client c where c.lastName = 'Андрющенко';

select * from Event e where client_id = 101714;
25395

SELECT
 aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted = 0 AND a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.code IN ('osm_kar','osm_detkard','osm_kar_arm','osm_vrach_kar_1','osm_vrach_det_kar')
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name REGEXP 'Стул'
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT JOIN ActionProperty_String aps ON aps.id = ap.id
WHERE e.id = %s
ORDER BY a.createDatetime DESC LIMIT 1;



UPDATE pes.rbEpicrisisProperty
	SET defaultValue='SELECT
aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted = 0 AND a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.code IN (''osm_kar'',''osm_detkard'',''osm_kar_arm'',''osm_vrach_kar_1'',''osm_vrach_det_kar'')
left JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name REGEXP ''ИМТ''
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT JOIN ActionProperty_String aps ON aps.id = ap.id
WHERE e.id = %s
ORDER BY a.createDatetime DESC LIMIT 1;'
	WHERE id=2310;
UPDATE pes.rbEpicrisisProperty
	SET defaultValue='SELECT
aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted = 0 AND a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.code IN (''osm_kar'',''osm_detkard'',''osm_kar_arm'',''osm_vrach_kar_1'',''osm_vrach_det_kar'')
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name = ''Состояние''
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT JOIN ActionProperty_String aps ON aps.id = ap.id
WHERE e.id = %s
ORDER BY a.createDatetime DESC LIMIT 1;'
	WHERE id=2317;

