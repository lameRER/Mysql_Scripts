select at.name, a.*
from Action a, Event e, Client c, ActionType at
where a.event_id = e.id
  and a.deleted = 0
  and a.actionType_id = at.id
  and at.deleted = 0
#   and at.name regexp '^Протокол'
  and e.deleted = 0
  and e.externalId = '28657'
and c.id = e.client_id
and c.deleted = 0
and c.lastName regexp 'никитин'
order by a.id desc


select rt.*
from ActionType at, rbPrintTemplate rt
where at.id = 49963 and rt.context = at.context



select *
from Organisation where createPerson_id = 877 and createDatetime = '2021-06-30 16:01:55' ;



select *
from Person where id =1865;