select * from rbEpicrisisProperty rep where id = 2676;



SELECT '', if(EXISTS(select ep.defaultValue from Epicrisis e
join EpicrisisProperty ep using(id)
WHERE ep.name = 'Осложнение' and e.id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 /*where e2.id = %s*/ limit 1) order by e3.id DESC LIMIT 1,1) 
order by e.id DESC limit 1),
(select ep.defaultValue from Epicrisis e
join EpicrisisProperty ep using(id)
WHERE ep.name = 'Осложнение' and e.id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 /*where e2.id = %s*/ limit 1) order by e3.id DESC LIMIT 1,1) 
order by e.id DESC limit 1),
(select aps.value from ActionProperty ap
join ActionProperty_String aps using(id)
JOIN Action a ON ap.action_id = a.id and a.deleted = 0 and a.event_id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 /*where e2.id = %s */limit 1) order by e3.id DESC LIMIT 1,1)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.name REGEXP '^Осмотр врача-кардиолога КХО$|^Дневник КХО$'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and ap.type_id = apt.id and apt.name REGEXP 'Осложнени.'
where ap.deleted = 0
order by a.createDatetime desc))
union
SELECT esp.id as idStored, esp.StoredValue as a
  FROM rbEpicrisisStoredProperties esp
  WHERE esp.deleted=0 AND esp.rbEpicrisisProperty_id=2676
  
  
  
  
  --  Auto-generated SQL script #202101251400
UPDATE pes.rbEpicrisisProperty
	SET defaultValue='select if(EXISTS(select ep.defaultValue, '''' from Epicrisis e
join EpicrisisProperty ep using(id)
WHERE ep.name = ''Осложнение'' and e.id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 where e2.id = %s limit 1) order by e3.id DESC LIMIT 1,1) 
order by e.id DESC limit 1),
(select ep.defaultValue, '''' from Epicrisis e
join EpicrisisProperty ep using(id)
WHERE ep.name = ''Осложнение'' and e.id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 where e2.id = %s limit 1) order by e3.id DESC LIMIT 1,1) 
order by e.id DESC limit 1),
(select aps.value, '''' from ActionProperty ap
join ActionProperty_String aps using(id)
JOIN Action a ON ap.action_id = a.id and a.deleted = 0 and a.event_id = where a.event_id = (select e3.id from Event e3 where e3.deleted = 0 and e3.eventType_id = 84 and e3.client_id = (select e2.client_id from Event e2 where e2.id = %s limit 1) order by e3.id DESC LIMIT 1,1)
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.name REGEXP ''^Осмотр врача-кардиолога КХО$|^Дневник КХО$''
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and ap.type_id = apt.id and apt.name REGEXP ''Осложнени.''
where ap.deleted = 0
order by a.createDatetime desc))
usion
SELECT esp.id as idStored, esp.StoredValue as a
  FROM rbEpicrisisStoredProperties esp
  WHERE
  esp.deleted=0
  AND esp.rbEpicrisisProperty_id=2676'
	WHERE id=2676;
