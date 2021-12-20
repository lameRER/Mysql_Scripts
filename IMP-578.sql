select r.*
from ActionType at1,
     ActionPropertyType apt,
     rbPrintTemplate r
where at1.name regexp 'Направление на приж' and
      apt.actionType_id = at1.id
  and at1.deleted = 0
  and apt.deleted = 0
and r.context = at1.context group by r.id;



select apt.*
from ActionPropertyType apt, ActionType at1 where apt.actionType_id = at1.id and at1.name = 'выписка' ;



select *
from rbPrintTemplate where name = 'протокол вк';

select * from ActionType where name = 'протокол вк';

select *
from DestinationTree_ActionType where actionType_id = 11757;

select
*
from ActionPropertyType where actionType_id in
(select id
from ActionType where code = '145-16925-1')

select *
from rbPrintTemplate where context = '145-16925-1';