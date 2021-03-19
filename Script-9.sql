select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
GROUP_CONCAT(ret.id, ' ', ret.name separator '\n'),
res.id, res.name , 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where rep.name REGEXP 'rw'
-- where rep.id  = 2284
group by res.id, rep.id
order by  retres.idx, resrep.idx;



select * from rbEpicrisisProperty rep where rep.id in (select resrep.id_rbEpicrisisProperty from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = (select retres.id_rbEpicrisisSections from rbEpicrisisTemplates_rbEpicrisisSections retres where retres.id_rbEpicrisisSections = 453order by idx))





SELECT IF(EXISTS(
SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id IN 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'основной') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1),
(SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id IN 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'основной') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1),
(SELECT CONCAT(aps.value, '','') FROM ActionProperty ap
JOIN ActionProperty_String aps USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted = 0 AND apt.name REGEXP '^Диагноз'
JOIN ActionType at ON a.actionType_id = at.id AND apt.actionType_id = at.id AND at.deleted = 0 AND at.code = 'osm_vrach_kar_1'
WHERE a.event_id = %s ORDER BY a.createDatetime LIMIT 1));


SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id in 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'фоновый') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1;


SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id in 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'Сопутствующий') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1;


SELECT IF(EXISTS(
SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id IN 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'Сопутствующий клинический') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1),
(SELECT CONCAT_WS(' ', m.DiagID, m.DiagName, d.diagnos_string) FROM MKB m
JOIN Diagnosis d ON d.MKB = m.DiagID AND d.id in (SELECT d1.diagnosis_id FROM Diagnostic d1 WHERE d1.deleted = 0 AND d1.diagnosisType_id IN 
(SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'Сопутствующий клинический') AND d1.event_id = %s ORDER BY d1.createDatetime DESC) AND d.client_id = (SELECT e.client_id FROM Event e WHERE e.id = %s) ORDER BY d.createDatetime DESC LIMIT 1),
(SELECT CONCAT(aps.value, '', '') FROM ActionProperty ap
JOIN ActionProperty_String aps USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted = 0 AND apt.name REGEXP '^Сопутствующи'
JOIN ActionType at ON a.actionType_id = at.id AND apt.actionType_id = at.id AND at.deleted = 0 AND at.code = 'osm_vrach_kar_1'
WHERE a.event_id = %s ORDER BY a.createDatetime LIMIT 1));





select * from 
-- update
rbEpicrisisProperty 
-- set defaultValue = REPLACE ('select GROUP_CONCAT(apt.name, '' '', CASE when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Date'' THEN  apd.value end separator ''\\n'') from ActionProperty ap 
-- left join ActionProperty_String aps using(id)
-- left join ActionProperty_Date apd using(id)
-- join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select id from Action where actionType_id = 25680 and deleted = 0 and status = 2 and event_id = %s order by createDatetime desc limit 1)
-- join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
-- join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP ''test''
-- where ap.deleted = 0', 'test', name)
where id in(2369,2370,2371,2372,2373,2374,2782,2783)


select rep. from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep 
where resrep.id_rbEpicrisisSections = 497 and resrep.id_rbEpicrisisProperty = rep.id 



