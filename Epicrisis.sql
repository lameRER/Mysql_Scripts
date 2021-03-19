-- select 'Диагностика'
-- union
-- SELECT at.name FROM ActionType at WHERE at.id in (SELECT a.actionType_id FROM Action a WHERE a.deleted = 0 AND status = 2 AND a.event_id = %s) AND at.class = 1 AND at.deleted = 0 AND at.group_id IS NOT NULL

SELECT /***/ et.code, et.name, es.id, es.name, es.description, ep.* 
FROM rbEpicrisisTemplates et
LEFT JOIN rbEpicrisisTemplates_rbEpicrisisSections etes ON et.id = etes.id_rbEpicrisisTemplates 
LEFT JOIN rbEpicrisisSections es ON etes.id_rbEpicrisisSections = es.id
LEFT JOIN rbEpicrisisSections_rbEpicrisisProperty esep ON es.id = esep.id_rbEpicrisisSections
LEFT JOIN rbEpicrisisProperty ep ON esep.id_rbEpicrisisProperty = ep.id
WHERE /*et.name REGEXP 'НАПРАВЛЕНИЕ НА СТАЦИОНАРНОЕ ЛЕЧЕНИЕ'*/ ep.name  REGEXP  'Использова';
ORDER BY etes.idx, esep.idx;



select * from rbEpicrisisProperty rep where name REGEXP 'консуль';

select * from rbEpicrisisSections_rbEpicrisisProperty resrep where id_rbEpicrisisSections = 500 ORDER by idx;

select * from rbEpicrisisProperty rep where rep.id = 2229;


select * from rbEpicrisisSections_rbEpicrisisProperty resrep order by id desc;

select * from rbEpicrisisProperty rep order by id desc;



SELECT a.endDate AS `Дата выполнения`, at.name as `Название документа`, GROUP_CONCAT(CONCAT_WS(' ', CONCAT(apt.name, ':'), aps.value) SEPARATOR '
') `Значения` FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2 AND a.endDate IS NOT NULL
JOIN ActionType at ON a.actionType_id = at.id AND at.deleted=0 AND at.name REGEXP '^Консультация'
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted=0 AND apt.name REGEXP '^Диагноз|^Рекомендации|^Должность|^Заключение|^Лечение|^Рекомендовано'
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT join ActionProperty_String aps ON aps.id=ap.id
WHERE e.id=%s AND e.deleted=0 
GROUP BY a.id ORDER BY a.createDatetime, apt.idx;


select * from 
update rbEpicrisisProperty rep 
set rep.defaultValue = 'SELECT \"\"'
where rep.name  REGEXP  'Использова';



set @return2 = null;
set @return3 = null;

set @return2 = (SELECT GROUP_CONCAT(ep.id) FROM rbEpicrisisProperty ep WHERE 
((ep.name REGEXP 'ФИО' and description = 'Персональные данные')
));
SET @return = (SELECT et.id FROM rbEpicrisisTemplates et WHERE et.code = '9');
set @return3 = (SELECT GROUP_CONCAT(es.id) FROM rbEpicrisisSections es WHERE 
(es.name REGEXP 'Рекомендации' AND es.description = 'Выписной эпикриз КХО 4')
); 

SELECT * FROM rbEpicrisisProperty ep WHERE FIND_IN_SET(ep.id, @return2);
SELECT * FROM rbEpicrisisSections es WHERE EXISTS(SELECT * FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE es.id = esep.id_rbEpicrisisSections AND FIND_IN_SET(esep.id_rbEpicrisisProperty, @return2));

SELECT * FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id, @return3);
SELECT * FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE FIND_IN_SET(esep.id_rbEpicrisisSections,@return3) ORDER BY esep.idx;
SELECT * FROM rbEpicrisisProperty ep WHERE ep.id IN (SELECT esep.id_rbEpicrisisProperty FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections in (SELECT es.id FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id,@return3)));
SELECT * FROM rbEpicrisisTemplates et WHERE et.id in (SELECT etes.id_rbEpicrisisTemplates FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisSections in (SELECT es.id FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id,@return3)));


DELETE FROM rbEpicrisisSections_rbEpicrisisProperty WHERE id_rbEpicrisisSections =  (SELECT es.id FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id, @return3));


SELECT * FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE id_rbEpicrisisSections =  (SELECT es.id FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id, @return3));

SELECT * FROM rbEpicrisisProperty ep ORDER BY ep.id DESC


select * from rbEpicrisisProperty rep where name REGEXP 'ФИО';


