select * from ActionType at2 where at2.name REGEXP '^Введение криоконсервированного' and at2.deleted = 0

select * from ActionType at2 where at2.id in (8264,4972,8265,4977) and at2.deleted = 0



select *  from Action a, ActionType at2, Event e 
where a.deleted = 0 and a.ActionType_id = at2.id and a.Event_id = e.id and 
at2.id in (8264,4972,8265,4977) and at2.deleted = 0 and a.directionDate REGEXP '2020' and a.status = 2 and
e.deleted = 0


select * from OrgStructure os where os.name REGEXP 'т' and os.deleted = 0


select 
os.name `Название подразделения`, 
at2.name `Название услуги`, 
count(aa.actionType_id) `Количество выполненных`
from ActionType at2 
join Action aa on aa.actionType_id = at2.id and aa.deleted = 0 and aa.status = 2 and aa.endDate REGEXP '2020'
left join Person p on aa.createPerson_id = p.id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id and os.id in(19, 181) and os.deleted = 0
where at2.id in (8264,4972,8265,4977) and at2.deleted = 0
GROUP by os.id, aa.actionType_id



select 
os.name `Название подразделения`, 
at2.name `Название услуги`, 
count(aa.actionType_id) `Количество выполненных`
from ActionType at2 
join Action aa on aa.actionType_id = at2.id and aa.deleted = 0 and aa.status = 2 and aa.endDate REGEXP '2020'
join Person p on aa.createPerson_id = p.id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id and os.id in(19, 181) and os.deleted = 0
where at2.id in (8208,8588) and at2.deleted = 0
GROUP by os.id, aa.actionType_id


select * from ActionType_Service ats where ats.master_id in(8208,8588);


select * from Service s ;


select * from Action where actionType_id = 8588 and status = 23;
