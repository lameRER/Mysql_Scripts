select *
from Action
where (id in (104136) or actionType_id = 25596 and deleted = 0) and event_id = 27944;



select *
from ActionProperty  where action_id = 104003 and type_id = 185363;


select *
from ActionProperty_Reference where id = 442994;

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