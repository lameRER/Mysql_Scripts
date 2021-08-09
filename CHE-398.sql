select * from Action order by id desc



select *
from ActionPropertyType where name = 'Операционная';


select *
from ActionPropertyType where actionType_id = 13723;

select *
from ActionPropertyType where id = 132381;

select *
from ActionType where id = 13723;


select at.name, a.*
from Action a, ActionType at
where (a.id in (104136,104135) or a.actionType_id = 25596 and a.deleted = 0) and a.event_id = 27944 and at.id = a.actionType_id;


select ActionPropertyType.formulaAlias, ActionPropertyType.*
from ActionPropertyType where actionType_id =
(select id
from ActionType where id in(23662));


select *
from ActionType where id in(23662)


select *
from ActionType where group_id = 21403 and class=  2;

select *
from ActionProperty  where action_id = 104003 and type_id = 185363;


select *
from ActionProperty_Reference where id = 442994;


select * from ActionPropertyType where actionType_id = 13723

select *
from ActionType where id = 25596;


select *
from ActionType where name regexp 'протокол операции';

select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where id =13723) and deleted = 0 order by idx ;


OrgStructure;name;parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные'),type=1


select name
from OrgStructure where parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные') and type;


select *
from ActionPropertyType where formulaAlias = 'operation' and actionType_id =
(select id
from ActionType where formulaAlias = 'oper_plan');


select *
from ActionType where ;