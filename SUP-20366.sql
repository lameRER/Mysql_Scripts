select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where name regexp 'qr' and deleted = 0)
and deleted = 0 order by idx
;

select *
from netricarbCitizenship;

select count(apr.id) as `Количество`, nc.name as `Наименование`
from ActionProperty ap, ActionProperty_Reference apr, netricarbCitizenship nc
where ap.id = apr.id and ap.type_id = 10445-- and ap.deleted = 0
and nc.id = apr.value
group by apr.value
;


select *
from Person where login = 'виста';