SET @ep_ai_s:=@ep_ai_e:= (SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'pes' AND TABLE_NAME = 'rbEpicrisisProperty');
INSERT LOW_PRIORITY rbEpicrisisProperty(id, name, description, type, defaultValue)
SELECT * FROM (
SELECT @ep_ai_e:=@ep_ai_e+1, '' name, (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id = @return) description, 7 type, 'SELECT ''Не контактен по отделению''' defaultValue
) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisProperty ep WHERE ep.name = tmp.name AND ep.description = tmp.description AND ep.type = tmp.type); set @return2 = NULL;

SET @es_ai_s:=@es_ai_e:= (SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'pes' AND TABLE_NAME = 'rbEpicrisisSections');
INSERT LOW_PRIORITY rbEpicrisisSections(id, name, description)
SELECT * FROM (
SELECT @es_ai_e:=@es_ai_e+1, 'Персональные данные' name, (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id = @return) description
) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisSections es WHERE es.name = tmp.name AND es.description = tmp.description); set @return3 = NULL;

INSERT LOW_PRIORITY rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
SELECT es.id, ep.id, ROW_NUMBER() OVER(ORDER BY esep.idx) + IFNULL((SELECT MAX(esep.idx) FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections = (SELECT MAX(es1.id) FROM rbEpicrisisSections es1)),0) FROM rbEpicrisisProperty ep, rbEpicrisisSections es, rbEpicrisisSections_rbEpicrisisProperty esep 
WHERE ((es.id BETWEEN @es_ai_s AND @es_ai_e) or es.id =  @return3) AND ((ep.id BETWEEN @ep_ai_s AND @ep_ai_e)or(FIND_IN_SET(ep.id, @return2)) = IF(esep.id_rbEpicrisisProperty = ep.id, esep.id_rbEpicrisisProperty = ep.id, ep.id))  GROUP BY ep.id;

INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
SELECT * FROM (SELECT et.id et_id, es.id es_id, ROW_NUMBER() OVER(ORDER BY etes.idx) + IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return),0) FROM rbEpicrisisTemplates et, rbEpicrisisSections es, rbEpicrisisTemplates_rbEpicrisisSections etes
WHERE ((es.id BETWEEN @es_ai_s AND @es_ai_e) OR FIND_IN_SET(es.id,@return3)) AND et.id = @return GROUP BY es.id) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE tmp.es_id = etes.id_rbEpicrisisSections AND tmp.et_id = etes.id_rbEpicrisisTemplates);
SET @ep_ai_s:=@ep_ai_e:=@es_ai_s:=@es_ai_e:= NULL;

SELECT * FROM rbEpicrisisProperty ep WHERE ep.id BETWEEN @ep_ai_s AND @ep_ai_e;
SELECT * FROM rbEpicrisisSections es WHERE es.id BETWEEN @es_ai_s AND @es_ai_e;
SELECT @ep_ai_s, @ep_ai_e, @es_ai_s,@es_ai_e;














SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'Консультац' AND ep.description = (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id = @return);


SELECT 'Дата выполнения' `Дата выполнения`,'Название консультации' `Название консультации`,'Значения' `Значения`
UNION
(SELECT a.endDate, at.name, GROUP_CONCAT(CONCAT_WS(' ', CONCAT(apt.name, ':'), aps.value) SEPARATOR '\n') FROM ActionProperty ap
LEFT JOIN ActionProperty_String aps USING(id)
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted = 0 AND apt.name REGEXP 'Рекомендации|Диагноз'
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2 
JOIN ActionType at ON a.actionType_id = at.id AND apt.actionType_id = at.id AND at.deleted = 0 AND at.name REGEXP '^Консультация'
GROUP BY a.id ORDER BY a.createDatetime);


SELECT at.name, apt.name, aps.value, CONCAT_WS(' ', CONCAT(apt.name, ':'), aps.value), ap.* FROM ActionProperty ap
LEFT JOIN ActionProperty_String aps USING(id)
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted = 0 AND apt.name REGEXP 'Рекомендации|Диагноз'
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND apt.actionType_id = at.id AND at.deleted = 0 AND at.name REGEXP '^Консультация'
GROUP BY ap.id
;




SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'Консультац';







SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return



SELECT ROW_NUMBER() OVER(), MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return

SELECT * FROM rbEpicrisisProperty ep ORDER BY ep.id DESC





SELECT at.code FROM ActionType at WHERE at.name REGEXP 'Дневник.*?кхо.*?4';


SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return;



SELECT * FROM (SELECT 'Рекомендации1' name) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisProperty ep WHERE ep.name = tmp.name);


-- INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
-- SELECT @return, esep.id_rbEpicrisisSections, IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return), 0)+1 
-- FROM rbEpicrisisTemplates_rbEpicrisisSections esep WHERE not EXISTS(SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return AND etes.id_rbEpicrisisSections = esep.id_rbEpicrisisSections) AND FIND_IN_SET(esep.id_rbEpicrisisSections,@return3);

-- INSERT LOW_PRIORITY rbEpicrisisProperty(name, description, type)
SELECT * FROM (SELECT 'Рекомендации' AS name, (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id = @return) AS description, 7 AS type) AS tmp
WHERE NOT EXISTS(SELECT ep1.name, ep1.description, ep1.type FROM rbEpicrisisProperty ep1 WHERE ep1.name = tmp.name AND ep1.description = tmp.description AND ep1.type = tmp.type);



INSERT LOW_PRIORITY rbEpicrisisProperty(name, description, type,defaultValue)
SELECT ep.name,(SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id = @return),ep.type, REPLACE(ep.defaultValue, '145-124-5', (SELECT at.code FROM ActionType at WHERE at.name REGEXP 'Дневник.*?кхо.*?4')) 
FROM rbEpicrisisProperty ep WHERE ep.id = (SELECT esep.id_rbEpicrisisProperty FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections = @return3 AND esep.id_rbEpicrisisProperty = @return2)
;


INSERT LOW_PRIORITY rbEpicrisisSections(name, description)
SELECT es.name, (SELECT name FROM rbEpicrisisTemplates et WHERE et.id = @return) FROM rbEpicrisisSections es WHERE es.id = @return3
;
INSERT LOW_PRIORITY rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
SELECT es.id, ep.id, ROW_NUMBER() OVER()  FROM rbEpicrisisSections es, (SELECT ep.id FROM rbEpicrisisProperty ep ORDER BY ep.id DESC LIMIT 1) ep WHERE es.id = (SELECT es1.id FROM rbEpicrisisSections es1 WHERE es1.id = LAST_INSERT_ID()) ORDER BY ep.id
;
INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
SELECT et.id, es.id, ROW_NUMBER() OVER() +  IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return), 0) FROM rbEpicrisisTemplates_rbEpicrisisSections etes, rbEpicrisisTemplates et, rbEpicrisisSections es WHERE es.id = @return3 AND et.id = @return ORDER BY es.id DESC LIMIT 1


INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
SELECT @return, esep.id_rbEpicrisisSections, IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return), 0)+1 
FROM rbEpicrisisTemplates_rbEpicrisisSections esep WHERE not EXISTS(SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = @return AND etes.id_rbEpicrisisSections = esep.id_rbEpicrisisSections) AND FIND_IN_SET(esep.id_rbEpicrisisSections,@return3);

SELECT * FROM ActionPropertyType apt WHERE apt.actionType_id = (SELECT at.id FROM ActionType at WHERE at.code REGEXP '145-124-1_1') AND apt.name REGEXP (SELECT GROUP_CONCAT(ep.name SEPARATOR '|') FROM rbEpicrisisProperty ep WHERE ep.id IN (SELECT esep.id_rbEpicrisisProperty FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections in (SELECT es.id FROM rbEpicrisisSections es WHERE FIND_IN_SET(es.id,@return3))))
;
 
--  (SELECT ROW_NUMBER() OVER () + (SELECT et1.code FROM rbEpicrisisTemplates et1 ORDER BY et1.id DESC LIMIT 1))


SELECT * FROM rbEpicrisisTemplates et;

SELECT * FROM OrgStructure os WHERE os.parent_id in (SELECT os1.id FROM OrgStructure os1 WHERE os1.name REGEXP 'стационар' AND os1.parent_id IS NULL)








SELECT * FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisProperty = 2264;

SELECT * FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections = 471


SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'смерти';



SELECT * FROM rbEpicrisisTemplates et WHERE et.id in (SELECT etes.id_rbEpicrisisTemplates FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisSections IN (SELECT esep.id_rbEpicrisisSections FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisProperty = 2265))




SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = 2195;


SELECT at.name as `Название документа`, apt.name `Название поля`, aps.value AS `Значение` FROM Event e
join Action a ON e.id = a.event_id AND a.deleted=0
JOIN ActionType at ON a.actionType_id = at.id AND at.class =2 AND at.deleted=0
JOIN ActionProperty ap ON a.id = ap.action_id
join ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted=0 AND (apt.name = 'Название операции' OR apt.name = 'Описание операции')
JOIN ActionProperty_String aps on aps.id = ap.id
WHERE e.id=%s;