select GROUP_CONCAT(apt.name, ' ', CASE when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Date' THEN  apd.value end separator '\n') from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select id from Action where actionType_id = 25680 and deleted = 0 and event_id = 31398 order by createDatetime desc limit 1)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP 'RW'
where ap.deleted = 0






select GROUP_CONCAT(apt.name, ' ', CASE when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Date' THEN  apd.value end separator '\n') from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select id from Action where actionType_id = 25680 and deleted = 0 and event_id = 31398 order by createDatetime desc)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP 'RW'
where ap.deleted = 0


select * from Event where externalId = '1102';


select 
a.createDatetime,
a.id,
a.status,
at2.name,
apt.name, 
CASE when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Date' THEN  apd.value end
from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.event_id = 31398
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id and apt.deleted = 0 
where ap.deleted = 0 order by a.createDatetime desc


select GROUP_CONCAT(apt.name, ' ', CASE when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Date' THEN  apd.value end separator '\n') from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id in (select id from Action where actionType_id = 25680 and deleted = 0 and a.event_id = 23546 order by createDatetime desc)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP 'RW'
where ap.deleted = 0




SELECT IF(EXISTS(SELECT CONCAT_WS(' ',d1.MKB, CONCAT(m.DiagName,';'), d1.diagnos_string) FROM Event e






SELECT GROUP_CONCAT('\n', tmp.name) FROM (
(SELECT IF(EXISTS(SELECT CONCAT_WS(' ',d1.MKB, CONCAT(m.DiagName,';'), d1.diagnos_string) FROM Event e
JOIN Diagnostic d ON e.id = d.event_id AND d.deleted = 0 
JOIN Diagnosis d1 ON d.diagnosis_id = d1.id AND d1.deleted = 0 and d1.diagnosisType_id IN (SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'основной' OR dt.name REGEXP 'заключительный')
JOIN MKB m ON d1.MKB = m.DiagID 
WHERE e.deleted = 0 /*AND e.id=%s*/ ORDER BY d1.createDatetime DESC LIMIT 1), 
(SELECT CONCAT_WS(' ',d1.MKB, CONCAT(m.DiagName,';'), d1.diagnos_string) FROM Event e
JOIN Diagnostic d ON e.id = d.event_id AND d.deleted = 0 
JOIN Diagnosis d1 ON d.diagnosis_id = d1.id AND d1.deleted = 0 and d1.diagnosisType_id IN (SELECT dt.id FROM rbDiagnosisType dt WHERE dt.name REGEXP 'основной' OR dt.name REGEXP 'заключительный')
JOIN MKB m ON d1.MKB = m.DiagID 
WHERE e.deleted = 0 /*AND e.id=%s*/ ORDER BY d1.createDatetime DESC LIMIT 1),
(SELECT IF(EXISTS(SELECT REGEXP_REPLACE(ep.defaultValue,'#', '') FROM Event e
JOIN Epicrisis e1 ON e.id=e1.event_id AND e1.code='4' AND e1.isDelete=0
JOIN EpicrisisSections es ON es.id=e1.id AND es.name='Диагнозы'
JOIN EpicrisisProperty ep ON e1.id=ep.id AND ep.name='Диагнозы:'
WHERE /*e.id=%s AND*/ e.deleted=0 ORDER BY e1.createDatetime DESC LIMIT 1), 
 (SELECT REGEXP_REPLACE(ep.defaultValue,'#', '') FROM Event e
JOIN Epicrisis e1 ON e.id=e1.event_id AND e1.code='4' AND e1.isDelete=0
JOIN EpicrisisSections es ON es.id=e1.id AND es.name='Диагнозы'
JOIN EpicrisisProperty ep ON e1.id=ep.id AND ep.name='Диагнозы:'
WHERE /*e.id=%s AND*/ e.deleted=0 ORDER BY e1.createDatetime DESC LIMIT 1),
 (SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0
join ActionType at ON a.actionType_id = at.id AND at.code='osm_vrach_kar_1' AND at.deleted=0
join ActionPropertyType apt ON at.id = apt.actionType_id AND apt.name = 'Диагноз' and apt.deleted=0
join ActionProperty ap ON a.id = ap.action_id AND apt.id=ap.type_id
JOIN ActionProperty_String aps ON aps.id=ap.id
WHERE /*e.ID=%s AND*/ e.deleted=0 LIMIT 1)) AS `name`)) AS `name`)
UNION ALL
(SELECT at.name AS `name` FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.deleted=0 AND at.serviceType=4 AND at.class=2
JOIN ActionType_Service ats ON at.id = ats.master_id
JOIN rbService s ON s.id = ats.service_id/* WHERE e.id=%s*/)) AS tmp;










select * from rbEpicrisisProperty rep where rep.name REGEXP 'осложнени.$';


select 
-- rep.*
rep.name, resrep.* 
from rbEpicrisisTemplates_rbEpicrisisSections retres, rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep 
where retres.id_rbEpicrisisTemplates = 127 and retres.id_rbEpicrisisSections = resrep.id_rbEpicrisisSections and resrep.id_rbEpicrisisProperty = rep.id  ORDER by resrep.idx



SELECT 
GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' then aps.value else apd.value end) separator '\n')
FROM Event e
join Action a ON e.id = a.event_id and a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.name = 'титульный лист'
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND ap.type_id = apt.id AND apt.name REGEXP 'RW'
left join ActionProperty_String aps ON aps.id = ap.id
left JOIN ActionProperty_Date apd on apd.id = ap.id 
WHERE e.id=%s order by a.createDatetime desc, apt.idx limit 1;



select rep.* from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep
where resrep.id_rbEpicrisisProperty = rep.id and resrep.id_rbEpicrisisSections = 453


select * from rbEpicrisisPropertyType rept ;

update 
rbEpicrisisProperty 
set defaultValue =REPLACE('SELECT 
GROUP_CONCAT(case when apt.typeName = ''String'' then aps.value else apd.value end separator ''\\n'')
FROM Event e
join Action a ON e.id = a.event_id and a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.name = ''титульный лист''
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND ap.type_id = apt.id AND apt.name REGEXP ''test''
left join ActionProperty_String aps ON aps.id = ap.id
left JOIN ActionProperty_Date apd on apd.id = ap.id 
WHERE e.id=%s order by a.createDatetime desc, apt.idx limit 1;', 'test', name)
where id in (2273,2274,2276,2275,2278,2279,2282)





select * from Person where id = 1435;


select 
at2.name, GROUP_CONCAT(apt.name, ': ' ,
CASE when apt.typeName regexp 'String|Constructor|text' THEN aps.value 
when apt.typeName regexp 'Double' THEN apd.value 
when apt.typeName regexp 'Regerence' THEN apr.value end separator '\n')
from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Double apd using(id)
left join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select a.id from Action a where a.deleted = 0 and a.event_id = %s and a.actionType_id in (select id from ActionType where class = 4 and deleted = 0) order by a.createDatetime desc limit 1)
JOIN ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.class = 4 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id and apt.deleted = 0 and apt.name != 'Номерок' and apt.typeName != 'TissueType'
where ap.deleted = 0 order by apt.idx



select * from ActionProperty where action_id = 53610;

select * from 111;




select apt.* from ActionType at2, ActionPropertyType apt 
where at2.class = 4 and at2.deleted = 0 and apt.actionType_id = at2.id and apt.deleted = 0 
GROUP by apt.typeName 



 
 
 select * from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = 594;


select * from rbEpicrisisProperty where id in(2678,2785);


select * from rbEpicrisisProperty rep where `type` = 9;

 select * from rbEpicrisisProperty rep order by id desc;




select a.event_id, GROUP_CONCAT(apt.name, ' ', CASE when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Date' THEN  apd.value end separator '\n') from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select id from Action where actionType_id = 25680 and deleted = 0 order by createDatetime desc limit 1)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 25680
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP 'RW'
where ap.deleted = 0



SELECT apt.name, IFNULL(aps.value,apd.value), apd.value, aps.value FROM Action a
join ActionType at ON a.actionType_id = at.id AND at.name = 'RW'
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND ap.type_id = apt.id AND apt.name REGEXP '^Результат$|^Дата$'
left join ActionProperty_String aps ON aps.id = ap.id
left join ActionProperty_Date apd ON apd.id = ap.id
where a.event_id = %s
order by a.createDatetime desc, apt.idx