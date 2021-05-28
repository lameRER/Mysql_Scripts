select org_id from Person;
select *
from Organisation where id =3188;
select *
from Client where id =1549863;
select at2.name, e.client_id, a.*
from Event e
join Action a on a.event_id = e.id
join ActionType at2 on at2.id = a.actionType_id and at2.id =14173
where e.client_id in(1549863,1552463) ;
select *
from ActionType where name regexp 'cov';
select *
from Action where actionType_id=14414;