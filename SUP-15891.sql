select * from Client c where c.id= 33748;


select e.id, e.execPerson_id, d.person_id, CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName), d.* from Diagnosis d, Event e, Person p2 
where d.client_id = 33748 and d.client_id = e.client_id and e.deleted = 0 and d.deleted = 0
and e.execPerson_id = p2.id ;



select * from Diagnosis d ;