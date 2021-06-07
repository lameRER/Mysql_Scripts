select *
from ActionType where flatCode = 'received';


select *
from ActionPropertyType where actionType_id = 15084 and deleted = 0 order by idx;


select *
from netricaTypeFromDiseaseStart;

# в первые 6 часов
# в течение 7-24 часов
# позднее 24-х часов


insert into ActionProperty_Reference(id, `index`, value)
select aps.id, 0,
       case
           when aps.value regexp '^в первые 6часов|^1 час|^2 часа|^3 часа|^4|^4 часа|^5 часов|^6 часов|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">1 час< /font>< /font>|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">4 часа< /font>< /font>' then 4
           when  aps.value regexp '^в течении 7-24 часов|^7-12 часов|^7-24 часов|^12-24 часов' then 5
           when aps.value regexp '^менее 2 суток|^более 24-х часов|^более 7 суток|^менее 3 суток|^менее 4 суток|^менее 5 суток|^менее 6 суток|^менее 7 суток|^позднее 24-х часов' then 6 end
from ActionProperty ap
left Join ActionProperty_String aps using(id)
# left Join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = 'received'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.name = 'Доставлен'
where ap.deleted= 0 and aps.id is not null; -- group by aps.value;


update
# select ap.*
# from
    ActionProperty ap
left Join ActionProperty_String aps using(id)
# left Join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = 'received'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.name = 'Доставлен' and ap.type_id = 35423
set ap.type_id =38920
where ap.deleted= 0 and aps.id is not null; -- group by aps.value;

select *
from ActionPropertyType where actionType_id = 15084;



select *
from ActionProperty_String where id = 250003765;


select action_id
from ActionProperty where id =;

select *
from Action where id = 98151098;


select a.event_id
from ActionProperty ap
join Action a on a.id = ap.action_id
where ap.deleted = 0 and a.event_id is not null



select *
from ActionProperty_String_copy_07_06_21;

select *
from ActionProperty_Reference;

