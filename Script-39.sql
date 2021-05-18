select * from Job j ;

select * from Job_Ticket jt ;

select * from rbJobType rjt ;


select * from job;


set @test = '145,1564,56464,564'


select * from Action WHERE FIND_IN_SET(id, @test);


select * from Action;


SELECT count(e.id), a.plannedEndDate, CONCAT(c.lastName, ' ', c.firstName, ' ', c.patrName), c.sex, c.birthDate,  group_concat(at.name SEPARATOR ' 
') 
AS 'Name' FROM ActionType at
INNER JOIN Action a ON a.actionType_id = at.id
INNER JOIN Event e ON e.id = a.event_id
INNER JOIN Client c ON e.client_id = c.id
INNER JOIN ActionProperty ap ON a.id = ap.action_id
INNER JOIN ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
INNER JOIN Job_Ticket jt ON apjt.value = jt.id
INNER JOIN Job j ON jt.master_id = j.id
INNER JOIN rbJobType jt1 ON j.jobType_id = jt1.id
-- WHERE e.id = 217550 AND jt1.id = 27
group by c.id -- jt.id

