SELECT jt.datetime, c.lastName, a.* FROM Action a
INNER JOIN ActionProperty ap ON a.id = ap.action_id
INNER JOIN ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
INNER JOIN Job_Ticket jt ON apjt.value = jt.id
INNER JOIN Event e ON a.event_id = e.id
INNER JOIN Client c ON e.client_id = c.id
WHERE a.actionType_id = 43232 AND jt.datetime >= '2021-07-23 11:30:00' AND a.status = 1



set @acOld = 43232;
set @acNew = 43419;


select ap.* from ActionProperty ap
left JOIN ActionProperty_Job_Ticket apjt using(id)
 JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 13:00:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
left join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx;




PREPARE stmt_name FROM @sel;
EXECUTE stmt_name;



select *
from ActionProperty ap
left JOIN ActionProperty_Job_Ticket apjt using(id)
 left JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 11:30:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx



select *
from ActionPropertyType where id in(14568,13624,14569,13625,14570,13626,14571,13627,14573,13629,14574,13630,14575,13631,14577,13633,14578,13634,14579,13635,14580,13636,14581,13637,14585,13641,14586,13642,14587,13643,14588,13644,14589,13645,14590,13646,14591,13647,14592,13648);




select *
from information_schema.PROCESSLIST where COMMAND not in('Sleep') and HOST regexp '10.145.134.254';


select *
from ActionPropertyType where id in();

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