SELECT apt.* FROM Action a
JOIN ActionType at ON a.actionType_id = at.id AND at.flatCode = 'oper_protocol'
JOIN Action a1 ON a.parent_id = a1.id AND a1.status = 2
JOIN ActionType at1 ON a1.actionType_id = at1.id AND at1.deleted = 0 AND at1.serviceType = 4
JOIN ActionPropertyType apt ON at1.id = apt.actionType_id AND apt.deleted = 0
WHERE a.event_id = 1871 AND a.status = 2






SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'операц';

SELECT 'Название свойства', 'Значение свойства'
UNION
(SELECT apt1.name AS `Название свойства`, IF(apt1.typeName REGEXP 'Constructor|String|Text', aps.value, IF(apt1.typeName = 'Date', apd.value, IF(apt1.typeName = 'Double', apd1.value, IF(apt1.typeName = 'Integer', api.value, IF(apt1.typeName = 'Reference', apr.value, IF(apt1.typeName = 'Time', apt.value, 'ERROR')))))) AS `Значение свойства` FROM ActionProperty ap
LEFT JOIN ActionProperty_String aps USING(id)
LEFT JOIN ActionProperty_Reference apr USING(id)
LEFT JOIN ActionProperty_Date apd USING(id)
LEFT JOIN ActionProperty_Double apd1 USING(id)
LEFT JOIN ActionProperty_Integer api USING(id)
LEFT JOIN ActionProperty_Time apt USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2 AND a.event_id = %s
JOIN ActionPropertyType apt1 ON ap.type_id = apt1.id AND apt1.deleted = 0
JOIN ActionType at ON a.actionType_id = at.id AND apt1.actionType_id = at.id AND at.flatCode = 'oper_protocol' AND at.deleted = 0 ORDER BY apt1.idx)




SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = 2229;



SELECT a.endDate AS `Дата выполнения`, at.name as `Название документа`, apt.name AS `Название поля`, aps.value AS `Значение` FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2 AND a.endDate IS NOT NULL
JOIN ActionType at ON a.actionType_id = at.id AND at.deleted=0 AND at.name REGEXP '^Консультация'
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted=0 AND (apt.name='Диагноз' OR apt.name='Рекомендации' OR apt.name = 'Должность' OR apt.name = 'Заключение' OR apt.name = 'Лечение')
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT join ActionProperty_String aps ON aps.id=ap.id
WHERE /*e.id=%s AND*/ e.deleted=0 ORDER BY apt.idx;





SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = (SELECT esep.id_rbEpicrisisProperty FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections = (SELECT es.id FROM rbEpicrisisSections es WHERE es.name REGEXP 'консульта'))


;


SELECT * FROM ActionPropertyType apt WHERE apt.actionType_id = (SELECT at.id FROM ActionType at WHERE at.flatCode = 'oper_protocol' AND at.deleted = 0) AND apt.name REGEXP 'хирург';







SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = 2351;


SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = (SELECT et.id FROM rbEpicrisisTemplates et WHERE et.code = '5') ORDER BY etes.idx;


SELECT 'Название свойства', 'Значение свойства'
UNION
(SELECT apt1.name AS `Название свойства`, IF(apt1.typeName REGEXP 'Constructor|String|Text', aps.value, IF(apt1.typeName = 'Date', apd.value, IF(apt1.typeName = 'Double', apd1.value, IF(apt1.typeName = 'Integer', api.value, IF(apt1.typeName = 'Reference', apr.value, IF(apt1.typeName = 'Time', apt.value, 'ERROR')))))) AS `Значение свойства` FROM ActionProperty ap
LEFT JOIN ActionProperty_String aps USING(id)
LEFT JOIN ActionProperty_Reference apr USING(id)
LEFT JOIN ActionProperty_Date apd USING(id)
LEFT JOIN ActionProperty_Double apd1 USING(id)
LEFT JOIN ActionProperty_Integer api USING(id)
LEFT JOIN ActionProperty_Time apt USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2 AND a.event_id = %s
JOIN ActionPropertyType apt1 ON ap.type_id = apt1.id AND apt1.deleted = 0
JOIN ActionType at ON a.actionType_id = at.id AND apt1.actionType_id = at.id AND at.flatCode = 'oper_protocol' AND at.deleted = 0 ORDER BY apt1.idx)

