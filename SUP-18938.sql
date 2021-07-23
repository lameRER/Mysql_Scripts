SELECT jt.datetime, c.lastName, a.* FROM Action a
INNER JOIN ActionProperty ap ON a.id = ap.action_id
INNER JOIN ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
INNER JOIN Job_Ticket jt ON apjt.value = jt.id
INNER JOIN Event e ON a.event_id = e.id
INNER JOIN Client c ON e.client_id = c.id
WHERE a.actionType_id = 43232 AND jt.datetime >= '2021-07-23 11:30:00' AND a.status = 1



set @acOld = 43232;
set @acNew = 43419;



select ap.id,
       ap.createDatetime,
       ap.createPerson_id,
       ap.modifyDatetime,
       ap.modifyPerson_id,
       ap.deleted,
       apt1.id,
       action_id,
       type_id,
       ap.unit_id,
       ap.norm,
       isAssigned,
       evaluation,
       isAutoFillCancelled
from ActionProperty ap
JOIN ActionProperty_Job_Ticket apjt using(id)
JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 11:30:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0




select * from ActionPropertyType where actionType_id = (select id from ActionType where id = @acOld) and deleted = 0;

select * from ActionPropertyType where actionType_id = (select id from ActionType where id = @acNew) and deleted = 0;


select *
from ActionType where id = 43232;

select *
from ActionType where id =43419


select *
from ActionType where name ='Определение РНК коронавируса SARS-cov-2 в мазках со слизистой оболочки ротоглотки методом ПЦР (НЕ ИСПОЛЬЗОВАТЬ!!!)';

select *
from ActionType order by id desc;