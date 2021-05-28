select org_id from Person;
select *
from Organisation where id =3188;
select *
from Client where id =1549863;
select a.*
from Event e
join Action a on a.event_id = e.id and a.actionType_id in(14181,14247,14258,14414)
where e.client_id= 1549863 ;
select *
from ActionType where name regexp 'cov';
select *
from Action where actionType_id=14414;