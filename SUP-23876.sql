select *
from eventtype;


create table `SUP-23876`
(select a.*
from event e
join action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id = 53373
where e.eventType_id = 254 and e.setDate between '2022-02-01' and '2022-02-11' and e.deleted =0);

select a.id
from event e
         join action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id = 53373
where e.eventType_id = 254 and e.setDate between '2022-02-01' and '2022-02-11' and e.deleted =0;


update action a
join event e on e.id = a.event_id and e.eventType_id = 254 and e.setDate between '2022-02-01' and '2022-02-11' and e.deleted =0
set a.deleted = 1
where a.deleted = 0 and a.actionType_id = 53373;

select *
from actiontype_service where master_id = 53373;

select *
from account_item where service_id = 68732;
select *
from account_item;


select eventType_id from event where id =6956722

select *
from actiontype where code = 'B01.069.010';