select count(type_id), ActionProperty.*
from ActionProperty where action_id = 100788001 and type_id = 39729 group by type_id;

select *
from Event where id = 33868103;

33868103
# REPLACE LOW_PRIORITY ActionProperty (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, action_id, type_id)


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
  ) AND a.event_id = 33868103;