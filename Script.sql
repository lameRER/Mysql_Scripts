
select
       concat_ws(' ', c.lastName, c.firstName, c.patrName),
       a.createDatetime,
        group_concat(concat_ws(': ', apt.name, aps.value separator '\n'))
from ActionProperty ap
left join ActionProperty_String aps on aps.id  = ap.id
join Action a on ap.action_id = a.id and ap.deleted = 0
join Event e on e.id = a.event_id and a.deleted = 0
join Client c on c.id = e.client_id and c.deleted = 0
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and at.id = 5487
join ActionPropertyType apt on apt.id = ap.type_id and apt.deleted =0 and at.id = apt.actionType_id group by a.id



select * from Event e ;