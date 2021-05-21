select * from Client c where c.lastName = 'белик' and c.firstName REGEXP 'вяче';


select * from Event e where e.client_id = 963040;

select e.id, e.client_id, a.takenTissueJournal_id, a.* from `Action` a 
join Event e on e.id = a.event_id 
where a.deleted = 0 and a.takenTissueJournal_id = 86254


select * from TakenTissueJournal ttj where ttj.client_id = 963040;