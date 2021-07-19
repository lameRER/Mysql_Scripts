select at.name, a.*
from Action a, Event e, Client c, ActionType at
where a.event_id = e.id
  and a.deleted = 0
  and a.actionType_id = at.id
  and at.deleted = 0
  and at.name regexp '^Протокол'
  and e.deleted = 0
  and e.externalId = '28657'
and c.id = e.client_id
and c.deleted = 0
and c.lastName regexp 'никитин'
order by a.id desc


select rt.*
from ActionType at, rbPrintTemplate rt
where at.id = 49963 and rt.context = at.context

