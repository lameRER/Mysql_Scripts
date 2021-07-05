select *
from Person where lastName regexp 'Андреева';


select * from Event e
join Diagnostic d on d.event_id = e.id and d.deleted = 0
join Diagnosis d1 on d1.id = d.diagnosis_id and d1.deleted = 0 and d1.MKB regexp 'F70' and d1.setDate = '2021-05-21'
where e.execPerson_id = 296 and e.deleted = 0 order by e.id desc


select *
from EventType where id in(61,2);


select org_id
from Person;

select *
from Organisation where id = 386270;