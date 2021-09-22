select *
from ActionType where id in
(select actionType_id, valueDomain
from ActionPropertyType where typeName = 'Action' and valueDomain in
(select code from ActionType where id in (select actionType_id from ActionPropertyType where valueDomain like '%Да (год)%')))
 group by id;