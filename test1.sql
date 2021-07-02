select count(type_id), ActionProperty.*
from ActionProperty where action_id =100787988 and type_id = 39729 group by type_id;
100787988
select *
from Event where id = 33868103;

select event_id, actionType_id
from Action where id = 100788001
;

select *
from Action where event_id = 33868103 and actionType_id = 15084;

select *
from ActionProperty where action_id = 100788001;

33868103

select *
from ActionProperty where id = 230636020;

select *
from ActionProperty where action_id = 99077600;
select *
from ActionProperty_Integer where id = 253017930;
#   REPLACE LOW_PRIORITY ActionProperty (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, action_id, type_id)


SELECT

  ap.createDatetime,
  ap.createPerson_id,
  ap.modifyDatetime,
  ap.modifyPerson_id,
  a.id,
  39729



  FROM Action a
  JOIN Event e ON a.event_id = e.id AND e.deleted = 0
  JOIN ActionProperty ap ON a.id = ap.action_id
  JOIN ActionPropertyType apt ON ap.type_id = apt.id AND (apt.name = '№ машины' AND apt.descr = 'numberCar')
  JOIN ActionProperty_String aps ON ap.id = aps.id


  WHERE  ap.deleted = 0
  AND a.deleted = 0
  AND  -- e.isClosed = 1 AND
  e.eventType_id IN (90,94,114) AND date(e.modifyDatetime) >=  DATE_SUB(CURDATE(), INTERVAL 2 DAY)


  AND a.id NOT IN (SELECT aClon.id
  FROM Action aClon
  JOIN Event e ON aClon.event_id = e.id AND e.deleted = 0
  JOIN ActionProperty ap ON aClon.id = ap.action_id
  JOIN ActionPropertyType apt ON ap.type_id = apt.id AND (ap.type_id = apt.id AND apt.name = '№ бригады' AND apt.descr = 'Номер наряда')
  JOIN ActionProperty_Integer api ON ap.id = api.id
  WHERE ap.deleted = 0
  AND aClon.deleted = 0
  AND -- e.isClosed = 1 AND
    e.eventType_id IN (90,94,114) AND date(e.modifyDatetime) >=  DATE_SUB(CURDATE(), INTERVAL 2 DAY)
  AND api.id IS NOT NULL
  );



# REPLACE LOW_PRIORITY ActionProperty_Integer (id, value)


SELECT

  ap.id,
  (SELECT
   IF(TRIM(REGEXP_REPLACE(aps.value ,'[^0-9]+','')) IS NULL OR TRIM(REGEXP_REPLACE(aps.value ,'[^0-9]+','')) = '', 112,

    (IF(aps.value NOT REGEXP 'б|н|Б|Н', CAST(TRIM(REGEXP_REPLACE(aps.value ,'[^0-9]+','')) AS INT), 4803)))

   -- CAST(TRIM(REGEXP_REPLACE(aps.value ,'[a-z,A-Z,/,,а-я,А-Я,?,., ,-,ё,Ё,№,-]','')) AS INT)
    FROM ActionProperty_String aps
    JOIN ActionProperty apNEW ON aps.id = apNEW.id
    JOIN ActionPropertyType aptNEW ON apNEW.type_id = aptNEW.id AND (aptNEW.name = '№ машины' AND aptNEW.descr = 'numberCar')
    WHERE apNEW.action_id = a.id)


  FROM Action a
  JOIN Event e ON a.event_id = e.id AND e.deleted = 0
  JOIN ActionProperty ap ON a.id = ap.action_id
  JOIN ActionPropertyType apt ON ap.type_id = apt.id AND (ap.type_id = apt.id AND apt.name = '№ бригады' AND apt.descr = 'Номер наряда')

  WHERE  ap.deleted = 0
  AND a.deleted = 0
  AND -- e.isClosed = 1 AND
  e.eventType_id IN (90,94,114) AND date(e.modifyDatetime) >=  DATE_SUB(CURDATE(), INTERVAL 2 DAY)


  AND a.id IN (SELECT aClon.id
  FROM Action aClon
  JOIN Event e ON aClon.event_id = e.id AND e.deleted = 0
  JOIN ActionProperty ap ON aClon.id = ap.action_id
  JOIN ActionPropertyType apt ON ap.type_id = apt.id AND (ap.type_id = apt.id AND apt.name = '№ бригады' AND apt.descr = 'Номер наряда')
  LEFT JOIN ActionProperty_Integer api ON ap.id = api.id
  WHERE ap.deleted = 0
  AND aClon.deleted = 0
  AND -- e.isClosed = 1 AND
    e.eventType_id IN (90,94,114) AND date(e.modifyDatetime) >=  DATE_SUB(CURDATE(), INTERVAL 2 DAY)
  AND api.value IS NULL);