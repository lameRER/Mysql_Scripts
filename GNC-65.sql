select * from ActionType at2 where at2.name REGEXP '^Плазмаферез лечебный' and at2.deleted = 0

select * from ActionType at2 where at2.id in (8264,4972,8265,4977) and at2.deleted = 0



select *  from Action a, ActionType at2, Event e 
where a.deleted = 0 and a.ActionType_id = at2.id and a.Event_id = e.id and 
at2.id in (8264,4972,8265,4977) and at2.deleted = 0 and a.directionDate REGEXP '2020' and a.status = 2 and
e.deleted = 0


select * from OrgStructure os where os.name REGEXP 'т' and os.deleted = 0


select
-- os.name, at2.name, count(aa.actionType_id)
*
from ActionType at2 
join Action aa on aa.actionType_id = at2.id and aa.deleted = 0 and aa.status = 2 and aa.endDate REGEXP '2020'
join Person p on aa.createPerson_id = p.id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id and os.id in(19, 181) and os.deleted = 0
where at2.id in (8264,4972,8265,4977) and at2.deleted = 0
GROUP by aa.actionType_id
