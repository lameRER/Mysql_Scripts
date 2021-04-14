select * from Event e where e.client_id = 519681;


select at2.name, a.status, a.plannedEndDate,  a.* from 
(select a.* from Action a 
join Action a1 on a1.id = a.parent_id 
where a.event_id = 33796707 and a.parent_id is not null
union 
select a1.* from Action a 
join Action a1 on a1.id = a.parent_id 
where a.event_id = 33796707 and a.parent_id is not null) as a
join ActionType at2 on at2.id = a.actionType_id
order by a.id 

select e.externalId from Event e where e.id = 33834573;


select a.* from Action a  
where a.event_id = 33834573 and a.parent_id is not null


select * from Action ;