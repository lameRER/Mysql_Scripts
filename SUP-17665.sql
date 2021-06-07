select *
from ActionType where flatCode = 'received';


select *
from ActionPropertyType where actionType_id = 15084 and deleted = 0 order by idx;


select apt.name, apt.typeName, aps .*
from ActionProperty ap
Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = 'received'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.name = 'Доставлен'
where ap.deleted= 0;


select *
from ActionProperty_String_copy_07_06_21;

select *
from ActionProperty_Reference;