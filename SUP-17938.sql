select *
from rbJobType;



select *
from ActionPropertyType where typeName = 'JobTicket' and valueDomain = '15' ;


select *
from ActionType where id = 11021;



select *
from ActionType where group_id = 11018;

select *
from Job where jobType_id = 64 and date = '2021-06-24';


select *
from rbUserRight where name regexp 'очеред';


select *
from rbUserProfile_Right where userRight_id = 318;


select *
from rbUserProfile where id in(10,22,24,25,1);

select *
from rbUserProfile;


select *
from Person where lastName regexp 'Юрьева';

select md5('')