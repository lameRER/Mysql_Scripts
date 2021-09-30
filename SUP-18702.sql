select * from rbPrintTemplate where context =
(select context
from ActionType where name regexp '013у');

select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where name regexp '013у')



select *
from DestinationTree_ActionType where master_id =10029;

select *
from OrgStructure_ActionType;

select *
from DestinationTree;