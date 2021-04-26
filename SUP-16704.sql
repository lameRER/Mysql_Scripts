use pnd8;
select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName),
v.* 
from Visit v, logger.Login l, Person p2 
where v.modifyPerson_id = l.person_id and v.modifyPerson_id = p2.id
order by v.modifyDatetime DESC 


select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `ФИО последнего редактора`, 
v.event_id `ID ИБ`,
e2.externalId `Номер ИБ`,
CONCAT_WS(' ', c2.lastName, c2.firstName, c2.patrName) `ФИО Пациента`
from Visit v 
join Person p2 on p2.id = v.modifyPerson_id 
join Event e2 on e2.id = v.id and e2.deleted = 0
join Client c2 on c2.id = e2.client_id and c2.deleted = 0
where v.deleted = 0
order by v.modifyDatetime DESC 


select * from logger.Login l ;


select * from Visit v ;


select * from Visit v ;

select * from Client c where c.id = 14479;



select * from Event e where e.client_id = 14479;



select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName), v.* from Visit v, Event e, Person p2 
where v.event_id = e.id and e.client_id = 42611 and e.deleted = 0 and v.person_id = p2.id
order by v.id DESC ;


select * from Diagnosis d where d.client_id = 14479 and d.deleted = 0;



select * from Diagnostic d where d.event_id = 113222;