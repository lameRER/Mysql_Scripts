select *
from Action where id =104136;

select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where id = 13723) and deleted = 0;


OrgStructure;name;parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные'),type=1

select *
from OrgStructure where parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные') and type = 1;