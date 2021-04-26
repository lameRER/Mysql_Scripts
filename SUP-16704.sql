select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName),
v.* 
from Visit v, logger.Login l, Person p2 
where v.modifyPerson_id = l.person_id and v.modifyPerson_id = p2.id
order by v.modifyDatetime DESC 


