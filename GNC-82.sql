select *
from rbPrintTemplate where name regexp 'костного мозга';


select *
from ActionType where name regexp 'Цитохимическое исследование препарата костного мозга';


select *
from ActionType where name regexp  'сидеробласты';


select *
from Action where actionType_id = 5487 and createDatetime >= '2020-01-01' and createDatetime <= '2021-07-02' and deleted = 0
;


01.01.2020-02.07.2021


select
       e.id,
       e.externalId,
       c.id,
       concat_ws(' ', c.lastName, c.firstName, c.patrName),
       a.createDatetime



from ActionProperty ap
join Action a on ap.action_id = a.id and ap.deleted = 0
join Event e on e.id = a.event_id and a.deleted = 0
join Client c on c.id = e.client_id and c.deleted = 0
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and at.id = 5487
join ActionPropertyType apt on apt.id = ap.type_id and apt.deleted =0 and at.id = apt.actionType_id


select *
from ActionPropertyType where actionType_id = 5487;


select *
from actionproperty_;