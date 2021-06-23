select *
from rbJobType;



select *
from ActionPropertyType where typeName = 'JobTicket' and valueDomain = '15' ;


select *
from ActionType where id = 11021;



select *
from ActionType where id = 11018;

select *
from Job where jobType_id = 64 and date = '2021-06-24';


select *
from rbUserRight where name regexp 'очеред';


select e.id, et.*
from Action a, Event e, EventType et where e.id = a.event_id and a.actionType_id = 11021 and a.deleted = 0 and e.deleted = 0 group by et.id, e.id;


select *
from rbUserProfile_Right where userRight_id = 318;


select *
from rbUserProfile where id in(10,22,24,25,1);

select *
from rbUserProfile;


select *
from Person where lastName regexp 'Юрьева';


select *
from rbSpeciality;

select md5('')