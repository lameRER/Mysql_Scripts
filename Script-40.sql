use s11;
select 	
at2.name as `Тип действия`, 
a.createDatetime as `Дата создания`,
CONCAT_WS(' ', p.lastName, left(p.firstName, 1), left(p.patrName, 1)) as `Автор создания`,
a.modifyDatetime as `Дата последнего редактирования`,
CONCAT_WS(' ', p2.lastName, left(p2.firstName, 1), left(p2.patrName, 1)) as `Последний редактор`,
CONCAT_WS(' ', p3.lastName, left(p3.firstName, 1), left(p3.patrName, 1)) as `Назначивший`,
a.directionDate as `Дата назначения`,
a.begDate as `Дата начала работы`,
CONCAT_WS(' ', p4.lastName, left(p4.firstName, 1), left(p4.patrName, 1)) as `Исполнитель`,
a.endDate as `Дата окончания работы`,
case
when a.status = 0 then 'Начато'
when a.status = 1 then 'Ожидание'
when a.status = 2 then 'Закончено'
when a.status = 3 then 'Отменено'
when a.status = 4 then 'Без результата(Отменена анес)'
end
as `Статус выполнения`
from Action a
join ActionType at2 on at2.id = a.actiontype_id
left join Person p on p.id = a.createPerson_id 
left join Person p2 on p2.id = a.modifyPerson_id
left join Person p3 on p3.id = a.setPerson_id
left join Person p4 on p4.id = a.person_id
where a.event_id = 33850725;



select 	
a.*
from Action a
where a.event_id = 33850725;


Статус выполнения: 0-Начато, 1-Ожидание, 2-Закончено, 3-Отменено, 4-Без результата(Отменена анес)


select * from Client c where c.lastName = 'аб';

select * from Event e where e.;


select * from Action a where a.id =100386724;