USE pes;

UPDATE rbEpicrisisProperty SET defaultValue = 'SELECT ''Название свойства'', ''Значение свойства''\r\nUNION\r\n(SELECT apt1.name AS `Название свойства`, IF(apt1.typeName REGEXP ''Constructor|String|Text'', aps.value, IF(apt1.typeName = ''Date'', apd.value, IF(apt1.typeName = ''Double'', apd1.value, IF(apt1.typeName = ''Integer'', api.value, IF(apt1.typeName = ''Reference'', apr.value, IF(apt1.typeName = ''Time'', apt.value, ''ERROR'')))))) AS `Значение свойства` FROM ActionProperty ap\r\nLEFT JOIN ActionProperty_String aps USING(id)\r\nLEFT JOIN ActionProperty_Reference apr USING(id)\r\nLEFT JOIN ActionProperty_Date apd USING(id)\r\nLEFT JOIN ActionProperty_Double apd1 USING(id)\r\nLEFT JOIN ActionProperty_Integer api USING(id)\r\nLEFT JOIN ActionProperty_Time apt USING(id)\r\nJOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2 AND a.event_id = %s\r\nJOIN ActionPropertyType apt1 ON ap.type_id = apt1.id AND apt1.deleted = 0\r\nJOIN ActionType at ON a.actionType_id = at.id AND apt1.actionType_id = at.id AND at.flatCode = ''oper_protocol'' AND at.deleted = 0 ORDER BY apt1.idx)' WHERE id = 2356;



SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = 2356;








SELECT * FROM Action a
 WHERE a.actionType_id = (SELECT at.id FROM ActionType at WHERE at.flatCode = 'oper_protocol') AND a.deleted = 0 -- AND a.event_id = 1871
 ;

SELECT * FROM ActionPropertyType apt WHERE apt.actionType_id = (SELECT at.id FROM ActionType at WHERE at.flatCode = 'oper_protocol' AND at.deleted = 0) AND apt.deleted = 0 GROUP BY apt.typeName


#region MyRegion






SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.code = 'osm_vrach_kar_1' AND at.deleted=0
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name = 'Жалобы' AND apt.deleted=0
JOIN ActionProperty_String aps ON ap.id = aps.id
WHERE e.id=1871 ORDER BY a.createDatetime LIMIT 1;





SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'ДНЕВНИК КХО'

SELECT * FROM rbEpicrisisProperty ep WHERE ep.name REGEXP 'осложнен'
;

SELECT * FROM ActionType at WHERE at.name REGEXP 'ДНЕВНИК КХО'

SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id and a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND (at.name = 'ДНЕВНИК КХО' OR at.name = 'Осмотр врача-кардиолога КХО')
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name = 'Осложнение'
join ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
join ActionProperty_String aps ON ap.id = aps.id
WHERE e.id = 1871 AND e.deleted = 0 ORDER BY a.createDatetime DESC LIMIT 1;



/*
UPDATE
rbEpicrisisProperty
SET defaultValue = REPLACE(
'SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted = 0 AND a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.code IN (\'osm_kar\',\'osm_detkard\',\'osm_kar_arm\',\'osm_vrach_kar_1\',\'osm_vrach_det_kar\')
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name REGEXP \'Анамнез заболевания\'
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT JOIN ActionProperty_String aps ON aps.id = ap.id
-- WHERE e.id = %s
ORDER BY a.createDatetime DESC LIMIT 1', '-- ', '')
WHERE id = @return;
*/
#endregion


;


SELECT * FROM rbServiceType st WHERE st.name REGEXP 'лабора';


SELECT * FROM ActionType at WHERE at.group_id in (SELECT at.id FROM ActionType at WHERE at.name REGEXP 'Диагностика' AND at.class = 1 AND at.deleted =0) AND at.deleted =0;
SELECT * FROM ActionType at WHERE at.class = 1 AND at.deleted = 0 AND at.group_id IS NOT NULL;
SELECT * FROM ActionType at WHERE at.group_id = 21252
;



SELECT at.name FROM ActionType at WHERE at.id in (SELECT a.actionType_id FROM Action a WHERE a.deleted = 0 AND status = 2 AND a.event_id = %s) AND at.class = 1 AND at.deleted = 0 AND at.group_id IS NOT NULL;



SELECT * FROM rbEpicrisisProperty ep




;



SELECT * FROM rbEpicrisisProperty ep WHERE ep.id = 2183